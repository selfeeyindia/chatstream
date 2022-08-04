import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'myapp.dart';

const apiKey = "b67pax5b2wdq";
const userToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c";
Future<void> main() async {
  final client = StreamChatClient(
    apiKey,
    logLevel: Level.INFO,
  );

  await client.connectUser(
    //it connects the current user
    User(id: 'r'),
    userToken, //it connects the end
  );

  final channel = client.channel(
    'messaging',
    id: 'flutterdevs',
    extraData: {
      'name': 'yush',
    },
  );

  await channel.watch();

  runApp(MyApp(client: client, channel: channel));
}
