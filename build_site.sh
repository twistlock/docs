#!/bin/bash
#
# This script builds the Prisma Cloud Compute static site
#

show_help() {
  echo "
Usage: build_site.sh [OPTIONS] [DOC_SOURCE]

build_site.sh builds the Prisma Cloud Compute static site.

OPTIONS:
  -r                            Populate release notes with CDN download links


DOC_SOURCE:
  path                          Path to AsciiDoctor doc source from the twistlock/docs repo

"
}


optspec=":r"
while getopts "${optspec}" opt; do
  case "${opt}" in
    r )
      publish_cdn_links=true
      ;;
    \?)
      show_help
      exit
      ;;
  esac
done
shift "$((OPTIND-1))"

readonly dst="output/"

if [ "$1" != "" ]; then
  echo "Building static site..."
else
  echo "Specify path to the cloned docs repo"
  exit 1
fi

# https://stackoverflow.com/questions/3643848/copy-files-from-one-directory-into-an-existing-directory
srcAdmin="$1""/admin_guide/."
srcRN="$1""rn/."
srcOps="$1""ops_guide/."
srcRefArch="$1""ref_arch/."
srcHistorical="$1""historical/."
srcTroubleshooting="$1""troubleshooting/."

# Delete previous build.
if [ -d "$dst" ]
then
  rm -rf "$dst"
fi

# Delete Python virtualenv.
pyenv uninstall -f build_site_env

# Create output dir.
mkdir "$dst"

# Set up Python env.
echo "Set up Python env"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenv 3.7.4 build_site_env
pyenv activate build_site_env
pip install -r requirements.txt

# Initialize a git repo.
cd "$dst"
git init
git config user.name "build"
git config user.email "<>"
cd ..

#
# ADMIN GUIDE (self-hosted)
#

# Copy admin guide files into place.
echo "Copy admin guide files"
cp -R "$srcAdmin" "$dst"
cp -R "files/." "$dst"

# Rename topic map file.
mv "$dst""_topic_map_compute_edition.yml" "$dst""_topic_map.yml"

# Fix up doc tree source files.
python format_fixup.py "$dst""_topic_map.yml"

# Commit files.
cd "$dst"
git add -A
git commit -q -m "Commit admin guide (Compute Edition)"

#
# ADMIN GUIDE (SaaS)
#

# The second distro needs its own index file in the main branch.
cp "index-main.html" "index-main2.html"
git add -A
git commit -q -m "Commit index file for SaaS book"

# Create a branch
git checkout -b pcee

# Commit files.
echo "Commit SaaS files"
git add -A
git commit -q -m "Commit admin guide (SaaS)"

#
# RELEASE NOTES
#

# Create a branch.
git checkout -b rn

# Copy files into place.
echo "Copy release notes files"
cd ..
cp -R "$srcRN" "$dst"
mv "$dst""_topic_map_static_site.yml" "$dst""_topic_map.yml"

# Fix adoc source files
python format_fixup.py "$dst""_topic_map.yml"
if [ "$publish_cdn_links" == "true" ]; then
  python rn_details.py "$dst""_topic_map.yml" "../../release_info.yml"
fi

# Commit files.
echo "Commit release files"
cd "$dst"
git add -A
git commit -q -m "Commit release notes"

#
# OPS GUIDE
#

# Create a branch.
git checkout -b ops

# Copy files into place.
echo "Copy Ops Guide files"
cd ..
cp -R "$srcOps" "$dst"

# Fix adoc source files
python format_fixup.py "$dst""_topic_map.yml"

# Commit files.
echo "Commit Ops Guide files"
cd "$dst"
git add -A
git commit -q -m "Commit Ops Guide"

#
# REFERENCE ARCHITECTURE
#

# Create a branch.
git checkout -b ref_arch

# Copy files into place.
echo "Copy Ref Arch files"
cd ..
cp -R "$srcRefArch" "$dst"

# Fix adoc source files
python format_fixup.py "$dst""_topic_map.yml"

# Commit files.
echo "Commit Ref Arch files"
cd "$dst"
git add -A
git commit -q -m "Commit Ref Arch"

#
# HISTORICAL
#

# Create a branch.
git checkout -b historical

# Copy files into place.
echo "Copy Historical files"
cd ..
cp -R "$srcHistorical" "$dst"

# Fix adoc source files
python format_fixup.py "$dst""_topic_map.yml"

# Commit files.
echo "Commit Historical files"
cd "$dst"
git add -A
git commit -q -m "Commit Historical"

#
# TROUBLESHOOTING
#

# Create a branch.
git checkout -b troubleshooting

# Copy files into place.
echo "Copy Troubleshooting files"
cd ..
cp -R "$srcTroubleshooting" "$dst"

# Fix adoc source files
#python format_fixup.py "$dst""_topic_map.yml"

# Commit files.
echo "Commit Troubleshooting files"
cd "$dst"
git add -A
git commit -q -m "Commit Troubleshooting"

# Generate the static site.
# asciibinder_pan package -l debug
echo "Generate static site"
git checkout master
asciibinder_pan package

cd "_package/main"
cp -R "../main2/enterprise_edition" "."

