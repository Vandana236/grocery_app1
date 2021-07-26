import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/utils/size_config.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // timestamp style
    TextStyle timeStampStyle = textTheme.caption.copyWith(
        color: Colors.grey[400],
        fontSize: 12
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFDFDFD),
      appBar: customAppBar(textTheme),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 10,
                width: SizeConfig.screenWidth,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 8,
                          width: SizeConfig.blockSizeHorizontal * 80,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/profileimg.png',
                                    height: SizeConfig.blockSizeVertical * 5,
                                    width: SizeConfig.blockSizeHorizontal * 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          'As salamu Alaikum, How can \nwe help?',
                                          style: textTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '8:48PM',
                                  style: textTheme.caption.copyWith(
                                    color: Colors.grey[400],
                                    fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IntrinsicHeight(
                    child: Container(
                      height: constraints.maxHeight / 6,
                      width: SizeConfig.blockSizeHorizontal * 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              height: constraints.maxHeight * 0.13,
                              decoration: BoxDecoration(
                                color: const Color(0xffF4F4F4),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'I ordered some groceries from chaldal.The delivery was not on time, and some products have gone rotten',
                                    style: textTheme.bodyText1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '8:52PM',
                              style: timeStampStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: constraints.maxHeight / 6,
                    width: SizeConfig.blockSizeHorizontal * 80,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/profileimg.png',
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: IntrinsicHeight(
                                child: Container(
                                  height: constraints.maxHeight * 0.13,
                                  width: SizeConfig.blockSizeHorizontal * 65,
                                  decoration: BoxDecoration(),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'We are sorry for the inconvenience. Can you upload some product pictures so that we can confirm it?',
                                        style: textTheme.bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '8:53PM',
                              style: timeStampStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 10,
                    width: SizeConfig.blockSizeHorizontal * 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/firstitm.png'),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 4,
                        ),
                        Image.asset('assets/images/seconditm.png'),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 4,
                        ),
                        Image.asset('assets/images/thirditm.png'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 8,
                    width: SizeConfig.blockSizeHorizontal * 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 60,
                            decoration: BoxDecoration(
                              color: const Color(0xffF4F4F4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                'Check the assets of the products',
                                style: textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '8:53PM',
                            style: timeStampStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: constraints.maxHeight / 6,
                    width: SizeConfig.blockSizeHorizontal * 80,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/profileimg.png',
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: constraints.maxHeight * 0.13,
                                width: SizeConfig.blockSizeHorizontal * 65,
                                decoration: BoxDecoration(),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Your complain has been received. Do you want to make a refund request, or reorder the items?',
                                      style: textTheme.bodyText1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '8:53PM',
                            style: timeStampStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 70,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 0.5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(
                    'I want to reorder some items',
                    style: textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 70,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 0.5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(
                    'I want to make a refund request',
                    style: textTheme.bodyText1,
                  ),
                ),
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 25,
                width: SizeConfig.blockSizeHorizontal * 70,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: SizeConfig.blockSizeVertical * 12,
        child: bottomChatBar(),
      ),
    );
  }
}

customAppBar(TextTheme textTheme) {
  return PreferredSize(
      child: Container(
        color: const Color(0xffFDFDFD),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chaldal customer support',
                      style: textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text(
                    'Ask any questions. Online 24/7 ',
                    style: textTheme.caption,
                  ),
                ],
              ),
              Image.asset('assets/images/callbtn.png'),
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(SizeConfig.blockSizeVertical * 10));
}

bottomChatBar() {
  return Container(
    color: Colors.white,
    height: SizeConfig.blockSizeVertical * 4,
    width: SizeConfig.screenWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal * 16,
          child: IconButton(
            icon: Image.asset("assets/images/uploadimgs.png"),
            iconSize: 40,
            onPressed: () {},
          ),
        ),
        Expanded(
          child: Container(
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(2),
                labelText: "Type something here ...",
                hintStyle: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF1F1F1F).withOpacity(0.4)),
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: IconButton(
                    icon: Image.asset("assets/images/sendbtn.png"),
                    onPressed: () {},
                  ), // myIcon is a 48px-wide widget.
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
