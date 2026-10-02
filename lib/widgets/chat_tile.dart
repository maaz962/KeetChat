import 'package:flutter/material.dart';
import '../core/utils/time_format.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';
import 'user_avatar.dart';

class ChatTile extends StatelessWidget {
  final UserModel user;
  final MessageModel? lastMessage;
  final bool lastIsMine;
  final int unread;
  final VoidCallback onTap;

  const ChatTile({
    super.key,
    required this.user,
    required this.lastMessage,
    required this.lastIsMine,
    required this.unread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final subtitle = lastMessage == null
        ? 'Abhi koi message nahi'
        : '${lastIsMine ? 'Aap: ' : ''}${lastMessage!.text}';

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: UserAvatar(user: user),
      title: Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: cs.onSurface.withOpacity(unread > 0 ? 0.9 : 0.6),
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (lastMessage != null)
            Text(
              formatTime(lastMessage!.time),
              style: TextStyle(
                fontSize: 12,
                color: unread > 0 ? cs.secondary : cs.onSurface.withOpacity(0.6),
              ),
            ),
          if (unread > 0) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: cs.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$unread',
                style: TextStyle(
                  color: cs.onSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}