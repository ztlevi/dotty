# base/macos

## Homebrew Backup

- Backup
  ```sh
  brew bundle dump --force --file="~/Library/Mobile Documents/com~apple~CloudDocs/PackageManagerLists/Brewfile"
  ```
- Restore
  ```sh
  brew bundle --file="~/Library/Mobile Documents/com~apple~CloudDocs/PackageManagerLists/Brewfile"
  ```
- Clean up
  ```sh
  brew bundle cleanup --file="~/Library/Mobile Documents/com~apple~CloudDocs/PackageManagerLists/Brewfile"
  ```
