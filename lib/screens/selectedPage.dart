import 'package:currency_exchange/bloc/cubit.dart';
import 'package:currency_exchange/components/components.dart';
import 'package:currency_exchange/components/currencyList.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('121212'),
      appBar: AppBar(
        backgroundColor: HexColor('121212'),
        title: Text(
          "${AppCubit.get(context).title}",
          style: TextStyle(
              color: Color.fromRGBO(76, 205, 203, 1),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(76, 205, 203, 1),
              ),
              onPressed: () {})
        ],
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return myDivider();
          },
          itemCount: currencyNameList.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: contryCodeSelection(context, currencyNameList[index]));
          }),
    );
  }
}


//  Text(
//             "${currencyNameList[index]}",
//             style: TextStyle(color: Colors.blue),
//           );