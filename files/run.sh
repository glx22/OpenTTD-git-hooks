#!/bin/sh

set -e

echo ""
echo "Validating commits"
echo ""

TARGET_BRANCH=master
if [ -n "${GITHUB_BASE_REF}" ]; then
	TARGET_BRANCH=${GITHUB_BASE_REF}
fi

is-on-top-of-master.sh
echo "Branch is on top of ${TARGET_BRANCH}"

HOOKS_DIR=/git-hooks GIT_DIR=.git /git-hooks/check-commits.sh origin/${TARGET_BRANCH}..HEAD
echo "Commit checks passed"
