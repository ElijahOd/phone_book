import 'package:flutter/material.dart';
import 'package:phonebook/add.dart';
import 'package:phonebook/detail.dart';
import 'package:phonebook/main.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    contacts = [
      Contact('Yurii Burkut', '+38 093 345 45 45'),
      Contact('Rostyslav Havuka', '+38 093 232 33 22'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneBook by OD'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailsPage(contact: contact),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactPage(),
            ),
          ).then((newContact) {
            if (newContact != null) {
              setState(() {
                contacts.add(newContact);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
