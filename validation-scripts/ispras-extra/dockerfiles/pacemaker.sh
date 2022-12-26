/bin/rm /etc/yum.repos.d/delorean.repo
/bin/yum-config-manager --add-repo https://kronosnet.org/builds/knet/centos-7-x86-64/master/latest/
/bin/yum-config-manager --add-repo https://kronosnet.org/builds/corosync/centos-7-x86-64/master/latest/
/bin/yum-config-manager --add-repo https://kronosnet.org/builds/libqb/centos-7-x86-64/master/latest/
/bin/yum-config-manager --add-repo https://kronosnet.org/builds/pacemaker/centos-7-x86-64/master/latest/
/bin/yum-config-manager --add-repo https://kronosnet.org/builds/fence-agents/centos-7-x86-64/master/latest/
/bin/yum-config-manager --add-repo https://kronosnet.org/builds/sbd/centos-7-x86-64/master-pcmk-master/latest/
/bin/yum-config-manager --add-repo https://kronosnet.org/builds/fence-virt/centos-7-x86-64/master/latest/

/bin/yum -y install epel-release
/bin/yum -y --nogpgcheck install libknet1 libnozzle1 libqb corosync pacemaker  amtterm fence-agents-all          fence-agents-amt-ws       fence-agents-apc          fence-agents-apc-snmp     fence-agents-bladecenter  fence-agents-brocade      fence-agents-cisco-mds    fence-agents-cisco-ucs    fence-agents-common       fence-agents-compute      fence-agents-drac5        fence-agents-eaton-snmp   fence-agents-emerson      fence-agents-eps          fence-agents-heuristics-ping fence-agents-hpblade      fence-agents-ibmblade     fence-agents-ifmib        fence-agents-ilo-moonshot fence-agents-ilo-mp       fence-agents-ilo-ssh      fence-agents-ilo2         fence-agents-intelmodular fence-agents-ipdu         fence-agents-ipmilan      fence-agents-kdump        fence-agents-mpath        fence-agents-redfish      fence-agents-rhevm        fence-agents-rsa          fence-agents-rsb          fence-agents-sbd          fence-agents-scsi         fence-agents-vmware-rest  fence-agents-vmware-soap  fence-agents-wti sbd fence-virt
