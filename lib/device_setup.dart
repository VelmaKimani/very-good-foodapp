import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/l10n/l10n.dart';
import 'package:foodapp/utils/_index.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceSetUp extends StatelessWidget {
  const DeviceSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: kPrimaryColor),
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryBackgroundColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: FoodAppRouter.generateRoute,
        initialRoute: FoodAppRouter.homeRoute,
      ),
    );
  }
}
