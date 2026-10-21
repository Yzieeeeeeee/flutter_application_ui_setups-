import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_radius.dart';
import 'package:tisser_application_test/core/constants/app_typo.dart';
import 'package:tisser_application_test/themes/colors.dart';

/// Preview thumbnails tucked behind a big white search pill
/// (replaces DestinationPreview + AppSearchBar).
class SearchPreviewSection extends StatelessWidget {
  const SearchPreviewSection({super.key});

  static const _images = [
    'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=400',
    'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=400',
    'https://images.unsplash.com/photo-1486870591958-9b9d0d1dda99?w=400',
    'https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?w=400',
    'https://images.unsplash.com/photo-1491555103944-7c647fd857e6?w=400',
  ];

  static const double _tileHeight = 84; // total tile height (bottom is hidden)
  static const double _barHeight = 64;
  static const double _overlap = 24; // how much the bar covers the tiles

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _tileHeight - _overlap + _barHeight,
      child: Stack(
        children: [
          // thumbnails (behind)
          Positioned(
            top: 0,
            left: 10,
            right: 10,
            height: _tileHeight,
            child: Row(
              children: [
                for (int i = 0; i < _images.length; i++) ...[
                  if (i != 0) const SizedBox(width: 6),
                  Expanded(child: _Tile(url: _images[i])),
                ],
              ],
            ),
          ),
          // search pill (front)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: _barHeight,
            child: const _SearchPill(),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String url;
  const _Tile({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        border: Border.all(color: Colors.white.withOpacity(0.7), width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.medium - 1.5),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          errorBuilder: (_, __, ___) =>
              Container(color: Colors.blueGrey.shade100),
        ),
      ),
    );
  }
}

class _SearchPill extends StatelessWidget {
  const _SearchPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFD),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 8)),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 26, color: Color(0xFF2B2F38)),
          const SizedBox(width: 12),
          Container(width: 1.5, height: 26, color: const Color(0xFFD5DAE0)),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 15, color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Explore new places',
                hintStyle: AppTypography.searchSection.copyWith(
                    color: Color.fromARGB(255, 70, 77, 94),),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.auto_awesome, size: 18),
            label: const Text('AI suggestions',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF080C16),
              foregroundColor: Colors.white,
              elevation: 0,
              minimumSize: const Size(0, 48),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.pill)),
            ),
          ),
        ],
      ),
    );
  }
}