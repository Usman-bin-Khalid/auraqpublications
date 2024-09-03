import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class UploadFileServices{
  //Upload image to Storage
  Future<String> getUrl(BuildContext context, File? file) async{
    String postfileUrl = "";
    try{
      if(file != null) {
        Reference storageReference = FirebaseStorage.instance.ref().child('uploadimage/images/${file.path.split('/')
            .last}');
        UploadTask uploadTask = storageReference.putFile(file);
        await uploadTask.whenComplete(() async {
          await storageReference.getDownloadURL().then((fileURL) {
            
            postfileUrl = fileURL;
          });
        });
        return postfileUrl;
      }else{
        return "";
      }
    }catch(e){
      rethrow;
    }
  }
}