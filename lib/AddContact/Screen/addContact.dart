// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:contacts/HomeScreen/model/contactinfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../HomeScreen/model/contactProvider.dart';
import '../model/photoProvider.dart';
import '../widget/photoList.dart';

class Addcontact extends StatefulWidget {
  const Addcontact({Key? key}) : super(key: key);

  @override
  State<Addcontact> createState() => _AddcontactState();
}

class _AddcontactState extends State<Addcontact> {
  @override
  Widget build(BuildContext context) {
    var name;
    var address;
    var phone;
    var jobTitle;
    var note;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PhotoProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Contact'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Choose Image'),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: PhotoList(),
              ),
              TextFormField(
                  onChanged: (val) {
                    name = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    final trimmed = value?.trim();
                    if (trimmed == null || trimmed.isEmpty) {
                      return 'need';
                    }
                    return null;
                  }),
              const Text('Enter Contact First and Last Name'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                  onChanged: (val) {
                    phone = val;
                  },
                  validator: (value) {
                    final trimmed = value?.trim();
                    if (trimmed == null || trimmed.isEmpty) {
                      return 'need';
                    }
                    return null;
                  }),
              const Text('Enter phone number'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Jop Title',
                  ),
                  onChanged: (val) {
                    jobTitle = val;
                  },
                  validator: (value) {
                    final trimmed = value?.trim();
                    if (trimmed == null || trimmed.isEmpty) {
                      return 'need';
                    }
                    return null;
                  }),
              const Text('Enter Jop Title'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Addres',
                  ),
                  onChanged: (val) {
                    address = val;
                  },
                  validator: (value) {
                    final trimmed = value?.trim();
                    if (trimmed == null || trimmed.isEmpty) {
                      return 'need';
                    }
                    return null;
                  }),
              const Text('Enter contact address'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                  ),
                  onChanged: (val) {
                    note = val;
                  },
                  validator: (value) {
                    final trimmed = value?.trim();
                    if (trimmed == null || trimmed.isEmpty) {
                      return 'need';
                    }
                    return null;
                  }),
              const Text('Enter contact Note'),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Center(
                  child: Text(
                    'Save it',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    final contact = ContactInfo(
                      name: name,
                      phone: phone,
                      address: address,
                      jopTitle: jobTitle,
                      note: note,
                      image: 'assets/person.jpg',
                    );
                    Provider.of<ContactData>(context, listen: false)
                        .addContact(contact);

                    Navigator.of(context).pop(false);
                  });
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
