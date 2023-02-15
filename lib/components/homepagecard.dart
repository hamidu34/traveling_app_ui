import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import 'custom_icon.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    Key? key,
    required this.texttheme,
  }) : super(key: key);

  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                              color: Colors.grey.shade300.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // #BAFE66
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
          PositionedDirectional(
            end: 10,
            bottom: 10,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xffBAFE66),
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
          PositionedDirectional(
            start: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Padar\nIsland',
                  style: texttheme.displayMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_outlined,
                      color: Color.fromARGB(235, 255, 255, 255),
                    ),
                    Text(
                      'Komodo National Park',
                      style: texttheme.headline6!.copyWith(
                          color: const Color.fromARGB(235, 255, 255, 255)),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
