import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<dynamic> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  // API call to fetch movies
  Future<void> fetchMovies() async {
    final apiKey = 'xxx';
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=es-ES&page=1';
    // otras url's popular, now_playing, top_rated

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          movies = data['results'];
          isLoading = false;
        });
      } else {
        throw Exception('Fallo al cargar las películas');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Películas en Cartelera')),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final imageUrl =
                      'https://image.tmdb.org/t/p/w500${movie['poster_path']}';

                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder:
                          (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    title: Text(movie['title']),
                    subtitle: Text(movie['release_date']),
                    onTap: () {
                      // agregar acción al hacer clic en la película
                    },
                  );
                },
              ),
    );
  }
}
