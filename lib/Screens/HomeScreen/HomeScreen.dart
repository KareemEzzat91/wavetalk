import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavetalk/Theme/ThemeCubit/themes_cubit.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {

  final iSDarkMode = Theme.of(context).brightness ==Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final bloc = context.read<ThemesCubit>();
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),shape: BoxShape.circle
            ),child: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.surface ,child: Icon(Icons.search),)),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Home"),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(radius: 30,backgroundImage: AssetImage("assets/images/photo_2024-10-23_14-08-28.jpg",),),
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body:Column(
          children: [
            SizedBox(height: height*.1,),
          ],
        ) ,
        bottomNavigationBar:  FlashyTabBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.event),
              title: Text('Events'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.highlight),
              title: Text('Highlights'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.settings),
              title: Text('한국어'),
            ),
          ],
        ),

    );
  }

}

