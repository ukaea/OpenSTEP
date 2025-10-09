"""Convert an HDF5 imas entry to NetCDF"""
import imas


# Fiesta outputs
dbentry_hdf5_format = imas.DBEntry("imas:hdf5?path=/home/vl0312/public/imasdb/step/3/1/1","r")
dbentry_nc_format = imas.DBEntry("STEP_SPP_001_freeboundary.nc", "w")

for ids in ["equilibrium", "wall", "pf_active"]:
    dbentry_nc_format.put(dbentry_hdf5_format.get(ids))

# Jetto outputs
dbentry_hdf5_format = imas.DBEntry("imas:hdf5?path=/home/vl0312/jetto/runs/runcontinue_smars_jul1023/imasdb/step/3/88888/2","r")
dbentry_nc_format = imas.DBEntry("STEP_SPP_001_transport.nc", "w")

for ids in ["core_profiles", "core_sources", "core_transport", "equilibrium", "ntms"]:
    dbentry_nc_format.put(dbentry_hdf5_format.get(ids))




