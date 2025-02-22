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
      title: 'Flutter Demo',
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
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Calculate Your BMI",
                  style: Myfont().copyWith(fontSize: 25),
                ),
                Gap(),
                TextField(
                  decoration: InputDecoration(
                      label: Text(
                        "Enter your Weight (in KG)",
                        style: Myfont(),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
                Gap(),
                TextField(
                  decoration: InputDecoration(
                      label: Text(
                        "Enter Your Height (in Feet)",
                        style: Myfont(),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
                Gap(),
                TextField(
                  decoration: InputDecoration(
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
                    },
                    child: Text(
                      "Calculate",
                      style: Myfont().copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Gap(),
                Text(
                  "data",
                  style: Myfont(),
                )
              ],
            ),
          ),
        ));
  }
}
