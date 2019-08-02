using CmdStan
ProjDir = @__DIR__
cd(ProjDir)

stream = open("my_model.stan", "r")
model = read(stream, String)
close(stream)

stanmodel = Stanmodel(Sample(save_warmup=true, num_warmup=1000,
  num_samples=2000, thin=1), name="include_functions_model", model=model,
  printsummary=false)

observeddata = Dict("N" => 10, "y" => [0, 1, 0, 1, 0, 0, 0, 0, 0, 1])

rc, chns, cnames = stan(stanmodel, observeddata, ProjDir,CmdStanDir=CMDSTAN_HOME)
