# academy_pratica_f1

import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var color = Colors.red;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cor aleatória',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(color: color),
          ),
          TextButton(
            child: const Text('Sortear cor'),
            onPressed: () {
              setState(() {
                switch (random.nextInt(9)) {
                  case 0:
                    color = Colors.blue;
                    break;
                  case 1:
                    color = Colors.amber;
                    break;
                  case 2:
                    color = Colors.cyan;
                    break;
                  case 3:
                    color = Colors.red;
                    break;
                  case 4:
                    color = Colors.pink;
                    break;
                  case 5:
                    color = Colors.orange;
                    break;
                  case 6:
                    color = Colors.indigo;
                    break;
                  case 7:
                    color = Colors.lime;
                    break;
                  case 8:
                    color = Colors.grey;
                    break;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

