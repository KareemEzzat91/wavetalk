import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavetalk/Screens/AuthScreen/LoginScreen/LoginCubit/login_cubit.dart';
import 'package:wavetalk/Screens/AuthScreen/onboarding/onboardingScreen.dart';
import 'package:wavetalk/Screens/HomeScreen/HomeScreen.dart';
import 'package:wavetalk/Theme/ThemeCubit/themes_cubit.dart';
import 'package:wavetalk/firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      BlocProvider<ThemesCubit>(create: ( context) =>ThemesCubit()..setinitalTheme() ,
     child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  bool checkuser (){return false ;}
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ThemesCubit()..setinitalTheme()), // إضافة BlocProvider للثيم
      BlocProvider(create: (context) => LoginCubit()),
    
    ],
      child: BlocBuilder<ThemesCubit,ThemState>(
        builder: (context,state){
          return MaterialApp(



          theme:state.themeData  ,
          title: 'Flutter Demo',
          home: checkuser () ?Homescreen():OnboardingScreen(),
        );
          },

      ),
    );
  }
}
