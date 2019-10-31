# parent-element-variable
This is a custom template that retrieves the parent element that matches the conditions up to the upper hierarchy and retrieves the value of the attribute (or included text) when retrieving data using Auto-Event Variables.  
It is primarily intended to be used to get link information using a click (all elements) trigger, or to get attribute values of a parent block using a link click trigger.  

## Operation overview
### flow
1. Go back from the element of the automatic event variable to the parent element with the attribute specified in "Value to be acquired".
2. If the corresponding parent element is found, get the attribute value or the text of the entire parent element.
### Remarks
  - Not only the parent element but also the element of the current location will be searched.

## Memo
### Operating specifications
- When "Element Text" is selected for "Get value", the following processing is performed instead of plain text.
  - Convert line feeds to single-byte spaces.
  - Delete tab.

### Technical note
- Apparently, as of October 2019, regular expressions ("/ ～～ /") cannot be used in codes.  
  Therefore, it will be replaced with "split ('xxxx'). Join ('')".
- When gtm.element is specified in the global variable (copyFromWindow), it is described as "dataLayer [dataLayer.length-1] ['gtm.element']".
- When trying to get the attribute value with gtm.element. *. Attributes.XXXX.value. An error occurs if "-" is included.  
  JS can be replaced with ".attributes [" XXXX "] .Value", but this description cannot be used.  
  Thus, for attribute values that begin with "data-", the conditional branch is executed so that the dataset is referenced instead of the attribute.  
  In that case, conversion to camel case was necessary, so it was difficult to convert without using regular expressions.  

### Improvements
- I wanted to be able to get the element, but even if I got the dataLayer with a global variable (copyFromWindow) or tried to get it as a data layer variable (copyFromDataLayer) Could not get as.  
  (It seems that the value of the end property can be referenced, but the property with child properties cannot be obtained)  
  Therefore, I gave up once.

## Editing history
### [2019/10/24 (Update)] Ayudante, Inc.
- To reduce the processing load, the number of dataLayer API calls has been reduced.
- Added "not equal" to the conditional operator to search.
- Memo format is adjusted to GitHub README format.

### [2019/10/11 (Update)] Ayudante, Inc.
- The following modifications were made with the aim of posting in the community template gallery.
  - Change Japanese to English.
  - Brush up code.
  - Add "Form Action" to search target.
  - Add "HTML Tag Name" to search target (specify tag name required).
  - When the search target is other than "HTML Tag Name", the value condition can be specified by "contain | not-contain | equal".
  - You can specify an attribute different from that specified for the search target in the acquisition target.

### [2019/05/24 (New)] Ayudante, Inc.
https://ayudante.jp/column/2019-05-24/18-04/
- It was new registration.
