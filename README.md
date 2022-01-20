JUMP TO TRAILING WHITESPACE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

This plugin provides movement commands to quickly go to whitespace at the end
of each line. (Usually in order to remove it).

### SEE ALSO

This plugin leverages the superior detection and customization facilities of
the companion ShowTrailingWhitespace.vim plugin ([vimscript #3966](http://www.vim.org/scripts/script.php?script_id=3966)), though it
can also be used without it if you're not interested in highlighting and
customizing.

Instead of jumping and deleting each occurrence manually, you can use the
companion DeleteTrailingWhitespace.vim ([vimscript #3967](http://www.vim.org/scripts/script.php?script_id=3967)) plugin to strip off
the trailing whitespace with one command, or even have this done automatically
on each write.

USAGE
------------------------------------------------------------------------------

    ]$                      Go to [count] next occurrence of trailing whitespace.
    [$                      Go to [count] previous occurrence of trailing
                            whitespace.

    Normal, operator-pending, and visual mode mappings are defined, even though
    the latter two are typically less useful that the normal mode mappings. The
    'wrapscan' setting applies.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-JumpToTrailingWhitespace
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim JumpToTrailingWhitespace*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the CountJump plugin ([vimscript #3130](http://www.vim.org/scripts/script.php?script_id=3130)), version 1.70 or higher.
- The ShowTrailingWhitespace.vim plugin ([vimscript #3966](http://www.vim.org/scripts/script.php?script_id=3966)) complements this
  script, but is not required. With it, the jumps consider the whitespace
  exceptions for certain filetypes.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

To change the default mappings from ]$ to ]x, use:

    let g:JumpToTrailingWhitespace_Mapping = 'x'

To also change the [ / ] prefix to something else, follow the instructions for
CountJump-remap-motions. (This requires CountJump 1.60.)

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-JumpToTrailingWhitespace/issues or email
(address below).

HISTORY
------------------------------------------------------------------------------

##### 1.10    03-Sep-2012
- As the search obeys the 'wrapscan' setting, also issue corresponding
  "trailing whitespace search hit BOTTOM, continuing at TOP" wrap warning
  messages. This requires the enhanced CountJump plugin version 1.70.

##### 1.01    28-Mar-2012
- CHG: Change g:JumpToTrailingWhitespace\_mapping to
  g:JumpToTrailingWhitespace\_Mapping.
- Document changing of [ / ] prefix through new CountJump 1.60.

##### 1.00    16-Mar-2012
- First published version.

##### 0.01    07-Mar-2012
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2012-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
