import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/modules/Bottom%20Sheet/show_bottom_sheet-add.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';
import '../modules/settings/settings.dart';
import '../modules/tasks/tasks.dart';
import '../provider/language_provider.dart';
import '../provider/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Home extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    var language = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: theme.initTheme == ThemeMode.light ? MyTheme.backColor
                     : MyTheme.backAndColorDark ,
      appBar: AppBar(
        title: Text(currentIndex == 0 ? AppLocalizations.of(context)!.todo_app
             :AppLocalizations.of(context)!.setting_title, 
        style: Theme.of(context).textTheme.headline1,),
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.initTheme == ThemeMode.light ? MyTheme.whiteColor
                     : MyTheme.backbottomNavi ,
        shape: const  CircularNotchedRectangle(),
        notchMargin: 6,
        child: BottomNavigationBar(
          onTap: (index){
            currentIndex =index;
            setState(() {
              
            });
          },
          currentIndex: currentIndex ,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
          ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        onPressed: () {
          addTask();
        },
         child: Icon(Icons.add),
        backgroundColor: MyTheme.pryColor,
      ) ,

        body: tabs[currentIndex],
    );
  }

  List<Widget> tabs =[Tasks(), Settings()];
  
  Widget? addTask() {
    showModalBottomSheet(
      context: context,
       builder: ((context){
        return const ShowModalBottomSheetAdd();
       }));
  }
}