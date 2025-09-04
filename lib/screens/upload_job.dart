import 'package:flutter/material.dart';
import 'package:openjobs/utils/job_types.dart';
import 'package:openjobs/utils/toast_marker.dart';
import 'package:openjobs/widgets/buttons/opx_material_button.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/widgets/input/opx_material_input.dart';
import 'package:openjobs/widgets/texts/strong_text.dart';

class UploadJobScreen extends StatefulWidget {
  const UploadJobScreen({super.key});

  @override
  State<UploadJobScreen> createState() => _UploadJobScreenState();
}

class _UploadJobScreenState extends State<UploadJobScreen> {
  final _dueDateController = TextEditingController();
  final _jobTypeController = TextEditingController(text: JobTypes.jobList[0]);
  final _jobCategoryController = TextEditingController(
    text: JobTypes.jobCategories[0],
  );
  final _applicationTypeController = TextEditingController(
    text: JobTypes.applicationTypes[0],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Job Posting")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            StrongText("Job Details"),
            SizedBox(height: 14),
            Text("Job Title"),
            OpenXInput(
              leadingIcon: Icon(LineAwesomeIcons.text_height_solid),
              hint: "Enter Job Title",
            ),
            SizedBox(height: 14),
            Text("Job Type"),
            InkWell(
              onTap: _pickType,
              child: OpenXInput(
                suffix: Icon(LineAwesomeIcons.chevron_circle_down_solid),
                controller: _jobTypeController,
                enabled: false,
                leadingIcon: Icon(LineAwesomeIcons.opencart),
                hint: "Job Type",
              ),
            ),
            SizedBox(height: 14),
            Text("Job Category"),
            InkWell(
              onTap: _pickCategory,
              child: OpenXInput(
                suffix: Icon(LineAwesomeIcons.chevron_circle_down_solid),
                controller: _jobCategoryController,
                enabled: false,
                leadingIcon: Icon(LineAwesomeIcons.opencart),
                hint: "Job Category",
              ),
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
                suffix: Icon(LineAwesomeIcons.chevron_circle_down_solid),
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
            Text("Job Description"),
            OpenXInput(hint: "Job Description", minLines: 3, maxLines: 3),
            SizedBox(height: 14),
            Text("Job Locations(Separate by Commas)"),
            OpenXInput(
              leadingIcon: Icon(LineAwesomeIcons.location_arrow_solid),
              hint: "Job Location",
            ),
            SizedBox(height: 14),
            Text("Minimum Salary"),
            OpenXInput(
              keyboardType: TextInputType.number,
              leadingIcon: Icon(LineAwesomeIcons.money_bill_alt),
              hint: "Expected Salary",
            ),
            SizedBox(height: 14),
            Text("Application Type"),
            InkWell(
              onTap: _pickApplicationType,
              child: OpenXInput(
                suffix: Icon(LineAwesomeIcons.chevron_circle_down_solid),
                controller: _applicationTypeController,
                enabled: false,
                leadingIcon: Icon(LineAwesomeIcons.opencart),
                hint: "Application Type",
              ),
            ),
            SizedBox(height: 14),
            Text("Application ${_applicationTypeController.text} data"),
            InkWell(
              onTap: _pickApplicationType,
              child: OpenXInput(
                leadingIcon: Icon(LineAwesomeIcons.opencart),
                hint: _applicationTypeController.text,
              ),
            ),
            SizedBox(height: 14),
            OpxMaterialButton(text: "Upload Listing", onPressed: () {}),
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

  void _pickType() {
    final textController = TextEditingController(text: _jobTypeController.text);
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: JobTypes.jobList
                      .map(
                        (e) => ListTile(
                          title: Text(e),
                          leading: Icon(
                            LineAwesomeIcons.arrow_alt_circle_right,
                          ),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _jobTypeController.text = e;
                              });
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              OpenXInput(
                controller: textController,
                hint: "Enter Custom Job Type",
              ),
              SizedBox(height: 14),
              OpxMaterialButton(
                text: "choose",
                onPressed: () {
                  if (mounted) {
                    if (textController.text.trim().isEmpty) {
                      ToastMarker.error("The type cant be empty");
                    }
                    setState(() {
                      _jobTypeController.text = textController.text;
                    });
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickCategory() {
    final textController = TextEditingController(
      text: _jobCategoryController.text,
    );
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: JobTypes.jobCategories
                      .map(
                        (e) => ListTile(
                          title: Text(e),
                          leading: Icon(
                            LineAwesomeIcons.arrow_alt_circle_right,
                          ),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _jobCategoryController.text = e;
                              });
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              OpenXInput(
                controller: textController,
                hint: "Enter Custom Job Category",
              ),
              SizedBox(height: 14),
              OpxMaterialButton(
                text: "choose",
                onPressed: () {
                  if (mounted) {
                    if (textController.text.trim().isEmpty) {
                      ToastMarker.error("The category cant be empty");
                    }
                    setState(() {
                      _jobCategoryController.text = textController.text;
                    });
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickApplicationType() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: JobTypes.applicationTypes
                      .map(
                        (e) => ListTile(
                          title: Text(e),
                          leading: Icon(
                            LineAwesomeIcons.arrow_alt_circle_right,
                          ),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _applicationTypeController.text = e;
                              });
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
