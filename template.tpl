___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Parent Element Variable",
  "description": "Searches for the element with the specified attribute from the parent element of the Auto Event Variable, and returns the attribute value etc.",
  "securityGroups": [],
  "categories": [
    "UTILITY"
  ],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ],
  "brand": {}
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Use this variable to get information about an element that has a specified attribute value, etc., of the parent element of an Auto-Event Variable.",
    "name": "helpText",
    "type": "LABEL"
  },
  {
    "displayName": "",
    "name": "searchTarget",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "Link URL",
            "help": "href属性を取得します。",
            "value": "href"
          },
          {
            "displayValue": "Form Action",
            "value": "action"
          },
          {
            "displayValue": "ID",
            "value": "id"
          },
          {
            "displayValue": "Classes",
            "value": "class"
          },
          {
            "displayValue": "Any Attribute",
            "value": "custom"
          },
          {
            "displayValue": "HTML Tag Name",
            "value": "tagName"
          }
        ],
        "displayName": "Search target",
        "name": "searchAttr",
        "type": "SELECT",
        "subParams": [
          {
            "help": "Enter the attribute name to be searched.<br>\n<strong>Note</strong>: Attribute names containing \"-\" are not supported except for custom data attributes.",
            "enablingConditions": [
              {
                "paramName": "searchAttr",
                "type": "EQUALS",
                "paramValue": "custom"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "args": [
                  "(^data\\-.*|[^\\-]+)"
                ],
                "type": "REGEX"
              },
              {
                "args": [
                  "[\\w\\-]+"
                ],
                "type": "REGEX"
              }
            ],
            "displayName": "Attribute name",
            "name": "searchAttrName",
            "type": "TEXT",
            "valueHint": "e.g. data-gtm-XXX"
          },
          {
            "help": "Enter the HTML's tag name to be searched.",
            "enablingConditions": [
              {
                "paramName": "searchAttr",
                "type": "EQUALS",
                "paramValue": "tagName"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "args": [
                  "[a-zA-Z]+"
                ],
                "type": "REGEX"
              }
            ],
            "displayName": "HTML Tag name",
            "name": "searchTagName",
            "type": "TEXT",
            "valueHint": "e.g. div"
          }
        ]
      },
      {
        "enablingConditions": [
          {
            "paramName": "searchAttr",
            "type": "NOT_EQUALS",
            "paramValue": "tagName"
          }
        ],
        "defaultValue": false,
        "simpleValueType": true,
        "name": "searchFilter",
        "checkboxText": "Filtering attribute's value",
        "type": "CHECKBOX"
      },
      {
        "help": "One or more conditions are required. If there is more than one, it becomes And condition.",
        "enablingConditions": [
          {
            "paramName": "searchFilter",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Filtering rule",
        "name": "filteringRule",
        "simpleTableColumns": [
          {
            "selectItems": [
              {
                "displayValue": "contains",
                "value": "contain"
              },
              {
                "displayValue": "not contains",
                "value": "not-contain"
              },
              {
                "displayValue": "equals",
                "value": "equal"
              }
            ],
            "defaultValue": "contain",
            "displayName": "Operator",
            "name": "filterOperator",
            "type": "SELECT"
          },
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "",
            "displayName": "Value",
            "name": "filterValue",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE"
      }
    ]
  },
  {
    "displayName": "",
    "name": "getTarget",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "alwaysInSummary": false,
        "selectItems": [
          {
            "displayValue": "Searched attribute's value",
            "value": "searchAttr"
          },
          {
            "displayValue": "Other attribute's value",
            "value": "inputAttr"
          },
          {
            "displayValue": "Element Text",
            "value": "innerText"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "searchAttr",
            "type": "NOT_EQUALS",
            "paramValue": "tagName"
          }
        ],
        "displayName": "Get value",
        "defaultValue": "searchAttr",
        "simpleValueType": true,
        "name": "getValueDefault",
        "type": "SELECT",
        "subParams": [
          {
            "help": "Enter the attribute name to be got.<br> <strong>Note</strong>: Attribute names containing \"-\" are not supported except for custom data attributes.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "args": [
                  "(^data\\-.*|[^\\-]+)"
                ],
                "type": "REGEX"
              },
              {
                "args": [
                  "[\\w\\-]+"
                ],
                "type": "REGEX"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "getValueDefault",
                "type": "EQUALS",
                "paramValue": "inputAttr"
              }
            ],
            "displayName": "Attribute name",
            "simpleValueType": true,
            "name": "getAttrNameDefault",
            "type": "TEXT",
            "valueHint": "e.g. data-gtm-XXX"
          }
        ]
      },
      {
        "macrosInSelect": false,
        "alwaysInSummary": true,
        "selectItems": [
          {
            "displayValue": "Any attribute's value",
            "value": "inputAttr"
          },
          {
            "displayValue": "Element Text",
            "value": "innerText"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "searchAttr",
            "type": "EQUALS",
            "paramValue": "tagName"
          }
        ],
        "displayName": "Get value",
        "defaultValue": "inputAttr",
        "simpleValueType": true,
        "name": "getValueTagName",
        "type": "SELECT",
        "subParams": [
          {
            "help": "Enter the attribute name to be got.<br> <strong>Note</strong>: Attribute names containing \"-\" are not supported except for custom data attributes.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "args": [
                  "(^data\\-.*|[^\\-]+)"
                ],
                "type": "REGEX"
              },
              {
                "args": [
                  "[\\w\\-]+"
                ],
                "type": "REGEX"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "getValueTagName",
                "type": "EQUALS",
                "paramValue": "inputAttr"
              }
            ],
            "displayName": "Attribute name",
            "simpleValueType": true,
            "name": "getAttrNameTagName",
            "type": "TEXT",
            "valueHint": "e.g. data-gtm-XXX"
          }
        ]
      }
    ]
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "gtm.element.*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// -------- API required
const dataLayer = require('copyFromDataLayer');

