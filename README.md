# JSONParser
JSON parser in Swift for easy access to JSON data

## Introduction
JSONParser is a simple light-weight parser that helps retrieve the data you want from a JSON data. This is achieve by applying syntactic sugar to on the Collection Objects extracted from the JSON data.
 I hope this readme will be as lightweight as this entire project. It works well with both network data calls as well as reading from a local json file.
 
 **Requirements: Xcode 6.1 and iOS 7.0 or above**
 
## Installation
Just save [JSONParser.swift](https://raw.githubusercontent.com/geekveek/JSONParser/master/JSONParser/JSONParser.swift) and drop it into your xcode project.

## Usage
`>>>` is the main infix operator that is used throughout the reading of the JSON Data. It returns an Optional AnyObject. If there is any error, it will return nil.

### A Simple Example ###
Contents of jsonDict.json
<pre><code>
{
  "Some Key":"Hi there. I'm stored in some key"
}
</code></pre>

To extract out the data,
<pre><code>
let path = NSBundle.mainBundle().pathForResource("jsonDict", ofType:"json")
let data = NSData(contentsOfFile:path!)
let someKeyData: NSString? = (data >>> "Some Key") as? NSString
println(someKeyData) //This will print Optional("Hi there. I'm stored in some key")
</code></pre>
### Features
1. Use it to extract data from dictionary directly from NSData object (as shown in example above)
2. Use it to extract data from array directly from NSData object

Contents of jsonArr.json:
<pre><code>
[
  "Item 0",
  "Item 1",
  "Item 2"
]</code></pre>
To extract out the data,
<pre><code>
let path = NSBundle.mainBundle().pathForResource("jsonArr", ofType:"json")
let data = NSData(contentsOfFile:path!)
let someKeyData: NSString? = (data >>> 1) as? NSString
println(someKeyData) //This will print Optional("Item 1")
</code></pre>
3. Use it to extract arrays or dictionaries from other arrays or dictionaries, in a chain

Contents of jsonMix.json: (example from <http://json.org/example>)
<code><pre>
{
  "glossary": {
    "title": "example glossary",
		"GlossDiv": {
      "title": "S",
		  "GlossList": {  
		    "GlossEntry": {
		      "ID": "SGML",
		      "SortAs": "SGML",
		      "GlossTerm": "Standard Generalized Markup Language",
		      "Acronym": "SGML",
		      "Abbrev": "ISO 8879:1986",
		      "GlossDef": {
		        "para": "A meta-markup language, used to create markup languages such as DocBook.",
		        "GlossSeeAlso": ["GML", "XML"]
		      },
		      "GlossSee": "markup"
		    }
		  }
		}
  }
}
</code></pre>
To get the first item of GlossSeeAlso:
<pre><code>
let path = NSBundle.mainBundle().pathForResource("jsonMix", ofType:"json")
let data = NSData(contentsOfFile:path!)
let someKeyData:AnyObject? = data >>> "glossary" >>> "GlossDiv" >>> "GlossList" >>> "GlossEntry" >>> "GlossDef" >>> "GlossSeeAlso" >>> 0
println(someKeyData as? NSString) //This will print Optional("GML")
</code></pre>
4. Use it to extract data from NSDictionary or NSArray //This is not a main feature. But it can be used this way.
<pre><code>
let arr = NSArray(array: ["Item 0","Item 1","Item 2"])
println((arr >>> 0) as? NSString) // Optional("Item 0")
let dict = NSDictionary(dictionary:["Some Key":"Hi there. I'm stored in some key"])
println((dict >>> "Some Key") as NSString) //Optional("Hi there. I'm stored in some key")
</code></pre>
