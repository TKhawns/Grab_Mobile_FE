// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../../base/base_bloc.dart';
import '../../base/base_event.dart';
import '../../data/repo/user_repo.dart';
import '../../event/user_event/signin_event.dart';
import '../../event/user_event/signin_fail.dart';
import '../../event/user_event/signin_success.dart';
import '../../event/user_event/signup_event.dart';
import '../../share_widget/validate.dart';

class SignInBloc extends BaseBloc {
  final _phoneSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  var phoneValidation = StreamTransformer<String, String?>.fromHandlers(
      handleData: (phone, sink) {
    if (Validation.isPhoneValid(phone)) {
      sink.add(null);
      return;
    }
    sink.add("Phone invalid");
  });

  var passValidation = StreamTransformer<String, String?>.fromHandlers(
    handleData: (pass, sink) {
      if (Validation.isPassValid(pass)) {
        sink.add(null);
        return;
      }
      sink.add("Password is too short");
    },
  );

  Stream<String?> get phoneStream =>
      _phoneSubject.stream.transform(phoneValidation);
  Sink<String> get phoneSink => _phoneSubject.sink;
  Stream<String?> get passStream =>
      _passSubject.stream.transform(passValidation);
  Sink<String> get passSink => _passSubject.sink;
  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  late UserRepo _userRepo;
  SignInBloc({required UserRepo userRepo}) {
    _userRepo = userRepo;
    validateForm();
  }

  validateForm() {
    CombineLatestStream.combine2(_phoneSubject, _passSubject, (phone, pass) {
      return Validation.isPhoneValid(phone) && Validation.isPassValid(pass);
    }).listen((enable) {
      btnSink.add(enable);
    });
  }

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SignInEvent:
        handleSignIn(event);
        break;
      case SignUpEvent:
        handleSignUp(event);
        break;
    }
  }

  handleSignIn(event) {
    loadingSink.add(true);
    btnSink.add(false);
    Future.delayed(Duration(seconds: 0), () {
      SignInEvent e = event as SignInEvent;
      _userRepo.signIn(e.phone, e.pass).then((userData) {
        processEventSink.add(SignInSuccessEvent(userData));
        loadingSink.add(false);
        btnSink.add(true);
        print(userData);
      }, onError: (e) {
        loadingSink.add(false);
        btnSink.add(true);
        processEventSink.add(SignInFailEvent(e.toString()));
        print(e);
      });
    });
  }

  handleSignUp(event) {}

  @override
  void dispose() {
    super.dispose();
    _phoneSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}
