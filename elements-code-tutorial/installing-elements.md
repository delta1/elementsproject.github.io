---
layout: page
title: Installing Elements
permalink: /elements-code-tutorial/installing-elements
---

# Elements code tutorial

## Installing Elements

To run this tutorial, you will need to have the elements executables installed locally. 

Elements can be installed from packages, or [built and run locally from the source code.](building-elements-from-source)

Signed elements packages are published with each release on [Github](https://github.com/elementsproject/elements/releases).

For this tutorial, you will need to download the latest `.tar.gz` or `.zip` file for your platform.
You should also download the `SHA256SUMS.asc` file, in order to verify the integrity of the package.

The file extensions for each platform are as follows:

| Platform | Package Extension |
| -------- | --------  |
| Linux 64-bit on Intel or AMD | `-x86_64-linux-gnu.tar.gz` |
| macOS (Intel and Apple Silion) | `-osx-64.tar.gz` |
| Windows 64-bit | `-win64.zip` |
| 64-bit Raspberry Pi and 64 bit ARM Linux | `-aarch64-linux-gnu.tar.gz` |

Note that if you are following this tutorial on a Windows computer, you will need to have a version of bash for Windows.

Once you have downloaded the package and the `SHA256SUMS.asc` file, verify the package hash. For example, on Linux:

```
$ sha256sum --ignore-missing --check SHA256SUMS.asc 
elements-elements-0.21.0.2-x86_64-linux-gnu.tar.gz: OK
sha256sum: WARNING: 19 lines are improperly formatted
```

You can verify the gpg signature of the hashes as follows:

```
$ gpg --keyserver keyserver.ubuntu.com --recv-keys BD0F3062F87842410B06A0432F656B0610604482
gpg: key 2F656B0610604482: public key "Pablo Greco <pgreco@blockstream.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1

$ gpg --verify SHA256SUMS.asc 
gpg: Signature made Mon 13 Apr 2026 06:06:31 PM CEST
gpg:                using RSA key BD0F3062F87842410B06A0432F656B0610604482
gpg: Good signature from "Pablo Greco <pgreco@blockstream.com>" [unknown]
gpg:                 aka "Pablo Greco <psgreco@gmail.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: BD0F 3062 F878 4241 0B06  A043 2F65 6B06 1060 4482
```

Extract the archive, and copy the `elementsd`, `elements-cli`, and `elements-qt` executables to `/usr/local/bin`.

Check that you can run the packages, using the `-version` option:


```
$ elementsd -version
Elements Core version elements-0.21.0.2
...

$ elements-cli -version
Elements Core RPC client version elements-0.21.0.2
```

You are now ready to proceed with the tutorial.


[Next: Setting up your working environment]({{ site.url }}/elements-code-tutorial/working-environment)

