import 'package:currency_exchange/screens/homeScreen.dart';
import 'package:currency_exchange/shered/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bloc/cubit.dart';
import 'bloc/stata.dart';
import 'components/components.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getData();
  getCurrency();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('121212'),
                    statusBarIconBrightness: Brightness.light),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.black),
              ),
              primaryColor: Colors.white,
              iconTheme: IconThemeData(color: Color.fromRGBO(76, 205, 203, 1)),
            ),
            debugShowCheckedModeBanner: false,
            title: 'currency exchange',
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
