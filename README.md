# flutter_chip_tags

Clip Styled Tags with TextFormField

## Getting Started

### Example
```dart
ChipTags(
  list: _myListCustom,
  chipColor: Colors.black,
  iconColor: Colors.white,
  textColor: Colors.white,
  decoration: InputDecoration(hintText: "Your Custom Hint"),
  keyboardType: TextInputType.text,
),
```    
## Properties

| Property        | Function                                                  |
| --------------- | --------------------------------------------------------  |
| list            | List<String> which you want to display as Tags.           |
| chipColor       | Sets Chip background color. By default it's Blue.         | 
| iconColor       | Sets Icon color. By default it's White.                   |
| textColor       | Sets Text color. By default it's White.                   |
| decoration      | It accepts InputDecoration to decorate TextFormField.     | 
| keyboradType    | It accepts TextInputType to set the keyboard layout.      |
  
## Example Demo
<img src="exampleDemo.GIF" height=500>
