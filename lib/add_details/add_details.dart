import 'package:bkautomobiles/add_details/widgets/add_details_header.dart';
import 'package:bkautomobiles/add_details/widgets/form_field_section.dart';
import 'package:flutter/material.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            AddDetailsHeader(),
            FormFieldSection(),
          ],
        ),
      ),
    );
  }
}
