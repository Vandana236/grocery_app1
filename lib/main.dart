import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/baseurlg/languagecubit/language_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'baseurlg/languagecubit/internetchecker.dart';
import 'baseurlg/languagecubit/locationmiter.dart';
import 'baseurlg/languagecubit/pagesnap.dart';
import 'baseurlg/locale/locales.dart';
import 'baseurlg/routes/routes.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Grocery App",
        home: LoginScreen(),
        theme: ThemeUtils.defaultAppThemeData);
  }

}
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCheckerEmitter>(
            create: (context) => InternetCheckerEmitter(),
          ),
          BlocProvider<ImageSnapReview>(
            create: (context) => ImageSnapReview(),
          ),
          BlocProvider<LocationEmitter>(
            create: (context) => LocationEmitter(),
          ),
          // BlocProvider<BottomNavigationEmitter>(
          //   create: (context) => BottomNavigationEmitter(),
          // ),
          // BlocProvider<BanerProvider>(
          //   create: (context) => BanerProvider(),
          // ),
          // BlocProvider<A2CartSnap>(
          //   create: (context) =>
          //       A2CartSnap(AddtoCartB(status: false, prodId: -1)),
          // ),
          // BlocProvider<CartListProvider>(
          //   create: (context) => CartListProvider(),
          // ),
          // BlocProvider<SingleApiEmitter>(
          //   create: (context) => SingleApiEmitter(),
          // ),
          // BlocProvider<SearchProvider>(
          //   create: (context) => SearchProvider(),
          // ),
          // BlocProvider<CategoryProvider>(
          //   create: (context) => CategoryProvider(),
          // ),
          // BlocProvider<CartCountProvider>(
          //   create: (context) => CartCountProvider(),
          // ),
          // BlocProvider<TopRecentNewDealProvider>(
          //   create: (context) => TopRecentNewDealProvider(),
          // ),
          // BlocProvider<ProfileProvider>(
          //   create: (context) => ProfileProvider(),
          // ),
          BlocProvider<PageSnapReview>(
            create: (context) => PageSnapReview(0),
          ),
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit(),
          ),
        ],
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (_, locale) {
            return MaterialApp(
              builder: (context, child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                  data: data.copyWith(textScaleFactor: 1.0),
                  child: child,
                );
              },
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en'),
                const Locale('ar'),
                const Locale('pt'),
                const Locale('fr'),
                const Locale('id'),
                const Locale('es'),
              ],
              locale: locale,
              //theme: appTheme,
              home: LoginScreen(),
              initialRoute: PageRoutes.signInRoot,
              routes: PageRoutes().routes(),
            );
          },
        ));
  }
}
