import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavetalk/Screens/AuthScreen/onboarding/onboardingScreen.dart';
import 'package:wavetalk/Theme/ThemeCubit/themes_cubit.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iSDarkMode = Theme.of(context).brightness ==Brightness.dark;
    final bloc = context.read<ThemesCubit>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("WaveTalk"),
        actions: [
          InkWell(onTap: (){bloc.toggleTheme(!iSDarkMode);},child: Icon(iSDarkMode ?Icons.nightlight_round_sharp:Icons.sunny))
        ],
      ),
      body: Center(
        child: MaterialButton(onPressed: ()async{
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (c)=>OnboardingScreen()) );


        },child: Text("Sign out"),),
      ),

    );
  }
}
