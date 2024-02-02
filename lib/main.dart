import 'dart:html';
import 'dart:math';

import 'package:custom_widget/snowman.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SnowMan(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
  with SingleTickerProviderStateMixin {
    late AnimationController animationController;
    late Tween<double> animation;

    @override
  void initState() {
    animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 250))
      ..addStatusListener((status) {
       if (status == AnimationStatus.completed){
        animationController.reverse();
       } else if(status == AnimationStatus.dismissed) {
        animationController.forward();
       }
      });
      animation = Tween<double>(begin: 0.8, end: 0);

      animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          builder: (context,child) => CustomPaint(
            painter: PackmanPainter(mouthExtend: animationController.value
            ),
          ),
          animation: animation.animate(animationController),
        ),
        ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(builder: (context,constraints){
//         print(constraints.maxHeight);
//         print(constraints.minHeight);
//         print(constraints.maxWidth);
//         print(constraints.minWidth);
//         return GridView(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: getMaxColumnSize(constraints.maxWidth),
//           ),
//         children: const [
//           WCard(),
//           WCard(),
//           WCard(),
//           WCard(),
//           WCard(),
//           WCard(),
//           WCard(),
//           WCard(),
//           WCard(),
//         ],
//         );
//       }),
//     );
//   }
//   int getMaxColumnSize(double value){
//     if(value < 1020) {
//       return 1;
//     } else if(value > 1020 && value < 1280) {
//       return 2;
//     } else {
//       return 3;
//     }
//   }
// }

class PackmanPainter extends CustomPainter {
  final double mouthExtend;

  PackmanPainter({super.repaint, required this.mouthExtend});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final paint = Paint();
    paint.color = Colors.yellow;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(centerX, centerY),
        width: 200,
        height: 200,
      ),
      0.4,
      2 * pi - mouthExtend,
      true,
      paint,
    );

    canvas.drawCircle(const Offset(-20, -50), 10, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

// class WCard extends StatelessWidget {
//   const WCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//           border: Border.all(
//             width: 1,
//             color: Colors.grey,
//           ),
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.2),
//               blurRadius: 4,
//             )
//           ]),
//       child: const Column(
//         children: [
//           Text(
//             'Title',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet! Lorem ipsum dolor sit amet!',
//             overflow: TextOverflow.visible,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
