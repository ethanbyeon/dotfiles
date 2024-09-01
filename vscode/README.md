# EYB's VSCode Setup

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
