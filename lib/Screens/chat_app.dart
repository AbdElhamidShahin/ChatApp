import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_chat_app/wedget/massege_bundle.dart';

import '../model/massege.dart';

class ChatPage extends StatelessWidget {
  final String? message;
  final _controller = ScrollController();
  ChatPage({super.key, this.message});
  CollectionReference masseges =
      FirebaseFirestore.instance.collection('massege');

  TextEditingController controller = TextEditingController();

  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
      stream: masseges
          .orderBy(
            'datetime', //يبدا من اخر رساله بعتاهاله
            descending: true, //لترتيب الرسائل تنازلي
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromjson(snapshot.data!.docs[i]),
            );
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff22B475E),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/scholar.png'),
                    height: 50,
                  ),
                  Text(
                    'chat',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? MassegeBundle(
                                message: messagesList[index],
                              )
                            : MassegeBundleFrind(
                                message: messagesList[index],
                              );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextField(
                    controller: controller,

                    onSubmitted: (data) async {
                      try {
                        if (data.isNotEmpty) {
                          await masseges.add({
                            //اضافه البيانات الي fire base
                            "massege": data, //الرياله
                            "datetime":   DateTime.now(),
                            "id": email //تاريخ ووقت ارسال الرسائل
                          });
                          controller.clear();
                          _controller.animateTo(0,
                              duration: Duration(
                                  seconds:
                                      1), //مده النزول من اول رساله الي اخر رساله
                              curve: Curves.fastOutSlowIn); //شكل النزول
                        }
                      } catch (e) {
                        print('حدث خطأ: $e');
                      }
                    },

                    style: const TextStyle(color: Colors.black), // text color
                    decoration: InputDecoration(
                      suffix: const Icon(
                        Icons.send,
                        color: Color(0xff22B475E),
                      ),
                      hintText: 'Sent Massege',
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text("loding.. ");
        }
      },
    );
  }
}
