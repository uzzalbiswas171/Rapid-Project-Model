



class HttpApi{
  /// Base Url
  static String  baseUrl = "https://rapiderp.excellency-catering-restaurant-sweets.com";


  /// Auth
  static String  registrationRoute = "/api/customer/register";
  static String  loginRoute = "/api/customer/login";

  /// Home Category List Or Country List
  static String  groupCategoryItemListRoute = "/api/customer/all/items";

  /// Home Category List Or Country List
  static String  groupListRoute = "/api/customer/group-list";

  /// Home Banner
  static String  baseUrlRoute = "/api/customer/banners";

  /// Popular Product
  static String  popularProductUrlRoute = "/api/customer/most-popular-foods";

  /// Best Sell
  static String recommendProductUrlRoute = "/api/customer/best-sale-foods";

  /// Recent View
  static String recentViewUrlRoute = "/api/customer/recent-view/all";

  /// Wish List Get
  static String wishListUrlRoute = "/api/customer/wishlist/all";

  /// Wish List add
  static String addWishListUrlRoute = "/api/customer/wishlist";

  /// Wish List add
  static String removeWishListUrlRoute = "/api/customer/wishlist/remove";

  /// Today's offered item
  static String todayOfferListUrlRoute = "/api/customer/offered/items";
}