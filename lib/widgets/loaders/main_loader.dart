import 'package:flutter/material.dart';
import 'package:openjobs/models/job_model.dart';
import 'package:openjobs/widgets/layouts/job_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: dummyJobs.length,
        itemBuilder: (context, index) {
          return JobCard(model: dummyJobs[index]);
        },
      ),
    );
  }
}
