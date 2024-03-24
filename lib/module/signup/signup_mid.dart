// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:fe_grab_mobile/base/base_widget.dart';
import 'package:fe_grab_mobile/module/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpMidPage extends StatelessWidget {
  const SignUpMidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF58BC6B),
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: SignUpFormWidget());
  }
}

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final TextEditingController _txtNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xFF58BC6B),
      padding: EdgeInsets.only(right: 25, left: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: screenWidth / 2,
            child: Image.asset(
              'assets/images/g33.png',
              fit: BoxFit.fill,
            ),
            padding: EdgeInsets.only(top: screenHeight / 12, bottom: 20),
          ),
          Container(
            padding: EdgeInsets.only(bottom: screenHeight / 6),
            alignment: Alignment.center,
            child: Text(
              "Siêu ứng dụng đáp ứng mọi nhu cầu\nhàng ngày",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          _buildNameField(),
          _buildSignUpButton(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 60),
        child: TextField(
          onChanged: (text) {
            print(text);
          },
          controller: _txtNameController,
          cursorColor: Colors.black,
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.account_balance_rounded,
              color: Colors.black,
              size: 24,
            ),
            label: const Center(child: Text("Tên của bạn")),
            labelStyle: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 80, bottom: 30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), color: Colors.white),
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Color.fromARGB(255, 25, 110, 41)),
          child: ElevatedButton(
            child: Text(
              "Tiếp tục",
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SignUpPage(name: _txtNameController.text)),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 60),
                backgroundColor: const Color(0xFF58BC6B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                )),
          ),
        ),
      ),
    );
  }
}
