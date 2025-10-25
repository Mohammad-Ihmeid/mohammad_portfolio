import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/src/skills/domain/enities/skill.dart';

class SkillTile extends StatelessWidget {
  const SkillTile({required this.skill, super.key});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 56,
          width: 56,
          child: SvgPicture.asset(skill.assetSvg, semanticsLabel: skill.name),
        ),
        const SizedBox(height: 10),
        Text(
          skill.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
