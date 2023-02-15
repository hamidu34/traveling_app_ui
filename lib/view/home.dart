import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:traveling_app_ui/components/custom_icon.dart';

import '../components/homepagecard.dart';

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
            HomePageCard(texttheme: texttheme),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
