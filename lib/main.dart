import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On-boarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyIntroduction(),
    );
  }
}

class MyIntroduction extends StatefulWidget {
  const MyIntroduction({Key? key}) : super(key: key);

  @override
  State<MyIntroduction> createState() => _MyIntroductionState();
}

class _MyIntroductionState extends State<MyIntroduction> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      bodyPadding: const EdgeInsets.all(80),
      pages: [
        PageViewModel(
          title: "안녕하세요",
          body: "환영합니다",
          image: Image.asset("image/page1.png"),
        ),
        PageViewModel(
          title: "Hello",
          body: "Welcome to MyApp",
          image: Image.asset("image/page2.png"),
        ),
        PageViewModel(
          title: "Bonjour",
          body: "Bienvenue dans MyApp",
          image: Image.asset("image/page3.png"),
        ),
      ],
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyMainPage(),
          ),
        );
      },
      next: const Icon(Icons.arrow_forward),
      back: const Icon(Icons.arrow_back_outlined),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(15.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 5.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
      ),
    );
  }
}
