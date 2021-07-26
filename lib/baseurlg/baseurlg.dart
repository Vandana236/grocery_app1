import 'package:shared_preferences/shared_preferences.dart';


var imagebaseUrl1 = 'https://gogrocer.tecmanic.com/';
var imagebaseUrl;
void getImageBaseUrl() async{
  SharedPreferences.getInstance().then((value){
    if(value.containsKey('imagebaseurl')){
      imagebaseUrl = value.getString('imagebaseurl')+'/';
    }else{
      imagebaseUrl = imagebaseUrl1;
    }
  });
}
var apibaseUrl = imagebaseUrl1+'api/';
var cityUri = Uri.parse('${apibaseUrl}city');
var loginUri = Uri.parse('${apibaseUrl}login');
var societyUri = Uri.parse('${apibaseUrl}society');
var signupUri = Uri.parse('${apibaseUrl}signup');
var appInfoUri = Uri.parse('${apibaseUrl}app_info');
var loginVerifyPhoneUri = Uri.parse('${apibaseUrl}loginverify_phone');
var loginVerifyViaFirebaseUri = Uri.parse('${apibaseUrl}loginverify_via_firebase');
var verifyViaFirebaseUri = Uri.parse('${apibaseUrl}verify_via_firebase');
var verifyPhoneRefferalUri = Uri.parse('${apibaseUrl}verify_phone');
var resendOtpUri = Uri.parse('${apibaseUrl}resendotp');
var verifyOtpPFirebaseUri = Uri.parse('${apibaseUrl}firebase_otp_ver');
var verifyOtpPPhoneUri = Uri.parse('${apibaseUrl}verify_otp');
var forGetPasswordByPhoneUri = Uri.parse('${apibaseUrl}forget_password');
var changePasswordUri = Uri.parse('${apibaseUrl}change_password');
var getNearestStoreUri = Uri.parse('${apibaseUrl}getneareststore');
var mapboxUri = Uri.parse('${apibaseUrl}mapbox');
var googleMapUri = Uri.parse('${apibaseUrl}google_map');
var mapbyUri = Uri.parse('${apibaseUrl}mapby');





var appname = 'Go Grocer';