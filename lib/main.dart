import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neewzoom/constants/ui_constants.dart';
import 'package:neewzoom/presentation/meetings/meetings_details_page.dart';
import 'package:neewzoom/presentation/meetings/meetings_page.dart';
import 'package:neewzoom/presentation/meetings/personal_id_page.dart';
import 'package:neewzoom/presentation/navigation/navigation_page.dart';
import 'package:neewzoom/presentation/otp_number.dart';
import 'package:neewzoom/presentation/otp_verification.dart';
import 'package:neewzoom/presentation/schedule_meeting/approve_block_page.dart';
import 'package:neewzoom/presentation/schedule_meeting/repeat_page.dart';
import 'package:neewzoom/presentation/schedule_meeting/schedule_meeting_page.dart';
import 'package:neewzoom/presentation/schedule_meeting/select_region_page.dart';
import 'package:neewzoom/presentation/schedule_meeting/select_time_zone_page.dart';

import 'constants/app_bloc_observer.dart';
import 'data/OTP/bloc/otp_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UIconstants uIconstants = UIconstants();
  final OtpBloc _otpBloc = OtpBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeewZoom',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF094C72, uIconstants.defaultSwatch),
        primaryColor: uIconstants.defaultPrimaryColor,
      ),
      home: BlocProvider.value(
        value: _otpBloc,
        // child: SafeArea(child: NavigationPage()),
        child: SafeArea(child: PersonalIdPage()),
      ),
    );
  }
}
