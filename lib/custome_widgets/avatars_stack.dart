import 'package:flutter/material.dart';
import 'package:neewzoom/constants/ui_constants.dart';

class AvatarsStack extends StatefulWidget {
  final List<String> listOfAvatars;
  const AvatarsStack({Key? key, required this.listOfAvatars}) : super(key: key);

  @override
  _AvatarsStackState createState() => _AvatarsStackState();
}

class _AvatarsStackState extends State<AvatarsStack> {
  final UIconstants uIconstants = UIconstants();

  List<Padding> _getAvatars() {
    List<Padding> avatars = [];
    int startValue = 0;
    int multiplier = 0;
    double displacementValue = 26;

    if (widget.listOfAvatars.length > 4) {
      startValue = widget.listOfAvatars.length - 4;
    }
    for (int x = startValue; x < widget.listOfAvatars.length; x++) {
      var temp = Padding(
        padding: EdgeInsets.only(left: displacementValue * multiplier),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(widget.listOfAvatars[x]),
        ),
      );

      avatars.add(temp);
      multiplier++;
    }

    return avatars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_pictureStack(), _counterText(widget.listOfAvatars.length)],
    );
  }

  Widget _pictureStack() {
    if (widget.listOfAvatars.isEmpty) {
      return Container();
    }
    return Stack(
      children: _getAvatars(),
      // children: [
      //   CircleAvatar(
      //     radius: 20,
      //     backgroundImage: AssetImage('assets/image/demo_profile.png'),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(left: 26),
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundImage: AssetImage('assets/image/demo_profile.png'),
      //     ),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(left: 26 * 2),
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundImage: AssetImage('assets/image/demo_profile.png'),
      //     ),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(left: 26 * 3),
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundImage: AssetImage('assets/image/demo_profile.png'),
      //     ),
      //   ),
      // ],
    );
  }

  Widget _counterText(int count) {
    if (count == 0) {
      return Container();
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 6),
        child: Text(
          "+" + count.toString(),
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 16,
            height: 1.3,
            fontWeight: FontWeight.w600,
            color: uIconstants.defaultFontColor,
          ),
        ),
      );
    }
  }
}
