import 'package:currency_exchange/bloc/cubit.dart';
import 'package:currency_exchange/screens/selectedPage.dart';
import 'package:currency_exchange/shered/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

double result({@required String from, @required String to, double amout}) {
  double fromm = from == 'EUR' ? 0 : currency['$from'];
  double too = to == 'EUR' ? 0 : currency['$to'];
  if (from == 'EUR') {
    too = too * amout;
    results = too;
  } else if (to == "EUR") {
    too = amout / fromm;
    results = too;
  } else {
    too = amout * too / fromm;
    results = too;
  }

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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              child: CachedNetworkImage(
                width: 48,
                height: 36,
                // imageUrl:
                //     'https://www.countryflags.io/${text.substring(0, 2).toUpperCase()}/shiny/64.png',
                imageUrl:
                    'https://flagcdn.com/w80/${text.substring(0, 2).toLowerCase()}.png',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "${text == 'ILS' ? 'Occupation Power' : text}",
            style: TextStyle(
                color: text == 'ILS'
                    ? Colors.red
                    : Color.fromRGBO(76, 205, 203, 1),
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          ////////
        ],
      ),
      onTap: () {
        AppCubit.get(context).changeText(text, context);
        result(
            from: "${AppCubit.get(context).from}",
            to: "${AppCubit.get(context).to}",
            amout: AppCubit.get(context).amout);
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
