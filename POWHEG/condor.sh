executable          = submitscript.sub
## # switch to either transfer the executable per job to the node
# # or from the shared storage for all jobs (don't touch during your job upstart!)
transfer_executable = True
universe            = vanilla
output              = submitscript_$(Cluster)_$(Process).out
error               = submitscript_$(Cluster)_$(Process).out
log                 = submitscript_$(Cluster)_$(Process).log
should_transfer_files   = IF_NEEDED
when_to_transfer_output = ON_EXIT
environment = "CLUSTER=$(Cluster) SGE_TASK_ID=$(Process)"
##########################
# job requirements       #
# special requirements as nly nodes with specific linux flavours
# e.g., requesting a node, that runs either with ScientificLinuc 6 or with CentOS 7
#
#requirements            = (OpSysAndVer == "SL6" || OpSysAndVer == "CentOS7")
requirements            = (OpSysAndVer == "SL6" )
#requirements            = (OpSysAndVer == "CentOS7" )
#
# maximum memory in MB; a job gets killed by the system when exceeding the request and the node has no spare memory
# default is 1536M and jobs requesting > 2048 get more hit in the fairshare calculation
#
RequestMemory = 1024
#
# max run time in seconds for a job, after it gets killed by the system
# if not set, default is 3 hours
# longer requested job run times get more hit in the fairshare calculation
#
# 1h
#+RequestRuntime     = 3600
# 168h=7days
#+RequestRuntime     = 604800
# 30h
#+RequestRuntime     = 108000
# 24 h
+RequestRuntime     = 86400
##
#
##########################
#queue 4000
queue 1

