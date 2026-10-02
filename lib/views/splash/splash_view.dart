import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../controllers/theme_controller.dart';
import '../../core/theme/app_colors.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context){
    final cs = Theme.of(context).colorScheme;
    final isDark = context.watch<ThemeController>().isDark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => context.read<ThemeController>().toggle(),
              ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/keetchat_logo.svg', width: 140),
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(
                text: 'Keet',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: 'Chat',
                    style: TextStyle(color: isDark ? AppColors.orange : cs.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(onPressed: () {},
                child: const Text('Get Started')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: const Icon(Icons.add),
      ),
    );
  }
}