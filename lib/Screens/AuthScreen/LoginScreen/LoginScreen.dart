 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:wavetalk/Helpers/customtextfiled/customtextfiled.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  late final String? Function(String?)? validator ;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height*.17,),
          Center(child: Column(
            children: [
              Text("Log in to WaveTalk",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff000E08)),),
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

                      child: CircleAvatar(
                        radius: 30,
                        child: Image.asset("assets/images/Google-Symbol.png", width: 60),
                          backgroundColor: Color(0xffFEF7FF)
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
                height: 40,
              ),
              GestureDetector(
                onTap: () {
/*
                  bloc.Login(context,_key,_nameController,_passwordController);
*/
                },
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xff24786D),
                        borderRadius: BorderRadius.circular(24),
                        // Optional: Rounded corners
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5))
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text("Login",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  )))
                        ]),
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
    );
  }
}
