import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';

class ChatController extends ChangeNotifier{
  final String myId = 'me';

  final List<UserModel> _users = [];
  final Map<String, List<MessageModel>> _messages = {};
  final Map<String, int> _unread = {};

  ChatController() {
    _loadDummyData();
  }

// Chats, jis ka last message sab se naya ho wo sab se oopar
List<UserModel> get chats {
    final list = [..._users];
    final zero = DateTime.fromMillisecondsSinceEpoch(0);
    list.sort((a, b) {
      final ta = lastMessageOf(a.id)?.time ?? zero;
      final tb = lastMessageOf(b.id)?.time ?? zero;
      return tb.compareTo(ta);
    });
    return list;
}

List<MessageModel> messageOf(String userId) => _messages[userId] ?? [];

  MessageModel? lastMessageOf(String userId) {
    final list = _messages[userId];
    return (list == null || list.isEmpty) ? null : list.last;
  }

  int unreadOf(String userId) => _unread[userId] ?? 0;

//  Dummy data
MessageModel _msg(String id, String from, String text, int minutesAgo) {
  return MessageModel(
      id: id,
      senderId: from,
      text: text,
      time: DateTime.now().subtract(Duration(minutes: minutesAgo)),
  );
}

void _loadDummyData() {
  _users.addAll([
    const UserModel(id: 'u1', name: 'Ayesha', isOnline: true),
    const UserModel(id: 'u2', name: 'Mujtaba'),
    const UserModel(id: 'u3', name: 'Hamza', isOnline: true),
    const UserModel(id: 'u4', name: 'Sara'),
    const UserModel(id: 'u5', name: 'Saad'),
  ]);

  _messages['u1'] = [
    _msg('1', 'u1', 'Assalam o Alaikum! Design bhej do', 25),
    _msg('2', myId, 'design.pdf bhej di', 22),
    _msg('3', 'u1', 'Mil gayi, shukriya', 5),
  ];
  _messages['u2'] = [
    _msg('4', myId, 'Kal meeting hai?', 180),
    _msg('5', 'u2', 'Haan, 11 baje', 170),
  ];
  _messages['u3'] = [
    _msg('6', 'u3', 'Bhai app ka kya bana?', 60),
    _msg('7', 'u3', 'Logo dikhao zara', 58),
    _msg('8', 'u3', 'Reply to do yar', 55),
  ];
  _messages['u4'] = [
    _msg('9', myId, 'Okay, theek hai', 1500),
  ];
  // u5 ke koi messages nahi (khali chat)

  _unread['u1'] == 1;
  _unread['u3'] == 3;
}
}