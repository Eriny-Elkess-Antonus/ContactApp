// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../Screen/alldetails.dart';
import '../../Screen/editContact.dart';
import '../model/contactProvider.dart';
import '../model/contactinfo.dart';

class ContactListItem extends StatefulWidget {
  const ContactListItem({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final ContactInfo contact;

  @override
  State<ContactListItem> createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {
  var editContact = ContactInfo(
    name: '',
    phone: '',
    address: '',
    image: '',
    jopTitle: '',
    note: '',
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllContactDetails(
                contact: widget.contact,
              ),
            ),
          );
        }),
        isThreeLine: true,
        leading: Image.asset(widget.contact.image),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.contact.name,
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber(
                      widget.contact.phone);
                },
                icon: const Icon(
                  Icons.call,
                  color: Colors.green,
                  size: 40,
                )),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contact.jopTitle,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  widget.contact.phone,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        EditContact.routeName,
                        arguments: widget.contact.name,
                      );
                    },
                    icon: const Icon(
                      Icons.create_rounded,
                      color: Colors.blue,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      Provider.of<ContactData>(context, listen: false)
                          .deletecontact(widget.contact.name);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 40,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
