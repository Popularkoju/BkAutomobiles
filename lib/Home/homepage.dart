import 'package:bkautomobiles/Home/widgets/home_page_header.dart';
import 'package:bkautomobiles/Home/widgets/search.dart';
import 'package:flutter/material.dart';

import 'widgets/homepage_tiles.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: const [
          homePageHeader(),
          Search(),
          HomePageCard(),
        ],
      ),
    ));
  }
}
