import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openjobs/services/auth/user_auth.dart';
import 'package:openjobs/widgets/layouts/job_card.dart';
import 'package:openjobs/widgets/loaders/main_loader.dart';
import 'package:openjobs/controllers/jobs_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/widgets/input/opx_search_filter.dart';

class HomeNav extends StatelessWidget {
  final _jobsController = JobsController();
  HomeNav({super.key});
  @override
  Widget build(BuildContext context) {
    final userAuth = UserAuth();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            userAuth.firstName ?? "OpenJobs",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.bell)),
            IconButton(
              onPressed: () {},
              icon: Icon(LineAwesomeIcons.comment_alt),
            ),
          ],
          floating: true,
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: OpxSearchFilter(
            hintText: "Search",
            suffix: IconButton(
              onPressed: () {},
              icon: Icon(LineAwesomeIcons.sliders_h_solid),
            ),
          ),
        ),
        Obx(
          () => _jobsController.loading.value
              ? SliverFillRemaining(child: MainLoader())
              : SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  sliver: SliverList.builder(
                    itemBuilder: (context, index) {
                      return JobCard(model: _jobsController.jobs.value[index]);
                    },
                    itemCount: _jobsController.jobs.value.length,
                  ),
                ),
        ),
      ],
    );
  }
}
