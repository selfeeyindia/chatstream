import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

/// Displays the list of messages inside the channel
class ChannelPage extends StatelessWidget {
  ChannelPage({
    Key? key,
    required this.channel,
  }) : super(key: key);
  final Channel channel;
  // var messageInputController = StreamMessageInputmessageInputController();
  @override
  Widget build(BuildContext context) {
    Message message = Message();
    return Scaffold(
      appBar: StreamChannelHeader(
        onImageTap: () {},
        showTypingIndicator: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(
            // messageInputmessageInputController: messageInputController,
            showCommandsButton: false,
            disableAttachments: true,
            sendButtonBuilder: (context, messageInputmessageInputController) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: FloatingActionButton(
                  onPressed: () async {
                    print(messageInputmessageInputController.text);
                    // await channel.sendMessage(message);
                    if (messageInputmessageInputController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please write some message",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (messageInputmessageInputController.text
                        .contains(RegExp(r'[0-9]'))) {
                      print(messageInputmessageInputController.text
                          .contains(RegExp(r'[0-9]')));
                      Fluttertoast.showToast(
                          msg: "Number is not allowed ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      Message message =
                          messageInputmessageInputController.message;
                      print(message);
                      messageInputmessageInputController.clear();
                      await channel.sendMessage(message);
                    }
                  },
                  child: Text("Send"),
                ),
              );
            },
          ),
          // TextField(
          //     keyboardType: TextInputType.numberWithOptions(decimal: false)),
          // SizedBox(
          //   height: 50,
          // ),
        ],
      ),
    );
  }
}
