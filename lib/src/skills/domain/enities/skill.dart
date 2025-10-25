import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  const Skill({required this.name, required this.assetSvg});

  final String name;
  final String assetSvg;

  @override
  List<Object> get props => [name, assetSvg];
}
