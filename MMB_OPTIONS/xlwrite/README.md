# xlwrite
Platform independent alternative for Matlab's ``xlswrite`` function

## Problem
Matlab's build in ``xlswrite`` only writes to xls and xlsx files on a Windows platform that has Excel installed. This is because it is using COM-objects which are only supported on Windows.

## Solution 
``xlwrite`` is a platform independent replacement for ``xlswrite``. It uses a java library, Apache POI, that allows to generate xls(x) files on any platform, including Linux and OS X. 

``xlwrite`` uses the same syntax as ``xlswrite``, making it easy to integrate and interchange in existing applications.

## How To

### Demo1
- Download or clone this repository: ```git clone https://github.com/adezegher/xlwrite.git```
- Open Matlab and navigate to the path containing this repository.
- Run demo1 from the Matlab command line: ``demo1_xlwrite.m`` 

### General usage
For correct operation of ``xlwrite``:
- Ensure you have Apache POI libraries extracted. Without the libraries xlwrite will not work!
- Ensure the Apache POI libraries are loaded before running ``xlwrite`` by adding following code before invoking ``xlwrite``:
```Matlab
javaaddpath('poi_library/poi-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-schemas-3.8-20120326.jar');
javaaddpath('poi_library/xmlbeans-2.3.0.jar');
javaaddpath('poi_library/dom4j-1.6.1.jar');
javaaddpath('poi_library/stax-api-1.0.1.jar');
```
-- *NOTE:* Change the paths to match the location of the ``poi_library`` folder!

## Supported Data Types
xlwrite supports following datatypes: 
- string 
- numerical 
- logical/boolean 
The type of data is kept in Excel: for example boolean data in matlab will be saved as boolean in Excel.

xlwrite also supports a combination of above datatypes in a cell array like for example: 
xlsData = {1 true 'text' false; 10 -12.5 6 false};