// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var heightAppBar = AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Hoạt động",
            style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade100),
                  // fixedSize: MaterialStateProperty.all<Size?>(
                  //     Size.fromHeight(heightAppBar - 20)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.history_outlined,
                      size: 26,
                    ),
                    Text(
                      "Lịch sử",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                )),
          )
        ],
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_activity.png',
            ),
            Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Text(
                  "Hiện vẫn chưa có đơn hàng nào",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Text(
                  "Hoạt động sẽ xuất hiện khi bạn sử dụng các dịch vụ của chúng tôi",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: GoogleFonts.inter(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
