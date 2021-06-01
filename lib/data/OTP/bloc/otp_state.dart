part of 'otp_bloc.dart';

class OtpState {
  final String? countryCode;
  final int? phoneNumber;

  const OtpState({this.phoneNumber, this.countryCode});

  OtpState copywith({phoneNumber, countryCode}) {
    return OtpState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        countryCode: countryCode ?? this.countryCode);
  }
}

// class OtpInitial extends OtpState {

// }

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
