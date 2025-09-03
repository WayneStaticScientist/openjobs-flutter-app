import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/models/job_model.dart';
import 'package:openjobs/widgets/input/opx_search_filter.dart';
import 'package:openjobs/widgets/layouts/job_card.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "OpenJobs",
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
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          sliver: SliverList.builder(
            itemBuilder: (context, index) {
              return JobCard(model: jobList[index]);
            },
            itemCount: jobList.length,
          ),
        ),
      ],
    );
  }
}
