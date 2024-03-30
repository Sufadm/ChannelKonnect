import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/pages/retailers_page.dart/widget/bottom_sheet.dart';
import 'package:nowapps/viewmodel/location_model.dart';

class RetailersPage extends StatelessWidget {
  const RetailersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = Get.put(LocationModel());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          "Check-In Page",
          style: GoogleFonts.lato(color: white),
        ),
      ),
      body: Column(
        children: [
          kHeight25,
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () {
                    bottomSheets(context, currentLocation);
                  },
                  title: Text(
                    "Zara",
                    style: GoogleFonts.lato(),
                  ),
                  subtitle: Text(
                    "Clothing",
                    style: GoogleFonts.lato(),
                  ),
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/id/518174626/photo/zara.jpg?s=612x612&w=0&k=20&c=l99gcgIcBazj69YH_k3p8X-SostbsO48eFZfUbYyZrg="),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
