 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wavetalk/Helpers/customtextfiled/customtextfiled.dart';
import 'package:wavetalk/Screens/AuthScreen/LoginScreen/LoginCubit/login_cubit.dart';
import 'package:wavetalk/Screens/AuthScreen/RegisterScreen/RegisterScreen.dart';
import 'package:wavetalk/Screens/HomeScreen/HomeScreen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  late final String? Function(String?)? validator ;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bolc = context.read<LoginCubit>();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height*.17,),
            Center(child: Column(
              children: [
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),gradient: LinearGradient(colors: [Color(0xff58C3B6),Colors.white],)),child: Text("Log in to WaveTalk",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff000E08)),)),
                Padding(
                  padding: const EdgeInsets.only(left: 32,top: 10),
                  child: Text("Welcome back! Sign in using your social  account or email to continue us",style: TextStyle(fontSize: 18,fontFamily: "circularstd",color:Color(0xff797C7B)),),
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    SizedBox(width: width * 0.26),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration( 
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        )
                      ),
                        child: CircleAvatar(
                          child: Icon(Icons.facebook, size: 50, color: Color(0xff1877f2)),backgroundColor: Color(0xffFEF7FF),
                          radius: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            )
                        ),
        
                        child: InkWell(
                          onTap: ()async{await bolc.signInWithGoogle(context);},
                          child: CircleAvatar(
                            radius: 30,
                            child: Image.asset("assets/images/Google-Symbol.png", width: 60),
                              backgroundColor: Color(0xffFEF7FF)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            )
                        ),
        
                        child: CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.apple, size: 50, color: Colors.black),backgroundColor: Color(0xffFEF7FF)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
        
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Form(
                    key: _key,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            icon: const Icon(Icons.email_outlined,color:  Color(0xff0186c7)),
                            controller: _nameController,
                            height: height,
                            text: "Email",
                            validator: (val) {
                              if (!val!.isEmail) {
                                return "this should be valid Email.";
                              } else if (val.length < 10) {
                                return " email should be more than 10 letters";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Padding(
        
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            icon: const Icon(Icons.lock,color:  Color(0xff0186c7)),
                            height: height,
                            controller: _passwordController,
                            text: "Password",
                            isPassword: true,
                            validator: (val) {
                              if (val!.length < 6) {
                                return "Password should be more than 7 letters";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )
        
                ),
        
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                        onTap: () {
        
                        },
                        child: const Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color: Color(0xff24786D),
                              fontWeight: FontWeight
                                  .bold)
                        ))
                  ],
                ),
                const SizedBox(
                  height:180,
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: (){bolc.Signin(_nameController.text,_passwordController.text , _key, context);},
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Log in ",
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
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have any account ? "),
                    InkWell(
                        onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>RegisterScreen()));
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                              color: Color(0xff24786D),
                              fontWeight: FontWeight
                                  .bold) /*GoogleFonts.agbalumo(color: Color(0xff0186c7))*/,
                        ))
                  ],
                )
              ],
            )),
        
          ],
        ),
      ),
    );
  }
}
