// ignore_for_file: unused_import, file_names, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

import 'contactinfo.dart';

class ContactData extends ChangeNotifier {
  final List<ContactInfo> _contact = [
    ContactInfo(
        name: 'Eriny Elkess',
        address: 'Ramses',
        image: 'assets/woman.png',
        jopTitle: 'Mobile developer',
        note: '',
        phone: '01221510859'),
    ContactInfo(
        name: 'Michale',
        address: 'Ramses',
        image: 'assets/man.png',
        jopTitle: 'Student',
        note: '',
        phone: '01221510867'),
  ];
// get all contacts
  List<ContactInfo> get contact {
    return [..._contact];
  }

// find contact
  ContactInfo findById(String name) {
    return _contact.firstWhere((per) => per.name == name);
  }

// addcontact
  void addContact(ContactInfo personalInfo) {
    final newPersonal = ContactInfo(
      address: personalInfo.address,
      image: personalInfo.image,
      jopTitle: personalInfo.jopTitle,
      name: personalInfo.name,
      note: personalInfo.note,
      phone: personalInfo.phone,
    );
    _contact.add(newPersonal);

    notifyListeners();
  }

// delete contact
  void deletecontact(String name) {
    _contact.removeWhere((per) => per.name == name);
    notifyListeners();
  }

// update contact
  void updatecontact(String name, ContactInfo personalInfo) {
    final personalIndex = _contact.indexWhere((per) => per.name == name);
    if (personalIndex >= 0) {
      _contact[personalIndex] = personalInfo;
      notifyListeners();
    } else {
      print('...');
    }
  }

// clear all contacts
  void clear() {
    _contact.clear();
  }
}
