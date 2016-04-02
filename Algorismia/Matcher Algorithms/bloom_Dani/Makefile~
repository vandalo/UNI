#
# Open Bloom Filter Master MakeFile
# By Arash Partow - 2000
#
# URL: http://www.partow.net/programming/hashfunctions/index.html
#
# Copyright Notice:
# Free use of this library is permitted under the guidelines
# and in accordance with the most current version of the
# Common Public License.
# http://www.opensource.org/licenses/cpl1.0.php
#

COMPILER         = -c++
OPTIMIZATION_OPT = -O3
OPTIONS          = -pedantic-errors -ansi -Wall -Wextra -Werror -Wno-long-long $(OPTIMIZATION_OPT) -o
LINKER_OPT       = -L/usr/lib -lstdc++

BUILD+=bloom_filter_example01
BUILD+=bloom_filter_example02

all: $(BUILD)

bloom_filter_example01: bloom_filter.hpp bloom_parameters.hpp bloom_filter.cpp bloom_parameters.cpp main_bloom.cpp bloom_inout.hpp bloom_inout.cpp
	$(COMPILER) $(OPTIONS) bloom_filter_example01 main_bloom.cpp bloom_filter.cpp bloom_parameters.cpp bloom_inout.cpp $(LINKER_OPT)
	
bloom_filter_example02: bloom_filter.hpp bloom_parameters.hpp bloom_filter.cpp bloom_parameters.cpp bloom_filter_example02.cpp bloom_inout.hpp bloom_inout.cpp
	$(COMPILER) $(OPTIONS) bloom_filter_example02 bloom_filter_example02.cpp bloom_filter.cpp bloom_parameters.cpp bloom_inout.cpp $(LINKER_OPT)

clean:
	rm -f core *.o *.bak *stackdump *#

#
# The End !
#
