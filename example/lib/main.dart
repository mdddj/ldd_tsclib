import 'package:flutter/material.dart';
import 'package:ldd_printers/api/printers.dart';
import 'package:ldd_printers/ldd_printers.dart';
import 'dart:async';

import 'package:ldd_tsclib/ldd_tsclib.dart' as ldd_tsclib;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initPrinterLibaray();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<LddWinPrinter> list = [];
  Future<void> _getAllPrinters() async {
    list = await lddGetAllPrinters();
    setState(() {});
  }

  @override
  void initState() {
    _getAllPrinters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Wrap(
                  runSpacing: 12,
                  spacing: 12,
                  children: [
                    ...list.map((v) {
                      return InkWell(
                          onTap: () {
                            ldd_tsclib.openport(v.driverName);
                          },
                          child: Chip(label: Text(v.driverName)));
                    })
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      ldd_tsclib.about();
                    },
                    child: Text("关于")),
                ElevatedButton(
                    onPressed: () {
                      ldd_tsclib.closeport();
                    },
                    child: Text("关闭端口")),
                ElevatedButton(
                    onPressed: () {
                      ldd_tsclib.setup(
                          a: '100',
                          b: '55',
                          c: '1.0',
                          d: '3',
                          e: '10',
                          f: '0',
                          g: '0');
                    },
                    child: Text("SETUP")),
                ElevatedButton(
                    onPressed: () {
                      ldd_tsclib.clearBuffer();
                    },
                    child: Text('清除')),
                ElevatedButton(
                    onPressed: () {
                      ldd_tsclib.barcode(
                          a: '10',
                          b: '0',
                          c: 'EAN13',
                          d: '80',
                          e: '1',
                          f: '0',
                          g: '2',
                          h: '4',
                          l: '123456789012');
                    },
                    child: Text("打印条码")),
                ElevatedButton(
                    onPressed: () {
                      ldd_tsclib.downloadPcx(
                          filepath: "c:\\img.bmp", filename: 'DEMO.BMP');
                    },
                    child: Text("下载图片")),
                ElevatedButton(
                    onPressed: () {
                      ldd_tsclib.printLabel('1', '1');
                    },
                    child: Text("打印")),
                Text("""
openport(“TSC TDP-245”) 
setup("32","25","2","10","0","0","0") 
clearbuffer() 
barcode("10","0","EAN13","80","1","0","2","4","123456789012") 
windowsfont(10,100,50,0,0,0,"标楷体","标楷体字型") 
printlabel("1","1") 
closeport() 
""")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
