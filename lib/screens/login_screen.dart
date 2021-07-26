import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_onlineapp/baseurlg/appinfo.dart';
import 'package:grocery_onlineapp/baseurlg/baseurlg.dart';
import 'package:grocery_onlineapp/baseurlg/locale/locales.dart';
import 'package:grocery_onlineapp/baseurlg/loginmodel.dart';
import 'package:grocery_onlineapp/baseurlg/routes/routes.dart';
import 'package:grocery_onlineapp/constants/color_constants.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/theme/style.dart';
import 'package:grocery_onlineapp/widgets/circular_image_cover.dart';
import 'package:grocery_onlineapp/widgets/my_ink_well.dart';
import 'package:grocery_onlineapp/widgets/my_text_field.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // private variable tp store phone number
  String _phoneNumber;

  // text editing controller for country code field
  TextEditingController countryCodeController = new TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool showProgress = false;

  dynamic token;

  int numberLimit = 10;

  AppInfoModel appInfoModeld;

  int count = 0;

  FirebaseMessaging messaging;

  bool isNumberOk = false;

  String appNameA = '--';
  void initState() {
    super.initState();
    // _languageCubit = BlocProvider.of<LanguageCubit>(context);
    hitAsyncInit();
    hitAppInfo();

  }

  void hitAsyncInit() async {
    try {
      await Firebase.initializeApp();
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        token = value;
      });
    } catch (e) {}
  }
  void hitAppInfo() async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      showProgress = true;
    });
    var http = Client();
    http.post(appInfoUri, body: {'user_id': ''}).then((value) {
      // print(value.body);
      if (value.statusCode == 200) {
        AppInfoModel data1 = AppInfoModel.fromJson(jsonDecode(value.body));
            print('data - ${data1.toString()}');
        if (data1!=null && '${data1.status}' == '1') {
          setState(() {
            appInfoModeld = data1;
            appNameA = '${appInfoModeld.appName}';
            numberLimit = int.parse('${data1.phoneNumberLength}');
            prefs.setString('app_currency', '${data1.currencySign}');
            prefs.setString('app_referaltext', '${data1.refertext}');
            prefs.setString('app_name', '${data1.appName}');
            prefs.setString('country_code', '${data1.countryCode}');
            prefs.setString('numberlimit', '$numberLimit');
            prefs.setInt('last_loc', int.parse('${data1.lastLoc}'));
            prefs.setString('wallet_credits', '${data1.userWallet}');
            prefs.setString('imagebaseurl', '${data1.imageUrl}');
            countryCodeController.text = '${data1.countryCode}';
            getImageBaseUrl();
            showProgress = false;
          });
        } else {
          setState(() {
            showProgress = false;
          });
        }
      } else {
        setState(() {
          showProgress = false;
        });
      }
    }).catchError((e) {
      setState(() {
        showProgress = false;
      });
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // screen height
    double screenHeight = MediaQuery.of(context).size.height;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom!=0;
    var locale = AppLocalizations.of(context);
    return SafeArea(
      top: true,
      bottom: true,
      right: false,
      left: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                  visible: !isKeyboardOpen,child: Container(height: screenHeight * 0.25)),
              Text(
                "Enter mobile number",
                style: normalHeadingStyle(context),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: MyInkWell(
                  onPressed: null,
                  introText: "for",
                  mainText: " Login / Registration",
                ),
              ),
              Text(
                "Mobile number",
                style: textTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:Text(
                          appInfoModeld!=null?'+${appInfoModeld.countryCode}':
                      '--',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Colors.black, fontSize: 15)
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 7,
                      child: MyTextField(
                        controller: phoneNumberController,
                        hintText: "Enter your mobile number",
                        readOnly: showProgress,
                        autofocus: false,
                        maxLines: 1,
                        maxlength: 10,
                        inputTextFontWeight: FontWeight.bold,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if(phoneNumberController.text.length==numberLimit){
                            setState(() {
                              isNumberOk = true;
                            });
                          }else{
                            setState(() {
                              isNumberOk = false;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !isKeyboardOpen,
               child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child:
                  (showProgress)?Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(strokeWidth: 1,color : Colors.red,),
                  ):MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    onPressed: () {
                      if (!showProgress) {
                        setState(() {
                          showProgress = true;
                        });
                        if (phoneNumberController.text != null &&
                            phoneNumberController.text.length == 10) {
                          hitLoginUrl('${phoneNumberController.text}', '', 'otp',
                              context);
                        } else {
                          Toast.show(locale.incorectMobileNumber, context,gravity: Toast.CENTER,duration: Toast.LENGTH_SHORT);
                          setState(() {
                            showProgress = false;
                          });
                        }
                      }
                    },
                    height: 50,
                    minWidth: 400,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        locale.Continuel1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !isKeyboardOpen,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Or connect with", style: textTheme.bodyText1),
                      SizedBox(width: 16),
                      CircularImageCover(
                        imageUrl: ImageConstants.FACEBOOK_LOGO_IMAGE_URL,
                        backgroundColor: ColorConstants.veryLightBlue,
                      ),
                      SizedBox(width: 16),
                      CircularImageCover(
                        imageUrl: ImageConstants.GOOGLE_LOGO_IMAGE_URL,
                        backgroundColor: ColorConstants.peach,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      if(!showProgress){
                        Navigator.pushNamed(context, PageRoutes.signUp, arguments: {
                          'user_phone': '${phoneNumberController.text}',
                          'numberlimit': numberLimit,
                          'appinfo': appInfoModeld,
                        });
                      }
                    },
                    behavior: HitTestBehavior.opaque,
                    child: RichText(
                      text: TextSpan(
                        text: locale.login1,
                        children: [
                          TextSpan(
                              text: ' ${locale.login2}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 15))
                        ],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  void hitLoginUrl(dynamic user_phone, dynamic user_password, dynamic logintype,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token == null) {
      var http = Client();
      http.post(loginUri, body: {
        'user_phone': '$user_phone',
        'user_password': '$user_password',
        'device_id': '$token',
        'logintype': '$logintype',
      }).then((value) {
        print('sign - ${value.body}');
        print('statuscode->${value.statusCode}');

        if (value.statusCode == 200) {
          var jsData = jsonDecode(value.body);
          SignInModel signInData = SignInModel.fromJson(jsData);
          print('datasignin->${signInData.toString()}');
          if ('${signInData.status}' == '0') {
            Toast.show(signInData.message, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
            Navigator.pushNamed(context, PageRoutes.signUp, arguments: {
              'user_phone': '${user_phone}',
              'numberlimit': numberLimit,
              'appinfo': appInfoModeld,
            });
          } else if ('${signInData.status}' == '1') {
            var userId = int.parse('${signInData.data.id}');
            prefs.setInt("user_id", userId);
            prefs.setString("user_name", '${signInData.data.name}');
            prefs.setString("user_email", '${signInData.data.email}');
            prefs.setString("user_image", '${signInData.data.userImage}');
            prefs.setString("user_phone", '${signInData.data.userPhone}');
            prefs.setString("user_password", '${signInData.data.password}');
            prefs.setString("wallet_credits", '${signInData.data.wallet}');
            prefs.setString("user_city", '${signInData.data.userCity}');
            prefs.setString("user_area", '${signInData.data.userArea}');
            prefs.setString("block", '${signInData.data.block}');
            prefs.setString("app_update", '${signInData.data.appUpdate}');
            prefs.setString("reg_date", '${signInData.data.regDate}');
            prefs.setBool("phoneverifed", true);
            prefs.setBool("islogin", true);
            prefs.setString("refferal_code", '${signInData.data.referralCode}');
            prefs.setString("reward", '${signInData.data.rewards}');
            prefs.setString("accesstoken", '${signInData.token}');
            Navigator.pushNamedAndRemoveUntil(
                context, PageRoutes.homePage, (route) => false);
            // Navigator.popAndPushNamed(context, PageRoutes.home);
          } else if ('${signInData.status}' == '2') {
            Navigator.pushNamed(context, PageRoutes.verification, arguments: {
              'token': '${token}',
              'user_phone': '${user_phone}',
              'firebase': '${appInfoModeld.firebase}',
              'country_code': '${appInfoModeld.countryCode}',
              'activity': 'login',
            });
          } else if ('${signInData.status}' == '3') {
            Navigator.pushNamed(context, PageRoutes.verification, arguments: {
              'token': '${token}',
              'user_phone': '${user_phone}',
              'firebase': '${appInfoModeld.firebase}',
              'country_code': '${appInfoModeld.countryCode}',
              'activity': 'login',
            });
          } else {
            Toast.show(signInData.message, context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
          }
        }
        setState(() {
          showProgress = false;
        });
      }).catchError((e) {
        setState(() {
          showProgress = false;
        });
        print(e);
      });
    } else {
      if (count == 0) {
        setState(() {
          count = 1;
        });
        messaging.getToken().then((value) {
          setState(() {
            token = value;
            print('data->'+token);
            hitLoginUrl(user_phone, user_password, logintype, context);
          });
        }).catchError((e) {
          setState(() {
            showProgress = false;
          });
        });
      } else {
        setState(() {
          showProgress = false;
        });
      }
    }
  }
}
