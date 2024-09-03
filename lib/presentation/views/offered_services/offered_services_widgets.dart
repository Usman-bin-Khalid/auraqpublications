import 'package:auraq_bulk_calculator/model/model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OfferedServicesWidgets extends StatelessWidget{
  final ModelClass modelClass;

  const OfferedServicesWidgets({super.key, required this.modelClass});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5, color: Colors.black),
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(modelClass.image.toString(),
              width: 70,
                height: 70,
              ),
            ),
            SizedBox(height: 24,),
            GestureDetector(
              onLongPress: () => copyToClipboard(context, modelClass.name),
              child: Center(
                child: Text(modelClass.name.toString(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                color: Colors.black),),
              ),
            ),
            SizedBox(height: 8,),
            GestureDetector(
              onLongPress: () => copyToClipboard(context, modelClass.description.toString()),
              child: Text(modelClass.description.toString(), style: TextStyle(fontSize: 14, color: Color(0xff6B6E74),),
              textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Copied to clipboard")),
    );
  }

}