class DailyMeetings {
  String day;
  List<EachMeeting> meetings;

  DailyMeetings({required this.day, required this.meetings});
}

class EachMeeting {
  String id;
  String title;
  String hours;
  bool startable;

  EachMeeting(
      {required this.id,
      required this.title,
      required this.hours,
      required this.startable});
}
