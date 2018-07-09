let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/assets/js/app.js', 'public/js').extract(['vue'])
    .sass('resources/assets/sass/app.scss', 'public/css');

mix.js('resources/assets/js/admin.js', 'public/js')
    .js('resources/assets/js/dashboard.js', 'public/js');

// 将多个原生 CSS 样式文件合并到一个文件
// mix.styles([
//     'public/css/vendor/normalize.css',
//     'public/css/vendor/videojs.css'
// ], 'public/css/all.css');


// 合并并最小化任意数量的 JavaScript 文件
mix.scripts([
    'public/js/admin.js',
    'public/js/dashboard.js'
], 'public/js/all.js');

// 自定义 Webpack 配置
// mix.webpackConfig({
//     resolve: {
//         modules: [
//             path.resolve(__dirname, 'vendor/laravel/spark/resources/assets/js')
//         ]
//     }
// });

if (mix.config.inProduction) {
    mix.version();
}