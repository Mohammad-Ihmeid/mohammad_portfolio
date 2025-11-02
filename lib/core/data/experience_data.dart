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
        skillsLearned: const [],
        description:
            'Developing advanced production-level mobile apps with a '
            'strong focus on clean architecture, responsive UI, real-time '
            'communication, and high-quality animations. Contributing to '
            'feature development, performance optimization, code reviews, '
            'and mentoring junior developers.',
        startDate: DateTime(2023, 2),
      ),
      Experience(
        companyName: 'MiraSoft',
        companyLogo: MediaRes.mirasoftLogo,
        jobTitle: 'Junior Flutter Developer',
        skillsLearned: const [],
        description:
            'Developed and enhanced Flutter applications, including '
            'building complete apps from scratch independently. '
            'Handled full development lifecycle, implemented new '
            'features, fixed bugs, optimized performance, and integrated '
            'REST APIs.',
        startDate: DateTime(2023, 2),
        endDate: DateTime(2024, 6),
      ),
      Experience(
        companyName: 'Cloud Data Solutions',
        companyLogo: MediaRes.cloudDataSolutionsLogo,
        jobTitle: 'Flutter Developer Intern',
        skillsLearned: const [],
        description:
            'Worked closely with senior developer to build and optimize '
            'Flutter applications, contributed to UI development, feature '
            'implementation, bug fixing, and participated in code '
            'reviews and Agile workflows.',
        startDate: DateTime(2022, 11),
        endDate: DateTime(2023, 2),
      ),
    ];
    return data;
  }
}
