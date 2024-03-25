import 'package:booktickets/screens/ticket_tabs.dart';
import 'package:booktickets/widgets/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/double_text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20, context), vertical: AppLayout.getHeight(20, context)),
        children: [
          Gap(AppLayout.getHeight(40, context)),
          Text("What are \nyou looking for?", style: Styles.headLineStyle1.copyWith(fontSize: 35)),
          Gap(AppLayout.getHeight(40, context)),
          const AppTicketTabs(firstTab: "Airline Tickets", secondTab: "Hotels"),
          Gap(AppLayout.getHeight(25, context)),
          const AppIconText(icon: Icons.flight_takeoff_rounded, text: "Departure"),
          Gap(AppLayout.getHeight(25, context)),
          const AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
          Gap(AppLayout.getHeight(25, context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(18, context), vertical: AppLayout.getWidth(15, context)),
            decoration: BoxDecoration(
              color: const Color(0xD91130CE),
              borderRadius: BorderRadius.circular(AppLayout.getHeight(10, context)),
            ),
            child: Row(
                children: [
                  Text("find tickets", style: Styles.textStyle)
                ]
            )
          ),
          Gap(AppLayout.getHeight(40, context)),
          const AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View all"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppLayout.getHeight(425, context),
                width: size.width*0.42,
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15, context), vertical: AppLayout.getWidth(15, context)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20, context)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(190, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(12, context)),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/sit.jpg"
                          ),
                          )
                        )
                      ),
                    Gap(AppLayout.getHeight(12, context)),
                    Text(
                      "20% discount on the early booking of this flight. Don't miss",
                      style: Styles.headLineStyle2,
                    ),
                  ],
                )
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width*0.44,
                        height: AppLayout.getHeight(210, context),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3AB8B8),
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(18, context)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15, context), vertical: AppLayout.getHeight(15, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                            Gap(AppLayout.getHeight(10, context)),
                            Text("Take the survey about our services and get discount", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18)),

                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                            padding: EdgeInsets.all(AppLayout.getHeight(30, context)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: AppLayout.getWidth(18, context), color: const Color(0xFF189999)),
                              color: Colors.transparent,
                            )
                        )
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(15, context)),
                  Container(
                    width: size.width*0.44,
                    height: AppLayout.getHeight(200, context),
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15, context), vertical: AppLayout.getHeight(15, context)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(18, context)),
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(
                      children: [
                        Text("Take love", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold, ), textAlign: TextAlign.center,),
                        Gap(AppLayout.getHeight(5, context)),
                        RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "😍",
                                  style: TextStyle(fontSize: 30),
                                ),
                                TextSpan(
                                  text: "🥰",
                                  style: TextStyle(fontSize: 50),
                                ),
                                TextSpan(
                                  text: "😘",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ]
                            )
                        ),
                      ]
                    )
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
