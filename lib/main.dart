// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/layout/home_layout.dart';
import 'package:test_todo_app/modules/edit_screen.dart';
import 'package:test_todo_app/provider/language_provider.dart';
import 'package:test_todo_app/provider/theme_provider.dart';
import 'package:test_todo_app/shared/styles/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => LanguageProvider())),
        ChangeNotifierProvider(create: ((context) => ThemeProvider())),
      ],
      child: MyApp()));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LanguageProvider>(context);
    var theming = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      
       localizationsDelegates:const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],

      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      locale: Locale(language.initLocale),

      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
       EditScreen.routeName: (context) => EditScreen(),
      },
      
      themeMode: theming.initTheme,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,

      debugShowCheckedModeBanner: false,
    );
  }
}
