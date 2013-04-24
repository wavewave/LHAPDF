-----------------------------------------------------------------------------
-- |
-- Module      : HEP.Data.LHAPDF
-- Copyright   : (c) 2011, 2013 Ian-Woo Kim
--
-- License     : GPL-3
-- Maintainer  : Ian-Woo Kim <ianwookim@gmail.com>
-- Stability   : experimental
-- Portability : GHC
--
-- Haskell interface to LHAPDF (Les Houches Accord Parton Distribution 
-- Function) library
--
-----------------------------------------------------------------------------

module HEP.Data.LHAPDF (
  PartonType(..),
  initPDFSet,   
  alphasPDF, 
  numberPDF, 
  initPDF, 
  xfx, 
  anti
  ) where

import HEP.Data.LHAPDF.Internal 

import Foreign.C
import Foreign.C.String
import Foreign.Ptr
import Foreign.ForeignPtr

data PartonType = G | D | U | S | C | B | T 
                | Dbar | Ubar | Sbar | Cbar | Bbar | Tbar


anti :: PartonType -> PartonType 
anti G = G 
anti D = Dbar
anti U = Ubar
anti S = Sbar 
anti C = Cbar 
anti B = Bbar 
anti T = Tbar 
anti Dbar = D
anti Ubar = U
anti Sbar = S
anti Cbar = C
anti Bbar = B
anti Tbar = T


initPDFSet :: String -> IO () 
initPDFSet name = do 
  c_name <- newCString name 
  c_LHAPDF_initPDFSet c_name

alphasPDF :: Double -> IO Double
alphasPDF mu = do 
  let c_mu = realToFrac mu
  c_alphas <- c_LHAPDF_alphasPDF c_mu  
  return $ realToFrac c_alphas
     
numberPDF :: IO Int
numberPDF = do 
  c_number <- c_LHAPDF_numberPDF 
  return $ fromIntegral c_number

initPDF :: Int -> IO () 
initPDF n = do 
  let c_n = fromIntegral n 
  c_LHAPDF_initPDF c_n 

partonType2Int :: PartonType -> Int
partonType2Int G = 0 
partonType2Int D = 1
partonType2Int U = 2 
partonType2Int S = 3 
partonType2Int C = 4 
partonType2Int B = 5 
partonType2Int T = 6 
partonType2Int Dbar = -1 
partonType2Int Ubar = -2
partonType2Int Sbar = -3
partonType2Int Cbar = -4
partonType2Int Bbar = -5
partonType2Int Tbar = -6
                   

xfx :: Double -> Double -> PartonType -> IO Double
xfx x q ptyp = do 
  let c_x = realToFrac x 
      c_q = realToFrac q
      c_n = (fromIntegral . partonType2Int) ptyp 
  c_xfx <- c_LHAPDF_xfx c_x c_q c_n
  return $ realToFrac c_xfx
  
