# Modify a Aeneas timing file (tab delimited) by shifting start and end numbers by an offset
# usage:
# offset=1.2 startline=6 perl -mEnv=startline,offset -anf ./shiftrest.pl timing02.txt
# Note: the **-an** options converts the perl script into a one-per-line with tab parsing into @F
# usage for text, e.g, '3c':
# offset=1.2 startline=$(grep -n -m 1 '3c' timing02.txt | cut -d: -f1) perl -mEnv=startline,offset -anf ./shiftrest.pl timing02.txt
# Note:
# $(grep -n -m 1 '3c' timing02.txt | cut -d: -f1)
# is bash magic to convert a search result into its line number
# grep -m 1
# makes sure you match only once i.e., 3c and not 3c, 13c & 43c

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
