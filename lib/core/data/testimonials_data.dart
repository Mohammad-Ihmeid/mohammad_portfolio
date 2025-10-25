import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/src/testimonials/domain/enities/testimonials.dart';

class TestimonialsData {
  static List<Testimonials> getData({required BuildContext context}) {
    final data = [
      const Testimonials(
        customerName: 'John Doe',
        customerJob: 'Founder - xyz.com',
        feedBack:
            '“Job well done! I am really impressed. '
            'He is very very good at what he does:) I '
            'would recommend Sagar and will rehire in '
            'the future for Frontend development.”',
      ),
      const Testimonials(
        customerName: 'John Doe',
        customerJob: 'Founder - abc.com',
        feedBack:
            '“Great guy, highly recommended for any COMPLEX front-end '
            'development job! His skills are top-notch and he will be '
            'an amazing addition to any team.”',
      ),
      const Testimonials(
        customerName: 'John Doe',
        customerJob: 'Freelancer',
        feedBack:
            '“Sagar was extremely easy and pleasant to work with and he truly '
            'cares about the project being a success. Sagar has a high level '
            'of knowledge and was able to work on my MERN stack application '
            'without any issues.”',
      ),
    ];
    return data;
  }
}
