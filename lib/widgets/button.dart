import 'package:flutter/material.dart';
import 'package:picture_plus/pages/first_page.dart';

class Button1 extends StatelessWidget {
  const Button1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstPage()));
      },
      child: Container(
        height: 60,
        width: 330,
        decoration: BoxDecoration(
            color: Color(0xffff7a07), borderRadius: BorderRadius.circular(60)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Start',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'FontsFree',
                letterSpacing: -1.0,
              ),
            ),
            /*Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 40,
            )*/
          ],
        ),
      ),
    );
  }
}
