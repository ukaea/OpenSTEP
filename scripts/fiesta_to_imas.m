%% Convert a Fiesta coilset and equilibrium .mat to IMAS IDS

path = "/common/step-simdb/simulations/aliases/SPP1_CML5_FBE";

%% 1. Load the files into Fiesta objects
load(fullfile(path, "CML5_EBCC_Equilibrium.mat")); % Contains equil
load(fullfile(path, "CML5_PFcoilset.mat")); % Contains coilset
configuration = fiesta_configuration('step', get(equil, 'grid'), coilset);

%% 2. Convert to IMAS objects
[equilibrium_ids, pf_active_ids, wall_ids] = equil2imas(equil, configuration, 0);

%% 3. Export
% Create a new handle on an IMASdb entry in HDF5 format (backend ID = 13)
% This will be at /home/vl0312/public/imasdb/step/3/123/456
ctx = imas_create_env_backend(123, 456, 'vl0312', 'step', '3', 13)

ids_put(ctx, 'equilibrium', equilibrium_ids);
ids_put(ctx, 'pf_active', pf_active_ids);
ids_put(ctx, 'wall', wall_ids);

imas_close(ctx);
