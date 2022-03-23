# DropboxIgnore
This is a tool for developers who use Dropbox,  which can help you ignore node_modules, vendor, or Pods conveniently.


## Dropbox for macOS 12
Having updated Dropbox to the latest beta version, I noticed `xattr -w com.dropbox.ignored 1 {path}` does not work.

Something has been changed:
- The Dropbox directory has been moved to `~/Library/CloudStorage/Dropbox` (You can find it in `~/.dropbox/info.json`)
- Use `xattr -w com.apple.fileprovider.ignore#P 1 {path}` to ignore file or directory


## How to use it
```
> ./dropbox-ignore.sh ~/Dropbox/project
```
This command will ignore node_modules, vendor, or Pods if a package.json, composer.json, or Podfile be found in the directory you provide.

Also, it will automatically created a node_modules, vendor, or Pods if **necessary**.

## Use it like a system command

You can move it to /usr/bin, /usr/local/bin, /bin, ~/bin,  or any path in your environment to execute it like a system command.

```
> sudo mv dropbox-ignore.sh /usr/local/bin/dropbox-ignore

> dropbox-ignore ~/Dropbox/project
```


## For a specific directory or file

If you just want to ignore a specific directory or file, you should use the following command which is from Dropbox official.
```
> xattr -w com.dropbox.ignored 1 ~/Dropbox/project/node_modules
```

## Notice

This script was only tested on MacOS 11.4.
