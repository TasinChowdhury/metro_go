// import 'package:flutter/material.dart';
//
//
// class Homescreen extends StatelessWidget {
//   const Homescreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     // return SafeArea(
//     //   child: SingleChildScrollView(
//     //     padding: const EdgeInsets.all(16),
//     //     child: Column(
//     //       crossAxisAlignment: CrossAxisAlignment.start,
//     //       children: [
//     //         _header(),
//     //         const SizedBox(height: 16),
//     //
//     //         _currentStationCard(),
//     //         const SizedBox(height: 16),
//     //
//     //         _nextTrainsCard(),
//     //         const SizedBox(height: 24),
//     //
//     //         _featuresGrid(context),
//     //         const SizedBox(height: 24),
//     //
//     //         _recentJourney(),
//     //       ],
//     //     ),
//     //   ),
//     // );
//
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xffe5e9f6),
//             Color(0xfffdfdfd),
//           ],
//         ),
//       ),
//       child: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _header(),
//               const SizedBox(height: 16),
//               _currentStationCard(),
//               const SizedBox(height: 16),
//               _nextTrainsCard(),
//               const SizedBox(height: 24),
//               _featuresGrid(context),
//               const SizedBox(height: 24),
//               _recentJourney(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

