import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/utils/enums.dart';
import 'package:mohammad_portfolio/src/skills/domain/enities/skill.dart';
import 'package:mohammad_portfolio/src/skills/presentation/widgets/skill_tile.dart';

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({required this.skills, super.key});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        final cross =
            w >= 1200
                ? 8
                : w >= 900
                ? 7
                : w >= 700
                ? 6
                : w >= 520
                ? 5
                : 4;
        final tileW = w / cross;
        const tileH = 120.0; // tune to match your design
        final aspect = tileW / tileH;

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cross,
            crossAxisSpacing: 24,
            mainAxisSpacing:
                context.deviceLayout == DeviceSize.desktop
                    ? 48
                    : context.deviceLayout == DeviceSize.tablet
                    ? 32
                    : 16,
            childAspectRatio: aspect,
          ),
          itemCount: skills.length,
          itemBuilder: (_, i) => SkillTile(skill: skills[i]),
        );
      },
    );
  }
}
