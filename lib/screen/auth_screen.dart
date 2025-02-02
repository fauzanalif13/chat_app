import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Flutter Chat App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                  width: 100,
                  child: Image.asset('assets/images/chat.png'),
                ),
                Card(
                  margin: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Form(
                      child: Column(
                        spacing: 20,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelStyle: Theme.of(context)
                                  .copyWith()
                                  .textTheme
                                  .bodyLarge,
                              labelText: 'Email Address',
                              icon: Container(
                                alignment: Alignment.center,
                                width: 20,
                                child: Icon(
                                  Icons.email,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelStyle: Theme.of(context)
                                  .copyWith()
                                  .textTheme
                                  .bodyLarge,
                              labelText: 'Password',
                              icon: Container(
                                alignment: Alignment.center,
                                width: 20,
                                child: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                            obscureText: true,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
