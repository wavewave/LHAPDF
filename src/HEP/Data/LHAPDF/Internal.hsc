{-# LANGUAGE ForeignFunctionInterface #-}

-----------------------------------------------------------------------------
-- |
-- Module      : HEP.Data.LHAPDF.Internal
-- Copyright   : (c) 2011, 2013 Ian-Woo Kim
--
-- License     : GPL-3
-- Maintainer  : Ian-Woo Kim <ianwookim@gmail.com>
-- Stability   : experimental
-- Portability : GHC
--
-- Internal functions for Haskell interface to LHAPDF library
-- 
-----------------------------------------------------------------------------

module HEP.Data.LHAPDF.Internal where

import Foreign.C
import Foreign.C.String
import Foreign.Ptr
import Foreign.ForeignPtr

foreign import ccall "lhapdf.h my_initPDFSet" c_LHAPDF_initPDFSet
  :: CString -> IO () 
       
foreign import ccall "lhapdf.h my_alphasPDF"  c_LHAPDF_alphasPDF
  :: CDouble -> IO CDouble 
    
foreign import ccall "lhapdf.h my_numberPDF"  c_LHAPDF_numberPDF
  :: IO CInt
     
foreign import ccall "lhapdf.h my_initPDF"    c_LHAPDF_initPDF
  :: CInt -> IO () 
     
foreign import ccall "lhapdf.h my_xfx"        c_LHAPDF_xfx
  :: CDouble -> CDouble -> CInt -> IO CDouble
     
