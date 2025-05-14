# be - Bash Line Editor

A simple Bash-based line-oriented text editor for terminal usage. This script allows editing and managing text files line-by-line with numbered entries, making it ideal for quick note-taking, list editing, or structured text manipulation.

## Features

- Load an existing text file (or start blank)
- View and edit lines by number
- Insert or remove specific lines
- Clear, renumber, or reset the buffer
- Save changes back to file
- Interactive shell with minimal commands

## Usage

```bash
./be [filename]
````

If no filename is provided, a new temporary buffer is used (named `blank`).

### Commands

| Command       | Description                                     |
| ------------- | ----------------------------------------------- |
| `save`        | Saves all lines to the current file             |
| `list`        | Displays current content with line numbers      |
| `clr`         | Clears the screen (like `clear`)                |
| `ren`         | Renumbers the lines in steps of 10              |
| `new`         | Clears the entire buffer                        |
| `N text`      | Replaces/adds line number N with the given text |
| `N`           | Deletes line number N                           |
| *Other input* | Invalid command message shown                   |

### Examples

```bash
$ ./be notes.txt

10 First line
20 Second line
30 Another thought

> 20 Updated second line
> list
10 First line
20 Updated second line
30 Another thought
> save
Save notes.txt
```

## License

This project is licensed under the [MIT License](LICENSE).

## Author

Created by \vroby65 – feel free to contribute or fork!


