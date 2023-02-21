![example workflow](https://github.com/bin2bin-applications/qbittorrent/actions/workflows/docker-image.yml/badge.svg)

<h1 id="app:name">qBittorrent</h1>

<img id="app:logo" src="https://cdn.jsdelivr.net/gh/bin2bin-applications/qbittorrent@master/logo.png" width="180" height="180"></img>

## Developer

<p>Click <a id="app:developer" href="https://www.qbittorrent.org/">here</a> to go to developer site</p>

## Description
<p id="app:short-description">Open-source software alternative to µTorrent</p>

<p id="app:long-description">The qBittorrent project aims to provide an open-source software alternative to µTorrent. qBittorrent is based on the Qt toolkit and libtorrent-rasterbar library.</p>

## Supported Architectures

The architectures supported by this image are:

| Architecture | Available | Tag    |
| :----------: | :-------: | ------ |
|    x86-64    |    ✅     | latest |

## Version Tags

The version tags available for this image are:

|  Tag   | Available | Description                           |
| :----: | :-------: | ------------------------------------- |
| latest |    ✅     | Stable releases with Ubuntu baseimage |

## Docker Pull

```bash
docker pull ghcr.io/bin2bin-applications/qbittorrent:latest
```

## Docker Run

```bash
docker run -d -p 8080:8080 ghcr.io/bin2bin-applications/qbittorrent:latest
```