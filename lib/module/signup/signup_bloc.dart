// ignore_for_file: depend_on_referenced_packages, avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../../base/base_bloc.dart';
import '../../base/base_event.dart';
import '../../data/repo/user_repo.dart';
import '../../event/user_event/signin_event.dart';
import '../../event/user_event/signup_event.dart';
import '../../event/user_event/signup_fail.dart';
import '../../event/user_event/signup_success.dart';
import '../../share_widget/validate.dart';

class SignUpBloc extends BaseBloc {
  final _phoneSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  late UserRepo _userRepo;

  SignUpBloc({required UserRepo userRepo}) {
    _userRepo = userRepo;
    validateForm();
  }

  var phoneValidation = StreamTransformer<String, String?>.fromHandlers(
    handleData: (phone, sink) {
      if (Validation.isPhoneValid(phone)) {
        sink.add(null);
        return;
      }
      sink.add("Phone invalid");
    },
  );
  var passValidation = StreamTransformer<String, String?>.fromHandlers(
    handleData: (pass, sink) {
      if (Validation.isPassValid(pass)) {
        sink.add(null);
        return;
      }
      sink.add("Password too short");
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

  validateForm() {
    CombineLatestStream.combine2(_phoneSubject, _passSubject, (phone, pass) {
      return Validation.isPassValid(pass) && Validation.isPhoneValid(phone);
    }).listen((enable) {
      btnSink.add(enable);
    });
  }

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SignInEvent:
        break;
      case SignUpEvent:
        handleSignUp(event);
        break;
    }
  }

  handleSignUp(event) {
    loadingSink.add(true);
    Future.delayed(Duration(seconds: 3), () {
      SignUpEvent e = event as SignUpEvent;
      _userRepo.signUp(e.displayName, e.phone, e.pass).then((userData) {
        processEventSink.add(SignUpSuccessEvent(userData));
        loadingSink.add(false);
        print(userData);
      }, onError: (e) {
        loadingSink.add(false);
        processEventSink.add(SignUpFailEvent(e.toString()));
        print(e);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _phoneSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}
