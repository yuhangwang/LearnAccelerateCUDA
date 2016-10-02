module Main where
import Data.Array.Accelerate      as Acc
import qualified Data.Array.Accelerate.CUDA     as CUDA

dotp :: Acc.Vector Float -> Acc.Vector Float -> Acc.Acc (Acc.Scalar Float)
dotp xs ys = let xs' = Acc.use xs
                 ys' = Acc.use ys
             in
             Acc.fold (+) 0 (Acc.zipWith (*) xs' ys')

main :: IO ()
main = do
  let xs = Acc.fromList (Acc.Z :. 5) [0..] :: Acc.Vector Float
  let ys = Acc.fromList (Acc.Z :. 5) [0..] :: Acc.Vector Float
  let zs = dotp xs ys
  print zs
  putStrLn "hello world"
