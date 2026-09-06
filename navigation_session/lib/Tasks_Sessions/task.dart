import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});

  String get initials {
    final words = name.split(' ');

    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }

    return name.substring(0, 2).toUpperCase();
  }
}

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<Contact> contacts = [
    Contact(name: 'Ali Mohamed', phone: '0194739893'),
    Contact(name: 'Mohamed Ali', phone: '0123456789'),
    Contact(name: 'Hussein Khaled', phone: '09288488993'),
    Contact(name: 'Usama elsharawy', phone: '6556'),
    Contact(name: 'Usama waleed', phone: '6556'),
    Contact(name: 'Usama tarek', phone: '6556'),
    Contact(name: 'Hussein tarek', phone: '09288488993'),
    Contact(name: 'Hussein ibrahim', phone: '09288488993'),
    Contact(name: 'Hussein jawad', phone: '09288488993'),
    Contact(name: 'Hussein valid', phone: '09288488993'),
    Contact(name: 'Hussein elsharawy', phone: '09288488993'),
    Contact(name: 'Hussein ramadan', phone: '09288488993'),
    Contact(name: 'Hussein yasser', phone: '09288488993'),
    Contact(name: 'Hussein omar', phone: '09288488993'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),

      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return Dismissible(
            key: Key(contact.name + contact.phone),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                contacts.remove(contact);
              });
            },
            child: ListTile(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetails(contact: contact),
                  ),
                );
              },

              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  contact.initials,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              title: Text(
                contact.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text(contact.phone),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final Contact contact;

  const ContactDetails({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.teal,
              child: Text(
                contact.initials,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              contact.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(contact.phone, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
