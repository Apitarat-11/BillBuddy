import 'package:flutter/material.dart';

class Setup6 extends StatefulWidget {
  const Setup6({Key? key}) : super(key: key);

  @override
  _Setup6dState createState() => _Setup6dState();
}

class _Setup6dState extends State<Setup6> {
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
        title: Text('เกี่ยวกับ'),
      ),
    );
  }
}
