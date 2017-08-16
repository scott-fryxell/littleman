gulp    = require 'gulp'
util    = require 'gulp-util'
coffee  = require 'gulp-coffee'
include = require 'gulp-include'
concat  = require 'gulp-concat'

gulp.task 'scripts', ->
	gulp.src('./**/*.coffee')
		.pipe(concat 'local.coffee')
    .pipe(do coffee)
  	.pipe(gulp.dest '/dest')

gulp.task 'item', ->
	gulp.src(['/dest/local.js', '../scott-fryxell.github.io/playground/item/application.js'])
		.pipe(concat 'application.js')
		.pipe(gulp.dest '/public')

gulp.task 'default', ['scripts', 'item']
gulp.watch 'public/**/*.coffee', ['scripts']
