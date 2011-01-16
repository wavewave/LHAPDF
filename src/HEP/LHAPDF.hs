module HEP.LHAPDF (
  initPDFSet,   
  alphasPDF, 
  numberPDF, 
  initPDF, 
  xfx
  ) where

import HEP.LHAPDF.Internal 

import Foreign.C
import Foreign.C.String
import Foreign.Ptr
import Foreign.ForeignPtr

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

xfx :: Double -> Double -> Int -> IO Double
xfx x q n = do 
  let c_x = realToFrac x 
      c_q = realToFrac q
      c_n = fromIntegral n 
  c_xfx <- c_LHAPDF_xfx c_x c_q c_n
  return $ realToFrac c_xfx
  
