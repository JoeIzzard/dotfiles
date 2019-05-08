#!/bin/bash

# Install SSH!
echo "[SSH Installer] SSH Installation began..."

# Building Directory Structure
echo "[SSH Installer] Building Directory Structure"
mkdir -p ~/.ssh/Keys
touch ~/.ssh/known_hosts

addHostsLoop() {
    read -r -p "[SSH Installer] Would you like to add a host? [Y/N] " Response

    addHost(){
        # Call the New Host function
        ssh-gen

        # Loop?
        read -r -p "[SSH Installer] Would you like to add another host? [Y/N] " Response

        case "$Response" in
            Y|y)
                return 1
                ;;
            N|n)
                return 0
                ;;
            *)
                echo "[SSH Installer] Incorrect Character. Defaulting to No"
                return 0
                ;;
        esac
    }

    # Main Loop
    case "$Response" in
        Y|y)
            # Call the Loop function
            until addHost ; do : ; done
            return 0
            ;;
        N|n)
            echo "[SSH Installer] Adding no hosts"
            return 0
            ;;
        *)
            echo "[SSH Installer] Please only use the characters Y or N"
            return 1
            ;;
    esac
}

until addHostsLoop ; do : ; done

echo "[SSH Installer] Installation Complete"