import 'package:flutter/material.dart';
import 'listMethod.dart';
import 'drawCirleGradient.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accordion UI',
      home: ChooseOptions(),
    );
  }
}

class ChooseOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //cho vào stack để lồng các layer)
        alignment: Alignment.center,
        children: [
          Center(
            child: CustomPaint(
              size: Size(400, 400),
              painter: CircleGradientPainter(),
            ),
          ),
          // Nội dung chính
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Accordion',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              // Danh sách các lựa chọn
              Container(
                //cho vào container để thêm thuộc tính
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    listMethod(context,
                        title: 'Present',
                        destination: DetailScreen(item: 'Present')),
                    Divider(color: Colors.blueAccent, thickness: 1),
                    listMethod(context,
                        title: 'Meeting',
                        destination: DetailScreen(item: 'Meeting')),
                    Divider(color: Colors.blueAccent, thickness: 1),
                    listMethod(context,
                        title: 'Interview',
                        destination: DetailScreen(item: "Interview")),
                  ],
                ),
              ),
            ],
            // Dịch lên giữa màn hình
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String item;

  const DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(item)),
        body: Center(
          child: Text("This is the detail screen for $item.",
              style: TextStyle(fontSize: 18)),
        ));
  }
}
