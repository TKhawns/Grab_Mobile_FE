// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';
import 'package:fe_grab_mobile/module/object/booking_now.dart';
import 'package:fe_grab_mobile/module/object/grab_reward.dart';
import 'package:fe_grab_mobile/module/object/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageForm(),
    );
  }
}

class HomePageForm extends StatefulWidget {
  const HomePageForm({super.key});

  @override
  State<HomePageForm> createState() => _HomePageFormState();
}

class _HomePageFormState extends State<HomePageForm> {
  List<Services> services = getAllServices();
  List<BookingNow> listBookingNows = getAllBookingNows();
  List<GrabReward> grabRewards = getAllGrabRewards();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // print(screenHeight);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    _buildHeader(screenHeight, screenWidth),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 120,
                      child: _buildListService(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 60,
                      child: _buildGrabRewards(screenWidth),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 15),
                      child: Row(
                        children: [
                          Text(
                            "Đặt ngay",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 21),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: const Icon(
                              Icons.arrow_circle_right_rounded,
                              color: Colors.grey,
                              size: 21,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 210,
                      margin: const EdgeInsets.only(top: 20),
                      child: _buildBookingNow(screenWidth),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 15),
                      child: Row(
                        children: [
                          Text(
                            "Có thể bạn sẽ thích",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 21),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: const Icon(
                              Icons.arrow_circle_right_rounded,
                              color: Colors.grey,
                              size: 21,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 210,
                      margin: const EdgeInsets.only(top: 20),
                      child: _buildBookingNow(screenWidth),
                    ),
                  ])),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double screenHeight, double screenWidth) {
    return Stack(
      children: [
        Container(
          color: const Color(0xff58bc6b),
          height: screenHeight / 8,
          width: screenWidth,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 8,
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          height: 60,
          margin: const EdgeInsets.only(top: 70, right: 20, left: 20),
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Center(
            child: TextField(
              style: const TextStyle(fontSize: 21),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                  hintText: "Tìm trên ứng dụng Grab",
                  hintStyle: const TextStyle(fontSize: 20),
                  labelStyle:
                      GoogleFonts.inter(color: Colors.grey, fontSize: 21)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrabRewards(double screenWidth) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: buildGrabRewards(screenWidth),
    );
  }

  List<Widget> buildGrabRewards(double screenWidth) {
    List<Widget> list = [];
    for (var i = 0; i < grabRewards.length; i++) {
      list.add(buildGrabReward(screenWidth, grabRewards[i], i));
    }
    return list;
  }

  Widget buildGrabReward(double screenWidth, GrabReward grabReward, int index) {
    return Container(
      //width: screenWidth / 3 + 60,
      constraints: const BoxConstraints(
        minWidth: 10,
        //maxWidth: screenWidth / 3 + 60,
      ),
      margin: EdgeInsets.only(right: 20, left: index == 0 ? 10 : 0),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    grabReward.title,
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  grabReward.content,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 30, left: 20, bottom: 10, right: 10),
            child: Image.asset(grabReward.image),
          ),
        ],
      ),
    );
  }

  Widget _buildListService() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: buildServices(),
    );
  }

  List<Widget> buildServices() {
    List<Widget> list = [];
    for (var i = 0; i < services.length; i++) {
      list.add(buildService(services[i], i));
    }
    return list;
  }

  Widget buildService(Services service, int index) {
    return Container(
      margin: EdgeInsets.only(right: 36, left: index == 0 ? 16 : 0),
      child: Column(
        children: [
          Image.asset(service.image),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              service.name,
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingNow(screenWidth) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: buildListBookingNows(screenWidth),
    );
  }

  List<Widget> buildListBookingNows(double screenWidth) {
    List<Widget> list = [];
    for (var i = 0; i < listBookingNows.length; i++) {
      list.add(buildListBookingNow(listBookingNows[i], i, screenWidth));
    }
    return list;
  }

  Widget buildListBookingNow(
      BookingNow listBookingNow, int index, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: index == 0 ? 16 : 0),
      width: screenWidth - 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              listBookingNow.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                listBookingNow.name,
                style: GoogleFonts.inter(
                    fontSize: 17, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
