import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String? x = '';

String? y = '';

String? op;

dynamic res;
dynamic ans;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.pink),
                      borderRadius: BorderRadius.circular(30)),
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        x.toString() == 'null' ? '' : x.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        op.toString() == 'null' ? '' : op.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        y.toString() == 'null' ? '' : y.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        res.toString() == 'null' ? '' : res.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                      ),
                      onPressed: () {
                        if (x == '') {
                          setState(() {
                            x = ans.toString();
                          });
                        }
                        if (op!=null&&x!='') {
                          setState(() {
                            y = ans.toString();
                          });
                        }
                      },
                      child: const Text('ans'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 280,
                          height: 285,
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            children: List.generate(9, (index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if (op == null) {
                                      setState(() {
                                        x = (x! + '$index');
                                        print('x = $x');
                                      });
                                    }
                                    if (x != null && op != null) {
                                      setState(() {
                                        y = (y! + '$index');
                                        print(
                                          'y = ' + y.toString(),
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: const LinearGradient(colors: [
                                        Colors.deepPurple,
                                        Colors.pink
                                      ]),
                                      color: Colors.deepPurple,
                                    ),
                                    child: Center(
                                      child: Text(
                                        index.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (x == null) {
                                  setState(() {
                                    x = (x! + '9');
                                    print('x = $x');
                                  });
                                }
                                if (x != null && op != null) {
                                  setState(() {
                                    y = (y! + '9');
                                    print('y = ' + y.toString());
                                  });
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepPurple,
                                ),
                                width: 85,
                                height: 85,
                                child: const Center(
                                  child: Text(
                                    '9',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  x = y = '';
                                  op = null;
                                  res = null;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepPurple,
                                ),
                                width: 85,
                                height: 85,
                                child: const Center(
                                  child: Text(
                                    'Del',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (x != null && y != null && op != null) {
                                  calc(x: x, y: y);
                                  setState(() {
                                    ans = calc(x: x, y: y);
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepPurple,
                                ),
                                width: 85,
                                height: 85,
                                child: const Center(
                                  child: Text(
                                    '=',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                op = '*';
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepPurple,
                              ),
                              width: 70,
                              height: 70,
                              child: const Center(
                                child: Text(
                                  'X',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                op = '%';
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepPurple,
                              ),
                              width: 70,
                              height: 77,
                              child: const Center(
                                  child: Text(
                                '%',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                op = '+';
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepPurple,
                              ),
                              width: 77,
                              height: 77,
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                op = '-';
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepPurple,
                              ),
                              width: 77,
                              height: 77,
                              child: const Center(
                                  child: Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  calc({required x, required y}) {
    int i = int.parse(x);
    int j = int.parse(y);
    switch (op) {
      case '*':
        setState(() {
          res = i * j;
          ans = res;
        });
        return res;
      case '+':
        setState(() {
          res = i + j;
          ans = res;
        });
        return res;
      case '%':
        setState(() {
          res = i / j;
          ans = res;
        });
        return res;
      case '-':
        setState(() {
          res = i - j;
          ans = res;
        });
        return res;
    }
  }
}
