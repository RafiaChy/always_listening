
class AppEnvironmentVariables{
  static const baseURL = "base-url";
  static const baseWebURL = "base-web-url";
  static const appName = "app-name";
  static const appTitle = "app-title";
  static const debugBannerBoolean = "debug-banner-boolean";
  static const bearerToken = "bearer-token";


  //make necessary changes
  static Map<String, dynamic> dev = {
    baseURL: "https://35.207.149.36:443/",
    baseWebURL: "https://35.207.149.36:443/",
    appName:'Always Listening Dev',
    debugBannerBoolean: true,
    appTitle: 'Always Listening Dev',
    bearerToken: 'KsJ5Ag3',
  };

  //make necessary changes
  static Map<String, dynamic> prod = {
    baseURL: "https://35.207.149.36:443/",
    baseWebURL: "https://35.207.149.36:443/",
    appName:'Always Listening Prod',
    debugBannerBoolean: false,
    appTitle: 'Always Listening',
    bearerToken: 'KsJ5Ag3',
  };
}