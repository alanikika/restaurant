import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_alan/common/custom_colors.dart';
import 'package:restaurant_alan/common/dimens.dart';
import 'package:restaurant_alan/common/styles.dart';
import 'package:restaurant_alan/widget/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Restaurant",
        backFlag: false,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimens.standard_16,
                  vertical: Dimens.standard_8,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.accentDangerFF3860,
                  borderRadius: BorderRadius.circular(
                    Dimens.standard_4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60.0,
                          width: 60.0,
                          color: CustomColors.colorA1AAAB,
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Nama Restorant",
                                style: Style.ibmPleXSansBold.copyWith(
                                  color: CustomColors.colorOrangeF7931D,
                                  letterSpacing: .25,
                                  fontSize: Dimens.standard_16,
                                ),
                              ),
                              SizedBox(
                                height: Dimens.standard_8,
                              ),
                              RatingBarIndicator(
                                rating: 2.75,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text("asd"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
