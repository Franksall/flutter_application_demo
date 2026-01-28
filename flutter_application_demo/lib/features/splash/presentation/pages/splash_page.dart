import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';
import 'package:flutter_application_demo/core/widgets/loading_screen.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Check if user is authenticated
    // For now, navigate to login
    context.go(AppConstants.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}
