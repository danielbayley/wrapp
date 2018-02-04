WrApp
=====
Wrap any script as a macOS app.

[CLI]
-----
`wrapp script.*` [`--options`]

| Option | Long        | Description                    | Default                           |
|:-------|:------------|:-------------------------------|:----------------------------------|
| `-h`   | `--help`    | Print brief usage information. |                                   |
| `-v`   | `--version` | Print running version info.    |                                   |
| `-n`   | `--name`    | Specify a name for the app.    | Capitalised base name of script.  |
| `-o`   | `--output`  | Specify an output folder.      | Script folder.                    |
| `-i`   | `--icon`    | Specify a custom icon.         | `*.(icns\|png)` in script folder. |
| `-t`   | `--trash`   | Trash original script.         | false                             |

Examples
--------
~~~ sh
wrapp script.sh # Script.app
wrapp script.* --name "App Title" --icon icon/*.icns # App Title.app
~~~

Install
-------
with _[Homebrew]_:
~~~ sh
brew tap max-os/install #wrapp
brew install wrapp
~~~

or `npm install --global max-os/wrapp`.
This tiny command line tool does not require [node] or [npm], but can be included as a dependency:
~~~ js
// package.json
"dependencies": {
  "wrapp": "max-os/wrapp"
}
~~~

Part of _[maxOS]_.

License
-------
[MIT] © [Daniel Bayley]

[MIT]:              LICENSE.md
[Daniel Bayley]:    https://github.com/danielbayley

[maxos]:            http://max-os.github.io
[cli]:              help.txt

[homebrew]:         http://brew.sh
[npm]:              https://npm.im
[node]:             https://nodejs.org
