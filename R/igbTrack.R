#
#
#This code was automatically generated. Do not edit.
#
#

 setClass( Class = "igbTrack" , representation = representation( region = "numeric" , chromosome = "character" , genome = "character" , loadmode = "character" , refresh = "logical")) 
if (!isGeneric( "region" )) {
if (is.function( "region" ))
  fun <- get( "region" , mode = "function")
 else 
  fun <- function(object, ...) standardGeneric( "region" )
 setGeneric( "region" , fun)
}


setMethod( f = region , definition = function(object, ...)
{
object@region
})


if (!isGeneric( "region<-" )) {
if (is.function( "region<-" ))
  fun <- get( "region<-" , mode = "function")
 else 
  fun <- function(object, ..., value) standardGeneric( "region<-" )
 setGeneric( "region<-" , fun)
}


setMethod( f = "region<-" , definition = function(object, ..., value)
{
object@region = value
object
})


if (!isGeneric( "chromosome" )) {
if (is.function( "chromosome" ))
  fun <- get( "chromosome" , mode = "function")
 else 
  fun <- function(object, ...) standardGeneric( "chromosome" )
 setGeneric( "chromosome" , fun)
}


setMethod( f = chromosome , definition = function(object, ...)
{
object@chromosome
})


if (!isGeneric( "chromosome<-" )) {
if (is.function( "chromosome<-" ))
  fun <- get( "chromosome<-" , mode = "function")
 else 
  fun <- function(object, ..., value) standardGeneric( "chromosome<-" )
 setGeneric( "chromosome<-" , fun)
}


setMethod( f = "chromosome<-" , definition = function(object, ..., value)
{
object@chromosome = value
object
})


if (!isGeneric( "genome" )) {
if (is.function( "genome" ))
  fun <- get( "genome" , mode = "function")
 else 
  fun <- function(object, ...) standardGeneric( "genome" )
 setGeneric( "genome" , fun)
}


setMethod( f = genome , definition = function(object, ...)
{
object@genome
})


if (!isGeneric( "genome<-" )) {
if (is.function( "genome<-" ))
  fun <- get( "genome<-" , mode = "function")
 else 
  fun <- function(object, ..., value) standardGeneric( "genome<-" )
 setGeneric( "genome<-" , fun)
}


setMethod( f = "genome<-" , definition = function(object, ..., value)
{
object@genome = value
object
})


if (!isGeneric( "loadmode" )) {
if (is.function( "loadmode" ))
  fun <- get( "loadmode" , mode = "function")
 else 
  fun <- function(object, ...) standardGeneric( "loadmode" )
 setGeneric( "loadmode" , fun)
}


setMethod( f = loadmode , definition = function(object, ...)
{
object@loadmode
})


if (!isGeneric( "loadmode<-" )) {
if (is.function( "loadmode<-" ))
  fun <- get( "loadmode<-" , mode = "function")
 else 
  fun <- function(object, ..., value) standardGeneric( "loadmode<-" )
 setGeneric( "loadmode<-" , fun)
}


setMethod( f = "loadmode<-" , definition = function(object, ..., value)
{
object@loadmode = value
object
})


if (!isGeneric( "refresh" )) {
if (is.function( "refresh" ))
  fun <- get( "refresh" , mode = "function")
 else 
  fun <- function(object, ...) standardGeneric( "refresh" )
 setGeneric( "refresh" , fun)
}


setMethod( f = refresh , definition = function(object, ...)
{
object@refresh
})


if (!isGeneric( "refresh<-" )) {
if (is.function( "refresh<-" ))
  fun <- get( "refresh<-" , mode = "function")
 else 
  fun <- function(object, ..., value) standardGeneric( "refresh<-" )
 setGeneric( "refresh<-" , fun)
}


setMethod( f = "refresh<-" , definition = function(object, ..., value)
{
object@refresh = value
object
})