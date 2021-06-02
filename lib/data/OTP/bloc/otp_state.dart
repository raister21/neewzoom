part of 'otp_bloc.dart';

class OtpState {
  final String? countryCode;
  final String? countryFlag;
  final int? phoneNumber;

  const OtpState({this.phoneNumber, this.countryCode, this.countryFlag});

  OtpState copywith({phoneNumber, countryCode, countryFlag}) {
    return OtpState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        countryCode: countryCode ?? this.countryCode,
        countryFlag: countryFlag ?? this.countryFlag);
  }
}

class OtpPhoneNumberSubmitted extends OtpState {
  final String countryCount;
  final int phoneNumber;

  const OtpPhoneNumberSubmitted(
      {required this.countryCount, required this.phoneNumber});
}

class OtpCodeSubmitted extends OtpState {
  final int otpCode;

  const OtpCodeSubmitted({required this.otpCode});
}
