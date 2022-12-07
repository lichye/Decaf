./test/dcc <test/test.decaf >test/test.s
./dcc <test/test.decaf >test/test.asm
./test/dcc -d tac <test/test.decaf >test/test.tac1
./dcc -d tac <test/test.decaf >test/test.tac2
spim -file test/test.asm