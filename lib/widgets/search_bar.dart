// import 'package:flutter/material.dart';
// import 'package:tisser_application_test/core/constants/app_radius.dart';
// import 'package:tisser_application_test/themes/colors.dart';

// class AppSearchBar extends StatelessWidget {
//   const AppSearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       padding: const EdgeInsets.fromLTRB(16, 0, 6, 0),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(AppRadius.pill),
//         border: Border.all(color: AppColors.glassBorder),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.06),
//               blurRadius: 16,
//               offset: const Offset(0, 6)),
//         ],
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.search, size: 22, color: AppColors.textPrimary),
//           const SizedBox(width: 8),
//           const Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Explore new places',
//                 hintStyle: TextStyle(fontSize: 13, color: AppColors.textPrimary),
//                 border: InputBorder.none,
//                 isDense: true,
//               ),
//             ),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {},
//             icon: const Icon(Icons.auto_awesome, size: 15),
//             label: const Text('AI Suggestions',
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primary,
//               foregroundColor: Colors.white,
//               elevation: 0,
//               minimumSize: const Size(0, 44),
//               padding: const EdgeInsets.symmetric(horizontal: 14),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppRadius.pill)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//  no need we mixed another