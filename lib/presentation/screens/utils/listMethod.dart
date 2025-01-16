import 'package:flutter/material.dart';

Widget listMethod(BuildContext context,
    {required String title, required Widget destination}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.white, width: 2),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.blue),
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_down, color: Colors.orange),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    ),
  );
}