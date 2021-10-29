import 'dart:convert';
import 'dart:math';

import 'package:bkautomobiles/Base_client_Services/base_client.dart';
import 'package:bkautomobiles/View_Details/view_details_model.dart';
import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({Key? key}) : super(key: key);

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  late Future<List<Get>> futureData;

  final url = "http://192.168.1.119/bkautomobiles/view_customer_list.php";

  Future<List<Get>> fetchdata() async {
    final response = await BaseClient().get(url);
    print(response);

    return response;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    futureData = fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<dynamic>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          List<Get>? data;

          return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Container(child: Text(data[index].id.toString()));
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}


// class DetailsList extends StatelessWidget {
//   const DetailsList({ Key? key }) : super(key: key);
  

//   @override
//   Widget build(BuildContext context) {
  
    
  
//     return ListView.builder(
      
//       itemCount:fetchdat.length,
//       itemBuilder: (context, index) {
//         return Image.network(photos[index].thumbnailUrl);
//       },
//     );
//   }
// }