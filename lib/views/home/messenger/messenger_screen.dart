import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialive/utils/app_colors.dart';
import 'package:socialive/utils/assets_paths.dart';
import 'components/chat_bubble.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {

  final List<Map<String, dynamic>> _messages = [
    {"message": "Hi Catherine! How are you?", "isSender": false},
    {"message": "I'm good and you?", "isSender": true},
    {"message": "I'm doing good. What are you doing?", "isSender": false},
    {"message": "I'm working on my app design", "isSender": true},
    {"message": "Let's get lunch! How about sushis?", "isSender": false},
    {"message": "That sounds great!", "isSender": true},
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({"message": text, "isSender": true});
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildMessagesList(),
          _buildMessageInput(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(AssetsIcon.arrowBack,color:isDarkTheme?Colors.white:Colors.black),
        onPressed: () => Get.back(),
      ),
      title: const Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.png'),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Abdullah Al Mahmud",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Last seen 11:44 AM",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(AssetsIcon.phoneCall,color:isDarkTheme?Colors.white:Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(AssetsIcon.videoCall,color:isDarkTheme?Colors.white:Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildMessagesList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          return ChatBubble(
            message: message["message"],
            isSender: message["isSender"],
          );
        },
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _buildTextField(),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: TextField(
        controller: _messageController,
        decoration: InputDecoration(
          hintText: "Write message",
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      onTap: _sendMessage,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: SvgPicture.asset(
            AssetsIcon.send,
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
