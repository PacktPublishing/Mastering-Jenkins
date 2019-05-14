#!/usr/bin/expect –f

# -------------------------------------------
# Example Expect Script to allow Ansible
# To create authorized keys entry 
# in target server and facilitate the
# execution of a playbook on that server without
# asking for a username and password each time
# -------------------------------------------

# Get the Target IP address (to connect to and own) 
set nodehostname [lindex $argv 0];

# Attempt to use ssh-copy-id to connect to the target without th need for a password 
spawn ssh-copy-id BUILD@$nodehostname
expect {
    ")?"   {send "yes\n";     exp_continue}
    word:  {send "BUILD123\n"; exp_continue}
    eof
}

# Next attempt to ssh to the target as user and alter the root password
spawn ssh BUILD@$nodehostname -t "sudo passwd root"
expect {
  BUILD: { send "BUILD\n";

              expect {
               password: {send "BUILD123\n";
                exp_continue
              }}

  }
}

# Finally attempt to ssh-copy-id for root so no password is needed
spawn ssh-copy-id root@$nodehostname
expect {
    ")?"   {send "yes\n";     exp_continue}
    word:  {send "BUILD123\n"; exp_continue}
    eof
}

