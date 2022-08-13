import 'package:flutter/cupertino.dart';

class MovieInfoIconTile extends StatelessWidget {
  IconData icon;
  String text;

  MovieInfoIconTile({required this.icon, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), const SizedBox(width: 4), Text(text)],
    );
  }
}
