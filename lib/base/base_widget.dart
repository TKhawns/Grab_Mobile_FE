// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, depend_on_referenced_packages, prefer_const_constructors

import 'package:fe_grab_mobile/module/signin/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PageContainer extends StatelessWidget {
  final Widget child;

  final List<SingleChildWidget> bloc;
  final List<SingleChildWidget> di;

  PageContainer({
    required this.child,
    required this.bloc,
    required this.di,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SignInPage>(create: (_) => SignInPage()),
        ...di,
        ...bloc,
      ],
      child: Scaffold(
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
        body: child,
      ),
    );
  }
}
