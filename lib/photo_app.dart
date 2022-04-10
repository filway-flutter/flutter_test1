import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoApp extends StatefulWidget {
  const PhotoApp({Key? key}) : super(key: key);

  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

///实战尝鲜】拍照APP开发
class _PhotoAppState extends State<PhotoApp> {
  final List<XFile?> _images = [];

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker().pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('【实战尝鲜】拍照APP开发'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: _images.length == 0
            ? Text('No image selected')
            : Wrap(
                spacing: 5,
                runSpacing: 5,
                children: _getImages(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: [
                  _item('拍照', true),
                  _item('相册选择', false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _getImages() {
    return _images
        .map(
          (file) => Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.file(
                  File(file!.path),
                  width: 120,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _images.remove(file);
                    });
                  },
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(color: Colors.black54),
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        .toList();
  }
}
