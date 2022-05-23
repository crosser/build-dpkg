# Build Debian Package

```yaml
on:
  push:
    branches:
      - master

jobs:
  build-deb:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - uses: crosser/build-dpkg
        id: build
        with:
          args: --unsigned-source --unsigned-changes

      - uses: actions/upload-artifact@v1
        with:
          name: ${{ steps.build.outputs.filename }}
          path: ${{ steps.build.outputs.filename }}
```
