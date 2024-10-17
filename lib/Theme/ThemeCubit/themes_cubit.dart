import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemState> {
  static final ThemeData LightTheme =ThemeData.light(
    useMaterial3: true
  );
  static final ThemeData DarkTheme =ThemeData.dark(
      useMaterial3: true
  );

  ThemesCubit() : super(ThemState(LightTheme));

  void toggleTheme (bool isdark ){
    final Themedata  =isdark ? DarkTheme :LightTheme;
    emit(ThemState(Themedata));
    _savetheme (isdark);
  }
  Future<void> _savetheme (bool isdark )async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isdark", isdark);
  }
  static Future <bool> LoadTheme ()async{
    final prefs = await SharedPreferences.getInstance();
    return  prefs.getBool("isdark ")??false;
  }
  Future <void>setinitalTheme ()async{
    final isDark = await LoadTheme();
    final Themedata = isDark ? DarkTheme :LightTheme;
    emit(ThemState(Themedata));

  }
}
