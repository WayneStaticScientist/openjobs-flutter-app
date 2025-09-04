import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/widgets/input/opx_material_input.dart';
import 'package:openjobs/widgets/layouts/settings_tile.dart';
import 'package:openjobs/widgets/texts/strong_text.dart';

class UploadJobScreen extends StatefulWidget {
  const UploadJobScreen({super.key});

  @override
  State<UploadJobScreen> createState() => _UploadJobScreenState();
}

class _UploadJobScreenState extends State<UploadJobScreen> {
  final _dueDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Job Posting")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SettingsCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StrongText("Job Details"),
                  SizedBox(height: 14),
                  Text("Job Title"),
                  OpenXInput(
                    leadingIcon: Icon(LineAwesomeIcons.text_height_solid),
                    hint: "Enter Job Title",
                  ),
                  SizedBox(height: 18),
                  Text("Experience Level"),
                  OpenXInput(
                    leadingIcon: Icon(LineAwesomeIcons.school_solid),
                    hint: "Experience Level",
                  ),
                  SizedBox(height: 14),
                  Text("Due Date"),
                  InkWell(
                    onTap: _pickDate,
                    child: OpenXInput(
                      controller: _dueDateController,
                      enabled: false,
                      leadingIcon: Icon(LineAwesomeIcons.calendar),
                      hint: "Due Date",
                    ),
                  ),
                  SizedBox(height: 14),
                  Text("Preffered Locations(Separate by Commas)"),
                  InkWell(
                    onTap: _pickDate,
                    child: OpenXInput(
                      leadingIcon: Icon(LineAwesomeIcons.location_arrow_solid),
                      hint: "Preffered Locations",
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate == null) return;
    if (mounted) {
      setState(() {
        _dueDateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }
}
