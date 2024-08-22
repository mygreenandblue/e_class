import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveImagePaths(List<File> images) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> imagePaths = images.map((file) => file.path).toList();
  prefs.setStringList('saved_images', imagePaths);
}

Future<List<File>> getSavedImages() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? imagePaths = prefs.getStringList('saved_images');

  if (imagePaths != null) {
    return imagePaths.map((path) => File(path)).toList();
  } else {
    return [];
  }
}

Future<void> deleteAllSavedImages() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('saved_images');
}

Future<void> deleteSpecificImage(File image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? imagePaths = prefs.getStringList('saved_images');

  if (imagePaths != null) {
    imagePaths.remove(image.path);
    prefs.setStringList('saved_images', imagePaths);
  }
}
