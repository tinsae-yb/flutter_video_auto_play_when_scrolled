import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:video_playground/home/video_widget.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        InViewNotifierList(
          scrollDirection: Axis.vertical,
          initialInViewIds: const ['0'],
          isInViewPortCondition:
              (double deltaTop, double deltaBottom, double viewPortDimension) {
            return deltaTop < (0.3 * viewPortDimension) &&
                deltaBottom > (0.3 * viewPortDimension);
          },
          itemCount: 10,
          builder: (BuildContext context, int index) {
            return Container(
              width: double.infinity,
              height: 300.0,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 50.0),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return InViewNotifierWidget(
                    id: '$index',
                    builder:
                        (BuildContext context, bool isInView, Widget? child) {
                      return VideoWidget(
                          play: isInView,
                          url:
                              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
                    },
                  );
                },
              ),
            );
          },
        ),
        Align(
          alignment: const Alignment(0, -0.4),
          child: Container(
            height: 1.0,
            color: Colors.redAccent,
          ),
        )
      ],
    );
  }
}
