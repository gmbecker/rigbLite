#
#
#This code was automatically generated. Do not edit.
#
#

setOldClass( Classes  =  "list")

valid_igbTrackList = function( object )
 {
    dat = object@.Data
    if (length(dat) == 0) 
        return(TRUE)
    if (any(sapply(dat, function(el) !is(el, "igbTrack")))) 
        return("One or more elements are not of class igbTrack.")
    if (any(sapply(dat, function(el) genome(object) != genome(el))) || 
        any(sapply(dat, function(el) region(object) != region(el)))) 
        "One or more elements have genome and/or region values which do not match those of the igbTrackList object"
    else TRUE
}

setClass( Class  =  "igbTrackList" , representation  =  representation( genome  =  "character" , region  =  "GRanges") , contains  =  "list" , validity  =  valid_igbTrackList)


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
} , signature  =  c( x  =  "igbTrackList"))


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
} , signature  =  c( x  =  "igbTrackList"))


if (!isGeneric( "region" )) {
if (is.function( "region" ))
  fun <- get( "region" , mode = "function")
 else 
  fun <- function(  object , ...  ) standardGeneric( "region" )
 setGeneric( "region" , fun)
}


setMethod( f  =  "region" , definition  =  function(object , ...)
{
object@region
} , signature  =  c( object  =  "igbTrackList"))


if (!isGeneric( "region<-" )) {
if (is.function( "region<-" ))
  fun <- get( "region<-" , mode = "function")
 else 
  fun <- function(  object , ... , value  ) standardGeneric( "region<-" )
 setGeneric( "region<-" , fun)
}


setMethod( f  =  "region<-" , definition  =  function(object , ... , value)
{
object@region = value
object
} , signature  =  c( object  =  "igbTrackList"))

