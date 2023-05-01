# mediainfo-docker

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/MCOfficer/mediainfo-docker/docker-publish.yml)
![MediaInfo Version](https://ghcr-badge.egpl.dev/mcofficer/mediainfo-docker/latest_tag?ignore=sha-*,master,latest&label=MediaInfo%20version)
![Image Size](https://ghcr-badge.egpl.dev/mcofficer/mediainfo-docker/size?tag=latest)

```shell
$ docker run --rm -v "${PWD}:/input" ghcr.io/mcofficer/mediainfo-docker my_media.mkv
```

A tiny, always-uptodate [MediaInfo](https://mediaarea.net/en/MediaInfo) image.

---

Always pull new versions:
```shell
$ docker run --rm -v "${PWD}:/input" --pull always ghcr.io/mcofficer/mediainfo-docker my_media.mkv
```

Or stick to a specific MediaInfo version:
```shell
$ docker run --rm -v "${PWD}:/input" ghcr.io/mcofficer/mediainfo-docker:23.04 my_media.mkv
```
