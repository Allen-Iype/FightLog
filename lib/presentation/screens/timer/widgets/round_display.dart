import 'package:fight_log/app/theme.dart';
import 'package:flutter/material.dart';

/// Display current round information
class RoundDisplay extends StatelessWidget {
  final int currentRound;
  final int totalRounds;
  final bool isResting;

  const RoundDisplay({
    super.key,
    required this.currentRound,
    required this.totalRounds,
    this.isResting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isResting ? AppTheme.secondaryColor : AppTheme.primaryColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sports_mma,
            color: isResting ? AppTheme.secondaryColor : AppTheme.primaryColor,
            size: 32,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Round',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
              ),
              Text(
                '$currentRound / $totalRounds',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isResting
                          ? AppTheme.secondaryColor
                          : AppTheme.primaryColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
