import 'package:flutter/material.dart';
import 'package:shop_app/features/profile/pages/profile_page.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Profile Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/media/FnAXHvjacAMqQcI?format=jpg&name=large',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // TODO: Edit image
                },
                child: const Text("Edit Image"),
              ),
              const SizedBox(height: 30),
              Textfieldsitem(hintText: 'Name', icon: Icons.person),
              const SizedBox(height: 20),
              Textfieldsitem(hintText: 'Email', icon: Icons.email),
              const SizedBox(height: 20),
              Textfieldsitem(hintText: 'Birthday', icon: Icons.calendar_today),
              const SizedBox(height: 20),
              Textfieldsitem(hintText: 'Phone', icon: Icons.phone),

              const SizedBox(height: 220),
              MainButton(
                text: 'Save',
                onPressed: () {
                  // TODO: Implement save functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Textfieldsitem extends StatelessWidget {
  const Textfieldsitem({super.key, required this.hintText, required this.icon});
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
