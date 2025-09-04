class JobModel {
  final String? date;
  final String title;
  final String? dueDate;
  final String jobType;
  final String? location;
  final String description;
  final String jobCategory;
  final int? expectedSalary;
  final String experienceLevel;
  final String applicationData;
  final String applicationType;
  final String? prefferedLocation;

  JobModel({
    this.date,
    this.dueDate,
    this.location,
    this.expectedSalary,
    required this.title,
    this.prefferedLocation,
    required this.jobType,
    required this.jobCategory,
    required this.description,
    required this.applicationData,
    required this.experienceLevel,
    required this.applicationType,
  });
  factory JobModel.fromMap(Map<String, dynamic> data) {
    return JobModel(
      title: data["title"],
      dueDate: data["dueDate"],
      jobType: data["jobType"],
      location: data["location"],
      description: data['description'],
      jobCategory: data['jobCategory'],
      expectedSalary: data['expectedSalary'],
      applicationType: data['applicationType'],
      applicationData: data['applicationData'],
      experienceLevel: data['experienceLevel'],
      prefferedLocation: data['prefferedLocation'],
    );
  }
}

List<JobModel> dummyJobs = [
  JobModel(
    title: 'Software Engineer',
    jobType: 'Full-time',
    jobCategory: 'Technology',
    description: 'Develop and maintain software applications.',
    applicationData: 'Apply through our website.',
    experienceLevel: 'Mid-level',
    applicationType: 'Online',
    dueDate: '2024-03-15',
    location: 'San Francisco, CA',
    expectedSalary: 120000,
  ),
  JobModel(
    title: 'Marketing Manager',
    jobType: 'Full-time',
    jobCategory: 'Marketing',
    description: 'Lead marketing campaigns and manage the marketing team.',
    applicationData: 'Send your resume to hr@example.com',
    experienceLevel: 'Senior',
    applicationType: 'Email',
    dueDate: '2024-03-22',
    location: 'New York, NY',
    expectedSalary: 150000,
  ),
  JobModel(
    title: 'Data Scientist',
    jobType: 'Contract',
    jobCategory: 'Data Science',
    description: 'Analyze data and build machine learning models.',
    applicationData: 'Apply on LinkedIn.',
    experienceLevel: 'Mid-level',
    applicationType: 'LinkedIn',
    dueDate: '2024-03-01',
    location: 'Remote',
    expectedSalary: 130000,
  ),
  JobModel(
    title: 'Sales Representative',
    jobType: 'Full-time',
    jobCategory: 'Sales',
    description: 'Generate leads and close sales deals.',
    applicationData: 'Call us at 555-123-4567.',
    experienceLevel: 'Entry-level',
    applicationType: 'Phone',
    dueDate: '2024-02-29',
    location: 'Chicago, IL',
    expectedSalary: 80000,
  ),
  JobModel(
    title: 'Project Manager',
    jobType: 'Full-time',
    jobCategory: 'Management',
    description: 'Oversee projects from start to finish.',
    applicationData: 'Submit your application via our portal.',
    experienceLevel: 'Mid-level',
    applicationType: 'Portal',
    dueDate: '2024-03-08',
    location: 'Austin, TX',
    expectedSalary: 110000,
  ),
];
