using My-Julia-ML-Package
using Test

@testset "My-Julia-ML-Package.jl" begin
    # Write your tests here.
    @test sum_of_three(3,4,5) == 12
    @test sum_of_three(5,5,5) == 15
    @test sum_of_three(6,6,6) == 18
end
