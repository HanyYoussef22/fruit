// import 'package:flutter/material.dart';
//
// void setupErrorState(BuildContext context, String error) {
//   if (error.isEmpty) return; // Add validation to prevent showing empty error messages.
//
//   showDialog(
//     context: context,
//     builder: (BuildContext dialogContext) { // Avoid shadowing parent context
//       return  _ErrorDialog(errorMessage: error);
//     },
//   );
// }
//
// /// Custom Widget for the Error Dialog
// class _ErrorDialog extends StatelessWidget {
//   final String errorMessage;
//
//   const _ErrorDialog({Key? key, required this.errorMessage}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       icon: const Icon(
//         Icons.error,
//         color: Colors.red,
//         size: 32,
//       ),
//       content: Text(
//         'Error: $errorMessage',
//         style: Styles.font14DarkBulemedium, // Ensure this style exists in your Styles class.
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text(
//             'Got it',
//             style: Styles.font14BlueSemiBold, // Ensure this style exists.
//           ),
//         ),
//       ],
//     );
//   }
// }
