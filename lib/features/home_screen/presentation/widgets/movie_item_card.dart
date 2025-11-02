

import 'package:flutter/material.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_model.dart';

class MovieItemCard extends StatelessWidget {

  final Result movie;

  const MovieItemCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        color: const Color(0xFF1C1C1C),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: movie.name .isEmpty
                    ? const Icon(Icons.image_outlined,
                        color: Colors.white54, size: 40)
                    : null,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (movie.name.isNotEmpty)
                      Text(
                        movie.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (movie.name.isNotEmpty) const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '${movie.favoriteCount}/10',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        movie.favoriteCount.toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}