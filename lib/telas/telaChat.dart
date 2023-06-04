import 'package:flutter/material.dart';

class ChatMessage {
  final String sender;
  final String content;

  ChatMessage({required this.sender, required this.content});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();

    setState(() {
      _messages.insert(0, ChatMessage(sender: 'User', content: text));
      _messages.insert(0,
          ChatMessage(sender: 'Other Person', content: 'Hello! How are you?'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];

                return ListTile(
                  title: Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    child: Text(
                      message.sender,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  subtitle: Container(
                    padding:
                        const EdgeInsets.only(top: 3, left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlue,
                    ),
                    child: Text(
                      message.content,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Color(0x159d9d9d),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: _textController,
                       style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Digite a Sua Mensagem',
                        hintStyle: TextStyle(color: Color(0xffffffff)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _handleSubmitted(_textController.text);
                    },
                    child: Text('Enviar')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TelaChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(
         seedColor: Color.fromRGBO(23, 185, 188, 100), 

        ),
           scaffoldBackgroundColor: Color.fromRGBO(45, 45, 45, 1)
         ),
          
      home: ChatScreen(),
    );
  }
}