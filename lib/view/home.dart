import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:traveling_app_ui/components/custom_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    List mapSelection = [
      {"icon": "asia", "title": "Asia"},
      {"icon": "europe", "title": "Europe"},
      {"icon": "middle-east", "title": "Middle East"},
      {"icon": "africa", "title": "Africa"}
    ];
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find your\nfavorite place',
                    style:
                        texttheme.headlineLarge!.copyWith(color: Colors.black),
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade200,
                    child: IconButton(
                      isSelected: true,
                      onPressed: () {
                        HapticFeedback.selectionClick();
                      },
                      icon: CustomIcons(
                        iconName: 'notification',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                itemCount: mapSelection.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        CustomIcons(iconName: mapSelection[index]["icon"]),
                        const Gap(5),
                        Text(
                          mapSelection[index]["title"],
                          style: texttheme.headlineSmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Gap(20),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/padarIsland.jpg'),
                  ),
                ),
                child: Stack(children: [
                  PositionedDirectional(
                    top: 10,
                    start: 10,
                    child: FittedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '\$60',
                                  style: texttheme.headlineSmall!
                                      .copyWith(color: Colors.white),
                                ),
                                const Gap(5),
                                Text(
                                  '/Person',
                                  style: texttheme.headline6!.copyWith(
                                      color: Colors.grey.shade300
                                          .withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 10,
                    top: 10,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.black12.withOpacity(0.1),
                          child: IconButton(
                            isSelected: true,
                            onPressed: () {
                              HapticFeedback.selectionClick();
                            },
                            icon: CustomIcons(
                              iconName: 'favorite',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
