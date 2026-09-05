import 'package:flutter/material.dart';
import '../models/sample.dart';

class SampleCell extends StatefulWidget {
  final int index;
  final Sample? sample;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onAdd;

  const SampleCell({
    Key? key,
    required this.index,
    required this.sample,
    required this.onTap,
    required this.onLongPress,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<SampleCell> createState() => _SampleCellState();
}

class _SampleCellState extends State<SampleCell> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final hasSample = widget.sample != null;

    return GestureDetector(
      onTapDown: (_) {
        if (hasSample) {
          setState(() => _isPressed = true);
          widget.onTap();
        }
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
      },
      onLongPress: hasSample ? widget.onLongPress : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: hasSample
              ? (_isPressed ? Colors.blue : Colors.blueAccent)
              : const Color(0xFF3a3a3a),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: hasSample ? Colors.blue : Colors.grey[700]!,
            width: 2,
          ),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: hasSample
                ? widget.onTap
                : widget.onAdd,
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: hasSample
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.music_note,
                            color: Colors.white, size: 28),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            widget.sample!.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Долгий тап - удалить',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: Colors.grey, size: 32),
                        const SizedBox(height: 8),
                        Text(
                          'Ячейка ${widget.index + 1}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
