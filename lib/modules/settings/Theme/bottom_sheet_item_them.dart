import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/provider/language_provider.dart';
import 'package:test_todo_app/provider/theme_provider.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ShowBottomSheetItemTheme extends StatefulWidget {
  @override
  State<ShowBottomSheetItemTheme> createState() =>
      _ShowBottomSheetItemThemeState();
}

class _ShowBottomSheetItemThemeState extends State<ShowBottomSheetItemTheme> {
  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LanguageProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.all(12),
            height: 8,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: MyTheme.blackColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.settings_theming,
                style:Theme.of(context).textTheme.subtitle1 
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: (() {
                  //Light
                  theme.changeThiming(ThemeMode.light);
                  Navigator.pop(context);
                  setState(() {
                    
                  });
                }),
                child: selecteCkeckTheming(
                    AppLocalizations.of(context)!.bottom_sheet_light,
                    theme.initTheme == ThemeMode.light? true : false,
                    ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  //Dark
                  theme.changeThiming(ThemeMode.dark);
                  Navigator.pop(context);
                  setState(() {
                    
                  });
                },
                child: selecteCkeckTheming(
                    AppLocalizations.of(context)!.bottom_sheet_dark, 
                    theme.initTheme == ThemeMode.dark? true : false,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget? selecteCkeckTheming(String text, bool selected,) {
    if (selected) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
              style:Theme.of(context).textTheme.subtitle1 
            ),
            Visibility(
              visible: selected,
              child:const Icon(
                Icons.check,
                size: 28,
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, 
            style:Theme.of(context).textTheme.subtitle1
            ),
            Visibility(
              visible: selected,
              child:const Icon(
                Icons.check,
                size: 28,
              ),
            )
          ],
        ),
      );
    }
  }
}