import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/presentation/otp_number.dart';
import 'package:neewzoom/presentation/otp_verification.dart';
import 'package:neewzoom/presentation/schedule_meeting/schedule_meeting_page.dart';

import 'constants/app_bloc_observer.dart';
import 'data/OTP/bloc/otp_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UIconstants uIconstants = UIconstants();
  OtpBloc _otpBloc = OtpBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeewZoom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: uIconstants.defaultPrimaryColor,
      ),
      home: BlocProvider.value(
        value: _otpBloc,
        child: SafeArea(child: ScheduleMeetingPage()),
      ),
    );
  }
}
