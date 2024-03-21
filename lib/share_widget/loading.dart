// ignore_for_file: prefer_const_constructors, unnecessary_new, depend_on_referenced_packages, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../animation/scale.dart';
import '../base/base_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingTask extends StatelessWidget {
  final Widget child;
  final BaseBloc bloc;

  const LoadingTask({required this.child, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<bool>.value(
      value: bloc.loadingStream,
      initialData: false,
      child: Stack(
        children: <Widget>[
          child,
          Consumer<bool>(
              builder: (context, isLoading, child) => Center(
                    child: isLoading
                        ? ScaleAnimation(
                            child: SpinKitWaveSpinner(
                              color: Colors.orange.shade500,
                              size: 80.0,
                              waveColor: Colors.green.shade400,
                            ),
                          )
                        : Container(),
                  )),
        ],
      ),
    );
  }
}
