import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_radius.dart';
import 'package:tisser_application_test/themes/colors.dart';

class CardStat extends StatelessWidget {

  final IconData icon;
  final String label;
 const  CardStat( {super.key, required this.icon, required this .label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      decoration:BoxDecoration(color: AppColors.surfaceSoft,
      borderRadius: BorderRadius.circular(AppRadius.small),
      ),
      child: Row(
mainAxisSize:  MainAxisSize.min,
children: [Icon(icon ,size : 16, color: AppColors.textPrimary,),
const SizedBox(width: 6,),
Text(label,
 style: const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: AppColors.textPrimary
      ),
      ),
      ],
      ),
    );
  }
}