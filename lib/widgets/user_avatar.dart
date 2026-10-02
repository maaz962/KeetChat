import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../models/user_model.dart';

class UserAvatar extends StatelessWidget{
  final UserModel user;
  final double radius;

  const UserAvatar({super.key, required this.user, this.radius = 26});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dotSize = radius * 0.55;

    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: cs.primary,
          child: Text(
            user.initial,
            style: TextStyle(
              color: cs.onPrimary,
              fontSize: radius * 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if(user.isOnline)
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
            width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkOnline : AppColors.lightOnline,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
          ),
          ),
      ],
    );
  }
}