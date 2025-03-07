import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ppkd_aps/main.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Selamat Datang",
          body: "Aplikasi ini membantu Anda dalam berbagai hal.",
          image: buildImage('assets/images/panduan.png'),
          decoration: pageDecoration(),
        ),
        PageViewModel(
          title: "Fitur Utama",
          body: "Nikmati fitur-fitur menarik dan bermanfaat.",
          image: buildImage('assets/images/fitur.png'),
          decoration: pageDecoration(),
        ),
        PageViewModel(
          title: "Mulai Sekarang",
          body: "Klik tombol di bawah untuk memulai aplikasi.",
          image: buildImage('assets/images/start.png'),
          decoration: pageDecoration(),
          // footer: ElevatedButton(
          //   onPressed: () => goToHome(context),
          //   child: const Text("Get Started"),
          // ),
        ),
      ],
      done: const Text("Mulai", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: const Text("Lewati"),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: const DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeColor: Colors.blue,
      ),
    );
  }

  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  Widget buildImage(String path) {
    return Image.asset(path, width: 300);
  }

  PageDecoration pageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 16),
      imagePadding: EdgeInsets.all(20),
    );
  }
}



