## Terrapin Mitigation in RHEL 8+

This bash script was made to mitigate the Terrapin vulnerability, CVE-2023-48795, through disabling of cryptographic keys. This method can be used if "kex-strict-c-v00@openssh.com" is not provided by clients or "kex-strict-s-v00@openssh.com" is absent in the server's reply. Otherwise, you may update to the latest version of your SSH implementations.