import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/res/media_res.dart';
import 'package:mohammad_portfolio/src/work/domain/enities/work.dart';

class WorkData {
  static List<Work> getData({required BuildContext context}) {
    final data = [
      const Work(
        image: MediaRes.qrProject,
        name: 'Fatoorati JO',
        description:
            'In line with the Kingdom’s digital transformation vision, this '
            'application provides a seamless way to scan and validate '
            'Jordanian e-invoices. By simply scanning the QR code found on '
            'invoices, users can instantly extract key details such as the '
            'seller name, tax number, date, total amount, and tax value. '
            'The app also verifies the authenticity of invoice data and '
            'allows users to securely store and review their invoices anytime, '
            'ensuring transparency, convenience, and improved financial '
            'record-keeping.',
        skills: [
          'Flutter',
          'Dart',
          'Clean Code',
          'QR Scanner',
          'SQLite',
          'State Management',
          'Figma',
          'Git',
        ],
        projectURL:
            'https://github.com/Mohammad-Ihmeid/jordanian_invoices_app.git',
      ),
      const Work(
        image: MediaRes.montraProject,
        name: 'Montra',
        description:
            'This application helps users manage their income and expenses '
            'effortlessly. It allows you to track monthly earnings, record '
            'daily spending, and maintain a clear overview of your financial '
            'activity. With easy-to-read summaries and smart insights, the '
            'app supports better financial planning, helping you stay '
            'organized, achieve your savings goals, and make more informed '
            'money decisions.',
        skills: [
          'Flutter',
          'Dart',
          'Clean Code',
          'Localizations',
          'Real Time',
          'Firebase',
          'State Management',
          'Figma',
          'Git',
        ],
        projectURL: 'https://github.com/Mohammad-Ihmeid/montra_app.git',
      ),
      const Work(
        image: MediaRes.portfolioProject,
        name: 'Portfolio',
        description:
            'I designed and developed a personal portfolio application to '
            'showcase my projects, skills, and professional journey. The '
            'app provides a smooth and modern user experience, highlighting '
            'my work in a clean and interactive way. It is connected to a '
            'custom domain and integrates with Firebase to manage dynamic '
            'content and data securely. This portfolio reflects my creativity, '
            'attention to detail, and ability to build production-ready mobile '
            'applications using modern technologies.',
        skills: [
          'Flutter UI/UX Design',
          'Custom Widgets & Responsive Layout',
          'State Management',
          'Firebase Integration',
          'Domain Integration & Deployment',
          'Animation & Smooth Transitions',
          'Clean and Maintainable Code Structure',
          'Performance Optimization',
        ],
        projectURL: 'https://github.com/Mohammad-Ihmeid/mohammad_portfolio.git',
      ),
    ];
    return data;
  }
}
