import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/widgets/double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_info_list.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import 'hotel_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20, context)),
            child: Column(
              children: [
                Gap(AppLayout.getHeight(40, context)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: Styles.headLineStyle3,
                          ),
                          Gap(AppLayout.getHeight(5, context)),
                          Text(
                            "Book Tickets",
                            style: Styles.headLineStyle1,
                          ),
                        ],
                      ),
                      Container(
                          height: AppLayout.getHeight(50, context),
                          width: AppLayout.getWidth(50, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppLayout.getHeight(10, context)),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/img_1.png"),),),)
                    ],),
                Gap(AppLayout.getHeight(5, context)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(10, context)),
                      color: const Color(0xFFF4F6FD)),
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12, context), vertical: AppLayout.getHeight(12, context)),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular,
                          color: Color(0xFFBFC205)),
                      Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(40, context)),
                const AppDoubleTextWidget(bigText: "Hotels", smallText: "View all")
              ],
            ),
          ),
          Gap(AppLayout.getHeight(15, context)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: AppLayout.getHeight(20, context)),
            child: Row(
              children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket,)).toList(),
            ),
          ),
          Gap(AppLayout.getHeight(15, context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20, context)),
            child: const AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View all"),
          ),
          Gap(AppLayout.getHeight(15, context)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: AppLayout.getHeight(20, context)),
            child: Row(
              children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
            ),),

        ])
    );
  }
}
