import 'package:flutter/material.dart';

class DockingBar extends StatefulWidget {
  final int currentIndex;
  final List<IconData> icons;
  final ValueChanged<int> onTap;

  const DockingBar({
    super.key,
    required this.currentIndex,
    required this.icons,
    required this.onTap,
  });

  @override
  State<DockingBar> createState() => _DockingBarState();
}

class _DockingBarState extends State<DockingBar> {
  late Tween<double> _tween;
  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 1.0, end: 1.2);
  }

  @override
  void didUpdateWidget(DockingBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      setState(() {
        _animationCompleted = false;
        _tween = Tween(begin: 1.0, end: 1.2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      clipBehavior: Clip.none,
      width: MediaQuery.sizeOf(context).width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TweenAnimationBuilder(
        key: ValueKey(widget.currentIndex),
        tween: _tween,
        duration: Duration(milliseconds: _animationCompleted ? 1500 : 250),
        curve: _animationCompleted ? Curves.elasticOut : Curves.easeOutCubic,
        onEnd: () {
          if (!_animationCompleted) {
            setState(() {
              _animationCompleted = true;
              _tween = Tween(begin: 1.5, end: 1.0);
            });
          }
        },
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.icons.length, (i) {
              final isActive = i == widget.currentIndex;
              return Expanded(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => widget.onTap(i),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..scale(isActive ? value : 1.0)
                        ..translate(0.0, isActive ? 20.0 * (1 - value) : 0.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isActive 
                              ? colorScheme.primary 
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: isActive ? [
                            BoxShadow(
                              color: colorScheme.primary.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ] : null,
                        ),
                        child: Icon(
                          widget.icons[i],
                          size: 24,
                          color: isActive 
                              ? colorScheme.onPrimary 
                              : colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
