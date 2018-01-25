using SortingLab
using Base.Test

N = 1_000_000
K = 100
# String sort
tic()
# const M=1000; const K=100; 
svec1 = rand([Base.randstring(rand(1:4)) for k in 1:N÷K], N);
@time res1 = radixsort(svec1)
@test issorted(res1)

# test sortperm
idx = fsortperm(svec1)
@test issorted(svec1[idx])

svec1 = rand([Base.randstring(rand(1:8)) for k in 1:N÷K], N);
@time res1 = radixsort(svec1)
@test issorted(res1)

# test sortperm
idx = fsortperm(svec1)
@test issorted(svec1[idx])

svec1 = rand([Base.randstring(rand(1:32)) for k in 1:N÷K], N);
@time res1 = radixsort(svec1)
@test issorted(res1)

@time res1 = radixsort(svec1, true)
@test issorted(res1, rev = true)

# test sortperm
idx = fsortperm(svec1)
@test issorted(svec1[idx])

@time sort!(svec1);
@test issorted(svec1)

svec1 = rand([string(rand(Char.(32:126), rand(1:8))...) for k in 1:N÷K], N);
@time radixsort!(svec1);
@test issorted(svec1)

svec1 = rand([string(rand(Char.(32:126), rand(1:16))...) for k in 1:N÷K], N);
@time radixsort!(svec1);
@test issorted(svec1)

svec1 = rand([string(rand(Char.(32:126), rand(1:24))...) for k in 1:N÷K], N);
@time radixsort!(svec1);
@test issorted(svec1)

svec1 = rand([string(rand(Char.(32:126), rand(1:32))...) for k in 1:N÷K], N);
@time radixsort!(svec1);
@test issorted(svec1)
toc()