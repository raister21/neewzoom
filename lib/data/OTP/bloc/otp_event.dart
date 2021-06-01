part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpPhoneNumberChanged extends OtpEvent {
  final int phoneNumber;
  const OtpPhoneNumberChanged({required this.phoneNumber});
}

class OtpCountryCodeChanged extends OtpEvent {
  final String countryCode;
  const OtpCountryCodeChanged({required this.countryCode});
}

class OtpPhoneNumberSubmit extends OtpEvent {
  final String countryCode;
  final int phoneNumber;

  const OtpPhoneNumberSubmit(
      {required this.countryCode, required this.phoneNumber});
}

class OtpCodeSumit extends OtpEvent {
  final int otpCode;

  const OtpCodeSumit({required this.otpCode});
}
