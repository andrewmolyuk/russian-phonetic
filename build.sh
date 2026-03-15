#!/bin/bash
set -e


BUNDLE_PATH="RussianPhonetic.bundle"
DMG_NAME="RussianPhonetic.dmg"
VOL_NAME="Russian Phonetic Installer"
WINDOW_SIZE="500 200"
WINDOW_POS="470 350"
ICON_SIZE=80
BUNDLE_ICON_POS="100 100"
ALIAS_NAME="Keyboard Layouts"
ALIAS_ICON_POS="350 100"


# Clean up any previous build
rm -f "$DMG_NAME"
rm -rf tmp-dmg
rm -f "$ALIAS_NAME"
mkdir tmp-dmg
cp -R "$BUNDLE_PATH" tmp-dmg/

# # Create alias to /Library/Keyboard Layouts
ln -s /Library/Keyboard\ Layouts "$ALIAS_NAME"
cp -R "$ALIAS_NAME" tmp-dmg/


create-dmg \
  --volname "$VOL_NAME" \
  --window-size $WINDOW_SIZE \
  --window-pos $WINDOW_POS \
  --icon-size $ICON_SIZE \
  --icon "$BUNDLE_PATH" $BUNDLE_ICON_POS \
  --icon "$ALIAS_NAME" $ALIAS_ICON_POS \
  "$DMG_NAME" \
  tmp-dmg


rm -rf tmp-dmg
rm -f "$ALIAS_NAME"
