import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_and_themeing/features/home_screen/data/datasources/remotly/movie_service.dart';
import 'package:maps_and_themeing/features/home_screen/data/repos/movie_repo.dart';
import 'package:maps_and_themeing/features/home_screen/presentation/cubits/movie_cubit.dart';
import 'package:maps_and_themeing/features/home_screen/presentation/pages/movies_screen.dart';
import 'package:maps_and_themeing/google_maps_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
  create: (context) => MovieCubit( 
    MovieRepo(
      MovieServices(
        Dio(),
      ),
    ),
  )..fetchMovies(),
  child: const MovieListPage(),
),
 //MapScreen() ,
    );
  }
}
