# usage:
# offset=1.2 startline=6 perl -mEnv=startline,offset -anf ./shiftrest.pl timing02.txt
# or for text '3c'
# offset=1.2 startline=$(grep -n -m 1 '3c' timing02.txt | cut -d: -f1) perl -mEnv=startline,offset -anf ./shiftrest.pl timing02.txt
use 5.026;

my ($s,$e,$t) = @F;
if ($. == $startline-1) {
	$e += $offset;
	}
if ($. >= $startline) {
	$s =~ s/^\N{BOM}//;
	$s += $offset;
	$e += $offset;
	}
say qq[$s\t$e\t$t];
