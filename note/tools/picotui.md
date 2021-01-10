<style>
    body{
    	font-size: 15pt;
    }
    h2{
        font-size: 28pt;
        font-weight: bold;
    }
    h3{
        font-size: 24pt;
        font-weight: bold;
    }
</style>

## picotui

### Initialization
```python
with Context():
    Screen.attr_color(C_WHITE, C_BLUE)
    Screen.cls()
    Screen.attr_reset()

    d = Dialog(x, y, width, height)
```

### Widgets

- WLabel
```python
WLable(str)
WLable(str, width)
```

- WFrame
```python
WFrame(width, height, str)
```

- WButton
```python
WButton(width, str)
```

- WCheckbox
```python
WCheckbox(str)
WCheckbox(str, choice)
```

- WRadioButton
```python
WRadioButton(list)
```

- WListBox
```python
WListBox(width, height, list)
```

- WPopupList
```python
WListBox(x, y, width, height)
WListBox(x, y, width, height, sel_items)
```

- WDropDown
```python
WDropDown(width, list)
```

- WTextEntry
```python
WTextEntry(width, str)
```

- WMultiEntry
```python
WMultiEntry(width, height, list)
```

- WComboBox
```python
WComboBox(width, str, list)
```

- WCompletionList
```python
WCompletionList(x, y, width, height, list)
```

- WAutoComplete
```python
WAutoComplete(str)
WAutoComplete(str, only_prefix)
```

### Action Listener
```python
w_checkbox_val = WLabel("", w=8)
d.add(30, 8, w_checkbox_val)

def checkbox_changed(w):
    # TODO
    # w is the widget that register this listener
    
w_checkbox.on("changed", checkbox_changed)
```

### Reference
[github](https://github.com/pfalcon/picotui)
