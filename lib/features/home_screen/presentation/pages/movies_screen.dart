import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_model.dart';
import 'package:maps_and_themeing/features/home_screen/presentation/cubits/movie_cubit.dart';
import 'package:maps_and_themeing/features/home_screen/presentation/widgets/movie_item_card.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Result> movies = [];
  //   /
  //   Movie(title: '', rating: 8.7, genre: 'Sci-Fi'),
  //   Movie(title: 'Fight Club', rating: 8.8, genre: 'Drama'),
  //   Movie(title: 'Forrest Gump', rating: 8.8, genre: 'Drama'),
  //   Movie(title: 'The Shawshank Redemption', rating: 9.2, genre: 'Drama'),
  //   Movie(title: 'The Godfather', rating: 9.2, genre: 'Crime'),
  // ];
  @override
  void initState() {
    super.initState();
  
    movies = context.read<MovieCubit>().state is MovieSuccess
        ? (context.read<MovieCubit>().state as MovieSuccess).movies
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1C1C1C),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.brightness_6_outlined,
              color: Colors.cyanAccent,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieSuccess) {
                  movies = state.movies;
                } else if (state is MovieError) {
                  return Center(child: Text(state.message));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieItemCard(movie: movies[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A2A2A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Load More Movies',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
