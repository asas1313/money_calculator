import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Center(
          child: GestureDetector(
              onTap: () {
                Get.snackbar('title', 'message');
              },
              child: Column(
                children: [
                  Text(
                    'Hello World',
                  ),
                  Text(
                    'Caption',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Headline1',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Headline2',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Headline3',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Headline4',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Headline5',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'Headline6',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Overline',
                    style: Theme.of(context).textTheme.overline,
                  ),
                  Text(
                    'Subtitle1',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Subtitle2',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    'BodyText1',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'BodyText2',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Button',
                    style: Theme.of(context).textTheme.button,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