// -------- Start Setting
// ---- Functions
// -- pattern data.search(get)Attr
const getElementBottom = function(target){
	if(target.indexOf('data-') === 0){	// For custom data attribute
		// Note: Since custom data attributes cannot be obtained with attributes, processing is branched.
		// Convert to camel case and get from dataset.
		return '.dataset.' + target.substring('data-'.length).split('-').map(function(text, index){
			if(index === 0){
				return text;
			}else{
				return text.charAt(0).toUpperCase() + text.substring(1);
			}
		}).join('');
	}else if(target === 'tagName'){	// For HTML tag name
		return '.tagName';
	}else if(target === 'innerText'){	// For element text
		return '.innerText';
	}else{	// For default action
		return '.attributes.' + target + '.value';
	}
};

// -- shorthand for search.top and search.parent
const getPath = function(){
	return search.top + search.parent;
};

// -- get return value
const getValue = function(){
	switch(data.getValueDefault || data.getValueTagName){	// Get data (searchAttr, inputAttr = getAttrName, innerText)
		case 'innerText':
			// Convert line breaks and tabs to single-byte spaces.
			return dataLayer(getPath() + search.getBottom).trim().split('\n').join(' ').split('\t').join('');
		default:
			return dataLayer(getPath() + search.getBottom) || undefined;
	}
};

// -- checked filter rule(OK = true、NG = false)
const checkFilter = function(targetValue){
	if(data.searchAttr !== 'tagName'){
		// Filters other than HTML tags
		return search.filter.rule.map(function(rule){	// Check the condition of each row.(OK = true, NG = false)
			switch(rule.filterOperator){
				case 'contain':
					return targetValue.indexOf(rule.filterValue) >= 0 ? true : false;
				case 'not-contain':
					return targetValue.indexOf(rule.filterValue) < 0 ? true : false;
				case 'equal':
					return targetValue === rule.filterValue ? true : false;
			}
		}).filter(function(check){	// Refine to NG (false) only
			return check === false;
		}).length === 0 ? true : false;	// true if false is 0, false if at least one
	}else{
		// HTML tag filter
		return search.filter.tagName.toUpperCase() === dataLayer(getPath() + search.searchBottom) ? true : false;
	}
};

