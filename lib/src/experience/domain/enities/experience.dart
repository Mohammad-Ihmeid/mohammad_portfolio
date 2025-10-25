import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  const Experience({
    required this.companyName,
    required this.companyLogo,
    required this.jobTitle,
    required this.skillsLearned,
    required this.startDate,
    this.endDate,
    this.description,
  });

  final String companyName;
  final String companyLogo;
  final String jobTitle;
  final List<String> skillsLearned;
  final DateTime startDate;
  final DateTime? endDate;
  final String? description;

  @override
  List<Object?> get props => [
    companyName,
    companyLogo,
    jobTitle,
    skillsLearned,
    startDate,
    endDate,
    description,
  ];

  /// احسب المدة بدقة (سنوات/أشهر) بين startDate و endDate (أو الآن إذا endDate == null).
  /// النتيجة ترجع خريطة تحتوي years و months و
  /// formatted (مثال: "2 سنة و 3 شهر").
  Map<String, dynamic> computeDuration({bool arabic = true}) {
    final end = endDate ?? DateTime.now().toUtc();

    // نعمل حساب الشهور بدقة:
    var years = end.year - startDate.year;
    var months = end.month - startDate.month;
    final days = end.day - startDate.day;

    // إذا الأيام سالبة نقص شهر واحد
    if (days < 0) {
      months -= 1;
    }

    // تصحيح الشهور و السنوات
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    // تهيئة النص عربي/إنجليزي
    String formatted;
    if (arabic) {
      final yearPart =
          years > 0 ? '$years ${years == 1 ? "سنة" : "سنوات"}' : '';
      final monthPart =
          months > 0 ? '$months ${months == 1 ? "شهر" : "أشهر"}' : '';
      if (yearPart.isNotEmpty && monthPart.isNotEmpty) {
        formatted = '$yearPart و $monthPart';
      } else if (yearPart.isNotEmpty) {
        formatted = yearPart;
      } else if (monthPart.isNotEmpty) {
        formatted = monthPart;
      } else {
        formatted = 'أقل من شهر';
      }
    } else {
      final yearPart =
          years > 0 ? '$years ${years == 1 ? "year" : "years"}' : '';
      final monthPart =
          months > 0 ? '$months ${months == 1 ? "month" : "months"}' : '';
      if (yearPart.isNotEmpty && monthPart.isNotEmpty) {
        formatted = '$yearPart and $monthPart';
      } else if (yearPart.isNotEmpty) {
        formatted = yearPart;
      } else if (monthPart.isNotEmpty) {
        formatted = monthPart;
      } else {
        formatted = 'Less than a month';
      }
    }

    return {'years': years, 'months': months, 'formatted': formatted};
  }

  /// فترة العرض كنص (مثال: "مارس 2021 — أغسطس 2024" أو "مارس 2021 — الآن")
  String periodText({bool arabic = true}) {
    // بسيط: نعرض شهر وسنة؛ للمزيد من الدقة استخدم intl DateFormat
    String monthYear(DateTime d) {
      final monthsEn = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      final monthsAr = [
        'يناير',
        'فبراير',
        'مارس',
        'أبريل',
        'مايو',
        'يونيو',
        'يوليو',
        'أغسطس',
        'سبتمبر',
        'أكتوبر',
        'نوفمبر',
        'ديسمبر',
      ];
      final m = arabic ? monthsAr[d.month - 1] : monthsEn[d.month - 1];
      return '$m ${d.year}';
    }

    final start = monthYear(startDate);
    final end =
        endDate != null ? monthYear(endDate!) : (arabic ? 'الآن' : 'Now');
    return '$start — $end';
  }
}
