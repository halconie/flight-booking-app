import 'package:booktickets/screens/ticket_tabs.dart';
import 'package:booktickets/screens/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_info_list.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/column_layout.dart';
import '../widgets/layout_builder_widget.dart';
import 'package:barcode_widget/barcode_widget.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  File? _pickedImage;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected.'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
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
              child: TicketView(ticket: ticketList[0], isColor: true),
            ),
            const SizedBox(height: 1,),

            Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15, context), vertical: AppLayout.getHeight(20, context)),
                margin: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15, context),),
                color: Colors.white,
                child: Column(
                    children: [
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppColumnLayout(
                              firstText: 'Param Pandey',
                              secondText: 'Passenger',
                              alignment: CrossAxisAlignment.start,
                              isColor: false
                            ),
                            AppColumnLayout(
                              firstText: '5221 364869',
                              secondText: 'passport',
                              alignment: CrossAxisAlignment.end,
                              isColor: false
                            )
                          ]
                      ),

                      Gap(AppLayout.getHeight(20, context)),
                      const AppLayoutBuilder(sections: 15, isColor: false, width: 5),
                      Gap(AppLayout.getHeight(20, context)),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppColumnLayout(
                                firstText: '0055 444 77147',
                                secondText: 'Number of E-ticket',
                                alignment: CrossAxisAlignment.start,
                                isColor: false
                            ),
                            AppColumnLayout(
                                firstText: 'B2SG28',
                                secondText: 'Booking Code',
                                alignment: CrossAxisAlignment.end,
                                isColor: false
                            )
                          ]
                      ),
                      Gap(AppLayout.getHeight(20, context)),
                      const AppLayoutBuilder(sections: 15, isColor: false, width: 5),
                      Gap(AppLayout.getHeight(20, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/visa.png", scale: 11,),
                                  Text(" *** 2462 ", style: Styles.headLineStyle3,)
                                ]
                              ),
                              Gap(AppLayout.getHeight(5, context)),
                              Text("Payment Method", style: Styles.headLineStyle4,),
                            ],
                          ),
                          const AppColumnLayout(
                              firstText: '\$249.99',
                              secondText: 'Price',
                              alignment: CrossAxisAlignment.end,
                              isColor: false
                          ),
                        ],
                      )
                    ]
                )
            ),
            /*
            bar code
            */
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppLayout.getHeight(21, context)),
                    bottomLeft: Radius.circular(AppLayout.getHeight(21, context)),
                ),
              ),

              margin: EdgeInsets.only(left: AppLayout.getHeight(15, context), right: AppLayout.getHeight(15, context)),
              padding: EdgeInsets.only(top: AppLayout.getHeight(20, context), bottom: AppLayout.getHeight(20, context)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15, context),),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15, context)),
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data: 'https://www.skyscanner.co.in/',
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70

                  ),
                ),
              ),
            ),
            Gap(AppLayout.getHeight(20, context)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15, context)),
              child: TicketView(ticket: ticketList[0],),
            ),
            ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.camera);
              },
              child: const Text('Pick Image from Camera'),
            ),
            ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
              child: const Text('Pick Image from Gallery'),
            ),
            if (_pickedImage != null)
              Image.file(_pickedImage!),
          ],
        ),
        Positioned(
          left: AppLayout.getHeight(22, context),
          top: AppLayout.getHeight(295, context),
          child: Container(
            padding: EdgeInsets.all(AppLayout.getHeight(3, context),),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Styles.textColor, width: 2),
            ),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            )
          ),
        ),
        Positioned(
          right: AppLayout.getHeight(22, context),
          top: AppLayout.getHeight(295, context),
          child: Container(
              padding: EdgeInsets.all(AppLayout.getHeight(3, context),),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              )
          ),
        )
      ])
    );
  }
}
