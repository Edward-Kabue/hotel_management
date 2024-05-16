// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hotel/presentation/authentication/widgets/logo.dart';
import 'package:provider/provider.dart';

import '../../../providers/admin_provider.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const LogoWidget(),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                // Pass the current context to the AdminProvider
                await context
                    .read<AdminProvider>()
                    .signInWithEmailAndPassword(context, email, password);
                // Check if the user is created successfully
                Navigator.pushNamed(
                  context,
                  '/bottomNav',
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
