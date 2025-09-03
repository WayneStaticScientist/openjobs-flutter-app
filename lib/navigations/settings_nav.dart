import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/widgets/layouts/normal_tile.dart';
import 'package:openjobs/widgets/layouts/settings_tile.dart';
import 'package:openjobs/widgets/texts/strong_text.dart';

class SettingsNav extends StatefulWidget {
  const SettingsNav({super.key});

  @override
  State<SettingsNav> createState() => _SettingsNavState();
}

class _SettingsNavState extends State<SettingsNav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: ListView(
        children: [
          StrongText("Settings"),
          const SizedBox(height: 12),
          SettingsCard(
            child: Column(
              children: [
                NormalTile(title: "User", iconData: LineAwesomeIcons.user),
              ],
            ),
          ),

          const SizedBox(height: 12),
          StrongText("Account"),
          const SizedBox(height: 12),
          SettingsCard(
            child: Column(
              children: [
                NormalTile(title: "Profile", iconData: LineAwesomeIcons.image),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                NormalTile(
                  title: "Change Password",
                  iconData: LineAwesomeIcons.lock_open_solid,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                NormalTile(
                  title: "Logout",
                  iconData: LineAwesomeIcons.times_circle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          StrongText("About"),
          const SizedBox(height: 12),
          SettingsCard(
            child: Column(
              children: [
                NormalTile(
                  title: "About App",
                  iconData: LineAwesomeIcons.info_circle_solid,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                NormalTile(
                  title: "Check for Update",
                  iconData: LineAwesomeIcons.cloud_upload_alt_solid,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                NormalTile(
                  title: "About Developer",
                  iconData: LineAwesomeIcons.code_solid,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
