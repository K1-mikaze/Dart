import 'dart:io';

import 'package:path_provider/path_provider.dart';

void saveVideo(File videoFile, String videoTitle) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final savePath = appDocDir.path + '/videos/$videoTitle.mp4';

  final videoBytes = await videoFile.readAsBytes();
  final File file = File(savePath);

  await file.writeAsBytes(videoBytes);

  // Show a success message or handle errors here
}
