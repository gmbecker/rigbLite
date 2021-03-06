#
#
#This code was automatically generated. Do not edit.
#
#





setClass( Class  =  "igbTrack" , representation  =  representation( genome  =  "character" , loadmode  =  "character" , refresh  =  "logical" , uri  =  "character"))


if (!isGeneric( "genome" )) {
if (is.function( "genome" ))
  fun <- get( "genome" , mode = "function")
 else 
  fun <- function(  x  ) standardGeneric( "genome" )
 setGeneric( "genome" , fun)
}


setMethod( f  =  "genome" , definition  =  function(x)
{
x@genome
} , signature  =  c( x  =  "igbTrack"))


if (!isGeneric( "genome<-" )) {
if (is.function( "genome<-" ))
  fun <- get( "genome<-" , mode = "function")
 else 
  fun <- function(  object , ... , value  ) standardGeneric( "genome<-" )
 setGeneric( "genome<-" , fun)
}


setMethod( f  =  "genome<-" , definition  =  function(x , value)
{
x@genome = value
x
} , signature  =  c( x  =  "igbTrack"))


if (!isGeneric( "loadmode" )) {
if (is.function( "loadmode" ))
  fun <- get( "loadmode" , mode = "function")
 else 
  fun <- function(  object , ...  ) standardGeneric( "loadmode" )
 setGeneric( "loadmode" , fun)
}


setMethod( f  =  "loadmode" , definition  =  function(object , ...)
{
object@loadmode
} , signature  =  c( object  =  "igbTrack"))


if (!isGeneric( "loadmode<-" )) {
if (is.function( "loadmode<-" ))
  fun <- get( "loadmode<-" , mode = "function")
 else 
  fun <- function(  object , ... , value  ) standardGeneric( "loadmode<-" )
 setGeneric( "loadmode<-" , fun)
}


setMethod( f  =  "loadmode<-" , definition  =  function(object , ... , value)
{
object@loadmode = value
object
} , signature  =  c( object  =  "igbTrack"))


if (!isGeneric( "refresh" )) {
if (is.function( "refresh" ))
  fun <- get( "refresh" , mode = "function")
 else 
  fun <- function(  object , ...  ) standardGeneric( "refresh" )
 setGeneric( "refresh" , fun)
}


setMethod( f  =  "refresh" , definition  =  function(object , ...)
{
object@refresh
} , signature  =  c( object  =  "igbTrack"))


if (!isGeneric( "refresh<-" )) {
if (is.function( "refresh<-" ))
  fun <- get( "refresh<-" , mode = "function")
 else 
  fun <- function(  object , ... , value  ) standardGeneric( "refresh<-" )
 setGeneric( "refresh<-" , fun)
}


setMethod( f  =  "refresh<-" , definition  =  function(object , ... , value)
{
object@refresh = value
object
} , signature  =  c( object  =  "igbTrack"))


if (!isGeneric( "uri" )) {
if (is.function( "uri" ))
  fun <- get( "uri" , mode = "function")
 else 
  fun <- function(  x , ...  ) standardGeneric( "uri" )
 setGeneric( "uri" , fun)
}


setMethod( f  =  "uri" , definition  =  function(x , ...)
{
x@uri
} , signature  =  c( x  =  "igbTrack"))


if (!isGeneric( "uri<-" )) {
if (is.function( "uri<-" ))
  fun <- get( "uri<-" , mode = "function")
 else 
  fun <- function(  object , ... , value  ) standardGeneric( "uri<-" )
 setGeneric( "uri<-" , fun)
}


setMethod( f  =  "uri<-" , definition  =  function(object , ... , value)
{
object@uri = value
object
} , signature  =  c( object  =  "igbTrack"))

