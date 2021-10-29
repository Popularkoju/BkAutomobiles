import 'package:flutter/material.dart';

class AddDetailsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepOrangeAccent),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          const Text(
            "Add Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          GestureDetector(
            onTap: () {
              //save
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepOrangeAccent),
                child: const Icon(
                  Icons.check,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
