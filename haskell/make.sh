for f in `ls *.hs`; do ghc -O2 --make $f; done
