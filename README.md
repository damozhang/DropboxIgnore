# DropboxIgnore
This is a tool for developers who use Dropbox,  which can help you ignore node_modules, vendor, or Pods conveniently.


## How to use it
```
> ./dropbox-ignore.sh ~/Developer/project
```
This command will ignore node_modules, vendor, or Pods if a package.json, composer.json, or Podfile be found in the directory you provide.

Also, it will automatically created a node_modules, vendor, or Pods if **necessary**.

## Use it like a system command

You can move it to /usr/bin, /bin,  or any path in your environment to execute it like a system command.

```
> mv dropbox-ignore.sh /bin/dropbox-ignore

> dropbox-ignore ~/Developer/project
```


## For a specific directory or file

If you just want to ignore a specific directory or file, you should use the following command which is from Dropbox official.
```
> xattr -w com.dropbox.ignored 1 "$filepath"
```
