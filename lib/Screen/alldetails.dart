import 'package:flutter/material.dart';

import '../HomeScreen/model/contactinfo.dart';

class AllContactDetails extends StatelessWidget {
  const AllContactDetails({Key? key, required this.contact}) : super(key: key);

  final ContactInfo contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(contact.image),
              Text(
                contact.name,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                contact.jopTitle,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.red,
                    size: 20,
                  ),
                  Text(
                    contact.phone,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Text(
                contact.address,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                contact.note,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
