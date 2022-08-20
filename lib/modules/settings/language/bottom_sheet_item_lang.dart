import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/provider/language_provider.dart';
import 'package:test_todo_app/shared/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BottomSheetItemLang extends StatefulWidget {
  const BottomSheetItemLang({Key? key}) : super(key: key);

  @override
  State<BottomSheetItemLang> createState() => _BottomSheetItemLangState();
}

class _BottomSheetItemLangState extends State<BottomSheetItemLang> {
  
  @override
  Widget build(BuildContext context) {
        var language = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin:const EdgeInsets.all(12),
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
                AppLocalizations.of(context)!.bottom_sheet_language,
                style: Theme.of(context).textTheme.subtitle1,
              ),
               const SizedBox(height: 20),
              InkWell(
                onTap: (() {
                  //English
                  language.changeLocale('en');
                  Navigator.pop(context);
                  setState(() {
                    
                  });
                }),
                child: selecteCkeckLanguage(
                    
                    AppLocalizations.of(context)!.bottom_sheet_english,
                    language.initLocale == 'en' ? true :false,),

              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  //Arabic
                  language.changeLocale('ar');
                  Navigator.pop(context);
                  setState(() {
                    
                  });
                },
                child: selecteCkeckLanguage(
                    AppLocalizations.of(context)!.bottom_sheet_arabic, 
                    language.initLocale == 'ar'? true : false,),
              ),
            ],
          ),
        ),
      ],
    );

  }

   Widget? selecteCkeckLanguage(String text, bool selected) {
    if (selected) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Visibility(
              visible: selected,
              child:  const Icon(
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
            Text(text, style: Theme.of(context).textTheme.subtitle1),
            Visibility(
              visible: selected,
              child: const Icon(
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