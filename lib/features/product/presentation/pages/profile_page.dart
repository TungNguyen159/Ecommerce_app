import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/media/FnAXHvjacAMqQcI?format=jpg&name=large',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'User Name',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                'User Email',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 50),

              TitleItem(
                icon: Icons.person,
                title: 'Account Settings',
                onTap: () {
                  // Navigate to account settings page
                },
              ),
              TitleItem(
                icon: Icons.history,
                title: 'Order History',
                onTap: () {
                  // Navigate to order history page
                },
              ),
              TitleItem(
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {},
              ),
              const SizedBox(height: 100),
              SizedBox(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MainButton(
                    text: 'Logout',
                    onPressed: () {
                      // Handle logout action
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleItem extends StatelessWidget {
  const TitleItem({super.key, required this.title, this.onTap, this.icon});
  final String title;
  final Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon ?? Icons.manage_accounts),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class BackBind extends StatelessWidget {
  const BackBind({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios,
            color:Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}