%% Start of file `cv-styles.cls'.
% CV Style Class File
%
% This class has been modified from the awesome cv class file:
% https://github.com/posquit0/Awesome-CV/awesome-cv.cls
%
% Author:
% Mr.Feng Yuan
% <bennetyf@gmail.com>
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{cv-styles}[2020/01/10 v0.0.1 CV Styles Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage[inline]{enumitem}
\setlist[itemize]{leftmargin=*}
\setlist[enumerate]{labelsep=*, leftmargin=*, nosep}
% Needed to define new environment
\RequirePackage{environ}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}

% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Needed to parse key-value parameters for new commands
\RequirePackage{pgfkeys}
% Needed to deal with table layouts
\RequirePackage{multirow}
\RequirePackage{makecell}

% Scale Fontawesome Icons
\DeclareFontFamily{U}{fontawesomeOne}{}
\DeclareFontShape{U}{fontawesomeOne}{m}{n}
  {<-> FontAwesome--fontawesomeone}{}
\DeclareRobustCommand\FAone{\fontencoding{U}\fontfamily{fontawesomeOne}\selectfont}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=1.0cm, top=1.5cm, right=1.0cm, bottom=1.5cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Customized colors
\definecolor{my-emerald}{HTML}{00A388}
\definecolor{my-skyblue}{HTML}{0395DE}
\definecolor{my-red}{HTML}{DC3522}
\definecolor{my-pink}{HTML}{EF4089}
\definecolor{my-lightpink}{HTML}{FFB6C1}
\definecolor{my-orange}{HTML}{FF6138}
\definecolor{my-nephritis}{HTML}{27AE60}
\definecolor{my-concrete}{HTML}{95A5A6}
\definecolor{my-darknight}{HTML}{131A28}
\colorlet{my-color}{my-emerald}

% Boolean value to switch section color highlighting
\newbool{SectionColorHighlight}
\setbool{SectionColorHighlight}{true}

% Awesome section color
\def\@sectionsemicolor#1#2#3{%
  \ifbool{SectionColorHighlight}{{\color{my-color}#1#2#3}\color{text}}%
  {{#1#2#3}\color{text}}%
}

\def\@sectiontitlecolor{%
  \ifbool{SectionColorHighlight}{\color{my-color}}{\color{text}}%
}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-----------------------------------------------------------------------------

% Set font for header (default is Roboto)
\fontdir[fonts/Roboto/]
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\fontdir[fonts/Aladin/]
\newfontfamily\positionfont[
  Path=\@fontdir,
  UprightFont=*-Regular
]{Aladin}

\fontdir[fonts/qualitype/]
\newfontfamily\qtchanceryfont[
  Path=\@fontdir,
  UprightFont=*,
  ItalicFont=*-Italic,
  BoldFont=*-Bold
]{QTChanceryType}

\newfontfamily\blackletterfont[
  Path=\@fontdir,
  UprightFont=*,
]{QTHeidelbergType}

\fontdir[fonts/ExpletusSans/]
\newfontfamily\sectiontitlefont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{ExpletusSans}

\fontdir[fonts/FiraSans/]
\newfontfamily\bodyfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-SemiBold,
  BoldItalicFont=*-SemiBoldItalic,
]{FiraSans}

\newfontfamily\bodyfontlight[
  Path=\@fontdir,
  UprightFont=*-Light,
  ItalicFont=*-LightItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{FiraSans}

\newcommand*{\headerprefixfont}{\blackletterfont}
\newcommand*{\footerfont}{\qtchanceryfont}
\newcommand*{\letternamefont}{\positionfont}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headernameprefixstyle}[2][36pt]{{\fontsize{#1}{1em}\headerprefixfont\color{my-color} #2}}
\newcommand*{\headerfirstnamestyle}[2][36pt]{{\fontsize{#1}{1em}\headerfontlight\color{my-color} #2}}
\newcommand*{\headermiddlenamestyle}[2][36pt]{{\fontsize{#1}{1em}\headerfontlight\color{my-color} #2}}
\newcommand*{\headerlastnamestyle}[2][36pt]{{\fontsize{#1}{1em}\headerfont\bfseries\color{my-color} #2}}
\newcommand*{\headerpositionstyle}[2][13pt]{{\fontsize{#1}{1em}\positionfont\color{darktext} #2}}
\newcommand*{\headeraddressstyle}[2][11pt]{{\fontsize{#1}{1em}\headerfont\itshape\color{lighttext} #2}}
\newcommand*{\headersocialstyle}[2][11pt]{{\fontsize{#1}{1em}\headerfont\color{text} #2}}
\newcommand*{\headerquotestyle}[2][12pt]{{\fontsize{#1}{1em}\bodyfont\itshape\color{darktext} #2}}
\newcommand*{\footerstyle}[2][12pt]{{\fontsize{#1}{1em}\footerfont\upshape\color{lighttext} #2}}
\newcommand*{\sectionstyle}[2][18pt]{{\fontsize{#1}{1em}\sectiontitlefont\bfseries\@sectiontitlecolor #2}}
\newcommand*{\subsectionstyle}[2][14pt]{{\fontsize{#1}{1em}\bodyfont\bfseries\textcolor{text}{#2}}}
\newcommand*{\paragraphstyle}[1][12pt]{\fontsize{#1}{1em}\bodyfontlight\upshape\color{text}}

% For elements of entry
% \newcommand*{\entryiconstyle}[2][20pt]{{\fontsize{#1}{1em} #2}}
\newcommand*{\entrytitlestyle}[2][13pt]{{\fontsize{#1}{1em}\bodyfont\bfseries\color{darktext} #2}}
\newcommand*{\entrylocationstyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfontlight\slshape\color{my-color} #2}}
\newcommand*{\entrypositionstyle}[2][12pt]{{\fontsize{#1}{1em}\bodyfont\scshape\color{text} #2}}
\newcommand*{\entrydatestyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfontlight\slshape\color{my-color} #2}}
\newcommand*{\descriptionstyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfontlight\upshape\color{text} #2}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[2][10pt]{{\fontsize{#1}{1em}\bodyfont\mdseries\color{graytext} #2}}
\newcommand*{\subentrypositionstyle}[2][8pt]{{\fontsize{#1}{1em}\bodyfont\scshape\color{graytext} #2}}
\newcommand*{\subentrydatestyle}[2][8pt]{{\fontsize{#1}{1em}\bodyfontlight\slshape\color{graytext} #2}}
\newcommand*{\subentrylocationstyle}[2][8pt]{{\fontsize{#1}{1em}\bodyfontlight\slshape\color{my-color} #2}}
\newcommand*{\subdescriptionstyle}[2][10pt]{{\fontsize{#1}{1em}\bodyfontlight\upshape\color{text} #2}}

% For elements of honor
\newcommand*{\honortitlestyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfont\color{graytext} #2}}
\newcommand*{\honorpositionstyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfont\bfseries\color{darktext} #2}}
\newcommand*{\honordatestyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfont\color{graytext} #2}}
\newcommand*{\honorlocationstyle}[2][10pt]{{\fontsize{#1}{1em}\bodyfontlight\slshape\color{ my-color} #2}}

% For elements of skill
\newcommand*{\skilltypestyle}[2][12pt]{{\fontsize{#1}{1em}\bodyfont\bfseries\scshape\color{darktext} #2}}
\newcommand*{\skillsetstyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfontlight\color{text} #2}}

% For elements of the cover letter
\newcommand*{\lettersectionstyle}[2][16pt]{{\fontsize{#1}{1em}\sectiontitlefont\bfseries\@sectiontitlecolor #2}}
\newcommand*{\recipientaddressstyle}[2][11.5pt]{{\fontsize{#1}{1em}\bodyfont\scshape\color{graytext} #2}}
\newcommand*{\recipienttitlestyle}[2][14pt]{{\fontsize{#1}{1em}\bodyfont\bfseries\color{darktext} #2}}
\newcommand*{\lettertitlestyle}[2][12pt]{{\fontsize{#1}{1em}\qtchanceryfont\bfseries\color{my-color} #2}}
\newcommand*{\letterdatestyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfontlight\slshape\color{my-color} #2}}
\newcommand*{\lettertextstyle}[1][10.5pt]{\fontsize{#1}{1.4em}\bodyfont\upshape\color{graytext}}
\newcommand*{\letternamestyle}[2][14pt]{{\fontsize{#1}{1em}\letternamefont\color{darktext} #2}}
\newcommand*{\letterenclosurestyle}[2][11pt]{{\fontsize{#1}{1em}\bodyfontlight\slshape\color{graytext} #2}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[4][]{%
  \ifthenelse{\equal{#1}{}}{}{\def\@prefix{#1}}%
  \ifthenelse{\equal{#2}{}}{}{\def\@firstname{#2}}%
  \ifthenelse{\equal{#3}{}}{}{\def\@middlename{#3}}%
  \ifthenelse{\equal{#4}{}}{}{\def\@lastname{#4}}%
}
\newcommand*{\prefix}[1]{\def\@prefix{#1}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\middlename}[1]{\def\@middlename{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \position{<jobtitle>}{<specialism>}
\newcommand*{\position}[2]{%
  \ifthenelse{\equal{#1}{}}{}{\def\@jobtitle{#1}}%
  \ifthenelse{\equal{#2}{}}{}{\def\@specialism{#2}}%
}
\newcommand*{\jobtitle}[1]{\def\@jobtitle{#1}}
\newcommand*{\specialism}[1]{\def\@specialism{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\def\@medium{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname\squad\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}

% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

%------------------------Commands for Cover Letter-----------------------------------%
% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\HeaderNameDelim}{\space}
\newcommand{\HeaderAfterNameSkip}{2mm}
\newcommand{\HeaderAfterPositionSkip}{1mm}
\newcommand{\HeaderPositionDelim}{\enskip\cdotp\enskip}
\newcommand{\HeaderAfterAddressSkip}{.5mm}
\newcommand{\HeaderIconSep}{\space}
\newcommand{\HeaderSocialSep}{\quad\textbar\quad}
\newcommand{\HeaderAfterSocialSkip}{3mm}
\newcommand{\HeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\SectionTopSkip}{3mm}
\newcommand{\SectionBottomSkip}{-3mm}
\newcommand{\SectionContentTopSkip}{2mm}
\newcommand{\SectionIconSep}{\space}
\newcommand{\SectionItemTopSkip}{-3mm}
\newcommand{\SectionEntryTopSkip}{-2mm}

\newcommand{\LetterContentTopSkip}{2mm}
\newcommand{\LetterContentBottomSkip}{2mm}

%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{P}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{X}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}b{#1}}
\newcolumntype{Y}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}b{#1}}
\newcolumntype{Z}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}b{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

\def\rulefill#1#2{\leavevmode\leaders\hrule\@height#1\@depth#2\hfill \kern\z@}
\newlength{\eX}
\setlength{\eX}{10pt}
\newcommand*{\cvrulefill}[1]{\rulefill{\dimexpr(\eX+#1)/2}{\dimexpr(-\eX+#1)/2}}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
        {\setlength{\photodim}{1.3cm}}%
        {\setlength{\photodim}{1.8cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
        {\def\@photoborder{darkgray}}%
        {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
  \ifdefined\@photo
    \begin{minipage}[c]{\headerphotowidth}%
      \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
    \end{minipage}
  \fi
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    %The Name Part
    \ifthenelse{\isundefined{\@prefix}}{}{\headernameprefixstyle{\@prefix}\HeaderNameDelim{}}%
    \ifthenelse{\isundefined{\@firstname}}{}{\headerfirstnamestyle{\@firstname}}%
    \ifthenelse{\isundefined{\@middlename}}{}{\headermiddlenamestyle{{}\HeaderNameDelim\@middlename}}%
    \ifthenelse{\isundefined{\@lastname}}{}{\headerlastnamestyle{{}\HeaderNameDelim\@lastname}}%
    \\[\HeaderAfterNameSkip]%
    %The Job Position Part
    \ifthenelse{\isundefined{\@jobtitle}}{}%
    {%
      \ifthenelse{\isundefined{\@specialism}}%
      {\headerpositionstyle{\@jobtitle}\\[\HeaderAfterPositionSkip]}%
      {\headerpositionstyle{\@jobtitle}\HeaderPositionDelim{\@specialism}%
      \\[\HeaderAfterPositionSkip]}%
    }%
    %The Address Part
    \ifthenelse{\isundefined{\@address}}{}%
    {\headeraddressstyle{\@address\\[\HeaderAfterAddressSkip]}}%
    %The Contacts Part
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@mobile}}% %Phone Number
        {}%
        {%
          {\faPhone}\HeaderIconSep\@mobile%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@email}}% %Email Address
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{mailto:\@email}{{\faEnvelope}\HeaderIconSep\@email}%
        }%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{http://\@homepage}{\faHome\HeaderIconSep\@homepage}%
        }%
      \ifthenelse{\isundefined{\@github}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://github.com/\@github}{\faGithubSquare\HeaderIconSep\@github}%
        }%
      \ifthenelse{\isundefined{\@gitlab}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://gitlab.com/\@gitlab}{\faGitlab\HeaderIconSep\@gitlab}%
        }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\HeaderIconSep\@stackoverflowname}%
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\HeaderIconSep\@linkedin}%
        }%
      \ifthenelse{\isundefined{\@twitter}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://twitter.com/\@twitter}{\faTwitter\HeaderIconSep\@twitter}%
        }%
      \ifthenelse{\isundefined{\@skype}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \faSkype\HeaderIconSep\@skype%
        }%
      \ifthenelse{\isundefined{\@reddit}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://www.reddit.com/user/\@reddit}{\faReddit\HeaderIconSep\@reddit}%
        }%
      \ifthenelse{\isundefined{\@xing}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://www.xing.com/profile/\@xing}{\faXingSquare\HeaderIconSep\@xing}
        }%
      \ifthenelse{\isundefined{\@medium}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://medium.com/@\@medium}{\faMedium\HeaderIconSep\@medium}%
        }%
      \ifthenelse{\isundefined{\@googlescholarid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \href{https://scholar.google.com/citations?user=\@googlescholarid}{\faGraduationCap\HeaderIconSep\@googlescholarname}%
        }%
      \ifthenelse{\isundefined{\@extrainfo}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderSocialSep}%
          \@extrainfo%
        }%
    } \\[\HeaderAfterSocialSkip]%
    \ifdefined\@quote
      \headerquotestyle{\@quote\\}\vspace{\HeaderAfterQuoteSkip}
    \fi
  \end{minipage}
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \ifthenelse{\equal{#1}{}}{}{\fancyfoot[L]{\footerstyle{#1}}}
  \ifthenelse{\equal{#2}{}}{}{\fancyfoot[C]{\footerstyle{#2}}}
  \ifthenelse{\equal{#3}{}}{}{\fancyfoot[R]{\footerstyle{#3}}}
}

% Define a section for CV
% Usage: \cvsection[<section-icon>]{<section-title>}
\newcommand{\cvsection}[2][\faBookmarkO]{%
  \vspace{\SectionTopSkip}
  \sectionstyle{#1\SectionIconSep#2}
  \phantomsection
  \color{gray}\cvrulefill{1.25pt}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\SectionContentTopSkip}
  \subsectionstyle{#1}
  \phantomsection
  \vspace{\SectionBottomSkip}
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\SectionContentTopSkip}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\SectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
  \vspace{\SectionBottomSkip}
}

% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[6][]{%
  \vspace{\SectionEntryTopSkip}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{.8\textwidth} R{.2\textwidth}}
      \ifempty{#3#4}
        {\entrypositionstyle{#2~#1} & \entrydatestyle{#5} \\}
        {\entrytitlestyle{#3} & \entrylocationstyle{#4} \\
         \entrypositionstyle{#2~#1} & \entrydatestyle{#5} \\}
        \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#6}}
  \end{tabular*}%
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \begin{center}
}{%
  \end{center}
  \vspace{\SectionBottomSkip}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{.8\textwidth} R{.2\textwidth}}
    \setlength\leftskip{.01\textwidth}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
      {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
      {}
      {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
      {}
      {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\SectionContentTopSkip}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{.1\textwidth} L{.75\textwidth} R{.15\textwidth}}
}{%
    \end{tabular*}
  \end{center}
  \vspace{\SectionBottomSkip}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[4]{%
  \vspace{\SectionEntryTopSkip}
  \ifempty{#1}{
  \honordatestyle{#4} & \honortitlestyle{#2} & \honorlocationstyle{#3} \\}%
  {\honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} & \honorlocationstyle{#3} \\}
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  % \vspace{\SectionBottomSkip}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{.9\textwidth}}
}{%
    \end{tabular*}
  \end{center}
  \vspace{\SectionBottomSkip}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}[1][\faAngleDoubleRight]{%
  \vspace{\SectionItemTopSkip}
  \begin{justify}
    \begin{enumerate}[label={#1}]
    \setlength{\parskip}{0pt}
}{%
    \end{enumerate}
  \end{justify}
  \vspace{\SectionItemTopSkip}
}

%---------------------Publication List Environment-----------------------%

\pgfkeys{
  /cvpubs/.is family, /cvpubs,
  default/.style = {fontsize=11pt, label={},
                    series=pubcnt, start=0, indent=3.4pt},
  fontsize/.estore in = \cvpubsFontsize,
  label/.estore in = \cvpubsLabel,
  series/.estore in = \cvpubsSeries,
  resume/.estore in = \cvpubsResume,
  start/.estore in = \cvpubsStart,
  indent/.estore in = \cvpubsIndent
}

% Define an enviroment for publications
\newenvironment{cvpubs}[1][]{%
  % Extract Environment Args
  \pgfkeys{/cvpubs, default, #1}%

  % Default Fontsize
  \def\pubsFontsize{\cvpubsFontsize}

  % Resume Existing Counter
  \ifdefined\cvpubsResume
    \let\@defaultCounter\cvpubsSeries
  \else
    % Set Internal Counter
    \newcounter{\cvpubsSeries}% % Use a new counter for publications
    \def\@defaultCounter{\cvpubsSeries}%
    % Set Counter Start Number
    \setcounter{\@defaultCounter}{\cvpubsStart}%
  \fi

  % Default label
  \ifthenelse{\equal{\cvpubsLabel}{}}{\def\pubsLabel{[\arabic{\@defaultCounter}]}}{\def\pubsLabel{\cvpubsLabel}}

  % Define the item style
  \newcommand*{\publabelstyle}[2][12pt]{{\fontsize{##1}{1em}\bodyfont\upshape\color{text} ##2}}
  \newcommand*{\pubitemstyle}[2][12pt]{{\fontsize{##1}{1em}\bodyfont\upshape\color{text} ##2}}

  % Define commend for journal articles
  \newcommand*{\journal}[9][12pt]{%
    \ifempty{##2}{\let\@pubauthors\undefined}{\def\@pubauthors{##2}}
    \ifempty{##3}{\let\@pubtitle\undefined}{\def\@pubtitle{##3}}
    \ifempty{##4}{\let\@pubconf\undefined}{\def\@pubjournal{##4}}
    \ifempty{##5}{\let\@pubvol\undefined}{\def\@pubvol{##5}}
    \ifempty{##6}{\let\@pubno\undefined}{\def\@pubno{##6}}
    \ifempty{##7}{\let\@pubstartpage\undefined}{\def\@pubstartpage{##7}}
    \ifempty{##8}{\let\@pubendpage\undefined}{\def\@pubendpage{##8}}
    \ifempty{##9}{\let\@pubyear\undefined}{\def\@pubyear{##9}}

    \pubitemstyle[##1]{%
    \@pubauthors, ``\@pubtitle,'' \textit{\@pubjournal}%
    \ifthenelse{\isundefined{\@pubvol}}{}{, vol.\@pubvol}%
    \ifthenelse{\isundefined{\@pubno}}{}{, no.\@pubno}%
    \ifthenelse{\isundefined{\@pubstartpage}}{}{, pp.\@pubstartpage}%
    \ifthenelse{\isundefined{\@pubendpage}}{}{--\@pubendpage}%
    \ifthenelse{\isundefined{\@pubyear}}{}{, \@pubyear}%
    .}%
  }

  % Define commend for conference papers
  \newcommand*{\conference}[8][12pt]{%
    \ifempty{##2}{\let\@pubauthors\undefined}{\def\@pubauthors{##2}}
    \ifempty{##3}{\let\@pubtitle\undefined}{\def\@pubtitle{##3}}
    \ifempty{##4}{\let\@pubconf\undefined}{\def\@pubconf{##4}}
    \ifempty{##5}{\let\@publocation\undefined}{\def\@publocation{##5}}
    \ifempty{##6}{\let\@pubstartpage\undefined}{\def\@pubstartpage{##6}}
    \ifempty{##7}{\let\@pubendpage\undefined}{\def\@pubendpage{##7}}
    \ifempty{##8}{\let\@pubyear\undefined}{\def\@pubyear{##8}}

    \pubitemstyle[##1]{%
    \@pubauthors, ``\@pubtitle,'' in \textit{\@pubconf}%
    \ifthenelse{\isundefined{\@publocation}}{}{ (\@publocation)}%
    \ifthenelse{\isundefined{\@pubstartpage}}{}{, pp.\@pubstartpage}%
    \ifthenelse{\isundefined{\@pubendpage}}{}{--\@pubendpage}%
    \ifthenelse{\isundefined{\@pubyear}}{}{, \@pubyear}%
    .}%
  }

  % Define the command for each item in the publication list
  \pgfkeys{
    /itempub/.is family, /itempub,
    default/.style = {type=journal, href="", fontsize=\pubsFontsize, label=\pubsLabel},
    type/.estore in = \itempubType,
    href/.estore in = \itempubLink,
    fontsize/.estore in = \itempubFontsize,
    label/.estore in = \itempubLabel
  }

  % Define publication items
  % Usage: \itempub[<type>]{<href>}{<author>}{<title>}{<journal>}{<volume>}{<issue>}{<page-start>}{<page-end>}{<year>}
  % Usage: \itempub[<type>]{<href>}{<author>}{<title>}{<proceedings>}{<location>}{}{<page-start>}{<page-end>}{<year>}
  \newcommand*{\itempub}[9][]{%
    \refstepcounter{\@defaultCounter}% Use the internal counter
    \pgfkeys{/itempub, default, ##1}%
    % Check whether URL is available.If so, add URL links on the relevant item labels.
    \ifthenelse{\equal{\itempubLink}{}}%
    {\item[\publabelstyle[\itempubFontsize]{\itempubLabel}]}%
    {\item[\href{\itempubLink}{\publabelstyle[\itempubFontsize]{\itempubLabel}}]}%
    % Check whether the pub is a journal or a conference proceeding.
    \ifthenelse{\equal{\itempubType}{journal}}%
    {\journal[\itempubFontsize]{##2}{##3}{##4}{##5}{##6}{##7}{##8}{##9}}%
    {\conference[\itempubFontsize]{##2}{##3}{##4}{##5}{##7}{##8}{##9}}%
  }
%-------------------------------------------------------------------------------------%
  \vspace{\SectionContentTopSkip}
  \begin{justify}
    \begin{itemize}%
    \setlength{\itemindent}{\cvpubsIndent}%
}{%
    \end{itemize}
  \end{justify}
  \vspace{\SectionItemTopSkip}
}

%-------------------------------------------------------------------------------
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------

% Define Utility Commands %

% Define Top and Bottom Struts of Each Row
\newcommand*{\TopStrut}[1][1ex]{\rule{0pt}{#1}}
\newcommand*{\BotStrut}[1][-1ex]{\rule[-#1]{0pt}{0pt}}

% Define an environment for cvletter
\pgfkeys{
  /cvletter/.is family, /cvletter,
  default/.style = {fontsize=11pt,
                    top=0mm, bottom=0mm, hmargin=0mm, cmargin=6mm, cinner=4mm},
                    % signature=profile.png, sigwidth=2cm, sigheight=1cm},
  fontsize/.estore in = \cvletterFontsize,
  top/.estore in = \cvletterTopMargin,
  hmargin/.estore in = \cvletterHeaderMargin,
  cmargin/.estore in = \cvletterClosingMargin,
  cinner/.estore in = \cvletterInnerClosing,
  bottom/.estore in = \cvletterBottomMargin,
  signature/.estore in = \cvletterSignature,
  sigwidth/.estore in = \cvletterSignatureWidth,
  sigheight/.estore in = \cvletterSignatureHeight
}

\NewEnviron{cvletter}[1][]{%
  \pgfkeys{/cvletter, default, #1}

  \newcommand*{\makeletterheader}{%
    \setlength\tabcolsep{0pt}%
    \setlength{\extrarowheight}{0pt}%
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{.4\textwidth} R{.6\textwidth}}%
      \lettertextstyle[\@lettertextfontsize]{\@letteropening} & \ifthenelse{\isundefined{\@lettertitle}}{}{\lettertitlestyle[\@lettertextfontsize]{\@lettertitle}}%
    \end{tabular*}%
  }

  \newcommand*{\makeletterclosing}{%
    \begin{minipage}{\textwidth}%
      \vspace{\cvletterClosingMargin}
      \noindent\raggedright%
      \lettertextstyle[\@lettertextfontsize]{\@letterclosing}%
    \end{minipage}
    \begin{minipage}{\textwidth}%
      \vspace{\cvletterInnerClosing}
      \noindent\raggedright%
      \ifdefined\cvletterSignature%
        \includegraphics[width=\cvletterSignatureWidth,height=\cvletterSignatureHeight]{\cvletterSignature}%
      \else%
        \letternamestyle{\@firstname~~\@lastname}%
      \fi%
    \end{minipage}
  }

  \ifdefined\@lettertextfontsize%
    \let\@lettertextfontsize{\cvletterFontsize}%
  \else%
    \def\@lettertextfontsize{\cvletterFontsize}%
  \fi%
  \vspace{\cvletterTopMargin}%
  \makeletterheader%
  \vspace{\cvletterHeaderMargin}%
  \BODY%
  \makeletterclosing%
  \vspace{\cvletterBottomMargin}%
}

% Define a section for the cover letter
% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[1]{%
  \lettersectionstyle{#1}
  \phantomsection
  \color{gray}\cvrulefill{1.25pt}
}

% Define a title of the cover letter
% Usage: \makelettertitle
\pgfkeys{
  /makelettertitle/.is family, /makelettertitle,
  default/.style = {stretch=1.25, inner=8mm, top=12mm, bottom=2mm},
  stretch/.estore in = \lettertitleStretch,
  inner/.estore in = \lettertitleInner,
  top/.estore in = \lettertitleTopMargin,
  bottom/.estore in = \lettertitleBottomMargin
}

\newcommand*{\makelettertitle}[1][]{%
  \pgfkeys{/makelettertitle, default, #1}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \vspace{\lettertitleTopMargin}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{.7\textwidth} R{.3\textwidth}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{minipage}{\textwidth}
    \vspace{\lettertitleInner}
    \setstretch{\lettertitleStretch}\recipientaddressstyle{\@recipientaddress}
    \vspace{\lettertitleBottomMargin}
  \end{minipage}
}

\pgfkeys{
  /lettercontent/.is family, /lettercontent,
  default/.style = {fontsize=\@lettertextfontsize, width=\textwidth,
                    top=0mm, bottom=0mm},
  fontsize/.estore in = \lettercontentFontsize,
  width/.estore in = \lettercontentWidth,
  height/.estore in = \lettercontentHeight,
  top/.estore in = \lettercontentTopMargin,
  bottom/.estore in = \lettercontentBottomMargin
}

\NewEnviron{lettercontent}[1][]{%
  \pgfkeys{/lettercontent, default, #1}%
  \ifdefined\@lettercontentHeight%
    \let\@lettercontentHeight\undefined%
  \fi%
  \ifdefined\lettercontentHeight%
    \def\@lettercontentHeight{\lettercontentHeight}%
  \else%
    \def\@lettercontentHeight{\height}%
  \fi%
  \begin{minipage}[][\@lettercontentHeight][c]{\lettercontentWidth}%
    \vspace{\lettercontentTopMargin}%
    \noindent\justifying%
    \lettertextstyle[\lettercontentFontsize]{\BODY}%
    \vspace{\lettercontentBottomMargin}%
  \end{minipage}%
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\pgfkeys{
  /makeletterenclosure/.is family, /makeletterenclosure,
  default/.style = {fontsize=12pt},
  fontsize/.estore in = \letterenclosureFontsize
}

\newcommand*{\makeletterenclosure}[1][]{%
  \pgfkeys{/makeletterenclosure, default, #1}
  \ifdefined\@letterenclosure
    \begin{minipage}{\textwidth}
      \noindent\raggedright%
      \letterenclosurestyle[\letterenclosureFontsize]{\@letterenclname:~\@letterenclosure}
    \end{minipage}
  \fi
}
