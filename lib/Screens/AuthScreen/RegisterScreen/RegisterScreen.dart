import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wavetalk/Helpers/customtextfiled/customtextfiled.dart';
import 'package:wavetalk/Screens/AuthScreen/LoginScreen/LoginCubit/login_cubit.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  late final String? Function(String?)? validator ;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      final bloc = context.read<LoginCubit>();
      double height = MediaQuery.of(context).size.height;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              if(Navigator.canPop(context)){ Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _key,
            child: ListView(
              children: [
                SizedBox(height: height * 0.05),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Sign up with",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Email",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000E08),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Get chatting with friends and family today by signing up for our chat app!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomTextField(
                    icon: const Icon(Icons.person, color: Color(0xff0186c7)),
                    controller: _nameController,
                    height: height,
                    text: "Your name",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter your name.";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomTextField(
                    icon: const Icon(Icons.email_outlined, color: Color(0xff0186c7)),
                    controller: _emailController,
                    height: height,
                    text: "Your email",
                    validator: (val) {
                      if (!val!.isEmail) {
                        return "This should be a valid email.";
                      } else if (val.length < 10) {
                        return "Email should be more than 10 letters.";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomTextField(
                    icon: const Icon(Icons.lock, color: Color(0xff0186c7)),
                    controller: _passwordController,
                    height: height,
                    text: "Password",
                    isPassword: true,
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password should be more than 6 letters.";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomTextField(
                    icon: const Icon(Icons.lock, color: Color(0xff0186c7)),
                    controller: _confirmPasswordController,
                    height: height,
                    text: "Confirm Password",
                    isPassword: true,
                    validator: (val) {
                      if (val != _passwordController.text) {
                        return "Passwords do not match.";
                      }
                      return null;
                    },
                  ),
                ),
                Spacer(),

                Center(
                  child: InkWell(
                    onTap: (){
                      bloc.CreateNewUser(context, _emailController.text, _passwordController.text, _key, _nameController.text);},
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 29,)
              ],
            ),
          ),
        ),
      );
    }
  }

