import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/model_class.dart';

class VideoModelclass extends StatelessWidget {
  final ModelClass modelClass;

  const VideoModelclass({
    super.key,
    required this.modelClass,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 84,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black,
                    width: 0.5),
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      modelClass.image.toString(),
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  modelClass.name.toString(),
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1A1A1A)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
