import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      ///SAVE INTO ONSAVED PARAMETER
      _formKey.currentState!.save();
    }

    ///SEND TO FIREBASE
    debugPrint(_enteredEmail);
    debugPrint(_enteredPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Flutter Chat App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant),
        backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
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
                      key: _formKey,
                      child: Column(
                        spacing: 20,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ///EMAIL FORM
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
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Make sure your input is a valid email!';
                              }

                              ///EMAIL HAS VALID
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),

                          ///PASSWORD FORM
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
                            validator: _isLogin
                                ? (value) {
                                    if (value == null) {
                                      return 'Please input your password!';
                                    }

                                    ///PASSWORD HAS VALID
                                    return null;
                                  }
                                : (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'Make sure your password is more than 6 characters';
                                    }
                                    return null;
                                  },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 12,
                            children: [
                              ElevatedButton(
                                onPressed: _submit,
                                child: Text(_isLogin ? 'Sign In' : 'Sign Up'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: Text(
                                    _isLogin ? 'Sign Up' : 'Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily:
                                          textTheme.bodyLarge.toString(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
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
