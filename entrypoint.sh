#!/bin/sh
set -e
install_tool="apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes"
mk-build-deps --install --tool="${install_tool}" debian/control
dpkg-buildpackage $@
cd ..
filename=`ls *.deb | grep -v -- -dbgsym`
dbgsym=`ls *.deb | grep -- -dbgsym`
echo ::set-output name=filename::$filename
echo ::set-output name=filename-dbgsym::$dbgsym
mv $filename $dbgsym workspace/
