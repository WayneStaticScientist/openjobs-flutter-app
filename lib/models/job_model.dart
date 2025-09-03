class JobModel {
  final int level;
  final String? date;
  final String title;
  final String? dueDate;
  final String? location;
  final String experience;
  final String description;
  final String applicationType;
  final String applicationForm;

  JobModel({
    this.date,
    this.dueDate,
    this.location,
    required this.level,
    required this.title,
    required this.experience,
    required this.description,
    required this.applicationType,
    required this.applicationForm,
  });
}

List<JobModel> jobList = [
  JobModel(
    level: 1,
    title: "Software Engineer",
    experience: "3+ years",
    description: "We are looking for a software engineer to join our team.",
    applicationType: "email",
    applicationForm: "hr@example.com",
  ),
  JobModel(
    level: 2,
    title: "Data Scientist",
    experience: "5+ years",
    description: "We are looking for a data scientist to join our team.",
    applicationType: "form",
    applicationForm: "https://example.com/form",
  ),
  JobModel(
    level: 3,
    title: "Product Manager",
    experience: "7+ years",
    description: "We are looking for a product manager to join our team.",
    applicationType: "linkedin",
    applicationForm: "https://linkedin.com/jobs/12345",
  ),
  JobModel(
    level: 1,
    title: "Frontend Developer",
    experience: "2+ years",
    description:
        "We need a skilled frontend developer to build user interfaces.",
    applicationType: "email",
    applicationForm: "jobs@company.com",
  ),
  JobModel(
    level: 2,
    title: "Backend Developer",
    experience: "4+ years",
    description: "Seeking a backend developer to work on server-side logic.",
    applicationType: "form",
    applicationForm: "https://company.com/careers",
  ),
];
