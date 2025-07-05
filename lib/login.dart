import 'package:flutter/material.dart';
import 'package:weather_project/navbar.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState(); 
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(); 
  final _passwordController = TextEditingController(); 

  @override
  void dispose() {
    _usernameController.dispose(); 
    _passwordController.dispose(); 

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.pink.shade50,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(height: 100.0),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          selectionColor: Colors.white,
                          style: TextStyle(
                            fontFamily: 'Poppins', 
                            fontWeight: FontWeight.bold, 
                            fontSize: 26, 
                            color: Colors.white 
                          ),
                        ), 
                        Text(
                          "To",
                          style: TextStyle(
                            fontFamily: 'Poppins', 
                            fontSize: 20, 
                            color: Colors.white
                          ),
                        ), 
                        Text(
                          "WearToday", 
                          style: TextStyle(
                            fontFamily: 'Poppins', 
                            fontWeight: FontWeight.bold,
                            fontSize: 30, 
                            color: Colors.white
                          ),
                        ),
                      ]
                    )
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                    controller: _usernameController, 
                    decoration: InputDecoration(
                      labelText: "Username", 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      )
                    ),
                  ), 
                  SizedBox(height: 30.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password", 
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(15.0)
                      )
                    ),
                  ), 
                  SizedBox(height: 30.0),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.pink.shade100,
                        foregroundColor: Colors.pink.shade50,
                      ),
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationBarWidget()));  }, child: Text(
                        "Enter", 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
                  ),
                ],
              ),
            ),
          ),
    ),), ), ); 
  }
}