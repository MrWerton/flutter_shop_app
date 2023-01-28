import 'package:flutter/material.dart';
import 'package:flutter_shop_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _scale;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _scale = Tween(begin: 1.0, end: 1.1).animate(_animationController);

    _animationController.forward();
    _animationController.repeat();
    super.initState();
  }

  void _navigateToHome() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E3DF),
      body: SafeArea(
        child: Stack(
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
              top: 20,
              right: 0,
              child: Text(
                textAlign: TextAlign.center,
                'Designer\nFurniture',
                style: TextStyle(
                  fontSize: 48,
                  color: Color.fromARGB(255, 59, 59, 59),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scale.value,
                      child: child,
                    );
                  },
                  child: GestureDetector(
                    onTap: _navigateToHome,
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
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
