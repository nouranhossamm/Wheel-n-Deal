import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wheel_n_deal/Core/functions/send_message.dart';
import 'package:wheel_n_deal/Core/utils/assets.dart';
import 'package:wheel_n_deal/Features/commuter/messages/presentation/views/widgets/chat_app_bar.dart';
import 'package:wheel_n_deal/Features/commuter/messages/presentation/views/widgets/sender_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommuterChatViewBody extends StatefulWidget {
  const CommuterChatViewBody({super.key});

  @override
  State<CommuterChatViewBody> createState() => _CommuterChatViewBodyState();
}

class _CommuterChatViewBodyState extends State<CommuterChatViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    // ignore: unused_local_variable
    String? message;
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 16.0, top: 5),
                  child: Column(
                    children: [
                      const ChatAppBar(),
                      const SizedBox(height: 11),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF3F3F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Yesterday',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF191D31),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            StreamBuilder<QuerySnapshot>(
                              stream: messages
                                  .orderBy('sentAt', descending: false)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  final List<QueryDocumentSnapshot> documents =
                                      snapshot.data!.docs;
                                  if (documents.isNotEmpty) {
                                    // Scroll to the end of the ListView when a new message is sent
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.linear,
                                      );
                                    });

                                    return Expanded(
                                      child: ListView.builder(
                                        controller: _scrollController,
                                        itemCount: documents.length,
                                        itemBuilder: (context, index) {
                                          final message =
                                              documents[index].get('message');
                                          // Replace this with your own condition to determine whether the message is sent or received
                                          return SenderMessage(
                                            messageContent: message,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                }
                                return Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.red,
                                ); // // Placeholder widget if no messages are found
                              },
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 17.0, right: 17, bottom: 17),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: messageController,
                                onFieldSubmitted: (value) {
                                  DateTime currentTime = DateTime.now();
                                  sendMessage(
                                    messages,
                                    value,
                                    messageController,
                                    currentTime,
                                    context,
                                  );
                                },
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF3F3F3),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  hintText: 'Type your message..',
                                  hintStyle:
                                      const TextStyle(color: Color(0xFFA3A3A3)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xff55433c), width: 2.5),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: Color(0xCCA3A3A3), width: 1.0),
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    child: InkWell(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                          AssetsData.attachment),
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      child:
                                          SvgPicture.asset(AssetsData.emojis),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 21.13),
                            InkWell(
                              onTap: () {
                                DateTime currentTime = DateTime.now();
                                sendMessage(
                                  messages,
                                  messageController.text,
                                  messageController,
                                  currentTime,
                                  context,
                                );
                              },
                              child: SvgPicture.asset(
                                AssetsData.sendMessage,
                                width: 30.87,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}