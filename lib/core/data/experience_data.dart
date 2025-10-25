import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/res/media_res.dart';
import 'package:mohammad_portfolio/src/experience/domain/enities/experience.dart';

class ExperienceData {
  static List<Experience> getData({required BuildContext context}) {
    final data = [
      Experience(
        companyName: 'MiraSoft',
        companyLogo: MediaRes.mirasoftLogo,
        jobTitle: 'Mid-Level Mobile Developer',
        skillsLearned: const [
          'Custom UI/UX: Designed a complete, responsive UI with custom widgets and animations tailored to real estate management.',
        ],
        startDate: DateTime(2023, 2),
      ),
      Experience(
        companyName: 'MiraSoft',
        companyLogo: MediaRes.mirasoftLogo,
        jobTitle: 'Junior Flutter Developer',
        skillsLearned: const [
          '''
              Custom UI/UX: Designed a complete, responsive UI with custom widgets
              and animations tailored to real estate management.''',
          '''
              State Management with Cubit: Managed complex state, enabling real-time
              updates and decreasing memory usage by 30%, improving stability.''',
          '''
              JWT Authentication with Encrypted Data: Secured user authentication with
              JWT tokens and encrypted data for safe server-client communication.''',
          '''
              Advanced Filtering: Built multi-criteria filters (location, price, type,
              amenities) to refine search results and improve user experience.''',
          '''
              Efficient Pagination: Implemented pagination, reducing page load time by
              2 seconds, and boosting app speed by 20%.''',
          '''
              Responsive Design: Ensured consistent experiences across devices with
              adaptive layouts for mobile and tablet.''',
          '''
              Multi-language Support: Integrated localization to support multiple
              languages and broaden user accessibility.''',
        ],
        startDate: DateTime(2023, 2),
        endDate: DateTime(2024, 6),
      ),
      Experience(
        companyName: 'Cloud Data Solutions',
        companyLogo: MediaRes.cloudDataSolutionsLogo,
        jobTitle: 'Trainee Flutter Developer',
        skillsLearned: const [
          '''
          During this period, I worked on several applications and gained various skills, 
          including how to collaborate with a team, complete tasks correctly, and troubleshoot 
          errors. I was able to enhance my app development skills using the Dart language and 
          the Flutter framework.''',
        ],
        startDate: DateTime(2022, 11),
        endDate: DateTime(2023, 2),
      ),
    ];
    return data;
  }
}
