import 'package:flutter/material.dart';

import 'widgets/onboarding_page_view.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPageView(),
    );
  }
}
