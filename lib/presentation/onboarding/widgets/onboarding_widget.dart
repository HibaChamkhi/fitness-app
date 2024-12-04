import 'package:fitness_app/core/ui/style/colors.dart';
import 'package:fitness_app/presentation/auth/widgets/sign_in.dart';
import 'package:flutter/material.dart';

class OnboardingPage {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/onboarding4.png', // Replace with your image assets
      title: 'Track Your Goal',
      description:
          'Don’t worry if you have trouble determining your goals, we can help you determine your goals and track your goals.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Get Burn',
      description:
          'Let’s keep burning, to achieve your goals. It hurts only temporarily. If you give up now, you will be in pain forever.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'Eat Well',
      description:
          'Let’s start a healthy lifestyle with us. We can determine your diet every day. Healthy eating is fun.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'Improve Sleep Quality',
      description:
          'Improve the quality of your sleep with us. Good quality sleep can bring a good mood in the morning.',
    ),
  ];

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInWidget(), // The new screen to navigate to
        ),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Column(
                  children: [
                    Image.asset(page.image,
                        fit: BoxFit.cover, width: double.infinity),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),
                          Text(
                            page.title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,fontFamily: "Poppins"
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            page.description,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 20, color: AppConstants.empress,fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                        value: (_currentPage + 1) / _pages.length,
                        // Progress value
                        backgroundColor: Colors.transparent,
                        color: AppConstants.malibu,
                        strokeWidth: 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onNext,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                AppConstants.malibu,
                                AppConstants.anakiwa,
                              ]),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
