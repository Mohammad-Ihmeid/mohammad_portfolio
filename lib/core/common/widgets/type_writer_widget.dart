import 'dart:async';
import 'package:flutter/material.dart';

/// TypewriterWidget
/// - texts: قائمة النصوص التي تريد كتابتها بالترتيب
/// - typingSpeed: مدة تأخير كل حرف أثناء الكتابة
/// - deletingSpeed: مدة تأخير كل حرف أثناء المسح
/// - pauseDuration: الوقت الانتظاري عند اكتمال الكتابة قبل البداية بالمسح
/// - loop: إن أردت تكرار اللوب للأبد
/// - cursor: حرف المؤشر (مثل '|' أو '')
/// - cursorBlinkDuration: مدة وميض المؤشر

class TypewriterWidget extends StatefulWidget {
  const TypewriterWidget({
    required this.texts,
    this.textStyle,
    this.typingSpeed = const Duration(milliseconds: 80),
    this.deletingSpeed = const Duration(milliseconds: 50),
    this.pauseDuration = const Duration(milliseconds: 1200),
    this.loop = true,
    this.cursor = '|',
    this.cursorBlinkDuration = const Duration(milliseconds: 500),
    this.startImmediately = true,
    super.key,
  }) : assert(texts.length > 0, 'Error');

  final List<String> texts;
  final TextStyle? textStyle;
  final Duration typingSpeed;
  final Duration deletingSpeed;
  final Duration pauseDuration;
  final bool loop;
  final String cursor;
  final Duration cursorBlinkDuration;
  final bool startImmediately;

  @override
  State<TypewriterWidget> createState() => _TypewriterWidgetState();
}

class _TypewriterWidgetState extends State<TypewriterWidget> {
  Timer? _typingTimer;
  Timer? _cursorTimer;
  int _textIndex = 0; // أي نص من texts
  int _charIndex = 0; // موضع الحرف الحالي داخل النص
  //bool _isTyping = true; // true => نكتب، false => نمسح
  bool _showCursor = true;

  String get _currentFullText => widget.texts[_textIndex];

  @override
  void initState() {
    super.initState();
    if (widget.startImmediately) {
      _startCursorBlink();
      _startTyping();
    }
  }

  @override
  void didUpdateWidget(covariant TypewriterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // لو تغيرت القائمة أو النص في الـ parent، أعد الضبط بشكل آمن
    if (oldWidget.texts != widget.texts) {
      _resetState();
      if (widget.startImmediately) {
        _startTyping();
        _startCursorBlink();
      }
    }
  }

  void _resetState() {
    _cancelTimers();
    _textIndex = 0;
    _charIndex = 0;
    //_isTyping = true;
    _showCursor = true;
  }

  void _startCursorBlink() {
    _cursorTimer?.cancel();
    _cursorTimer = Timer.periodic(widget.cursorBlinkDuration, (_) {
      if (!mounted) return;
      setState(() => _showCursor = !_showCursor);
    });
  }

  void _startTyping() {
    _typingTimer?.cancel();

    //_isTyping = true;
    _typingTimer = Timer.periodic(widget.typingSpeed, (t) {
      if (!mounted) {
        t.cancel();
        return;
      }

      if (_charIndex < _currentFullText.length) {
        setState(() => _charIndex++);
      } else {
        // وصلنا للنهاية
        t.cancel();
        Future.delayed(widget.pauseDuration, () {
          if (!mounted) return;
          _startDeleting();
        });
      }
    });
  }

  void _startDeleting() {
    _typingTimer?.cancel();
    //_isTyping = false;
    _typingTimer = Timer.periodic(widget.deletingSpeed, (t) {
      if (!mounted) {
        t.cancel();
        return;
      }

      if (_charIndex > 0) {
        setState(() => _charIndex--);
      } else {
        // انتهى المسح: ننتقل للنص التالي أو نتوقف
        t.cancel();
        _textIndex = (_textIndex + 1) % widget.texts.length;

        if (!widget.loop && _textIndex == 0) {
          // لو لا نريد تكرار، نهايته هنا ونوقف الوميض أيضاً
          _cancelCursorTimer();
          return;
        }

        // نبدأ كتابة النص التالي بعد توقف بسيط
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!mounted) return;
          _startTyping();
        });
      }
    });
  }

  void _cancelTimers() {
    _typingTimer?.cancel();
    _typingTimer = null;
    _cursorTimer?.cancel();
    _cursorTimer = null;
  }

  void _cancelCursorTimer() {
    _cursorTimer?.cancel();
    _cursorTimer = null;
    if (mounted) setState(() => _showCursor = false);
  }

  @override
  void dispose() {
    _cancelTimers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visible = _currentFullText.substring(0, _charIndex);
    final cursor =
        widget.cursor.isEmpty ? '' : (_showCursor ? widget.cursor : ' ');
    return Text(
      '$visible$cursor',
      textAlign: TextAlign.center,
      style: widget.textStyle ?? DefaultTextStyle.of(context).style,
    );
  }
}
