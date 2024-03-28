// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'dart:ui';

import 'package:fe_grab_mobile/module/object/message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../share_widget/link_button.dart';

class MessagePage extends StatelessWidget {
  List<Message> messages = getAllMessages();

  MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var heightAppBar = AppBar().preferredSize.height

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Tin nhắn",
            style: GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 25),
            child: const Icon(
              Icons.delete_forever_outlined,
              size: 40,
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Material(
              child: Container(
                height: 60,
                color: Colors.white,
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 10),
                  unselectedLabelColor: const Color(0xFF58BC6B),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF58BC6B)),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: const Color(0xFF58BC6B), width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Trò chuyện",
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: const Color(0xFF58BC6B), width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Thông báo",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/man_with_helmet.png'),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          child: Text(
                            "Xem cuộc trò chuyện của bạn với nhân viên hỗ trợ tại đây!",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                                  'Bạn cũng có thể yêu cầu hỗ trợ thông qua\n',
                              style: GoogleFonts.inter(
                                fontSize: 17,
                              ),
                              children: const <InlineSpan>[
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: LinkButton(
                                      urlLabel: "Trung tâm trợ giúp",
                                      url:
                                          "https://www.facebook.com/TVKhanhnee"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: buildMessages(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildMessages() {
    List<Widget> list = [];
    for (var i = 0; i < messages.length; i++) {
      list.add(buildMessage(messages[i], i, messages.length));
    }
    return list;
  }

  Widget buildMessage(Message message, int index, int length) {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: index == length - 1 ? 0 : 10),
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(200, 70),
          elevation: 0,
        ),
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: CircleAvatar(
                backgroundColor: Colors.orange[100],
                radius: 35,
                child: Image(
                  alignment: Alignment.center,
                  image: NetworkImage(message.avatar, scale: 0.3),
                  fit: BoxFit.fill,
                ),
                // backgroundImage: ,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              message.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            message.date,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            message.content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        // message.unread == true
                        //     ? Text(".",
                        //         style: GoogleFonts.inter(
                        //           color: Colors.red,
                        //           fontSize: 50,
                        //         ))
                        //     : Container()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
