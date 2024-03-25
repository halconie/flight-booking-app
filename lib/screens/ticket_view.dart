import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  // const TicketView({super.key, required this.ticket});
  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(200, context),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16, context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*
              showing the blue part of the card/ticket
               */
            Container(
              decoration: BoxDecoration(
                  color: isColor==null? const Color(0xFF526799) : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppLayout.getHeight(21, context)),
                      topRight: Radius.circular(AppLayout.getHeight(21, context)))),
              padding: EdgeInsets.all(AppLayout.getHeight(16, context)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      const ThickContainer(),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                              height: AppLayout.getHeight(24, context),
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  // print("The width is ${constraints.constrainWidth()}");
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        (constraints.constrainWidth() / 6)
                                            .floor(),
                                        (index) => SizedBox(
                                              width: AppLayout.getWidth(3, context),
                                              height: AppLayout.getHeight(1, context),
                                              child: const DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                              ),
                                            )),
                                  );
                                },
                              )),
                          Center(
                              child: Transform.rotate(
                                  angle: 1.5,
                                  child: const Icon(Icons.local_airport_rounded,
                                      color: Colors.white))),
                        ],
                      )),
                      // Icon(Icons.local_airport_rounded, color: Colors.white),

                      const ThickContainer(),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(3, context)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: AppLayout.getWidth(100, context),
                            child: Text(
                              ticket['from']['name'],
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.white),
                            )),
                        Text(
                          ticket['flying_time'],
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                            width: AppLayout.getWidth(100, context),
                            child: Text(
                              ticket['to']['name'],
                              textAlign: TextAlign.end,
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.white),
                            )),
                      ])
                ],
              ),
            ),
            /*
              showing the orange part of the card/ticket
               */
            Container(
                color: Styles.orangeColor,
                child: Row(children: [
                  SizedBox(
                      height: AppLayout.getHeight(20, context),
                      width: AppLayout.getWidth(10, context),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppLayout.getHeight(10, context)),
                            bottomRight: Radius.circular(AppLayout.getHeight(10, context))),
                      ))),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(AppLayout.getHeight(12.0, context)),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  (constraints.constrainWidth() / 15).floor(),
                                  (index) => SizedBox(
                                      width: AppLayout.getWidth(5, context),
                                      height: AppLayout.getHeight(1, context),
                                      child: const DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.white)))));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      height: AppLayout.getHeight(20, context),
                      width: AppLayout.getWidth(10, context),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getHeight(10, context)),
                            bottomLeft: Radius.circular(AppLayout.getHeight(10, context))),
                      )))
                ])),
            /*
            bottom part of the orange card/ticket
            */
            Container(
              decoration: BoxDecoration(
                  color: Styles.orangeColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppLayout.getHeight(21, context)),
                      bottomRight: Radius.circular(AppLayout.getHeight(21, context)))),
              padding: EdgeInsets.only(
                  left: AppLayout.getHeight(16, context), top: AppLayout.getHeight(10, context), right: AppLayout.getHeight(16, context), bottom: AppLayout.getHeight(16, context)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['date'],
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          Gap(AppLayout.getHeight(5, context)),
                          Text(
                            "Date",
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ticket['departure_time'],
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          Gap(AppLayout.getHeight(5, context)),
                          Text(
                            "Departure Time",
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            ticket['number'].toString(),
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          Gap(AppLayout.getHeight(5, context)),
                          Text(
                            "Number",
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
