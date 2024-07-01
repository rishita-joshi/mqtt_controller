import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/SHColors.dart';
import '../utils/SHComman.dart';

class SHBrokerPage extends StatefulWidget {
  const SHBrokerPage({super.key});

  @override
  State<SHBrokerPage> createState() => _SHBrokerPageState();
}

class _SHBrokerPageState extends State<SHBrokerPage> {
  List<bool> _selections = List.generate(3, (_) => false);

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: SHContainerColor,
        title: Text(
          "Add Broker",
          style: boldTextStyle(color: Colors.white, size: 24),
        ),
      ),
      backgroundColor: SHContainerColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            26.height,
            AppTextField(
              textStyle: primaryTextStyle(color: white),
              cursorColor: white,
              textFieldType: TextFieldType.EMAIL,
              decoration:
                  buildSHInputDecoration('Broker Name', textColor: Colors.grey),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: white),
              cursorColor: white,
              textFieldType: TextFieldType.OTHER,
              decoration:
                  buildSHInputDecoration('Address', textColor: Colors.grey),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: white),
              cursorColor: white,
              textFieldType: TextFieldType.OTHER,
              decoration:
                  buildSHInputDecoration('Port', textColor: Colors.grey),
            ),
            16.height,
            AppTextField(
              textStyle: primaryTextStyle(color: white),
              cursorColor: white,
              textFieldType: TextFieldType.OTHER,
              decoration:
                  buildSHInputDecoration('Client Id', textColor: Colors.grey),
            ),
            16.height,
            CheckboxListTile(
                title: Text(
                  "Broker Protection",
                  style: primaryTextStyle(color: grey),
                ),
                value: isChecked,
                onChanged: (val) {}),
            16.height,
            ListTile(
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text(
                "Use SSL Connection",
                style: primaryTextStyle(color: grey),
              ),
              leading: Icon(
                Icons.bar_chart_outlined,
                color: Colors.grey,
              ),
            ),
            16.height,
            CheckboxListTile(
                title: Text(
                  "Do not connect at startUp",
                  style: primaryTextStyle(color: grey),
                ),
                value: isChecked,
                onChanged: (val) {}),
            16.height,
            CheckboxListTile(
                title: Text(
                  "Use Clean Connection",
                  style: primaryTextStyle(color: grey),
                ),
                value: isChecked,
                onChanged: (val) {}),
            16.height,
            Center(
              child: ToggleButtons(
                borderColor: grey,
                fillColor: Colors.white,
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];

                    if (index == 0 && _selections[index]) {
                    } else if (index == 0 && !_selections[index]) {}

                    if (index == 1 && _selections[index]) {
                    } else if (index == 1 && !_selections[index]) {}

                    if (index == 2 && _selections[index]) {
                    } else if (index == 2 && !_selections[index]) {}
                  });
                },
                isSelected: _selections,
                children: <Widget>[
                  Text(
                    "QOS 0",
                    style: primaryTextStyle(color: grey),
                  ).paddingAll(10),
                  Text(
                    "QOS 1",
                    style: primaryTextStyle(color: grey),
                  ).paddingAll(10),
                  Text(
                    "QOS 2",
                    style: primaryTextStyle(color: grey),
                  ).paddingAll(10),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
