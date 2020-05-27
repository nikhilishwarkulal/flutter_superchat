# flutter_superchat
Flutter Chatting Ui Template.

![](http://luckyapp.in/processserverluckypic/super.jpg)



### Chat Template Integration.

------------

Implement Chat Template with very minimal lines of code. Want to implement this in your project?





### Steps To Integrate it into your project .
------------
```dart
CustomChatTemplate(2,itemBuilder: (context,index){
	 return (index % 2 == 0) ?
		  LeftMessage(text: "Hey this auther is crazy",) :
		  RightMessage(text: "Indeed he is..!",);
	},
	onTap: (int index){
		print(index.toString());
	}
)

```

### Types Of Message You can Send .

------------
### Constructores CustomChatTemplate
```dart
(
	this.itemCount
	{this.itemBuilder,
	this.scrollController,
	this.onTap,
	this.onLongTap
});
```


#### LeftMessage and RightMessage uses following Constructors
```dart
({
	this.text,
	this.textColor,
	this.backgroundColor,
	this.fontSize,
	this.readText,
	this.tickImage,
	this.fontName
});
```

#### LeftImage and RightImage uses following Constructors
```dart
 ({
	 this.backgroundColor,
	 this.fontName,
	 this.tickImage,
	 this.readText,
	 this.image,
	 this.heroTag
 });
```
#### LeftVideo and RightVideo uses following Constructors
```dart
({
	this.backgroundColor,
	this.fontName,
	this.tickImage,
	this.readText,
	this.thumbNail,
	this.heroTag
});
```
#### Help.

------------

- You can email me to nikhilishwar2@gmail.com if any update or suggestion required and also support me with the improvement of this project.

