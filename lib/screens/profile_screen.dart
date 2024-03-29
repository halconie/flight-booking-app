import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20, context), vertical: AppLayout.getHeight(20, context)),
        children: [
          Gap(AppLayout.getHeight(40, context)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppLayout.getHeight(86, context),
                width: AppLayout.getWidth(86, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10, context)),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/img_1.png'),
                    fit: BoxFit.cover
                  )
                )
              ),
              Gap(AppLayout.getWidth(10, context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Book Tickets", style: Styles.headLineStyle1,),
                  Gap(AppLayout.getHeight(2, context)),
                  Text("New-York", style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey.shade500
                  ),),
                  Gap(AppLayout.getHeight(8, context)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(100, context)),
                      color: const Color(0xFFFEF4F3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(3, context), vertical: AppLayout.getHeight(3, context)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(3, context)),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF526799),
                          ),
                          child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Gap(AppLayout.getWidth(5, context)),
                        const Text("Premium Status", style: TextStyle(
                            fontWeight: FontWeight.w600, color: Color(0xFF526799)
                        ),),
                      ],
                    )
                  )
                ]
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      print("You are tapped");
                    },
                    child: Text(
                      "Edit",
                      style: Styles.textStyle.copyWith(color: Styles.primaryColor, fontWeight: FontWeight.w300),
                    ),
                  )
                ]
              )
            ],
          ),
          Gap(AppLayout.getHeight(8, context)),
          Divider(color: Colors.grey.shade300),
          Stack(
            children: [
              Container(
                height: AppLayout.getHeight(90, context),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(18, context)),
                )
              ),
              Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                  padding: EdgeInsets.all(AppLayout.getHeight(30, context)),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF264CD2), width: 18),
                  )
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(25, context), vertical: AppLayout.getHeight(20, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                      color: Styles.primaryColor, size: 27),
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                    ),
                    Gap(AppLayout.getHeight(12, context)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You\'ve got a new award",
                          style: Styles.headLineStyle2.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white,
                          ),
                        ),
                        Text(
                          "You have 95 flights in a year",
                          style: Styles.headLineStyle2.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.7),
                            fontSize: 16
                          ),
                        )
                      ]
                    )
                  ]
                ),
              ),

            ],
          ),
          Gap(AppLayout.getHeight(25, context)),
          Text("Accumulated miles", style: Styles.headLineStyle2),
          Gap(AppLayout.getHeight(20, context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15, context),),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(15, context)),
              color: Styles.bgColor,
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
                Gap(AppLayout.getHeight(15, context)),
                Text(
                  "192802",
                  style: TextStyle(
                    fontSize: 45, fontWeight: FontWeight.w600, color: Styles.textColor
                  ),
                ),
                Gap(AppLayout.getHeight(20, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Miles accured", style: Styles.headLineStyle4.copyWith(fontSize: 16),),
                    Text("30 March 2024", style: Styles.headLineStyle4.copyWith(fontSize: 16),),

                  ],
                ),
                Gap(AppLayout.getHeight(4, context)),
                Divider(color: Colors.grey.shade300),
                Gap(AppLayout.getHeight(4, context)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(firstText: "23 042", secondText: "Miles",
                        alignment: CrossAxisAlignment.start, isColor: false),
                    AppColumnLayout(firstText: "Airline CO", secondText: "Received from",
                        alignment: CrossAxisAlignment.end, isColor: false),
                  ],
                ),
                Gap(AppLayout.getHeight(12, context)),
                const AppLayoutBuilder(sections: 12, isColor: false,),
                Gap(AppLayout.getHeight(12, context)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(firstText: "24", secondText: "Miles",
                        alignment: CrossAxisAlignment.start, isColor: false),
                    AppColumnLayout(firstText: "McGinn\'s", secondText: "Received from",
                        alignment: CrossAxisAlignment.end, isColor: false),
                  ],
                ),
                Gap(AppLayout.getHeight(12, context)),
                const AppLayoutBuilder(sections: 12, isColor: false,),
                Gap(AppLayout.getHeight(12, context)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(firstText: "52 340", secondText: "Miles",
                        alignment: CrossAxisAlignment.start, isColor: false),
                    AppColumnLayout(firstText: "Param", secondText: "Received from",
                        alignment: CrossAxisAlignment.end, isColor: false),
                  ],
                )

              ]
            )
          ),
          Gap(AppLayout.getHeight(25, context)),
          InkWell(
            onTap: ()=>print("You are tapped"),
            child: Center(
              child: Text(

                "How to get more miles",
                style: Styles.textStyle.copyWith(
                  color: Styles.primaryColor, fontWeight: FontWeight.w500
                ),
              ),
            ),
          )
        ],
      )

    );
  }
}
