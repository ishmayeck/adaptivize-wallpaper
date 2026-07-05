# adaptivize-wallpaper

Turn a directory of light/dark image pairs into adaptive wallpapers for both
**macOS** (a single light/dark `.heic`) and **KDE Plasma** (a wallpaper package
with a light/dark cross-fade).

Each wallpaper lives in its own directory containing two images: one whose
filename contains `dark` or `night` (the dark variant) and one that does not
(the light variant). Outputs are collected under a shared `out/` tree so they
are easy to bulk-copy:

```
out/macos/<name>.heic
out/kde/<name>/          # metadata.json + contents/
```

## Install

```sh
make install        # symlink into ~/.local/bin (updates when you git pull)
make install-copy   # or drop a static copy there instead
make uninstall      # remove it
```

Override the location with `make install BINDIR=/usr/local/bin`. Ensure the
target directory is on your `PATH`.

Requires: `heif-enc` (libheif), `exiv2`, `identify` (ImageMagick), `python3`.

## Usage

Run it from the directory that holds your wallpaper folders.

```sh
adaptivize-wallpaper                 # build every wallpaper dir here, skipping
                                      #   ones already built (except `out`)
adaptivize-wallpaper --force         # rebuild everything, even if already built
adaptivize-wallpaper wave interfold  # build only the named dir(s)
adaptivize-wallpaper --help          # usage
```

A wallpaper is considered already built when both its `out/macos/<name>.heic`
and `out/kde/<name>/metadata.json` exist. Each directory is processed in
isolation, so a malformed one is reported and skipped without aborting the run.

Bulk-install the generated KDE packages:

```sh
cp -r out/kde/* ~/.local/share/wallpapers/
```
