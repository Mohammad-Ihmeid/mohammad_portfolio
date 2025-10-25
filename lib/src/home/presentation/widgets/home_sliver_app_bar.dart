// import 'package:flutter/material.dart';

// class HomeSliverAppBar extends StatelessWidget {
//   const HomeSliverAppBar({
//     required this.onTapContact,
//     required this.onTapDownloadCV,
//     required this.onToggleTheme,
//     required this.onToggleLocale,
//     super.key,
//     this.expandedHeight = 280,
//   });
//   final VoidCallback onTapContact;
//   final VoidCallback onTapDownloadCV;
//   final VoidCallback onToggleTheme;
//   final VoidCallback onToggleLocale;
//   final double expandedHeight;

//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context);
//     final textTheme = t.textTheme;
//     final isDark = t.brightness == Brightness.dark;

//     return SliverAppBar(
//       pinned: true,
//       floating: true,
//       snap: true,
//       expandedHeight: expandedHeight,
//       elevation: 0,
//       surfaceTintColor: Colors.transparent,
//       titleSpacing: 0,
//       leadingWidth: 56,
//       leading: Padding(
//         padding: const EdgeInsetsDirectional.only(start: 12),
//         child: CircleAvatar(
//           radius: 18,
//           child: Text('S', style: textTheme.titleMedium),
//         ),
//       ),
//       title: Text(
//         'Sira Team',
//         style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
//       ),
//       actions: [
//         IconButton(
//           tooltip: 'GitHub',
//           onPressed: () => _openExternal('https://github.com/sira'),
//           icon: const Icon(Icons.code),
//         ),
//         IconButton(
//           tooltip: 'LinkedIn',
//           onPressed: () => _openExternal('https://www.linkedin.com/in/sira'),
//           icon: const Icon(Icons.business_center),
//         ),
//         IconButton(
//           tooltip: isDark ? 'Light' : 'Dark',
//           onPressed: onToggleTheme,
//           icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
//         ),
//         IconButton(
//           tooltip: 'AR/EN',
//           onPressed: onToggleLocale,
//           icon: const Icon(Icons.translate),
//         ),
//         const SizedBox(width: 8),
//       ],
//       flexibleSpace: FlexibleSpaceBar(
//         background: _HeaderHero(
//           onTapContact: onTapContact,
//           onTapDownloadCV: onTapDownloadCV,
//         ),
//       ),
//     );
//   }

//   Future<void> _openExternal(String url) async {
//     // اتركها بسيطة — لاحقًا استبدلها بـ url_launcher
//     // أو مرّر callback من الخارج حسب أسلوبك.
//   }
// }

// class _HeaderHero extends StatelessWidget {
//   const _HeaderHero({
//     required this.onTapContact,
//     required this.onTapDownloadCV,
//   });
//   final VoidCallback onTapContact;
//   final VoidCallback onTapDownloadCV;

//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context);
//     final textTheme = t.textTheme;

//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: AlignmentDirectional.topStart,
//           end: AlignmentDirectional.bottomEnd,
//           colors: [
//             t.colorScheme.primary.withValues(alpha: 0.12),
//             t.colorScheme.secondary.withValues(alpha: 0.10),
//             Colors.transparent,
//           ],
//         ),
//       ),
//       padding: const EdgeInsetsDirectional.only(
//         start: 24,
//         end: 24,
//         top: 72,
//         bottom: 16,
//       ),
//       child: Align(
//         alignment: AlignmentDirectional.bottomStart,
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 1100),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Expanded(child: _Intro(textTheme: textTheme)),
//               // منطقة صورة/أفاتار اختيارية
//               const SizedBox(width: 24),
//               const _AvatarPlaceholder(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Intro extends StatelessWidget {
//   const _Intro({required this.textTheme});
//   final TextTheme textTheme;

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       runSpacing: 8,
//       children: [
//         Text(
//           'مرحباً، أنا',
//           style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
//         ),
//         Text(
//           'Sira Team',
//           style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
//         ),
//         Text(
//           'Senior Full-Stack Developer • Flutter • React • ASP.NET Core',
//           style: textTheme.titleMedium,
//         ),
//         const SizedBox(height: 12),
//         Wrap(
//           spacing: 12,
//           runSpacing: 8,
//           children: [
//             FilledButton.icon(
//               onPressed: () {}, //=> onTapDownloadCV(),
//               icon: const Icon(Icons.download),
//               label: const Text('Download CV'),
//             ),
//             OutlinedButton.icon(
//               onPressed: () {}, //=> onTapContact(),
//               icon: const Icon(Icons.mail),
//               label: const Text('Contact Me'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _AvatarPlaceholder extends StatelessWidget {
//   const _AvatarPlaceholder();

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (ctx, c) {
//         if (c.maxWidth < 760) return const SizedBox.shrink();
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Container(
//             width: 160,
//             height: 160,
//             color: Theme.of(
//               context,
//             ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
//             child: const Icon(Icons.person, size: 72),
//           ),
//         );
//       },
//     );
//   }
// }
