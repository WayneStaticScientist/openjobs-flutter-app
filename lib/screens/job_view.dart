import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openjobs/models/job_model.dart';
import 'package:openjobs/utils/helpers.dart';
import 'package:openjobs/utils/themer_util.dart';
import 'package:openjobs/widgets/texts/bold_text.dart';
import 'package:openjobs/widgets/texts/strong_text.dart';
import 'package:openjobs/widgets/layouts/decorated_chips.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/widgets/buttons/opx_material_button.dart';

class JobView extends StatefulWidget {
  final JobModel job;
  const JobView({super.key, required this.job});

  @override
  State<JobView> createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.job.title), centerTitle: true),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StrongText(widget.job.title),
                    SizedBox(height: 20),
                    Wrap(
                      children: [
                        OpxChip(
                          title: widget.job.location ?? "Unknown",
                          icon: LineAwesomeIcons.location_arrow_solid,
                        ),
                        SizedBox(width: 16),
                        OpxChip(
                          title: widget.job.jobType,
                          icon: LineAwesomeIcons.wallet_solid,
                        ),
                        SizedBox(width: 16),
                        OpxChip(
                          title: widget.job.jobCategory,
                          icon: LineAwesomeIcons.code_branch_solid,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.job.description,
                      style: TextStyle(
                        fontSize: 18,
                        color: ThemerUtil.getPaint(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(LineAwesomeIcons.hand_holding_solid),
                      title: BoldText("Experience"),
                      subtitle: Text((widget.job.experienceLevel)),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(LineAwesomeIcons.calendar),
                      title: BoldText("Company Name"),
                      subtitle: Text(
                        (widget.job.company == null ||
                                widget.job.company!.trim().isEmpty)
                            ? "No company name"
                            : widget.job.company!,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(LineAwesomeIcons.calendar),
                      title: BoldText("Valid Until"),
                      subtitle: Text(
                        (widget.job.dueDate == null ||
                                widget.job.dueDate!.trim().isEmpty)
                            ? "No due date"
                            : widget.job.dueDate!,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(LineAwesomeIcons.calendar),
                      title: BoldText("Preffered Locations"),
                      subtitle: Text(
                        (widget.job.prefferedLocation == null ||
                                widget.job.prefferedLocation!.trim().isEmpty)
                            ? "No Preffered Location"
                            : widget.job.prefferedLocation!,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(LineAwesomeIcons.money_bill_solid),
                      title: BoldText("Salary"),
                      subtitle: Text(
                        (widget.job.expectedSalary?.toString()) ??
                            "Not mentioned",
                      ),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Get.theme.colorScheme.primary),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  child: OpxMaterialButton(
                    loading: _loading,
                    text: "Apply",
                    onPressed: _applyJob,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _applyJob() async {
    setState(() {
      _loading = true;
    });
    final helpers = ApplyHelpers();
    await helpers.applyJob(widget.job);
    await Future.delayed(Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }
}
