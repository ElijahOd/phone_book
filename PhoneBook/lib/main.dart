import 'package:flutter/material.dart';
import 'package:phonebook/contact.dart';

void main() => runApp(const PhoneBook());

class PhoneBook extends StatelessWidget {
  const PhoneBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhoneBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactsPage(),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact(this.name, this.phoneNumber);
}
