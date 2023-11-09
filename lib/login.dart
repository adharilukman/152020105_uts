import 'package:flutter/material.dart';
import 'package:uts/Calcbutton.dart';
import 'BMIPage.dart';
import 'ProfilePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        leading: isLoggedIn ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke halaman login
            setState(() {
              isLoggedIn = false;
            });
          },
        ) : null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.accessibility),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMIPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: !isLoggedIn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: TextField(
                        controller: emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        print('Email: $email');
                        print('Password: $password');
                        setState(() {
                          isLoggedIn = true;
                        });
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20.0), // Spasi tambahan
                  ],
                )
              : CalcButton(),
        ),
      ),
    );
  }
}
