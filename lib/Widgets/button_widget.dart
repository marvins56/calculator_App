// import 'package:flutter/material.dart';

// class ButtonWid extends StatefulWidget {
//   ButtonWid(
//       {this.buttonColor,
//       this.buttonText,
//       this.buttonTextColor,
//       this.onPressed});

//   Color? buttonColor;
//   String? buttonText;
//   Color? buttonTextColor;
//   VoidCallback? onPressed;

//   @override
//   State createState() => _ButtonWidState();
// }

// class _ButtonWidState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: buttonColor ?? Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Center(
//             child: Text(
//               buttonText ?? "",
//               style: TextStyle(
//                   color: buttonTextColor ?? Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
