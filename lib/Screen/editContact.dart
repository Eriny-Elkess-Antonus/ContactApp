// ignore_for_file: file_names, unused_element, unnecessary_null_comparison

import 'package:contacts/HomeScreen/model/contactinfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../HomeScreen/model/contactProvider.dart';
import '../AddContact/model/photoProvider.dart';
import '../AddContact/widget/photoList.dart';

class EditContact extends StatefulWidget {
  const EditContact({
    Key? key,
  }) : super(key: key);

  static const routeName = '/edit-contact';
  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  var name = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();
  var jobTitle = TextEditingController();
  var note = TextEditingController();
  final _form = GlobalKey<FormState>();
  var editContact = ContactInfo(
    name: '',
    phone: '',
    address: '',
    image: 'assets/person.jpg',
    jopTitle: '',
    note: '',
  );
  var _initValues = {
    'name': '',
    'number': '',
    'address': '',
    'jopTitle': '',
    'note': '',
    'image': '',
  };
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments as String;
      if (productId != null) {
        editContact = Provider.of<ContactData>(context, listen: false)
            .findById(productId);
        _initValues = {
          'name': editContact.name,
          'phone': editContact.phone,
          'address': editContact.address,
          'jopTitle': editContact.jopTitle,
          'note': editContact.note,
          'image': editContact.image,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    address.dispose();
    jobTitle.dispose();
    note.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (editContact.name != null) {
      Provider.of<ContactData>(context, listen: false)
          .updatecontact(editContact.name, editContact);
    } else {
      Provider.of<ContactData>(context, listen: false).addContact(editContact);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PhotoProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Contact'),
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
                initialValue: _initValues['name'],
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  final trimmed = value?.trim();
                  if (trimmed == null || trimmed.isEmpty) {
                    return 'need';
                  }
                  return null;
                },
                onSaved: (value) {
                  editContact = ContactInfo(
                    name: value.toString(),
                    phone: editContact.phone,
                    address: editContact.address,
                    image: editContact.image,
                    jopTitle: editContact.jopTitle,
                    note: editContact.name,
                  );
                },
              ),
              const Text('Enter Contact First and Last Name'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
                initialValue: _initValues['phone'],
                validator: (value) {
                  final trimmed = value?.trim();
                  if (trimmed == null || trimmed.isEmpty) {
                    return 'need';
                  }
                  return null;
                },
                onSaved: (value) {
                  editContact = ContactInfo(
                    name: editContact.name,
                    phone: value.toString(),
                    address: editContact.address,
                    image: editContact.image,
                    jopTitle: editContact.jopTitle,
                    note: editContact.name,
                  );
                },
              ),
              const Text('Enter phone number'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Jop Title',
                ),
                initialValue: _initValues['jopTitle'],
                validator: (value) {
                  final trimmed = value?.trim();
                  if (trimmed == null || trimmed.isEmpty) {
                    return 'need';
                  }
                  return null;
                },
                onSaved: (value) {
                  editContact = ContactInfo(
                    name: editContact.name,
                    phone: editContact.phone,
                    address: editContact.address,
                    image: editContact.image,
                    jopTitle: value.toString(),
                    note: editContact.name,
                  );
                },
              ),
              const Text('Enter Jop Title'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Addres',
                ),
                initialValue: _initValues['address'],
                validator: (value) {
                  final trimmed = value?.trim();
                  if (trimmed == null || trimmed.isEmpty) {
                    return 'need';
                  }
                  return null;
                },
                onSaved: (value) {
                  editContact = ContactInfo(
                    name: editContact.name,
                    phone: editContact.phone,
                    address: value.toString(),
                    image: editContact.image,
                    jopTitle: editContact.jopTitle,
                    note: editContact.name,
                  );
                },
              ),
              const Text('Enter contact address'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Notes',
                ),
                initialValue: _initValues['note'],
                validator: (value) {
                  final trimmed = value?.trim();
                  if (trimmed == null || trimmed.isEmpty) {
                    return 'need';
                  }
                  return null;
                },
                onSaved: (value) {
                  editContact = ContactInfo(
                    name: editContact.name,
                    phone: editContact.phone,
                    address: editContact.address,
                    image: editContact.image,
                    jopTitle: editContact.jopTitle,
                    note: value.toString(),
                  );
                },
              ),
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
                  _saveForm();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
