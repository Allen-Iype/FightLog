import 'package:fight_log/app/theme.dart';
import 'package:flutter/material.dart';

/// Control buttons for the timer
class TimerControls extends StatelessWidget {
  final bool isPaused;
  final bool isResting;
  final bool isCompleted;
  final VoidCallback onPlayPause;
  final VoidCallback onSkipRest;
  final VoidCallback onReset;

  const TimerControls({
    super.key,
    required this.isPaused,
    required this.isResting,
    required this.isCompleted,
    required this.onPlayPause,
    required this.onSkipRest,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Reset button
        if (!isPaused)
          _ControlButton(
            icon: Icons.stop,
            label: 'Stop',
            color: AppTheme.error,
            onPressed: onReset,
          ),

        const SizedBox(width: 20),

        // Play/Pause button (larger)
        _ControlButton(
          icon: isPaused ? Icons.play_arrow : Icons.pause,
          label: isPaused ? 'Start' : 'Pause',
          color: AppTheme.primaryColor,
          onPressed: onPlayPause,
          isLarge: true,
        ),

        const SizedBox(width: 20),

        // Skip rest button (only visible during rest)
        if (isResting && !isPaused)
          _ControlButton(
            icon: Icons.skip_next,
            label: 'Skip',
            color: AppTheme.secondaryColor,
            onPressed: onSkipRest,
          )
        else
          const SizedBox(width: 80), // Maintain spacing
      ],
    );
  }
}

/// Individual control button
class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool isLarge;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = isLarge ? 80.0 : 60.0;
    final iconSize = isLarge ? 40.0 : 28.0;

    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.2),
            border: Border.all(
              color: color,
              width: 3,
            ),
            boxShadow: isLarge
                ? [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              customBorder: const CircleBorder(),
              child: Icon(
                icon,
                color: color,
                size: iconSize,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: isLarge ? 16 : 14,
          ),
        ),
      ],
    );
  }
}
