import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/screens/upload_job.dart';
import 'package:openjobs/widgets/layouts/item_card.dart';

class UploadNav extends StatefulWidget {
  const UploadNav({super.key});

  @override
  State<UploadNav> createState() => _UploadNavState();
}

class _UploadNavState extends State<UploadNav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: AppBar(
              title: Text(
                "OpenJOBS",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(LineAwesomeIcons.bars_solid),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ItemCard(
                  onTap: () => Get.to(() => const UploadJobScreen()),
                  title: 'Upload Job',
                  icon: LineAwesomeIcons.plus_solid,
                ),
              ),
              Expanded(
                child: ItemCard(
                  title: 'Job Find',
                  icon: LineAwesomeIcons.search_solid,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
