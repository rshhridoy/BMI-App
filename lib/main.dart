import 'dart:ffi';

import 'package:bmi_app/custom_widget/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      darkTheme:
          ThemeData(colorScheme: ColorScheme.dark(primary: Colors.black87)),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var htfController = TextEditingController();
  var htinController = TextEditingController();

  var result = " ";
  var icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset("assets/images/title.png")),
              Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'LilitaOne'),
              ),
            ],
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calculate_rounded),
                    Text(
                      "Calculate Your BMI",
                      style: Myfont().copyWith(fontSize: 25),
                    ),
                  ],
                ),
                Gap(),
                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monitor_weight_rounded),
                      label: Text(
                        "Enter your Weight (in KG)",
                        style: Myfont(),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
                Gap(),
                TextField(
                  controller: htfController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height_rounded),
                      label: Text(
                        "Enter Your Height (in Feet)",
                        style: Myfont(),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
                Gap(),
                TextField(
                  controller: htinController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height_rounded),
                      label: Text(
                        "Enter Your Height (in Inch)",
                        style: Myfont(),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
                Gap(),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    onPressed: () {
                      // Handle button press
                      var wt = wtController.text.toString();
                      var ft = htfController.text.toString();
                      var inch = htinController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iinch = int.parse(inch);

                        var tinch = (ift * 12) + iinch;
                        var hcm = tinch * 2.54;
                        var hm = hcm / 100;

                        var msg;

                        var bmi = iwt / (hm * hm);

                        if (bmi > 25) {
                          msg = "You are Overweight";
                        } else if (bmi < 18) {
                          msg = "You are Underweight";
                        } else {
                          msg = "Perfect";
                        }

                        setState(() {
                          result =
                              "$msg.\n     Your BMI is ${bmi.toStringAsFixed(0)}";
                        });
                      } else {
                        setState(() {
                          result =
                              "Please Enter All The Required Blanks to Calculate";
                        });
                      }
                    },
                    child: Text(
                      "Calculate",
                      style: Myfont().copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Gap(),
                Text(
                  result,
                  style: Myfont().copyWith(fontSize: 16),
                )
              ],
            ),
          ),
        ));
  }
}
