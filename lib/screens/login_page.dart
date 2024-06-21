import 'package:flutter/material.dart';
import 'package:travel_app/screens/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        //'assets/images/login_background.png'
        fit: StackFit.expand,
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/login_background.png'),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.5),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: size.width * 0.8,
                  padding:const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _gotoMainPage(context);
                    },
                    icon: Image.asset('assets/images/ic_google.png'),
                    label: const Text(
                      '   Continue with Google',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(
                            color: Colors.white,
                            width: 1.0), // Customize the color and width
                      ),
                      padding: MaterialStateProperty.all(
                       const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0), // Add padding here
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _gotoMainPage(context);
                    },
                    icon: const Icon(Icons.apple, color: Colors.black),
                    label: const Text(
                      '   Continue with Apple',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(
                            color: Colors.white,
                            width: 1.0), // Customize the color and width
                      ),
                      padding: MaterialStateProperty.all(
                       const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0), // Add padding here
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _gotoMainPage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    const MainPage()), (Route<dynamic> route) => false);
  }
}
