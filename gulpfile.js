const gulp = require('gulp');
const del = require('del');
const size = require('gulp-size');
const elm  = require('gulp-elm');
const less = require('gulp-less');
const rename = require('gulp-rename');
const merge = require('merge-stream');
const cleanCSS = require('gulp-clean-css');
const livereload = require('gulp-livereload');

const APP_DIR = 'app/src';
const OUTPUT_DIR = 'docs';
const LESS_ENTRY_POINT = APP_DIR + '/less/style.less';

const CSS_OUTPUT_DIR = OUTPUT_DIR + '/css';
const IMG_OUTPUT_DIR = OUTPUT_DIR + '/img';
const FONTS_OUTPUT_DIR = OUTPUT_DIR + '/fonts';
const JS_OUTPUT_DIR = OUTPUT_DIR + '/js';


gulp.task('clean', function () {
    return del([
        OUTPUT_DIR + '/**/*.js',
        OUTPUT_DIR + '/**/*.css',
        OUTPUT_DIR + '/**/*.html',
        OUTPUT_DIR + '/img/*'
    ])
});

gulp.task('elm-init', elm.init);
gulp.task('elm-bundle', ['elm-init'], function(){
    return gulp.src(APP_DIR+'/**/*.elm')
        .pipe(elm.bundle('main.js'))
        .pipe(gulp.dest(JS_OUTPUT_DIR))
        .pipe(livereload())
});

gulp.task('buildCss', function () {
    return gulp.src(LESS_ENTRY_POINT)
        .pipe(less().on('error', function (err) {
            this.emit('end')
        }))
        .pipe(rename('style.css'))
        .pipe(cleanCSS()) // minify css
        .pipe(gulp.dest(CSS_OUTPUT_DIR))
        .pipe(livereload())
});

gulp.task('copyFiles', function () {
    return merge(
        gulp.src(APP_DIR+'/**/*.html')
            .pipe(gulp.dest(OUTPUT_DIR)),

        gulp.src(APP_DIR+'/fonts/**/*')
            .pipe(gulp.dest(FONTS_OUTPUT_DIR)),

        gulp.src(APP_DIR+'/img/**/*')
            .pipe(gulp.dest(IMG_OUTPUT_DIR))
    )
});

gulp.task('copyHtml', function () {
    return merge(
        gulp.src(APP_DIR+'/**/*.html')
            .pipe(gulp.dest(OUTPUT_DIR))
            .pipe(livereload())
    )
});

const allTasks = [
    'clean',
    'elm-bundle',
    'buildCss',
    'copyFiles'
];

gulp.task('default', allTasks);

gulp.task('watch', allTasks, function() {
    livereload.listen({
        port: 35729,
        host: 'localhost'
    });
    gulp.watch(APP_DIR+'/**/*.elm', ['elm-bundle']);
    gulp.watch(LESS_ENTRY_POINT, ['buildCss']);
    gulp.watch(APP_DIR+'/**/*.html', ['copyHtml']);
});

