// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/theme.dart';
import '../model/contactProvider.dart';
import 'contactListItem.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final contacts = context.read<ContactData>();
    // final contact = contacts.contact;
    return Consumer<ContactData>(
      builder: ((context, contact, child) {
        return ListView.separated(
            separatorBuilder: (_, __) => AppDimens.itemSepatator,
            itemCount: contact.contact.length,
            itemBuilder: (_, index) {
              return ContactListItem(
                contact: contact.contact[index],
              );
            });
      }),
    );
  }
}
