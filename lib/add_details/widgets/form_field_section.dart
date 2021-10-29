import 'package:flutter/material.dart';

class FormFieldSection extends StatefulWidget {
  @override
  _FormFieldSectionState createState() => _FormFieldSectionState();
}

class _FormFieldSectionState extends State<FormFieldSection> {
  // Defining key for forms --------------------------------
  final _formKey = GlobalKey<FormState>();
  // Defining key for forms - END -------------------------
  //Defining controller ****************************************
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var contactController = TextEditingController();
  var bikeController = TextEditingController();
  // Defining controller Ends **********************************
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Name",
                      icon: const Icon(
                        Icons.person_outline_sharp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Bike Number",
                      icon: const Icon(
                        Icons.format_list_numbered,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Contact Number",
                      icon: const Icon(
                        Icons.phone_android_sharp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Address",
                      icon: const Icon(
                        Icons.home,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, right: 45, left: 45),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 0,
                            primary: Colors.deepOrangeAccent),
                        onPressed: () {
                          onPressButton(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Add to Database',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

onPressButton(BuildContext context) {}
