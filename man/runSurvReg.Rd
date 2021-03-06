% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runSurvReg.R
\name{runSurvReg}
\alias{runSurvReg}
\title{Run the weighted survival regression for a set of estimation points (defined by DecYear and Log(Q))}
\usage{
runSurvReg(estPtYear, estPtLQ, numDays, DecLow, DecHigh, Sample, windowY = 7,
  windowQ = 2, windowS = 0.5, minNumObs = 100, minNumUncen = 50,
  interactive = TRUE, edgeAdjust = TRUE)
}
\arguments{
\item{estPtYear}{numeric vector of Decimal Year values at the estimation points}

\item{estPtLQ}{numeric vector of ln(Q) values at the estimation points, must be the same length as estPtYear}

\item{numDays}{number of days in the Daily record}

\item{DecLow}{number specifying minimum decimal year}

\item{DecHigh}{number specifying maximum decimal year}

\item{Sample}{dataframe created for EGRET analysis}

\item{windowY}{numeric specifying the half-window width in the time dimension, in units of years, default is 7}

\item{windowQ}{numeric specifying the half-window width in the discharge dimension, units are natural log units, default is 2}

\item{windowS}{numeric specifying the half-window with in the seasonal dimension, in units of years, default is 0.5}

\item{minNumObs}{numeric specifying the miniumum number of observations required to run the weighted regression, default is 100}

\item{minNumUncen}{numeric specifying the minimum number of uncensored observations to run the weighted regression, default is 50}

\item{interactive}{logical specifying whether or not to display progress message}

\item{edgeAdjust}{logical specifying whether to use the modified method for calculating the windows at the edge of the record.  The modified method tends to reduce curvature near the start and end of record.  Default is TRUE.}
}
\value{
resultSurvReg numeric array containing the yHat, SE, and ConcHat values array dimensions are (numEstPts,3)
}
\description{
This function runs the survival regression which is the concentration estimation method of WRTDS. 
   It uses sample data from the data frame Sample. 
   It does the estimation for a set of data points defined by two vectors: estPtYear and estPtLQ. 
   It returns an array of results for the estimation points.  
   The array returned contains yHat, SE and ConcHat (in that order).
}
\examples{
eList <- Choptank_eList
estPtYear<-c(2001.0,2005.0,2009.0)
estPtLQ<-c(1,1,1)
Sample <- getSample(eList)
numDays <- Sample$Julian[nrow(Sample)] - Sample$Julian[1] + 1
DecLow <- Sample$DecYear[1]
DecHigh <- Sample$DecYear[nrow(Sample)]
resultSurvReg <- runSurvReg(estPtYear,estPtLQ,numDays,DecLow,DecHigh,Sample)
}
\keyword{statistics}
\keyword{water-quality}
