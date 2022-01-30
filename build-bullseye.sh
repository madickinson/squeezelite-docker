#!/bin/bash

TAG_FAMILY="bullseye"
TAG_SL_VERSION="squeezelite-1.9.8"

TODAY=`date +%F`
echo "TODAY: "$TODAY

TAG_TODAY=$TAG_SL_VERSION"-"$TAG_FAMILY"-"$TODAY
echo "TODAY's tag: "$TAG_TODAY

TAG_INTERMEDIATE=$TAG_SL_VERSION"-"$TAG_FAMILY
echo "Intermediate tag: "$TAG_INTERMEDIATE

tags=($TAG_TODAY $TAG_INTERMEDIATE $TAG_FAMILY)

for tag in "${tags[@]}"; do
	docker build \
		--push \
		--platform linux/arm/v7,linux/amd64 \
		--build-arg BASE_IMAGE=debian:bullseye-20220125-slim \
		--build-arg DOWNLOAD_FROM_SOURCEFORGE=N \
		--tag giof71/squeezelite:$tag \
		.
done
