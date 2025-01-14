import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/SHModel.dart';
import '../utils/SHColors.dart';
import '../utils/SHDataProvider.dart';
import 'SHNewDeviceScreen.dart';

class SHAllDevicesScreen extends StatefulWidget {
  SHModel? data;

  SHAllDevicesScreen({this.data});

  @override
  SHAllDevicesScreenState createState() => SHAllDevicesScreenState();
}

class SHAllDevicesScreenState extends State<SHAllDevicesScreen> {
  List devicesList = getAllDevicesList();

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHScaffoldDarkColor,
      appBar: AppBar(
        title: Text("All Devices", style: boldTextStyle(color: white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: SHScaffoldDarkColor,
        iconTheme: IconThemeData(color: white),
        actions: [
          IconButton(
              onPressed: () {
                SHNewDeviceScreen().launch(context);
              },
              icon: Icon(Icons.add, color: white)),
        ],
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: List.generate(devicesList.length, (index) {
              SHDeviceModel data = devicesList[index];
              bool isSelcetdIndex = selectedIndex == index;
              return Container(
                height: 120,
                width: context.width() * 0.27,
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  backgroundColor:
                      isSelcetdIndex ? context.cardColor : SHContainerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      data.deviceImg.validate(),
                      fit: BoxFit.cover,
                      height: 30,
                      width: 30,
                      color: isSelcetdIndex ? black : white,
                    ),
                    8.height,
                    Text(data.deviceTitle.validate(),
                        style: boldTextStyle(
                            color: isSelcetdIndex ? null : white)),
                    4.height,
                    Text(data.deviceSubTitle.validate(),
                        style: secondaryTextStyle(color: gray)),
                  ],
                ),
              ).onTap(() {
                selectedIndex = index;
                setState(() {});
              }, borderRadius: radius(24));
            }),
          ).paddingAll(16),
        ],
      ),
    );
  }
}
