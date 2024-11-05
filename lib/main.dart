import 'package:filmood/di/get_it.dart';
import 'package:filmood/domain/entities/movie_entity.dart';
import 'package:filmood/domain/usecases/get_trending.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmood',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GetTrending _getTrending;
  List<MovieEntity> _movies = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _getTrending = getItInstance<GetTrending>();
    _fetchTrendingMovies();//caling the method to fetch the movies
  }

  Future<void> _fetchTrendingMovies() async {
    try {
      final movies = await _getTrending(); // Fetch movies using the repository
      // Log the movies to the console
      print('Trending Movies:');
      for (var movie in movies) {
        print('ID:${movie.id} ,Title: ${movie.title}, Release Date: ${movie.releaseDate}');
      }
      setState(() {
        _movies = movies; // Update the state with the fetched movies
        _isLoading = false; // Set loading to false
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load trending movies: $e'; // Update error state
        _isLoading = false; // Set loading to false
      });
      print('Error fetching movies: $e'); // Log the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(child: Text(_error))
              : ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    return ListTile(
                      leading: Image.network(
                        'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                      ),
                      title: Text(movie.title),
                      subtitle: Text(movie.releaseDate),
                    );
                  },
                ),
    );
  }
}
