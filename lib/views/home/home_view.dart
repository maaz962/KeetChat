import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../controllers/chat_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../widgets/chat_tile.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final chat = context.watch<ChatController>();
    final isDark = context.watch<ThemeController>().isDark;
    final chats = chat.chats;
    
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            SvgPicture.asset('assets/images/keetchat_logo.svg', height: 32),
            const SizedBox(width: 8),
            const Text(
              'KeetChat',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => context.read<ThemeController>().toggle(),
          ),
        ],
      ),
      body: ListView.separated(
          itemCount: chats.length,
          separatorBuilder: (_, __) => const Divider(height: 1, indent: 80,),
        itemBuilder: (context, index) {
            final user = chats[index];
            final last = chat.lastMessageOf(user.id);
            return ChatTile(
                user: user,
                lastMessage: last,
                lastIsMine: last?.senderId == chat.myId,
                unread: chat.unreadOf(user.id),
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${user.name} ki chat agly step me')),
                  );
                },
            );
        },
    ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: const Icon(Icons.chat),
        ),
    );
  }
}