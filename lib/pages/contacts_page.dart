import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  final List<Map<String,String>> contacts = List.generate(15, (i) => {
    'name': 'Kontak ${i+1}',
    'phone': '0812-0000-${(1000+i).toString()}',
    'avatar': 'assets/profile.jpg'
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (_, idx) {
        final c = contacts[idx];
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(c['avatar']!)),
          title: Text(c['name']!),
          subtitle: Text(c['phone']!),
        );
      },
    );
  }
}
