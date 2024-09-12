import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'online-shop.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jokowi Ganteng App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            bottomNavigationBar: getBottomNavigation(context),
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Center(
                child: Text(
                  "Login Page",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: Form(
                child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  const SizedBox(height: 2.0),
                  const Text(
                    "Sign In to continue",
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                  const SizedBox(height: 15.0),
                  SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 227, 227, 227),
                            labelText: 'Username',
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 13.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none)),
                      )),
                  SizedBox(height: 10.0),
                  SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 227, 227, 227),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 13.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none)),
                      )),
                  SizedBox(height: 16.0),
                  CheckBoxAgreement(),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeShop(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                        )),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?"),
                      SizedBox(width: 8.0),
                      Text(
                        "Sign Up",
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ))));
  }

  Widget getBottomNavigation(BuildContext context) {
    List<Icon> icons = [
      Icon(Icons.home, color: Colors.black),
      Icon(Icons.search, color: Colors.black),
      Icon(Icons.notifications, color: Colors.black),
      Icon(Icons.person, color: Colors.black)
    ];

    List<String> labels = ["Home", "Search", "Notifications", "Profile"];

    return Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons.asMap().entries.map((entry) {
              int index = entry.key;
              Icon icon = entry.value;
              return Padding(
                padding: EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    icon,
                    Text(labels[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ))
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}

class CheckBoxAgreement extends StatefulWidget {
  @override
  State<CheckBoxAgreement> createState() => _CheckBoxAgreementState();
}

class _CheckBoxAgreementState extends State<CheckBoxAgreement> {
  bool _isChecked = false;

  void _onCheckboxChange(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: _onCheckboxChange,
          activeColor: Colors.black,
        ),
        Text(
          "I agree with Murni Astuti's Agreement",
          style: TextStyle(color: Colors.black, fontSize: 14.0),
        ),
      ],
    );
  }
}
