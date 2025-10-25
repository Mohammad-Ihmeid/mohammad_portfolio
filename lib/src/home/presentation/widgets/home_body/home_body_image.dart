import 'package:flutter/material.dart';
import 'package:mohammad_portfolio/core/extensions/context_extension.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_dark.dart';
import 'package:mohammad_portfolio/core/res/app_color/app_color_light.dart';

class LayeredProfilePhoto extends StatelessWidget {
  const LayeredProfilePhoto({
    required this.image,
    super.key,
    this.size = 220,
    this.radius = 0,
    this.borderWidth = 8,
    this.primaryBorderColor = Colors.white,
    this.backCardColor = const Color(0xFFE9EDF2),
    this.backCardOffset = const Offset(18, 18),
    this.secondBackCardOffset = const Offset(36, 36),
    this.shadowBlur = 14,
  });

  /// يمكن تمرير AssetImage أو NetworkImage
  final ImageProvider image;

  /// العرض/الارتفاع النهائي للمكوّن (مربع)
  final double size;

  /// نصف القطر للأركان الدائرية
  final double radius;

  /// سماكة الإطار الأبيض حول الصورة
  final double borderWidth;

  /// لون إطار الصورة
  final Color primaryBorderColor;

  /// لون البطاقات الخلفية
  final Color backCardColor;

  /// إزاحة البطاقة الخلفية الأولى (الأقرب للصورة)
  final Offset backCardOffset;

  /// إزاحة البطاقة الخلفية الثانية (الأبعد)
  final Offset secondBackCardOffset;

  /// شدّة الضلّ
  final double shadowBlur;

  @override
  Widget build(BuildContext context) {
    // المقاس الأساسي لكل البطاقات
    final cardSize = size;

    return SizedBox(
      width: cardSize + secondBackCardOffset.dx,
      height: cardSize + secondBackCardOffset.dy,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // البطاقة الخلفية الأبعد
          Positioned(
            left: secondBackCardOffset.dx,
            top: secondBackCardOffset.dy,
            child: _BackCard(
              size: cardSize,
              radius: radius,
              color:
                  context.isDark
                      ? AppColorsDark.gray200
                      : AppColorsLight.gray200,
              shadowBlur: shadowBlur * 0.6,
            ),
          ),

          // البطاقة الخلفية الأقرب
          Positioned(
            left: backCardOffset.dx,
            top: backCardOffset.dy,
            child: _BackCard(
              size: cardSize,
              radius: radius,
              color: backCardColor,
              shadowBlur: shadowBlur,
            ),
          ),

          // الصورة الرئيسية بإطار أبيض
          _FramedImage(
            image: image,
            size: cardSize,
            radius: radius,
            borderWidth: borderWidth,
            borderColor: primaryBorderColor,
            shadowBlur: shadowBlur,
          ),
        ],
      ),
    );
  }
}

class _BackCard extends StatelessWidget {
  const _BackCard({
    required this.size,
    required this.radius,
    required this.color,
    required this.shadowBlur,
  });

  final double size;
  final double radius;
  final Color color;
  final double shadowBlur;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 1.15, // قريب من نسبة الصورة في المثال
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: shadowBlur,
            offset: const Offset(0, 6),
          ),
        ],
      ),
    );
  }
}

class _FramedImage extends StatelessWidget {
  const _FramedImage({
    required this.image,
    required this.size,
    required this.radius,
    required this.borderWidth,
    required this.borderColor,
    required this.shadowBlur,
  });

  final ImageProvider image;
  final double size;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final double shadowBlur;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 1.20,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        color: borderColor, // الإطار الأبيض
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: shadowBlur,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius - 2),
        child: Image(
          image: image,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
