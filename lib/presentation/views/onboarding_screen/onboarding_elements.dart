import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/model_class.dart';

class ModelElements extends StatelessWidget {
  final ModelClass modelClass;

  const ModelElements({super.key, required this.modelClass});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            modelClass.image.toString(),
            height: 200,
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Center(
            child: Text(
              modelClass.name.toString(),
              style: TextStyle(
                fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
