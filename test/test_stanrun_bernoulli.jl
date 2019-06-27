using CmdStan, MCMCChains, Test

ProjDir = joinpath(dirname(@__FILE__), "..", "examples", "StanRun")
cd(ProjDir) do
  
  @testset "StanRun Bernoulli" begin

    isdir("tmp") &&
      rm("tmp", recursive=true);

    include(joinpath(ProjDir, "bernoulli.jl"))
  
    isdir("tmp") &&
      rm("tmp", recursive=true);
  
  end # testset

end # cd
