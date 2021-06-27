using Random
include("secrets.jl")
# FLAG is defined in secrets

f(a::Float64) = 4*round(Int64, a,RoundDown)+1

f(a::Int64) = 2*a

function f(a::String)
    s = Vector{UInt8}(a)
    x = Random.randsubseq(1:length(s),0.5)
    y = setdiff(1:length(s),x)

    o = Vector{Any}(undef,length(s))
    o[x] = convert.(Float64,s[x])
    o[y] = convert.(Int64,s[y])

    f.(o)
end

println(f(FLAG))
# [204, 216, 389, 413, 493, 437, 234, 197, 465, 421, 224, 433, 205, 381, 401, 421, 213, 449, 209, 232, 198, 208, 381, 98, 461, 190, 209, 477, 202, 213, 193, 437, 405, 250]
# the above output was observed