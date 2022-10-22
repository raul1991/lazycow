#!/bin/bash
set -e
set -x

_push_code() {
	local tag=$1
	git commit -a -m "[skip ci] Released v${tag}"
	git tag v"${tag}"
	git push --all
	git push origin v"${tag}"
}

_create_tarball() {
	local tar_file="$1"
	my_repo=$(basename "$PWD")
	(cd .. && tar -cf "${tar_file}" "${my_repo}/" && mv ${tar_file} "${my_repo}/")
	echo "$tar_file"
}

_upload_file() {
	local tar_file="$1"
	url=$(cat "${tar_file}" | curl --progress-bar --upload-file "-" "https://transfer.sh/${tar_file}" --insecure)
    echo "$url"
}

_create_tag() {
	# create tags
	major_version=$(cat lazy-cow.rb|grep version | awk '{print $2}'|sed -e 's/"//g'|awk '{split($0,arr,"."); print arr[1]}')
	minor_version=$(cat lazy-cow.rb|grep version | awk '{print $2}'|sed -e 's/"//g'|awk '{split($0,arr,"."); print arr[2]}')
	patch_version=$(cat lazy-cow.rb|grep version | awk '{print $2}'|sed -e 's/"//g'|awk '{split($0,arr,"."); print arr[3]}')
	tag=${major_version}.${minor_version}.$((patch_version + 1))
	echo "$tag"
}

do_release() {
	# generate a new tag
	local tag=$(_create_tag)
	# create a tarball
	local tar_file=$(_create_tarball "lazy-cow-${tag}-bin.tar.gz")
	# upload tarball
	# local url=$(_upload_file ${tar_file})
	# modify version and url for the release
	# replace url
	# read about the hack here - https://stackoverflow.com/a/44864004/1270865
	# sed -i.bak 's#url .*#url '\"${url}\"'#g' lazy-cow.rb && rm -f lazy-cow.rb.bak
	# replace version
	# sed -i.bak 's/version .*/version '\"${tag}\"'/g' lazy-cow.rb && rm -f lazy-cow.rb.bak
	# do a commit and push
	#_push_code $tag
	# Surprise!
	(/usr/games/fortune | /usr/games/cowsay) || true
}
[[ $OSTYPE == 'darwin'* ]] && echo "I wish this was a linux system... :(" || sudo apt-get install fortune cowsay
do_release
