import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/modules/settings/Theme/bottom_sheet_item_them.dart';
import 'package:test_todo_app/provider/theme_provider.dart';
import 'package:test_todo_app/shared/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/language_provider.dart';
import 'language/bottom_sheet_item_lang.dart';

// ignore: use_key_in_widget_constructors
class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    var language = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Container(
        margin:const  EdgeInsets.all(20),
        padding: const  EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.settings_language,
            style: Theme.of(context).textTheme.headline2!.
            copyWith(color: theme.initTheme ==ThemeMode.light ? MyTheme.blackColor
                    : MyTheme.whiteColor,),),
            const SizedBox(height: 20,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: theme.initTheme ==ThemeMode.light ? MyTheme.whiteColor
                    : MyTheme.backbottomNavi,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  side:BorderSide(
                    color: MyTheme.pryColor
                  ) ),
              ),
              onPressed: languageBottomSheet,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Text( 
                    // language
                    language.initLocale == 'en' ?
                    AppLocalizations.of(context)!.bottom_sheet_english 
                    : AppLocalizations.of(context)!.bottom_sheet_arabic ,
                          style: Theme.of(context).textTheme.subtitle1!
                          .copyWith(color: MyTheme.pryColor),),
                 Image.asset(theme.initTheme == ThemeMode.light
                        ? 'assets/images/baseline_black.png'
                        : 'assets/images/baseline_white.png')],
              ),
            ),
            const SizedBox(height: 25,),
            Text(AppLocalizations.of(context)!.settings_theming,
            style: Theme.of(context).textTheme.headline2!.
            copyWith(color: theme.initTheme ==ThemeMode.light ? MyTheme.blackColor
                    : MyTheme.whiteColor,),),
            const SizedBox(height: 20,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: theme.initTheme ==ThemeMode.light ? MyTheme.whiteColor
                    : MyTheme.backbottomNavi,
                padding:const  EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  side:BorderSide(
                    color: MyTheme.pryColor
                  ) ),
              ),
              onPressed: () => themeBottomSheet(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(
                  language.initLocale == 'en' ?
                  AppLocalizations.of(context)!.bottom_sheet_light
                    : AppLocalizations.of(context)!.bottom_sheet_dark ,),
                 Image.asset(theme.initTheme == ThemeMode.light
                        ? 'assets/images/baseline_black.png'
                        : 'assets/images/baseline_white.png')],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? languageBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: ((context) => const BottomSheetItemLang()));
      return null;
  }

  Widget? themeBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: ((context) => ShowBottomSheetItemTheme()));
    return null;
  }
}
