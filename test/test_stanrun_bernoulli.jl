using MCMCChains, Test

ProjDir = joinpath(dirname(@__FILE__), "..", "examples", "StanRun")
cd(ProjDir) do
  
  @testset "StanRun Bernoulli" begin

    isdir("tmp") &&
      rm("tmp", recursive=true);

    include(joinpath(ProjDir, "bernoulli.jl"))
  
    if rc == 0
      s = summarize(chns)
      @test s[:theta, :mean][1] ≈ 0.34 atol=0.1
    end

    isdir("tmp") &&
      rm("tmp", recursive=true);
  
  end # testset

end # cd
