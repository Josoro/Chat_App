import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/providers/chat_provider.dart';
import 'package:chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/R.055bc260c495abfc24099240b581fe2f?rik=5HJE9ErTF7XbwQ&riu=http%3a%2f%2fwww.topzoo.fr%2flib%2fpicts%2fpages4%2foiseaux1.jpg&ehk=w%2b%2byfL5sh0ZjaSuWweTICxxuE9h3ZOO2oyB%2f4Km1lc4%3d&risl=&pid=ImgRaw&r=0'),
          ),
        ),
        centerTitle: true,
        title: const Text('Mi Amor'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                 return (message.fromWho == FromWho.her)
                    ? HerMessageBubble(message: message,)
                    :  MyMessageBubble(messages: message,);
              },
            )),

            //Caja de Texto de mensajes
        MessageFieldBox(onValue: (value)=> chatProvider.sendMessage(value))
          ],
        ),
      ),
    );
  }
}
