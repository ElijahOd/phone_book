import 'package:flutter/material.dart';
import 'package:phonebook/main.dart';

class AddContactPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                hintText: 'Enter phone number',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final phoneNumber = phoneNumberController.text;
                final newContact = Contact(name, phoneNumber);
                Navigator.pop(context, newContact);
              },
              child: const Text('Save Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
