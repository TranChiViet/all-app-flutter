import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(
    this.imagePickFn,
  );

  final void Function(File? pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
        source: ImageSource.camera, maxWidth: 150, imageQuality: 50);
    if (imageFile != null) {
      setState(() {
        _pickedImage = File(imageFile.path);
        widget.imagePickFn(_pickedImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          child: _pickedImage != null
              ? Image.file(
                  _pickedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}
