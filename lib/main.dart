import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavetalk/Screens/AuthScreen/RegisterScreen/RegisterScreen.dart';
import 'package:wavetalk/Screens/AuthScreen/onboarding/onboardingScreen.dart';
import 'package:wavetalk/Screens/HomeScreen/HomeScreen.dart';
import 'package:wavetalk/Theme/ThemeCubit/themes_cubit.dart';
void main() {
  runApp(
      BlocProvider<ThemesCubit>(create: ( context) =>ThemesCubit()..setinitalTheme() ,
     child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  bool checkuser (){return false ;}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit,ThemState>(
      builder: (context,state ){
      return MaterialApp(
          theme:state.themeData  ,
          title: 'Flutter Demo',
        home: checkuser () ?Homescreen():OnboardingScreen(),
        );

      } ,
    );
  }
}
