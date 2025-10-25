import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/res/media_res.dart';
import 'package:mohammad_portfolio/src/work/domain/enities/work.dart';

class WorkData {
  static List<Work> getData({required BuildContext context}) {
    final data = [
      const Work(
        image: MediaRes.projectTest,
        name: 'Fiskil',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Maecenas nec urna ac tellus volutpat viverra. Vestibulum ante '
            'ipsum primis in faucibus orci luctus et ultrices posuere '
            'cubilia curae.',
        skills: [
          'React',
          'Next.js',
          'Typescript',
          'Nest.js',
          'PostgreSQL',
          'Tailwindcss',
          'Figma',
          'Cypress',
          'Storybook',
          'Git',
        ],
        projectURL:
            'https://github.com/Mohammad-Ihmeid/hr_app/tree/main/lib/src/auth',
      ),
      const Work(
        image: MediaRes.projectTest,
        name: 'Fiskil',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Maecenas nec urna ac tellus volutpat viverra. Vestibulum ante '
            'ipsum primis in faucibus orci luctus et ultrices posuere '
            'cubilia curae.',
        skills: [
          'React',
          'Next.js',
          'Typescript',
          'Nest.js',
          'PostgreSQL',
          'Tailwindcss',
          'Figma',
          'Cypress',
          'Storybook',
          'Git',
        ],
        projectURL:
            'https://github.com/Mohammad-Ihmeid/hr_app/tree/main/lib/src/auth',
      ),
      const Work(
        image: MediaRes.projectTest,
        name: 'Fiskil',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Maecenas nec urna ac tellus volutpat viverra. Vestibulum ante '
            'ipsum primis in faucibus orci luctus et ultrices posuere '
            'cubilia curae.',
        skills: [
          'React',
          'Next.js',
          'Typescript',
          'Nest.js',
          'PostgreSQL',
          'Tailwindcss',
          'Figma',
          'Cypress',
          'Storybook',
          'Git',
        ],
        projectURL:
            'https://github.com/Mohammad-Ihmeid/hr_app/tree/main/lib/src/auth',
      ),
    ];
    return data;
  }
}
