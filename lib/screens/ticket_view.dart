import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
      height: AppLayout.getHeight(GetPlatform.isAndroid==true?174:169, context),
      // height: AppLayout.getHeight(174, context),
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
                      topRight: Radius.circular(AppLayout.getHeight(21, context)),
                  ),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16, context)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3
                      ),
                      Expanded(child: Container()),
                      const ThickContainer(isColor: true,),
                      Expanded(
                          child: Stack(
                            children: [
                              SizedBox(
                                  height: AppLayout.getHeight(24, context),
                                  child: const AppLayoutBuilder(sections: 6,)
                              ),
                              Center(
                                  child: Transform.rotate(
                                      angle: 1.5,
                                      child: Icon(Icons.local_airport_rounded, color: isColor==null? Colors.white : const Color(0xFF8ACCF7))
                                  )
                              ),
                            ],
                          )),
                      const ThickContainer(isColor: true,),
                      // const Icon(Icons.local_airport_rounded, color: Colors.white),

                      // const ThickContainer(),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3,
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
                              style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4 ,
                            )
                        ),
                        Text(
                          ticket['flying_time'],
                          style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,
                        ),
                        SizedBox(
                          width: AppLayout.getWidth(100, context),
                          child: Text(
                            ticket['to']['name'],
                            textAlign: TextAlign.end,
                            style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,
                            ),
                        ),
                      ]
                  )
                ],
              ),
            ),
            /*
            showing the orange part of the card/ticket
            */
            Container(
                color: isColor==null? Styles.orangeColor : Colors.white,
                child: Row(children: [
                  SizedBox(
                      height: AppLayout.getHeight(20, context),
                      width: AppLayout.getWidth(10, context),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isColor==null? Colors.grey.shade200 : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(AppLayout.getHeight(10, context)),
                                bottomRight: Radius.circular(AppLayout.getHeight(10, context)),
                            ),
                          ),
                      ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(AppLayout.getHeight(9.0, context)),
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  (constraints.constrainWidth() / 15).floor(),
                                  (index) => SizedBox(
                                      width: AppLayout.getWidth(5, context),
                                      height: AppLayout.getHeight(1, context),
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: isColor==null?  Colors.white : Colors.grey.shade300,
                                          )
                                      )
                                  )
                              )
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      height: AppLayout.getHeight(20, context),
                      width: AppLayout.getWidth(10, context),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isColor==null? Styles.bgColor  : Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppLayout.getHeight(10, context)),
                                bottomLeft: Radius.circular(AppLayout.getHeight(10, context)),
                            ),
                          ),
                      ),
                  ),
                ]),
            ),
            /*
            bottom part of the orange card/ticket
            */
              Container(
                decoration: BoxDecoration(
                    color: isColor==null? Styles.orangeColor : Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppLayout.getHeight(isColor==null?21:0, context)),
                        bottomRight: Radius.circular(AppLayout.getHeight(isColor==null?21:0, context)),
                    ),
                ),
                padding: EdgeInsets.only(
                    left: AppLayout.getHeight(16, context),
                    top: AppLayout.getHeight(10, context),
                    right: AppLayout.getHeight(16, context),
                    bottom: AppLayout.getHeight(16, context)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(firstText: ticket['date'], secondText: "Date",
                            alignment: CrossAxisAlignment.start, isColor: isColor),
                        AppColumnLayout(firstText: ticket['departure_time'], secondText: "Departure Time",
                            alignment: CrossAxisAlignment.center, isColor: isColor),
                        AppColumnLayout(firstText: ticket['number'].toString(), secondText: "Number",
                            alignment: CrossAxisAlignment.end, isColor: isColor),
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
