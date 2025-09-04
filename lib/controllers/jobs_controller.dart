import 'package:get/get.dart';
import 'package:openjobs/models/job_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JobsController extends GetxController {
  Rx<int> page = Rx(0);
  Rx<List<JobModel>> jobs = Rx<List<JobModel>>([]);
  Rx<int> pageSize = Rx<int>(10);
  Rx<bool> loading = Rx<bool>(true);
  Rx<String> error = Rx<String>("");
  Future<void> findJobs({bool reset = false}) async {
    final instance = Supabase.instance.client;
    try {
      final int from = page.value * pageSize.value;
      final int to = from + pageSize.value - 1;
      final list =
          instance
                  .from("jobs")
                  .select("*")
                  .order('created_at', ascending: false)
                  .range(from, to)
              as List<Map<String, dynamic>>;
      if (reset) jobs.value.clear();
      jobs.value.addAll(list.map((e) => JobModel.fromMap(e)));
    } catch (e) {
      rethrow;
    }
  }
}
