import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'channel_list_page.dart';
import 'channel_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client, required this.channel})
      : super(key: key);

  final StreamChatClient client;
  final Channel channel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, widget) {
          return StreamChat(
            client: client,
            child: widget,
          );
        },
        home: HomePage(
          channel: channel,
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.channel,
  }) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Chat"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) => Card(
                      child: Container(
                        height: 150,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildBtn(context),
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Center buildBtn(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(channel: channel),
                  ));
            },
            child: Text("Tap to Chat")));
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.channel}) : super(key: key);

  final Channel channel;
  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: channel,
      // child: const ChannelListPage(),
      child: ChannelPage(
        channel: channel,
      ),
      // child: Text('sdfs'),
    );
  }
}
