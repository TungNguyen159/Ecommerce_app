import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void _logout(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text("Do you want to log out?"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes', style: TextStyle(color: Colors.red)),
              onPressed: () {
                context.push("/signin");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  context.push('/profile/detail');
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/FnAXHvjacAMqQcI?format=jpg&name=large',
                  ),
                ),

                title: Text(
                  'User Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text('User Email'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 30),

              TitleItem(
                icon: Icons.person,
                title: 'Orders',
                onTap: () {
                  // Navigate to orders page
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              TitleItem(
                icon: Icons.history,
                title: 'Order History',
                onTap: () {
                  // Navigate to order history page
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              TitleItem(
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {},
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: false,
                secondary: Icon(Icons.dark_mode),
                onChanged: (value) {
                  // Handle dark mode toggle
                },
              ),
              SwitchListTile(
                title: Text('Notifications'),
                value: true,
                secondary: Icon(Icons.notifications),
                onChanged: (value) {
                  // Handle notifications toggle
                },
              ),
              const SizedBox(height: 100),
              TitleItem(
                title: 'Logout',
                icon: Icons.logout,
                onTap: () {
                  _logout(context);
                },
                textColor: Colors.red,
                iconcolor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleItem extends StatelessWidget {
  const TitleItem({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.trailing,
    this.textColor = Colors.black,
    this.iconcolor = Colors.black,
  });
  final String title;
  final Function()? onTap;
  final IconData? icon;
  final Widget? trailing;
  final Color? textColor;
  final Color? iconcolor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon ?? Icons.manage_accounts),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
      textColor: textColor,
      iconColor: iconcolor,
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
  const BackBind({super.key, required this.onPressed});

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}
