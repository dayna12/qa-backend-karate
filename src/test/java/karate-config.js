function fn() {
  var env = karate.env || 'dev';
  var config = {};
  config.baseUrl = 'https://serverest.dev';
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 15000);
  karate.configure('report', { showLog: true, showAllSteps: false });
  return config;
}
