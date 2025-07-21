import 'package:flutter/material.dart';

class SplashAnimate extends StatelessWidget {
  const SplashAnimate({
    super.key,
    required double opacity,
    required this.slideAnimation,
  }) : _opacity = opacity;

  final double _opacity;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Icon (optional)
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            child: const Icon(
              Icons.task_alt_rounded,
              size: 80,
              color: Colors.tealAccent,
            ),
          ),
          const SizedBox(height: 20),

          // Welcome Text with all animations
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.8, end: 1.2),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: SlideTransition(
                position: slideAnimation,
                child: const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
