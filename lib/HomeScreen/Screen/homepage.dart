// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AddContact/Screen/addContact.dart';

import '../model/contactProvider.dart';
import '../widget/contavtList.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts App'),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: const Text('Delete All'),
                  onTap: () {
                    Provider.of<ContactData>(context, listen: false).clear();
                  }),
              const PopupMenuItem(
                child: Text('About'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white70,
        ),
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Addcontact(),
            ),
          );
        },
      ),
      body: const Center(
        child: ContactList(),
      ),
    );
  }
}
