# List of tags

Tags will be used for Financial reporting and application lifecycle
For relation with other referential (CMDB), key value is Application name
All Tags are set to all resources ; some tags are also set at resource group level

Application name        All environment     Key value between Azure and CMDB. Example : SITERN-P with format [application name]-[environment code]
Branch                  All environment     TOTAL Business Branch
Environment             All environment     Single character (Prod Qual Dev pReprod Integration Sandbox)
Application Lifetime    Only for Sandbox    End date
Maintenance Window      All environment     Default value : VM can be stopped or started at any timeOther value : maintenance windows in hour per week
Opening Hours           All environment     Default value : VM must be up 24/24 Hours, 7/7 days
Exploitation            All environment     Name of outsourcer (e.g. SIRUS).

# Naming resource group

Naming Syntax use the following rules :
    lower characters
    fixed size (no hyphen is used to separate significant strings)

Rg_name = 
    Cloud Prefix    2 char  : az, as
    Type            2 char  : rg
    Environment     1 char  : (p)rod, (q)ual, (d)ev, (p)reprod, (i)ntegration, (s)andbox
    Name            4 char  : environment code
