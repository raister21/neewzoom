import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpState());

  @override
  Stream<OtpState> mapEventToState(
    OtpEvent event,
  ) async* {
    if (event is OtpPhoneNumberChanged) {
      yield state.copywith(phoneNumber: event.phoneNumber);
    }
    if (event is OtpCountryCodeChanged) {
      yield state.copywith(
          countryCode: event.countryCode, countryFlag: event.countryFlag);
    }
    if (event is OtpPhoneNumberSubmit) {
      print(state.countryCode);
      print(state.phoneNumber);
      yield OtpPhoneNumberSubmitted(
          countryCount: event.countryCode, phoneNumber: event.phoneNumber);
    }
    if (event is OtpCodeSumit) {
      yield OtpCodeSubmitted(otpCode: event.otpCode);
    }
  }
}
