import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavetalk/Screens/AuthScreen/LoginScreen/LoginScreen.dart';
import 'package:wavetalk/Screens/AuthScreen/RegisterScreen/RegisterScreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _showLogo = false;
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  void _startAnimations() {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _showLogo = true;
      });
    });
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        _showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff43116A),
                  Color(0xff0A1832),
                ],
                begin: Alignment.topCenter,
                end: Alignment.centerRight,
              ),
            ),
          ),
          // Animated logo
          AnimatedPositioned(
            left: _showLogo ? 70 : width * 0.5,
            top: _showLogo ? 20 : height * 0.3,
            duration: Duration(milliseconds: 400),
            child: AnimatedOpacity(
              opacity: _showLogo ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: ClipRect(
                child: Image.asset(
                  "assets/images/logo-color-removebg.png",
                  color: Colors.white,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
            ),
          ),
          // Animated text below logo
          AnimatedPositioned(
            left: 0,
            top: _showText ? height*.1 : height,
            duration: Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: ClipRect(
                child: Image.asset(
                  "assets/images/Connect friends easily & quickly (1).png",
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
            ),
          ),
          // Text section
          AnimatedPositioned(
            top:_showText? height * 0.51:height,
            duration: Duration(milliseconds: 600),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our chat app is the perfect\n way to stay connected ",
                    style: TextStyle(
                      fontFamily: "circularstd",
                      color: Color(0xffB9C1BE),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "  with friends & family",
                    style: TextStyle(
                      fontFamily: "circularstd",
                      color: Color(0xffB9C1BE),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Social media icons
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            top: _showText?height * 0.67:height,
            child: Row(
              children: [
                SizedBox(width: width * 0.26),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    child: Icon(Icons.facebook, size: 40, color: Colors.blue),
                    radius: 30,
                  ),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 30,
                    child: Image.asset("assets/images/Google-Symbol.png", width: 60),
                  ),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.apple, size: 40, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // OR Divider with animation
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),

            top:_showText? height * 0.75:height,
            width: width,
            child: Row(
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
          ),
          // Sign-up button with animation
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),

            left: width * 0.049,
            top: _showLogo ?height * 0.80:height,
            child: AnimatedOpacity(
              opacity: _showText ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: (){},
                child: InkWell(
                  onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>RegisterScreen()));},
                  child: Container(
                    width: width * 0.9,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Sign up with mail",
                        style: GoogleFonts.akshar(
                          fontSize: 30,
                          color: Color(0xff000E08),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Login section
          Positioned(
            left: width * 0.24,
            top: height * 0.92,
            child: Row(
              children: [
                Text(
                  "Existing account?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffB9C1BE),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                  },
                  child: Text(
                    "Log in ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
