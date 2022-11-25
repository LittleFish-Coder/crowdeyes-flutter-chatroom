import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatAPIPage extends StatefulWidget {
  /// To initialize this example, an instance of [client] and [channel] is required.
  const ChatAPIPage({
    super.key
  });

  @override
  State<ChatAPIPage> createState() => _ChatAPIPageState();

}

class _ChatAPIPageState extends State<ChatAPIPage> {
  /// Instance of [StreamChatClient] we created earlier. This contains information about
  /// our application and connection state.
  late StreamChatClient client;
  /// The channel we'd like to observe and participate.
  late Channel channel;

  @override
  void initState(){
    super.initState();
    /// Create a new instance of [StreamChatClient] passing the apikey obtained from your
    /// project dashboard.
    client = StreamChatClient(
      'b67pax5b2wdq',
      logLevel: Level.INFO,
    );
    connectClient();
    /// Creates a channel using the type `messaging` and `flutterdevs`.
    /// Channels are containers for holding messages between different members. To
    /// learn more about channels and some of our predefined types, checkout our
    /// our channel docs: https://getstream.io/chat/docs/flutter-dart/creating_channels/?language=dart
    channel = client.channel('messaging', id: 'flutterdevs');
    watchChannel();
    runApp(NormalPage(client, channel));
  }

  void connectClient() async {
    /// Set the current user. In a production scenario, this should be done using
    /// a backend to generate a user token using our server SDK.
    /// Please see the following for more information:
    /// https://getstream.io/chat/docs/flutter-dart/tokens_and_authentication/?language=dart
    await client.connectUser(
      User(id: 'tutorial-flutter'),
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
    );
  }

  void watchChannel() async {
    /// `.watch()` is used to create and listen to the channel for updates. If the
    /// channel already exists, it will simply listen for new events.
   await channel.watch();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Building");
  }
}

Widget NormalPage(client, channel){
  return MaterialApp(
    builder: (context, widget) {
      return StreamChat(
        client: client,
        child: widget,
      );
    },
    home: StreamChannel(
      channel: channel,
      child: const ChannelPage(),
    ),
  );
}

/// Displays the list of messages inside the channel
class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}
