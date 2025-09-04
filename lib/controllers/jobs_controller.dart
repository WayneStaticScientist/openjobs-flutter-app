import 'package:get/get.dart';
import 'package:openjobs/models/job_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JobsController extends GetxController {
  final page = 0.obs;
  final jobs = <JobModel>[].obs;
  final pageSize = 10.obs;
  final loading = true.obs;
  final error = "".obs;
  Future<void> findJobs({bool reset = false}) async {
    final instance = Supabase.instance.client;
    try {
      final int from = page.value * pageSize.value;
      final int to = from + pageSize.value - 1;
      final list = await instance
          .from("jobs")
          .select("*")
          .order('created_at', ascending: false)
          .range(from, to);
      if (reset) jobs.clear();
      jobs.addAll(list.map((e) => JobModel.fromMap(e)));
      loading.value = false;
    } catch (e) {
      error.value = "$e";
      rethrow;
    }
  }
}
