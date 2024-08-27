#!/bin/bash

make_pmod() {
	# Declare local variables for file name and path
	local policy_file="CVE-2023-48795.pmod"
    local policy_path="/etc/crypto-policies/policies/modules/$policy_file"

	# Create the policy module
    echo -e "cipher@SSH = -CHACHA20-POLY1305\nssh_etm = 0" > "$policy_file"

	# Move the policy to the directory
    if mv "$policy_file" "$policy_path"; then
        echo "Policy module created at $policy_path"
    else
        echo "Failed to move the policy module to $policy_path" >&2
        exit 1
    fi
		
	# Update the policy with the new module
	update-crypto-policies --set $(update-crypto-policies --show):CVE-2023-48795
	
	# Restart the SSH service
    if systemctl restart sshd; then
        echo "SSHD service restarted successfully."
    else
        echo "Failed to restart SSHD service." >&2
        exit 1
    fi

}
#Execute
make_pmod

