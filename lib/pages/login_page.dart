import 'package:flutter/material.dart';
import 'package:flutter_shop_app/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  Route _navigateToHome() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE5E3DF),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            top: 40,
            right: 0,
            child: Text(
              textAlign: TextAlign.center,
              'Designer\nFurniture',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 59, 59, 59),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
              bottom: 3,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(_navigateToHome()),
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 1, 39),
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 121, 121, 121),
                              width: 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color.fromARGB(255, 92, 92, 92),
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
