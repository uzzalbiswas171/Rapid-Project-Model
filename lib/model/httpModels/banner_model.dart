

import 'package:rapid_super_market/Core/HttpApis/http_apis.dart';

class BannerItem {
  final int id;
  final String titleEn;
  final String titleAr;
  final String topTitleEn;
  final String topTitleAr;
  final String keyTagsEn;
  final String keyTagsAr;
  final String bannerPhotoEn;
  final String bannerPhotoAr;
  final int purchaseItemId;
  final String bannerType;
  final String createdAt;
  final String updatedAt;

  BannerItem({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.topTitleEn,
    required this.topTitleAr,
    required this.keyTagsEn,
    required this.keyTagsAr,
    required this.bannerPhotoEn,
    required this.bannerPhotoAr,
    required this.purchaseItemId,
    required this.bannerType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'],
      titleEn: json['title_en'],
      titleAr: json['title_ar'],
      topTitleEn: json['top_title_en'],
      topTitleAr: json['top_title_ar'],
      keyTagsEn: json['key_tags_en'],
      keyTagsAr: json['key_tags_ar'],
      bannerPhotoEn: json['banner_photo_en'],
      bannerPhotoAr: json['banner_photo_ar'],
      purchaseItemId: json['purchase_item_id'],
      bannerType: json['banner_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  String get fullBannerUrlEn => "${HttpApi.baseUrl}/${bannerPhotoEn}";
  String get fullBannerUrlAr => "${HttpApi.baseUrl}/${bannerPhotoAr}";
}


class BannerResponse {
  final bool status;
  final String message;
  final List<BannerItem> smallBanners;
  final List<BannerItem> heroBanners;

  BannerResponse({
    required this.status,
    required this.message,
    required this.smallBanners,
    required this.heroBanners,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      status: json['status'],
      message: json['message'] ?? '',
      smallBanners: (json['small_banner'] as List)
          .map((e) => BannerItem.fromJson(e))
          .toList(),
      heroBanners: (json['hero_banner'] as List)
          .map((e) => BannerItem.fromJson(e))
          .toList(),
    );
  }
}

