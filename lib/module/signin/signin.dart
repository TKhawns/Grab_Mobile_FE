// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:fe_grab_mobile/base/base_widget.dart';
import 'package:fe_grab_mobile/module/object/food_option.dart';
import 'package:fe_grab_mobile/module/object/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
        title: "Grab", bloc: [], di: [], child: const SignInForm());
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  List<Services> services = getAllServices();
  List<Options> options = getAllOptions();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    return Column(
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
                _buildAds(screenWidth),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Món ngon cho bạn",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500, fontSize: 21),
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
                  margin: const EdgeInsets.only(top: 20),
                  height: 160,
                  child: _buildListFoods(screenWidth),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Đi chợ mua sắm",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500, fontSize: 21),
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
                  margin: const EdgeInsets.only(top: 20),
                  height: 160,
                  child: _buildListFoods(screenWidth),
                ),
              ])),
        )),
        _buildFooter(screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildHeader(double screenHeight, double screenWidth) {
    return Stack(
      children: [
        Container(
          color: const Color(0xff58bc6b),
          height: screenHeight / 3 - 100,
          width: screenWidth,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 60, left: 25),
                    child: Text(
                      "Chưa có tài khoản Grab?",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Text(
                      "Đăng ký để hưởng các \ntiện ích",
                      style:
                          GoogleFonts.inter(color: Colors.white, fontSize: 16),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Image.asset('assets/images/man_with_helmet.png'),
              ),
            ],
          ),
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
          margin: const EdgeInsets.only(top: 150, right: 20, left: 20),
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

  Widget _buildAds(double screenWidth) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 214, 255, 234),
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.6,
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Chưa có tài khoản Grab?",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                Text(
                  "Đăng ký để hưởng các\ntiện ích!",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            ),
          ),
          Expanded(
            child: Image.asset('assets/images/3gift.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(double screenWidth, double screenHeight) {
    return Container(
      height: 100,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: 55,
            width: screenWidth / 2 - 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 214, 255, 234)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ))),
              onPressed: () {},
              child: Text("Đăng ký",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30),
            height: 55,
            width: screenWidth / 2 - 50,
            color: Colors.transparent,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ))),
              onPressed: () {},
              child: Text("Đăng nhập",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18)),
            ),
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

  Widget _buildListFoods(screenWidth) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: buildFoods(screenWidth),
    );
  }

  List<Widget> buildFoods(double screenWidth) {
    List<Widget> list = [];
    for (var i = 0; i < options.length; i++) {
      list.add(buildFood(options[i], i, screenWidth));
    }
    return list;
  }

  Widget buildFood(Options option, int index, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(right: 36, left: index == 0 ? 16 : 0),
      height: 35,
      width: screenWidth / 3 + 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[200]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
                option.name,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 90, right: 5),
            child: Image.asset(option.image),
          ),
        ],
      ),
    );
  }
}
