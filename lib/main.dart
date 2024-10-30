import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        isUserSignedIn = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemesCubit()..setinitalTheme()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: BlocBuilder<ThemesCubit, ThemState>(
        builder: (context, state) {
          return GetMaterialApp(
            theme: state.themeData,
            title: 'Flutter Demo',
            home: isUserSignedIn ? Homescreen() : OnboardingScreen(),
          );
        },
      ),
    );
  }
}
