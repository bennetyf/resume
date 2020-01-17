## **MY RESUME TEMPLATES**

### **Introduction**
---
This is the repo to store my personal resume template, including English and Chinese versions. In the English version, a cover letter is also included. The template is customized accordding to [Awesome CV](https://github.com/posquit0/Awesome-CV).

The basic structures and styles are kept unchanged, but the some parts of the original [class file](https://github.com/posquit0/Awesome-CV/blob/master/awesome-cv.cls) have been rewritten with fonts changed, and added the publication section template. All the fonts involved are self-contained in the fonts folder.

### **Preview**
---
* #### Resume English
|Sample Page 1|Sample Page 2|
|:-----:|:-----:|
|[![Resume Page 1](https://rawcdn.githack.com/bennetyf/resume/98b9bedffd3088bff3cc14d98508d6da5c306542/Samples/resume-sample-en-1.png)](https://rawcdn.githack.com/bennetyf/resume/8077c4cb0c4b521d837fea5b46571b858f09f5e0/Samples/resume-sample-en.pdf)|[![Resume Page 2](https://rawcdn.githack.com/bennetyf/resume/98b9bedffd3088bff3cc14d98508d6da5c306542/Samples/resume-sample-en-2.png)](https://rawcdn.githack.com/bennetyf/resume/8077c4cb0c4b521d837fea5b46571b858f09f5e0/Samples/resume-sample-en.pdf)|

* #### *Cover Letter*
|Sample Page|
|:-----:|
|[![Cover Letter](https://rawcdn.githack.com/bennetyf/resume/98b9bedffd3088bff3cc14d98508d6da5c306542/Samples/coverletter-sample-en-1.png)](https://rawcdn.githack.com/bennetyf/resume/8077c4cb0c4b521d837fea5b46571b858f09f5e0/Samples/coverletter-sample-en.pdf)|

### **How to Use**
---
#### *Build the Project*
A full TeX installation is required. You can choose to use [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/). Because the [*fontspec*](https://github.com/wspr/fontspec/) package is used, the project should be compiled using [XeTeX](https://tug.org/xetex/) or [LuaTeX](http://www.luatex.org/), where [XeTeX](https://tug.org/xetex/) is recommended. The build command is as follows:

```shell
$ xelatex resume.tex
```
This will output the final pdf file.

#### *Colors and Fonts*
The following colors are defined for the texts:

* *darktext* (HTML hex code: #414141);
* *text* (HTML hex code: #333333);
* *graytext* (HTML hex code: #5D5D5D);
* *lighttext* (HTML hex code: #999999);

,where the default text color is set as *text* and the following highlighting colors are defined:
* emerald (#00A388);
* skyblue (#0395DE);
* pink (#EF4089);
* lightpink (#FFB6C1);
* orange (#FF6138);
* nephritis (#27AE60);
* concrete (#95A5A6);
* darknight (#131A28);

[Fire Sans](https://fonts.google.com/specimen/Fira+Sans) font is selected as the default font for the body texts, and [Roboto](https://fonts.google.com/specimen/Roboto) font is for the headers. Several handwritten fonts are used to make the document less dull, such as [QTChanceryType](https://fontzone.net/font-details/qtchancerytype-bold), [Expletus Sans](https://fonts.google.com/specimen/Expletus+Sans)(for section titles), [Aladin](https://fonts.google.com/specimen/Aladin)(for job position), etc.

#### *Resume Environments*
* `\begin{cventries}\end{cventries}` is for the main set of all resume entries;
* `\begin{cvitems}[<bullet-type>]\end{cvitems}` is for the itemized environment of the description part in each entry, where the option argument is for the type of the bullets.
* `\begin{cvsubentries}\end{cvsubentries}` is for the set of resume subentries;
* `\begin{cvhonors}\end{cvhonors}` is for the honor section of the resume;
* `\begin{cvskills}\end{cvskills}` is for the skills section of the resume;
* `\begin{cvpubs}[<fontsize>, <label>, <series>, <start>, <indent>, <resume>]\end{cvpubs}` is for the publication section of the resume, where the option arguments define the fontsize, item label type, the counter name, the starting number, the indent, etc.

#### *Resume Commands*
* `\name[<prefix>]{<firstname>}{<middlename>}{<lastname>}` is for name definition;
* `\position{<jobtitle>}{<specialism>}` is for job position definition;
* `\makecvheader[<position>]` is for generating the header of the resume, including the name, job positon/specialism, address, and contacts;
* `\makecvfooter{<left>}{<center>}{<right>}` is for generating the footer of the resume with three parts. If any part is unnessasary, simply set leave it empty;
* `\cvsection[<section-icon>]{<section-title>}` is for making the main resume section, including an icon followed by the section title, which are both highlighted;
* `\cventry{<position>}{<title>}{<location>}{<date>}{<description>}` is for making the resume entry where the `<description>` includes a list using the environment `{cvitems}`;
* `\cvsubentry{<position>}{<title>}{<date>}{<description>}` is for making the resume subentry;
* `\cvhonor{<position>}{<title>}{<location>}{<date>}` is for making the resume honor section entries;
* `\cvskill{<type>}{<skillset>}` is for making the resume skill section entries, where `<type>` denotes the overall skillset and `<skillset>` is the listed details.
* `\itempub[<type>]{<href>}{<author>}{<title>}{<journal>}{<volume>}{<issue>}{<page-start>}{<page-end>}{<year>}` and `\itempub[<type>]{<href>}{<author>}{<title>}{<proceedings>}{<location>}{}{<page-start>}{<page-end>}{<year>}` are for defining publication entries. The first one is for formatting journal articles and the latter is for formatting the conference proceedings.

#### *Coverletter Environments*
* `\begin[<fontsize>,<top-margin>,<bottom-margin>,<header-margin>,<closing-margin>,<signature-margin>,<signature-pic>,<signature-width>,<signature-height>]{cvletter}\end{cvletter}` is for defining the body of the coverletter, including letter opening, letter content, and letter closing;
* `\begin{lettercontent}[<fontsize>,<width>,<height>,<top-margin>,<bottom-margin>]\end{lettercontent}` is for defining the cover letter textual contents;

#### *Coverletter Commands*
* `\recipient{<To whom this letter is for>}{<Address of the company>}`, `\letterdate{<date>}`, `\lettertitle{<applied position>}`, `\letteropening{<dear xxx>}`, `\letterclosing{<sincerely,>}`, `\letterenclosure[<attachment>]{<resume>}` is for defining the basic components of the cover letter;
* `\makeletteropening` is used inside the `cvletter` environment, where letter opening and letter title should be defined. The fontsize of the letter opening can be adjusted;
* `\makeletterclosing` is for letter closing, where the signature part can be selected from printed or graphical;
* `\lettersection{<section-title>}` is for the section title part of the cover letter;
* `\makeletterheader[<address-stretch>,<inner-margin>,<top-margin>,<bottom-margin>]` makes the cover letter header including the company address and date, where `<address-stretch>` denotes the line spacing of the company address;
* `\\makeletterenclosure[<fontsize>]` makes the enclosure of the cover letter where fontsize can be adjusted.
