import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

class FileFunctions {
  pickGalleryImage(BuildContext context, File? imageUrl) async {
    var status = Permission.photos;
    try {
      if (await status.isDenied) {
        Permission.storage.request();
      } else {
        var pickedImage = await ImagePicker.platform
            .getImageFromSource(source: ImageSource.gallery);

        imageUrl = File(pickedImage!.path);

        print(imageUrl);
      }
    } catch (e) {
      VxToast.show(context, msg: 'Failed To Select Image, Please Try Again.');
    }
  }
}
