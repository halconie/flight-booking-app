import 'package:booktickets/screens/ticket_tabs.dart';
import 'package:booktickets/screens/ticket_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_info_list.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20, context), vertical: AppLayout.getHeight(20, context)),
          children: [
            Gap(AppLayout.getHeight(40, context)),
            Text("Tickets", style: Styles.headLineStyle1),
            Gap(AppLayout.getHeight(20, context)),
            const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
            Gap(AppLayout.getHeight(20, context)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15, context)),
              child: TicketView(ticket: ticketList[0]),
            )

          ],
        )
      ])
    );
  }
}
