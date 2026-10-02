import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/theme_controller.dart';
import 'controllers/chat_controller.dart';
import 'core/theme/app_theme.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeController()),
            ChangeNotifierProvider(create: (_) => ChatController()),

          ],
      child: const KeetChatApp(),
      ),
      );
}

class KeetChatApp extends StatelessWidget {
  const KeetChatApp({super.key});

  @override
  Widget build(BuildContext context){
    final theme = context.watch<ThemeController>();
    return MaterialApp(
      title: 'KeetChat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: theme.mode,
      home: const HomeView(),
    );
  }
}