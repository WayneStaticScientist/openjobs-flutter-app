import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openjobs/utils/helpers.dart';
import 'package:openjobs/models/job_model.dart';
import 'package:openjobs/screens/job_view.dart';
import 'package:openjobs/utils/color_util.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class JobCard extends StatelessWidget {
  final JobModel model;
  const JobCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.grey.withAlpha(26),
        child: InkWell(
          onTap: () => Get.to(() => JobView(job: model)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 40, child: _getAvatar(model.title)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: ListTile(
                                    title: Text(
                                      model.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${model.jobCategory} , ${model.jobType}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    LineAwesomeIcons.bookmark_solid,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              model.description,
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis for better overflow handling
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LineAwesomeIcons.location_arrow_solid,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(model.location ?? "No Location"),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _applyJob,
                      child: const Text('APPLY'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getAvatar(String title) {
    return CircleAvatar(
      backgroundColor: ColorUtil.getMedianColor(title),
      child: Text(title[0], style: TextStyle(color: Colors.white)),
    );
  }

  Future<void> _applyJob() async {
    final helpers = ApplyHelpers();
    await helpers.applyJob(model);
  }
}
