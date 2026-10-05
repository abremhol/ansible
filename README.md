# ansible

Local workstation setup targeting Ubuntu 26.04 LTS (Resolute Raccoon).

Run the playbook on your workstation:

```sh
ansible-playbook --ask-become-pass local.yml
```

Or build the Ubuntu 26.04 container:

```sh
docker build -t ansible-ubuntu-26.04 .
```

Ubuntu compatibility:

- Ubuntu 24.04 and newer use `libfuse2t64` for FUSE 2 support.
- Ubuntu 26.04 uses `tealdeer`, which provides the `tldr` command.
- Functions Core Tools v4 uses Microsoft's Ubuntu 24.04 (Noble) repository on
  Ubuntu 26.04 because the Resolute repository does not currently contain
  `azure-functions-core-tools-4`. Azure CLI uses the native Resolute repository.
- Earlier Ubuntu releases retain their existing package and repository selection,
  except for the FUSE 2 package rename on Ubuntu 24.04.
