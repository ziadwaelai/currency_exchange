import 'package:currency_exchange/bloc/cubit.dart';
import 'package:currency_exchange/components/components.dart';
import 'package:currency_exchange/components/currencyList.dart';
import 'package:currency_exchange/screens/selectedPage.dart';
import 'package:currency_exchange/shered/api.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('121212'),
      appBar: AppBar(
        backgroundColor: HexColor('121212'),
        centerTitle: true,
        title: Text(
          "Exchange Rate",
          style: TextStyle(
              color: Color.fromRGBO(76, 205, 203, 1),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    child:
                        contryCode(context, AppCubit.get(context).from, 'From'),
                  ),
                  onTap: () {
                    AppCubit.get(context).Title(AppCubit.get(context).where);

                    setState(() {});
                    AppCubit.get(context).where = 1;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedPage(),
                        ));
                  },
                ),
              ),
              FloatingActionButton(
                  backgroundColor: Color.fromRGBO(76, 205, 203, 1),
                  child: Icon(
                    Icons.compare_arrows_rounded,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeCurrency();
                  }),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: GestureDetector(
                    child: contryCode(context, AppCubit.get(context).to, 'To'),
                    onTap: () {
                      AppCubit.get(context).Title(AppCubit.get(context).where);
                      setState(() {});
                      AppCubit.get(context).where = 2;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedPage(),
                          ));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "${AppCubit.get(context).from}",
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(76, 205, 203, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(76, 205, 203, 1),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    setState(() {});
                    double amout = 0.0;
                    if (!value.isEmpty) {
                      amout = double.parse(value);
                    }

                    result(
                        from: "${AppCubit.get(context).from}",
                        to: "${AppCubit.get(context).to}",
                        amout: amout);
                  },
                ),
              ),
              Center(
                child: Text(
                  "${double.parse((results).toStringAsFixed(2))}  ${AppCubit.get(context).to}",
                  style: TextStyle(
                      color: Color.fromRGBO(76, 205, 203, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Data Proved at ",
                      style: TextStyle(
                          color: Color.fromRGBO(76, 205, 203, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "$date",
                      style: TextStyle(
                          color: Color.fromRGBO(76, 205, 203, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
