import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'save_video.dart';

void downloadVideo(String url) async {
  var ytExplode = YoutubeExplode();
  var video = await ytExplode.videos.get(url);
  var videoTitle = video.title;

  var manifest = await ytExplode.videos.streamsClient.getManifest(video);

  var streamInfo = manifest.audioOnly.first;
  var videoStream = manifest.video.first;

  var audioStream = ytExplode.videos.streamsClient.get(streamInfo);
  var videoFile = await ytExplode.videos.streamsClient.get(videoStream);

  final appPath = await getApplicationDocumentsDirectory();
  final filePath = appPath.path + '/videos/$videoTitle.m4a';
  final file = File(filePath);

  // Open a file for writing.
  final fileStream = file.openWrite();

  // Get the actual stream.
  final stream = ytExplode.videos.streamsClient.get(streamInfo);

  print('Downloading audio...');
  // Pipe the stream to the file.
  await stream.pipe(fileStream);

  // Close the file stream.
  await fileStream.flush();
  await fileStream.close();
}
