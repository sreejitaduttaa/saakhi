import 'package:flutter/material.dart';

class ContactDetails{
  String username;
  String password;
  String email;
  String contact;

  ContactDetails({
    required this.username,
    required this.password,
    required this.email,
    required this.contact,
  })

}

class EmergencyContact {
  final List<String> _contacts = ['1234567890','2345567563'];

  void addContacts(String contact) {
    _contacts.add(contact);
  }

  List<String> getContacts() => _contacts;
}
