var gulp = require('gulp');

var clean = require('gulp-clean'),
	coffee = require('gulp-coffee'),
	concat = require('gulp-concat'),
	concatcss = require('gulp-concat-css'),
	jade = require('gulp-jade'),
	jshint = require('gulp-jshint'),
	minifycss = require('gulp-minify-css'),
	notify = require('gulp-notify'),
	rename = require('gulp-rename'),
	sass = require('gulp-ruby-sass'),
	uglify = require('gulp-uglify'); 

// Default task
gulp.task('default', ['clean'], function() {
    gulp.start('css', 'coffee', 'watch');
});

//CSS
gulp.task('css', function() {
	return gulp.src('src/css/*.scss')
		.pipe(sass())
		.pipe(concatcss('main.css'))
	    .pipe(gulp.dest('css/'))
	    .pipe(rename({suffix: '.min'}))
	    .pipe(minifycss())
	    .pipe(gulp.dest('css/'))
	    .pipe(notify({ message: 'CSS task complete' }));
});

// Scripts
gulp.task('coffee', function() {
  	return gulp.src('src/js/*.coffee')
		.pipe(concat('main.js'))
		.pipe(coffee())
		.pipe(jshint())
		.pipe(jshint.reporter('default'))
    	.pipe(gulp.dest('js/'))
    	.pipe(rename({ suffix: '.min' }))
    	.pipe(uglify())
    	.pipe(gulp.dest('js/'))
    	.pipe(notify({ message: 'Coffee task complete' }));
});

// Scripts
gulp.task('jade', function() {
  	return gulp.src('src/html/*.jade')
		.pipe(jade({pretty:true}))
    	.pipe(gulp.dest(''))
    	.pipe(rename({ suffix: '.min' }))
    	.pipe(gulp.dest(''))
    	.pipe(notify({ message: 'Jade task complete' }));
});

// Clean
gulp.task('clean', function() {
  	return gulp.src(['css', 'js', '.sass-cache'], {read: false})
    	.pipe(clean());
});

// Watch .js, .scss, and .jade files
gulp.task('watch', function() {
	gulp.watch('src/css/*.scss', ['css']);
	gulp.watch('src/js/*.coffee', ['coffee']);
	gulp.watch('src/html/*.jade', ['jade']);
});