import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/res/media_res.dart';
import 'package:mohammad_portfolio/src/skills/domain/enities/skill.dart';

class SkillsData {
  static List<Skill> getData({required BuildContext context}) {
    final data = [
      const Skill(name: 'Figma', assetSvg: MediaRes.figmaSvg),
      const Skill(name: 'Firebase', assetSvg: MediaRes.firebaseSvg),
      const Skill(name: 'AI', assetSvg: MediaRes.aiSvg),
      const Skill(name: 'C#', assetSvg: MediaRes.cSharpSvg),
      const Skill(name: 'Dart', assetSvg: MediaRes.dartSvg),
      const Skill(name: 'Flutter', assetSvg: MediaRes.flutterSvg),
      const Skill(name: 'Git', assetSvg: MediaRes.gitSvg),
      const Skill(name: 'SQL', assetSvg: MediaRes.sqlServerSvg),
      const Skill(name: 'Real Time', assetSvg: MediaRes.realtimeDatabaseSvg),
      const Skill(name: '.net', assetSvg: MediaRes.netFrameworkSvg),
    ];
    return data;
  }
}
