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
      Contact('Sergiy Chebts', '+38 093 717 17 17'),
      Contact('Illia Odokii', '+38 093 999 88 77'),
      Contact('Dmytro Zamkovyi', '+38 093 123 34 45'),
      Contact('Gaik Grigoryan', '+38 093 432 54 65'),
      Contact('Oksana Atamas', '+38 093 098 34 34'),
      Contact('Ruslan Palamarchuk', '+38 093 342 32 11'),
      Contact('Vasiliy Vasiliy', '+38 093 111 42 45'),
      Contact('Vitalii Kovtiukh', '+38 093 342 22 11'),
      Contact('Yuliia Drobot', '+38 093 232 11 22'),
      Contact('Oleksandr Dishniykov', '+38 093 121 12 44'),
      Contact('Olena Dashenko', '+38 093 655 65 65'),
      Contact('Sasha Bezpalchuk', '+38 093 454 65 65'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ContactCounter(
      contactCount: contacts.length,
      childWidget: Scaffold(
        appBar: AppBar(
          title: const Text('PhoneBook by OD'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
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
                          builder: (context) =>
                              ContactDetailsPage(contact: contact),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Builder(
                        builder: (context) {
                          final counter =
                              ContactCounter.of(context)?.contactCount ?? 0;
                          return Text('Contacts: $counter');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCounter extends InheritedWidget {
  final int contactCount;
  final Widget childWidget;

  const ContactCounter({
    super.key,
    required this.contactCount,
    required this.childWidget,
  }) : super(child: childWidget);

  static ContactCounter? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ContactCounter>();
  }

  @override
  bool updateShouldNotify(ContactCounter oldWidget) {
    return contactCount != oldWidget.contactCount;
  }
}
