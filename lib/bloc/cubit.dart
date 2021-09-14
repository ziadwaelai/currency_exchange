import 'package:bloc/bloc.dart';
import 'package:currency_exchange/bloc/stata.dart';
import 'package:currency_exchange/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  String from = 'EGP';
  String to = 'USD';
  int where = 0;

  void changeText(String text, context) {
    if (where == 1) {
      from = text;
    } else {
      to = text;
    }
    Navigator.pop(context);
    emit(AppFromState());
    emit(AppToState());
  }

  String title;
  void Title(int i) {
    if (i == 1) {
      title = 'From';
    } else {
      title = "To";
    }
    emit(AppTitleState());
  }

  void changeCurrency() {
    String temp;
    temp = from;
    from = to;
    to = temp;
    emit(AppchangeState());
  }
  double amout = 0.0;

}
