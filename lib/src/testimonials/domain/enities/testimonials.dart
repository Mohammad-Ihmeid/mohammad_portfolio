import 'package:equatable/equatable.dart';

class Testimonials extends Equatable {
  const Testimonials({
    required this.customerName,
    required this.customerJob,
    required this.feedBack,
  });

  final String customerName;
  final String customerJob;
  final String feedBack;

  @override
  List<Object?> get props => [customerName, customerJob, feedBack];
}
