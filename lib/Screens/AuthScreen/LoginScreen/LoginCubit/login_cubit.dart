import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:wavetalk/Screens/HomeScreen/HomeScreen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future <void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print ("1111111111111111111111111111");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    print ("@22222222222222222222222222211");
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print("33333333333333333333333333333333");

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("444444444444444444444444444");
    final userId =FirebaseAuth.instance.currentUser?.uid;

    if (  userId !=null){
      DocumentSnapshot document = await FirebaseFirestore.instance.collection("users").doc(userId).get();
      if (!document.exists){
        print("Done111111111111111111111111111111111111111111111111111");


        await FirebaseFirestore.instance.collection("users").doc(userId)
            .collection("userProfile").doc("profile")
            .set({"username": FirebaseAuth.instance.currentUser!.displayName,});
        print("Done22222222222222222222222222222222222222222222222222");


      }
    }


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homescreen()),
    );




  }

  Future <void>CreateNewUser (BuildContext context,emailAddress,password, GlobalKey<FormState> key,username)async {
    try {
      if(key.currentState!.validate())
        {emit(LoadingLoginState());
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      User? user = credential.user;
      if(user !=null)
        {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Homescreen()));

      await FirebaseFirestore.instance.collection("users").doc(user.uid)
          .collection("userProfile").doc("profile")
          .set({username: username,});
      emit(SuccessLoginState());
        }
      else{
        emit(errorLoadingState("Error"));
      }
        }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(errorLoadingState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(errorLoadingState('The account already exists for that email'));
      }
    } catch (e) {
      emit(errorLoadingState(e.toString()));
    }
  }
  Future <void> Signin(emailAddress,password,GlobalKey<FormState> key,BuildContext context)async{
    try {
      if(key.currentState!.validate()) {
        emit(LoadingLoginState());
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailAddress,
            password: password
        );
        if (credential.user != null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Homescreen()));
        emit(SuccessLoginState());
      }
        else{emit(errorLoadingState("error"));}
        }
    }
    catch (e) {
      emit(errorLoadingState(e.toString()));

      }
    }
  }
  Future<void>resetpassword ()async{

  }

