var gulp = require('gulp');

var clean = require('gulp-clean'),
	coffee = require('gulp-coffee'),
	concat = require('gulp-concat'),
	jshint = require('gulp-jshint'),
	minifycss = require('gulp-minify-css'),
	notify = require('gulp-notify'),
	rename = require('gulp-rename'),
	sass = require('gulp-ruby-sass'),
	uglify = require('gulp-uglify'); 

		gulp-notify	gulp-rename	gulp-ruby-sass gulp-uglify
// Default task
gulp.task('default', ['clean'], function() {
    gulp.start('css', 'coffee', 'watch');
});

gulp.task('css', function() {
	return gulp.src('src/*.scss')
		.pipe(sass())
	    .pipe(gulp.dest('css/'))
	    .pipe(rename({suffix: '.min'}))
	    .pipe(minifycss())
	    .pipe(gulp.dest('css/'))
	    .pipe(notify({ message: 'CSS task complete' }));
});

// Scripts
gulp.task('coffee', function() {
  	return gulp.src('src/*.coffee')
		.pipe(concat('main.js'))
		.pipe(coffee())
		.pipe(jshint())
		.pipe(jshint.reporter('default'))
    	.pipe(gulp.dest('lib/'))
    	.pipe(rename({ suffix: '.min' }))
    	.pipe(uglify())
    	.pipe(gulp.dest('lib'))
    	.pipe(notify({ message: 'Coffee task complete' }));
});

// Clean
gulp.task('clean', function() {
  return gulp.src(['dist/styles', 'dist/scripts', 'dist/images'], {read: false})
    .pipe(clean());
});

// Watch .js and .scss files
gulp.task('watch', function() {
	gulp.watch('src/*.scss', ['css']);
	gulp.watch('src/*.coffee', ['coffee']);
});