// ---- Default Settings
// -- Search target
var search = {	// Temp for dataLayer specification of search target
	'top': 'gtm.element',
	'parent': '',
	'searchBottom': '',
	'getBottom': ''
};
// -- Adjust search target by choice
switch(data.searchAttr){	// Search target attribute name (href, action, id, class, custom, tagName)
	case 'custom':
		// For custom, refer to the name of another input field
		search.searchBottom = getElementBottom(data.searchAttrName);
		break;
	case 'tagName':
		// For tagName, refer to the name of another input field
		search.searchBottom = getElementBottom(data.searchAttr);
		search.filter = {'tagName': data.searchTagName};
		break;
	default:
		search.searchBottom = getElementBottom(data.searchAttr);
		break;
}
// -- Get search target filter
if(data.searchFilter){
	search.filter = {'rule': data.filteringRule};
}
// -- Get target
search.getBottom = search.searchBottom;	// Synchronize with search target
// -- Adjust search target by choice
switch(data.getValueDefault || data.getValueTagName){
	case 'inputAttr':
		search.getBottom = getElementBottom(data.getAttrNameDefault || data.getAttrNameTagName);
		break;
	case 'innerText':
		search.getBottom = getElementBottom(data.getValueDefault || data.getValueTagName);
		break;
}


// --------- Processing
// ---- Check back from the current location to the parent element
do{
	if(dataLayer(getPath() + search.searchBottom) !== undefined){
		// If the specified attribute exists
		if(!search.filter){
			// When there is no filter condition
			return getValue();
		}else if(checkFilter(dataLayer(getPath() + search.searchBottom))){
			// When there are filtering conditions
			return getValue();
		}
	}
	search.parent += '.parentElement';
}while(dataLayer(getPath() + '.tagName'));	// Finish when upper layer no longer exists

// ---- If the element is not found
return undefined;


___NOTES___

This memo is written in two languages: English and Japanese.
このメモは、英語と日本語の2つの言語で書かれています。

The first half is English and the second half is Japanese.
前半は英語で、後半は日本語です。

Both will have the same content.
両方とも同じ内容になります。

Thank you Google Translate!
Google翻訳ありがとう！


----------------------------------------------------------------
For English
----------------------------------------------------------------

This is a custom template that retrieves the parent element that matches the conditions up to the upper hierarchy and retrieves the value of the attribute (or included text) when retrieving data using Auto-Event Variables.
It is primarily intended to be used to get link information using a click (all elements) trigger, or to get attribute values of a parent block using a link click trigger.

●Operation overview
[flow]
1. Go back from the element of the automatic event variable to the parent element with the attribute specified in "Value to be acquired".
2. If the corresponding parent element is found, get the attribute value or the text of the entire parent element.
[Remarks]
-Not only the parent element but also the element of the current location will be searched.

● Memo
[Operating specifications]
-When "Element Text" is selected for "Get value", the following processing is performed instead of plain text.
-- Convert line feeds to single-byte spaces.
-- Delete tab.

[Technical note]
- Apparently, as of October 2019, regular expressions ("/ ～～ /") cannot be used in codes.
Therefore, it will be replaced with "split ('xxxx'). Join ('')".
- When gtm.element is specified in the global variable (copyFromWindow), it is described as "dataLayer [dataLayer.length-1] ['gtm.element']".
- When trying to get the attribute value with gtm.element. *. Attributes.XXXX.value. An error occurs if "-" is included.
  JS can be replaced with ".attributes [" XXXX "] .Value", but this description cannot be used.
  Thus, for attribute values ​​that begin with "data-", the conditional branch is executed so that the dataset is referenced instead of the attribute.
  In that case, conversion to camel case was necessary, so it was difficult to convert without using regular expressions.

