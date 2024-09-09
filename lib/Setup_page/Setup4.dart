import 'package:flutter/material.dart';

class Setup4 extends StatefulWidget {
  const Setup4({Key? key}) : super(key: key);

  @override
  _Setup4dState createState() => _Setup4dState();
}

class _Setup4dState extends State<Setup4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // ภาพพื้นหลัง
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BB.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.3),
                BlendMode.dstATop,
              ),
            ),
          ),
        ),
      ]),
      appBar: AppBar(
        title: Text('ภาษา'),
      ),
    );
  }
}
