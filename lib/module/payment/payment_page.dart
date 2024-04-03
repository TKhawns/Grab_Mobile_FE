// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:fe_grab_mobile/module/object/payment_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentWidget();
  }
}

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  List<PaymentList> paymentList = getPaymentList();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Thanh toán",
            style: GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.settings_rounded,
              size: 26,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.grey[100],
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.grey[100],
                    height: screenHeight / 7,
                    width: screenWidth,
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cách thức thanh toán\ntiện lợi nhất",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Image.asset("assets/images/3gift.png"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: screenHeight / 4),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 70,
                    width: screenWidth - 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF58BC6B),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset("assets/images/grab_pay.png")),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Thêm thẻ",
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "Thanh toán dễ dàng hơn với thẻ tín dụng",
                                  style: GoogleFonts.inter(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: screenHeight / 20, left: 20, right: 20),
                    height: 60,
                    child: _buildPaymentServices(screenWidth),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: screenWidth - 80,
                      height: 2,
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 30, bottom: 30),
                    child: Text(
                      "Đề xuất cho bạn",
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth - 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: screenWidth / 2 - 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              "assets/images/naptiendt.png",
                              fit: BoxFit.fitWidth,
                            )),
                        Container(
                            width: screenWidth / 2 - 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              "assets/images/thanhtoanhoadon.png",
                              fit: BoxFit.fitWidth,
                            ))
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: screenWidth - 80,
                      height: 2,
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 30, bottom: 30),
                    child: Text(
                      "Giao dịch gần đây",
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Không có hoạt động nào gần đây.",
                      style: GoogleFonts.inter(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(
                      top: screenHeight / 10 + 20, left: 30, right: 30),
                  width: screenWidth - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white),
                  child: Stack(children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              "Active",
                              style: GoogleFonts.inter(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "Moca Wallet",
                            style: GoogleFonts.inter(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/moca_wallet.png",
                      fit: BoxFit.cover,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentServices(double screenWidth) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: buildPaymentServices(screenWidth),
    );
  }

  List<Widget> buildPaymentServices(double screenWidth) {
    List<Widget> list = [];
    for (var i = 0; i < paymentList.length; i++) {
      list.add(buildPaymentService(screenWidth, paymentList[i], i));
    }
    return list;
  }

  Widget buildPaymentService(
      double screenWidth, PaymentList payment, int index) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 10,
      ),
      margin: EdgeInsets.only(right: 20, left: index == 0 ? 10 : 0),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: payment.icon,
          ),
          Text(
            payment.name,
            style: GoogleFonts.inter(
                fontSize: 19, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
