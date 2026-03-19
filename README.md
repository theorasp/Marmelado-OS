# Installation Instructions

## Teil 1: Downloading the ISO

To get started, simply download the pre-built ISO of Marmelado OS from the [releases page](https://github.com/theorasp/Marmelado-OS/releases).

## Teil 2: Writing the ISO to USB

### For Linux Mint:

1. Install Balena Etcher from the official website.
2. Open Balena Etcher.
3. Select the downloaded ISO file.
4. Choose your USB stick as the target.
5. Click "Flash" and wait for the process to complete.

### For Windows:

1. Download Balena Etcher from the official website.
2. Launch Balena Etcher.
3. Select the ISO file you have downloaded.
4. Choose the USB stick as the destination.
5. Click on "Flash" and let the tool do its work.

### For macOS:

1. Download Balena Etcher from the official website.
2. Start Balena Etcher.
3. Select your downloaded ISO file.
4. Select the USB stick as the destination.
5. Click on "Flash" and wait until the process is done.

Alternatively, you can use the `dd` command in the terminal:
```
# Replace /dev/sdX with your USB device
sudo dd if=/path/to/your.iso of=/dev/sdX bs=4M && sync
```

Make sure to replace `/path/to/your.iso` with the actual path of the ISO file and `/dev/sdX` with your USB device path.

After writing the ISO to your USB stick, it's ready to use!