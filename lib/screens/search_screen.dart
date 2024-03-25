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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          Text("What are \nyou looking for?", style: Styles.headLineStyle1.copyWith(fontSize: 35)),
          const Gap(40),
          FittedBox(
            child: Container(
                padding: const EdgeInsets.all(3.5),
                child: Row(
                  children: [
                    /*
                airline tickets
                */
                    Container(
                      width: size.width*0.44,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: Center(child: Text("Airline Tickets")),
                    ),
                    /*
                hotels
                */
                    Container(
                      width: size.width*0.44,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                        color: Colors.transparent,
                      ),
                      child: Center(child: Text("Hotels")),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFF4F6FD)
                )
            ),
          ),
          const Gap(25),
          const AppIconText(icon: Icons.flight_takeoff_rounded, text: "Departure"),
          const Gap(20),
          const AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
          const Gap(25),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xD91130CE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                children: [
                  Text("find tickets", style: Styles.textStyle)
                ]
            )
          ),
          const Gap(40),
          const AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View all"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 425,
                width: size.width*0.42,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/sit.jpg"
                          ),
                          )
                        )
                      ),
                    const Gap(12),
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
                        height: 210,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3AB8B8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                            Gap(10),
                            Text("Take the survey about our services and get discount", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18)),

                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 18, color: Color(0xFF189999)),
                              color: Colors.transparent,
                            )
                        )
                      ),
                    ],
                  ),
                  Gap(15),
                  Container(
                    width: size.width*0.44,
                    height: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(
                      children: [
                        Text("Take love", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold, ), textAlign: TextAlign.center,),
                        Gap(5),
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
