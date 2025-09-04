import 'package:supabase_flutter/supabase_flutter.dart';

class JobsServices {
  Future<void> uploadOne({
    required String dueDate,
    required String jobType,
    required String jobCategory,
    required String applicationType,
    required String title,
    required String experienceLevel,
    required String prefferedLocation,
    required String description,
    required String location,
    required double expectedSalary,
    required String applicationData,
  }) async {
    try {
      final client = Supabase.instance.client;
      await client.from("jobs").insert({
        "title": title,
        "dueDate": dueDate,
        "jobType": jobType,
        "location": location,
        "description": description,
        "jobCategory": jobCategory,
        "expectedSalary": expectedSalary,
        "applicationType": applicationType,
        "applicationData": applicationData,
        "experienceLevel": experienceLevel,
        "prefferedLocation": prefferedLocation,
      });
    } catch (e) {
      rethrow;
    }
  }
}
