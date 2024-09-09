import 'package:flutter/material.dart';

class Setup5 extends StatefulWidget {
  const Setup5({Key? key}) : super(key: key);

  @override
  _Setup5dState createState() => _Setup5dState();
}

class _Setup5dState extends State<Setup5> {
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
        title: Text('การช่วยเหลือสนับสนุน'),
      ),
    );
  }
}
