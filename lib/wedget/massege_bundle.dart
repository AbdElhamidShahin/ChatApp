import 'package:flutter/material.dart';
import 'package:new_chat_app/model/massege.dart';

class MassegeBundle extends StatelessWidget {
  const MassegeBundle({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: Color(0xff22B475), // إصلاح الكود اللوني بدون حرف E
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.message != null) // عرض الرسالة فقط إذا كانت غير فارغة
                  Text(
                    message.message!,
                    style: const TextStyle(color: Colors.white),
                  ),
                if (message.datetime != null) // عرض التاريخ إذا كان غير فارغ
                  Text(
                    message.datetime!.toLocal().toString(), // تحويل التاريخ إلى نص
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class MassegeBundleFrind extends StatelessWidget {
  const MassegeBundleFrind({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                bottomLeft: Radius.circular(32),
                topRight: Radius.circular(32)),
            color: Color(0xff006D84),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              message.message!,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
