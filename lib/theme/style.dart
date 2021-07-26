import 'package:flutter/material.dart';

class ThemeUtils {
  static final ThemeData defaultAppThemeData = appTheme();

  static ThemeData appTheme() {
    Color primaryColor = Color(0xffDC2E45);

    return ThemeData(
      fontFamily: "Google-Sans",
      // Colors
      primaryColor: primaryColor,
      accentColor: Color(0x26dc2e45),
      hintColor: Color(0xFF999999),
      // Widget theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: Color(0xffFFFFFF),
          onSurface: Color(0xff707070), // Disabled button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primaryColor),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        elevation: 5.0,
        unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: StadiumBorder(),
        disabledColor: Color(0xFFE5E3DC),
        height: 50,
      ),
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
      ),
      cardColor: Colors.white,
      cardTheme: CardTheme(elevation: 5),
      // canvasColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
        opacity: 1.0,
      ),
      // Text themes
      textTheme: TextTheme(
        headline5: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: primaryColor,
        ),
        subtitle2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.normal,
        ),
        button: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}

// Additional text themes
TextStyle appBarTitleStyle(BuildContext context) =>
    Theme.of(context).textTheme.headline6.copyWith(
          color: Color(0xff233561),
          fontWeight: FontWeight.normal,
        );

TextStyle textFieldLabelStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          color: Theme.of(context).accentColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );

TextStyle textFieldHintStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          color: Colors.grey[800],
          fontWeight: FontWeight.normal,
        );

// TODO: Pass font-size from function parameters
TextStyle textFieldInputStyle(BuildContext context, FontWeight fontWeight) =>
    Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.black,
          fontSize: 18,
          fontWeight: fontWeight ?? FontWeight.normal,
        );

TextStyle loginButtonTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.button.copyWith(color: Colors.black);

TextStyle textFieldSuffixStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );

TextStyle normalCaptionStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(
          color: Colors.grey,
        );

TextStyle boldSubtitle(BuildContext context) =>
    Theme.of(context).textTheme.subtitle1.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );

TextStyle normalHeadingStyle(BuildContext context) =>
    Theme.of(context).textTheme.headline6.copyWith(
          fontWeight: FontWeight.normal,
        );

TextStyle boldCaptionStyle(BuildContext context) =>
    Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold);
