import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your email to reset your password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle password reset logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Password reset link sent!')),
                );
                context.go('/signin');
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}