// ignore_for_file: prefer_const_constructors

import 'package:bkautomobiles/View_Details/view_details.dart';
import 'package:bkautomobiles/add_details/add_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(children: [
          ListTile(
              title: Text("Add customer details",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                "Name, Address, contact number",
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              leading: Icon(
                Icons.person_add,
                color: Colors.red,
                size: 45,
              ),
              tileColor: Colors.amberAccent,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddDetails()));
              }),
          SizedBox(
            height: 8,
          ),
          ListTile(
            title: Text("View customer details",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              "Name, Address, contact number...",
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(
              Icons.bookmark_added_rounded,
              color: Colors.red,
              size: 45,
            ),
            tileColor: Colors.amberAccent,
            onTap: () {
              Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewDetails()));
            },
          ),
        ]),
      ),
    );
  }
}
