// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_bloc.dart';
import '../base/base_event.dart';

class BlocListener<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final Function(BaseEvent event) listener;

  const BlocListener({
    super.key,
    required this.child,
    required this.listener,
  });

  @override
  _BlocListenerState createState() => _BlocListenerState<T>();
}

class _BlocListenerState<T> extends State<BlocListener> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var bloc = Provider.of<T>(context) as BaseBloc;
    bloc.processEventStream.listen(
      (event) {
        widget.listener(event);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<BaseEvent?>.value(
      value: (Provider.of<T>(context) as BaseBloc).processEventStream,
      initialData: null,
      updateShouldNotify: (prev, current) {
        return false;
      },
      child: Consumer<BaseEvent?>(
        builder: (context, event, child) {
          return Container(
            child: widget.child,
          );
        },
      ),
    );
  }
}
