/** VARIAVLES **/
var gulp = require('gulp');

var clean = require('gulp-clean'),
	coffee = require('gulp-coffee'),
	concat = require('gulp-concat'),
	concatcss = require('gulp-concat-css'),
	gutil = require('gulp-util'),
	jade = require('gulp-jade'),
	jshint = require('gulp-jshint'),
	minifycss = require('gulp-minify-css'),
	notify = require('gulp-notify'),
	rename = require('gulp-rename'),
	sass = require('gulp-ruby-sass'),
	uglify = require('gulp-uglify'); 

// Input File Paths
var htmlSrc = 'src/html/*.jade',
	cssSrc = 'src/css/*.scss',
	jsSrc = 'src/js/*.coffee';

/** FUNCTIONS **/ 

function handleError(err) {
	console.log("Error: " + err.toString);
	gutil.log(err.toString);
	gutil.beep;
	this.emit('end');
}

/** TASKS **/

// Default task
gulp.task('default', function() {
    gulp.start('sass', 'coffee', 'jade', 'watch');
});

//CSS
gulp.task('sass', function() {
	return gulp.src('src/css/main.scss')
		.pipe(sass({noCache: true}))
			.on('error', handleError)
	    .pipe(gulp.dest('css/'))
	    .pipe(rename({suffix: '.min'}))
	    .pipe(minifycss())
	    .pipe(gulp.dest('css/'))
	    .pipe(notify({ message: 'Sass task complete' }));
});

// Scripts
gulp.task('coffee', function() {
  	return gulp.src(['src/js/lib.coffee', jsSrc])
		.pipe(concat('main.js'))
		.pipe(coffee())
			.on('error', handleError)
		.pipe(jshint())
		.pipe(jshint.reporter('default'))
    	.pipe(gulp.dest('js/'))
    	.pipe(rename({ suffix: '.min' }))
    	.pipe(uglify())
    	.pipe(gulp.dest('js/'))
    	.pipe(notify({ message: 'Coffee task complete' }));
});

// HTML
gulp.task('jade', function() {
	gulp.start('jadePretty', 'jadeUgly');
  	
});

// Hack for creating uglify and beautify html
gulp.task('jadePretty', function() {
	return gulp.src(htmlSrc)
		.pipe(jade({pretty:true}))
			.on('error', handleError)
    	.pipe(gulp.dest(''))
    	.pipe(notify({ message: 'Jade Pretty complete' }));
});

gulp.task('jadeUgly', function() {
	return gulp.src(htmlSrc)
		.pipe(jade({pretty:false}))
			.on('error', handleError)
    	.pipe(rename({ suffix: '.min' }))
    	.pipe(gulp.dest(''))
    	.pipe(notify({ message: 'Jade Ugly complete' }));
});

// Clean
gulp.task('clean', function() {
  	return gulp.src(['css', 'js'], {read: false})
    	.pipe(clean()
    		.on('error', gutil.log)
    		.on('error', gutil.beep));
});

// Watch .js, .scss, and .jade files
gulp.task('watch', function() {
	gulp.watch(cssSrc, ['sass']);
	gulp.watch(jsSrc, ['coffee']);
	gulp.watch(htmlSrc, ['jade']);
});