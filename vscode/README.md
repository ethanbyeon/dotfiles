# EYB's VSCode Setup

[Back to Main README](../README.md)

## Backup Current Setup

> [!IMPORTANT]
> Back up your VSCode settings before changing them, so you can restore them if needed.
>
> #### macOS
> ```bash
> cp -r "$HOME/Library/Application Support/Code/User" "$HOME/Library/Application Support/Code/User.bak"
> ```
> #### Linux
> ```bash
> cp -r "$HOME/.config/Code/User" "$HOME/.config/Code/User.bak"
> ```
> #### Windows
> ```bash
> cp -r "%APPDATA%\Code\User" "%APPDATA%\Code\User.bak"
> ```

### Restore Backup (if needed)
> [!TIP]
> <details>
> <summary>To revert to your original configuration, restore the backup by copying it back to its original location:</summary>
>
> #### macOS
> ```bash
> cp -r "$HOME/Library/Application Support/Code/User.bak" "$HOME/Library/Application Support/Code/User"
> ```
> #### Linux
> ```bash
> cp -r "$HOME/.config/Code/User.bak" "$HOME/.config/Code/User"
> ```
> #### Windows
> ```bash
> cp -r "%APPDATA%\Code\User.bak" "%APPDATA%\Code\User"
> ```
> </details>

## Installation

Replace your existing configuration files with `keybindings.json` and `settings.json` in the VSCode User folder.

#### macOS
```bash
cp -i keybindings.json settings.json "$HOME/Library/Application Support/Code/User"
```

> [!IMPORTANT]
> Restart or reload VSCode to ensure the changes are applied.

## Keybindings

<details>
<summary>Click to view keybindings</summary>

### VIM
| KEY       | COMMAND                                  | MODE
| --------- | ---------------------------------------- | ------- |
| leader e  | workbench.action.toggleSidebarVisibility | NORMAL
| leader q  | workbench.action.closeActiveEditor       | NORMAL
| leader ff | workbench.action.quickOpen               | NORMAL
| leader k  | editor.action.showHover                  | NORMAL
| leader ca | editor.action.quickFix                   | NORMAL
| ]d        | editor.action.mark.next                  | NORMAL
| [d        | editor.action.mark.prev                  | NORMAL
| leader c  | editor.action.commentLine                | VISUAL

### Explorer
| KEY            | COMMAND                         | WHEN
| -------------- | ------------------------------- | ------- |
| ctrl+e         | workbench.action.toggleSidebarVisibility <br> workbench.files.action.focusFilesExplorer  | editorTextFocus
| a              | explorer.newFile                | filesExplorerFocus && !inputFocus
| r              | renameFile                      | filesExplorerFocus && !inputFocus
| c              | filesExplorer.copy              | filesExplorerFocus && !inputFocus
| p              | filesExplorer.paste             | filesExplorerFocus && !inputFocus
| d              | deleteFile                      | filesExplorerFocus && !inputFocus

### Navigation
| KEY            | COMMAND                                | WHEN
| -------------- | -------------------------------------- | ------- |
| tab            | workbench.action.nextEditor            | editorTextFocus && vim.active && vim.mode != 'Insert'
| shift+tab      | workbench.action.previousEditor        | editorTextFocus && vim.active && vim.mode != 'Insert'
| ctrl+h         | workbench.action.focusLeftGroup        | editorTextFocus && vim.active && vim.mode != 'Insert'
| ctrl+h         | workbench.explorer.fileView.focus      | editorTextFocus && vim.active && vim.mode != 'Insert' && activeEditorGroupIndex == 1 && explorerViewletVisible
| ctrl+l         | workbench.action.focusRightGroup       | editorTextFocus && vim.active && vim.mode != 'Insert'
| ctrl+l         | workbench.action.focusFirstEditorGroup | filesExplorerFocus

### Selection
| KEY            | COMMAND                                    | WHEN
| -------------- | ------------------------------------------ | ------- |
| tab            | selectNextSuggestion                       | editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible
| tab            | workbench.action.quickOpenNavigateNext     | inQuickOpen
| shift+tab      | selectPrevSuggestion                       | editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible
| shift+tab      | workbench.action.quickOpenNavigatePrevious | inQuickOpen
</details>
