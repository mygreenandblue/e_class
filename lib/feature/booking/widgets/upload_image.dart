import 'dart:async';
import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadImage extends StatefulWidget {
  final Function(String?, File?) onImageSelected;

  UploadImage({required this.onImageSelected});

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String? _imagePath;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getImageFromCamera() async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!isCameraGranted) {
      // Have not permission to camera
      return;
    }

    // Generate filepath for saving
    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    bool success = false;

    try {
      // Make sure to await the call to detectEdge.
      success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Scanning', // use custom localizations for android
        androidCropTitle: 'Crop',
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      print("success: $success");
    } catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      if (success) {
        _imagePath = imagePath;
        _imageFile = File(imagePath);
        widget.onImageSelected(
            _imagePath, _imageFile); // Pass the path and file back to parent
      }
    });
  }

  Future<void> getImageFromGallery() async {
    // Generate filepath for saving
    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    bool success = false;
    try {
      // Make sure to await the call to detectEdgeFromGallery.
      success = await EdgeDetection.detectEdgeFromGallery(
        imagePath,
        androidCropTitle: 'Crop', // use custom localizations for android
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      print("success: $success");
    } catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      if (success) {
        _imagePath = imagePath;
        _imageFile = File(imagePath);
        widget.onImageSelected(
            _imagePath, _imageFile); // Pass the path and file back to parent
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: getImageFromCamera,
            child: const Text('Chụp ảnh'),
          ),
        ),
        const SizedBox(width: 20),
        Center(
          child: ElevatedButton(
            onPressed: getImageFromGallery,
            child: const Text('Tải ảnh lên'),
          ),
        ),
      ],
    );
  }
}
