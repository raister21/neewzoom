import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class ScheduleMeetingButton extends StatelessWidget {
  ScheduleMeetingButton({Key? key}) : super(key: key);
  final UIconstants uIconstants = UIconstants();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: uIconstants.defaultsmallPads,
          horizontal: uIconstants.defaultPads),
      child: Container(
        height: uIconstants.defaultButtonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(uIconstants.defaultInputBorderRadius),
            )),
        child: TextButton(
          onPressed: () {
            var sheetController = showModalBottomSheet(
              isDismissible: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(uIconstants.defaultInputBorderRadius),
              ),
              barrierColor: Color.fromRGBO(20, 20, 20, 0.5),
              context: (context),
              builder: (context) => Container(
                height: 220,
                child: Column(
                  children: [
                    _headerBar(context),
                    Divider(),
                    _diclaimerMessage(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: uIconstants.defaultsmallPads,
                          horizontal: uIconstants.defaultPads),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: uIconstants.defaultPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                uIconstants.defaultInputBorderRadius),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Learn More",
                            style: TextStyle(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          child: Text(
            "Schedule Meeting",
            style: TextStyle(
                fontFamily: 'WorkSans',
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget _headerBar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: EdgeInsets.only(top: uIconstants.defaultsmallPads),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: uIconstants.defaultPads),
          child: Text(
            "PREMIUM PLAN",
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: uIconstants.defaultDarkBackground,
            ),
          ),
        ),
      ),
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close))
    ]);
  }

  Widget _diclaimerMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: uIconstants.defaultsmallPads + 4,
          horizontal: uIconstants.defaultPads),
      child: Text(
        "You need to upgrade to a Premium Plan to remove the 40-minute time limit.",
        style: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 16,
          color: uIconstants.defaultFontColor,
        ),
      ),
    );
  }
}
