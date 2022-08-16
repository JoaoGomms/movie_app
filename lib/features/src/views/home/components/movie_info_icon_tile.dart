import 'package:flutter/material.dart';

class MovieInfoIconTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const MovieInfoIconTile({required this.icon, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue[900],
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
