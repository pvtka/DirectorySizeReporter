# DirectorySizeReporter

A versatile R script designed for generating comprehensive reports on directory sizes within a file system. This utility is especially useful for administrators and users needing detailed insights into their directory and file sizes for cleanup, analysis, or auditing purposes.

## Features

- **Flexible Directory Reporting**: Generate size reports for any specified directory path.
- **Recursive Search**: Option to search directories recursively to any depth.
- **Pattern Matching**: Supports filtering of files or directories based on regular expressions.
- **Directory-Only Reporting**: Can be configured to report sizes of directories only, excluding files.
- **Customizable Depth Level**: Control the depth of recursive directory scanning to limit report scope.


### Usage

The main function to use is `sizeReport()`, which takes several parameters to customize its operation:

- `path`: The directory path to generate a report for.
- `patt`: Regular expression to filter files/directories. Defaults to ".*" to include everything.
- `dironly`: Boolean flag to indicate whether to report only directories (`TRUE`) or include files (`FALSE`). Defaults to `FALSE`.
- `level`: Specifies the depth of recursion. A value of `0` means no subdirectories are included, `Inf` means unlimited depth.

Example usage:

```R
source("DirectorySizeReporter.R")

# Generate a full report for the current directory, including all files and subdirectories
sizeReport(path = ".")

# Generate a report for all PNG files in a specific directory
sizeReport(path = "/path/to/directory", patt = "png$")

# Generate a directory-only report for a specific project folder, up to 1 level deep
sizeReport(path = "/path/to/project", dironly = TRUE, level = 1)
