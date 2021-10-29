import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.orangeAccent.withOpacity(0.3),
      ),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 8, left: 12, top: 8, bottom: 8),
            child: Icon(
              Icons.search_rounded,
              color: Colors.deepOrange,
              size: 30,
            ),
          ),
          Text('Search', style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
