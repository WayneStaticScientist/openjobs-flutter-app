import 'package:openjobs/models/job_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplyHelpers {
  Future<void> applyJob(JobModel job) async {
    if (job.applicationType.toLowerCase().trim() == "email") {
      await _applyViaEmail(job);
      return;
    }
    if (job.applicationType.toLowerCase().trim() == "phone") {
      await _launchWhatsApp(
        phoneNumber: job.applicationData,
        message: "Application for ${job.title} - ${job.jobType}",
      );
      return;
    }
  }

  // Future<void> _launchPhoneDialer(String phoneNumber) async {
  //   final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
  //   await launchUrl(launchUri);
  // }

  Future<void> _launchWhatsApp({
    required String phoneNumber,
    required String message,
  }) async {
    final Uri uri = Uri.parse(
      'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}',
    );

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch WhatsApp';
    }
  }

  Future<void> _applyViaEmail(JobModel job) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: job.applicationData,
      query: encodeQueryParameters(<String, String>{
        'subject': "Application for ${job.jobType} for ${job.title}",
        'body': 'Your letter',
      }),
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch $emailLaunchUri');
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}
