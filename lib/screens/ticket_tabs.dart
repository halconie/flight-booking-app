import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
      child: Container(
          padding: EdgeInsets.all(AppLayout.getHeight(3.5, context)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(50, context)),
              color: const Color(0xFFF4F6FD)
          ),
          child: Row(
            children: [
              /*
                airline tickets
                */
              Container(
                width: size.width*0.44,
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7, context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(AppLayout.getHeight(50, context))),
                  color: Colors.white,
                ),
                child: const Center(child: Text("Airline Tickets")),
              ),
              /*
                hotels
                */
              Container(
                width: size.width*0.44,
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7, context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(AppLayout.getHeight(50, context))),
                  color: Colors.transparent,
                ),
                child: const Center(child: Text("Hotels")),
              ),
            ],
          )
      ),
    );
  }
}
