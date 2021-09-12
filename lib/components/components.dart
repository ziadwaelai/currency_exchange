import 'package:currency_exchange/bloc/cubit.dart';
import 'package:currency_exchange/screens/selectedPage.dart';
import 'package:currency_exchange/shered/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> currency = {};

void getCurrency() {
  getData().then((value) {
    currency = value['rates'];
  }).catchError((error) {
    print(error.toString());
  });
}

double results = 0;
String date = '2021-09-12';

double result(
    {@required String from, @required String to,  double amout}) {
  double fromm = currency['$from'];
  double too = currency['$to'];
  too = amout * too / fromm;
  results = too;

  return too;
}

Widget contryCode(
  context,
  String text,
  String where,
) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(76, 205, 203, 1)),
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text(
            "$text",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),
          ),
          Text(
            "$where",
            style: TextStyle(
                color: Color.fromRGBO(76, 205, 203, 1),
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    ),
  );
}

Widget contryCodeSelection(
  context,
  String text,
) {
  return Container(
    child: GestureDetector(
      child: Text(
        "$text",
        style: TextStyle(
            color: Color.fromRGBO(76, 205, 203, 1),
            fontSize: 40,
            fontWeight: FontWeight.w700),
      ),
      onTap: () {
        AppCubit.get(context).changeText(text, context);
      },
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 40.0, end: 40.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
