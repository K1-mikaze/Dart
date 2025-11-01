import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OeschinenVideo extends StatefulWidget {
  final String videoTxt;
  final String videoUrl;

  const OeschinenVideo({
    super.key,
    required this.videoUrl,
    required this.videoTxt,
  });

  @override
  State<OeschinenVideo> createState() => _OeschinenVideoState();
}

class _OeschinenVideoState extends State<OeschinenVideo> {
  late VideoPlayerController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller
        .initialize()
        .then((value) {
          setState(() {
            // el video ha sido inicializado, cambia el estado
            _isLoading = false;
          });
        })
        .catchError((error) {
          print('Error al inicializar el video: $error');
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.videoTxt)),
      body: Center(
        child:
            _isLoading
                ? CircularProgressIndicator() // indicador de carga
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // el video ocupa todo el ancho y el espacio restante
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      padding: const EdgeInsets.all(8),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
