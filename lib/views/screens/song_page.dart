import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
            "Songs :- ${index + 1}",
          ),
        ),
      ),
    );
  }
}