[Improvements]
- I wanted to be able to get the element, but even if I got the dataLayer with a global variable (copyFromWindow) or tried to get it as a data layer variable (copyFromDataLayer) Could not get as.
  (It seems that the value of the end property can be referenced, but the property with child properties cannot be obtained)
Therefore, I gave up once.

● Editing history
[2019/10/11 (Update)] Ayudante, Inc.
- The following modifications were made with the aim of posting in the community template gallery.
-- Change Japanese to English.
-- Brush up code.
-- Add "Form Action" to search target.
-- Add "HTML Tag Name" to search target (specify tag name required).
-- When the search target is other than "HTML Tag Name", the value condition can be specified by "contain | not-contain | equal".
-- You can specify an attribute different from that specified for the search target in the acquisition target.

[2019/05/24 (New)] Ayudante, Inc.
https://ayudante.jp/column/2019-05-24/18-04/
- It was new registration.


----------------------------------------------------------------
For Japanese	日本語
----------------------------------------------------------------

自動イベント変数でデータ取得時に、条件に合致する親要素を上位階層へ遡って探し出し、任意の属性の値（または内包するテキスト）を取得するためのカスタムテンプレートです。
主にクリック（すべての要素）トリガーでリンク情報を取得したり、またはリンククリックトリガーで親ブロックの属性値を取得したりするための利用を想定しています。

●動作概要
【流れ】
1.自動イベント変数のelementから、「取得する値」で指定した属性を持つ親要素まで遡ります。
2.該当する親要素を見つけた場合に、属性の値または親要素全体のテキストを取得します。
【備考】
・親要素だけでなく、現在地のelementも検索対象となります。

●メモ
【動作仕様】
・「Get value」で「Element Text」を選択した場合、素のままのテキストではなく、以下の処理を行っています。
　　・改行を半角スペースへ変換
　　・タブを削除

【技術上のメモ】
・どうやら2019年10月現在、コード内では正規表現（「/～～/」）は使用できないようです。
　そのため、「split('～～').join('')」などで代替しています。
・gtm.elementをグローバル変数（copyFromWindow）で指定する場合は「dataLayer[dataLayer.length-1]['gtm.element']」という記述になります。
・gtm.element.*.attributes.XXXX.valueで属性値を取得しようとした場合、「-」を含むものはエラーになります。
　JSであれば「.attributes["XXXX"].value」で代替できますが、この記述は使用できないようです。
　そのため、「data-」で始まる属性値の場合は条件分岐させて、attributesではなくdatasetを参照するようにしました。
　なおその際、キャメルケースへの変換が必要だったため正規表現を使わずに（使えないので）変換大変でした。

【改善点】
・要素（element）の取得も可能にしたかったのですが、グローバル変数（copyFromWindow）でdataLayerを取得しても、データレイヤー変数（copyFromDataLayer）として取得しようとしても、いずれの場合でもgtm.elementをObjectとして取得することができませんでした。
　（どうやら末端プロパティの値は参照可能ですが、子プロパティを持つプロパティは取得できないようです）
　そのため、いったん諦めています。

●編集履歴
【2019/10/11（更新）】Ayudante, Inc.
・コミュニティテンプレートギャラリーへの掲載を目指して、以下の改修を行いました。
　　・日本語を英語へ変更
　　・コードのブラッシュアップ
　　・検索対象へ「Form Action」を追加
　　・検索対象へ「HTML Tag Name」を追加（要タグ名指定）
　　・検索対象へ「HTML Tag Name」以外の場合に「contain|not-contain|equal」で値の条件指定を可能に
　　・取得対象で検索対象で指定したものとは別の属性を指定可能に

【2019/05/24（新規作成）】Ayudante, Inc.
https://ayudante.jp/column/2019-05-24/18-04/
・新規登録しました。
