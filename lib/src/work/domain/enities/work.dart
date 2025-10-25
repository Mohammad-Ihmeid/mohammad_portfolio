import 'package:equatable/equatable.dart';

class Work extends Equatable {
  const Work({
    required this.image,
    required this.name,
    required this.description,
    required this.skills,
    required this.projectURL,
  });

  final String image;
  final String name;
  final String description;
  final List<String> skills;
  final String projectURL;

  @override
  List<Object> get props => [image, name, description, skills, projectURL];
}
