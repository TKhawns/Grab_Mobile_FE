// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:fe_grab_mobile/base/base_widget.dart';
import 'package:fe_grab_mobile/module/signin/signin_bloc.dart';
import 'package:fe_grab_mobile/share_widget/bloc_listener.dart';
import 'package:fe_grab_mobile/share_widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../base/base_event.dart';
import '../../data/repo/user_repo.dart';
import '../../data/service/user_service.dart';
import '../../event/user_event/signin_event.dart';
import '../../event/user_event/signin_fail.dart';
import '../../event/user_event/signin_success.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      di: [
        Provider.value(
          value: UserService(),
        ),
        ProxyProvider<UserService, UserRepo>(
          update: (context, userService, previous) =>
              UserRepo(userService: userService),
        ),
      ],
      bloc: [],
      child: SignInFormWidget(),
    );
  }
}

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  final TextEditingController _txtPhoneController = TextEditingController();
  final TextEditingController _txtPassController = TextEditingController();

  // code of check validate Sign in here
  handleEvent(BaseEvent event) {
    if (event is SignInSuccessEvent) {
      Navigator.pushReplacementNamed(context, "/home",
          arguments: event.userData.token);
    }

    if (event is SignInFailEvent) {
      final snackBar = SnackBar(
        content: Text(event.errorMessage),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Provider<SignInBloc>.value(
      value: SignInBloc(userRepo: Provider.of(context)),
      child: Consumer<SignInBloc>(builder: (context, bloc, child) {
        return BlocListener<SignInBloc>(
          listener: handleEvent,
          child: LoadingTask(
            bloc: bloc,
            child: Container(
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
                    padding:
                        EdgeInsets.only(top: screenHeight / 12, bottom: 20),
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
                  _buildPhoneField(bloc),
                  _buildPassField(bloc),
                  _buildSignInButton(bloc),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account ?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        _buildFooter()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPhoneField(SignInBloc bloc) {
    return StreamProvider<String?>.value(
        initialData: null,
        value: bloc.phoneStream,
        child: Consumer<String?>(
            builder: (context, value, child) => Container(
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
                      controller: _txtPhoneController,
                      onChanged: (text) {
                        bloc.phoneSink.add(text);
                        print(text);
                      },
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                          size: 24,
                        ),
                        hintText: "(+84)382588919",
                        hintStyle: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                        label: const Center(child: Text("Số điện thoại")),
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )));
  }

  Widget _buildPassField(SignInBloc bloc) {
    return StreamProvider<String?>.value(
        initialData: null,
        value: bloc.phoneStream,
        child: Consumer<String?>(
            builder: (context, value, child) => Container(
                  margin: EdgeInsets.only(top: 20),
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
                      controller: _txtPassController,
                      onChanged: (text) {
                        bloc.passSink.add(text);
                        print(text);
                      },
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                          size: 24,
                        ),
                        hintText: "Mật khẩu",
                        hintStyle: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                        label: const Center(child: Text("Mật khẩu")),
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )));
  }

  Widget _buildFooter() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          )),
      child: Text(
        "Đăng ký",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/mid-signup");
      },
    );
  }

  Widget _buildSignInButton(SignInBloc bloc) {
    return StreamProvider<bool?>.value(
        initialData: true,
        value: bloc.btnStream,
        child: Consumer<bool>(
            builder: (context, enable, child) => Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 80, bottom: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromARGB(255, 25, 110, 41)),
                      child: ElevatedButton(
                        child: Text(
                          "Đăng nhập",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        onPressed: enable
                            ? () {
                                bloc.event.add(SignInEvent(
                                  phone: _txtPhoneController.text,
                                  pass: _txtPassController.text,
                                ));
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(350, 60),
                            backgroundColor: const Color(0xFF58BC6B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            )),
                      ),
                    ),
                  ),
                )));
  }
}
