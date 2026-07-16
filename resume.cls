%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV
% Version 2.0 (8/5/13)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Trey Hunner
%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2024/01/01 v1.0 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array}            % Required for boldface (\bfseries) tabular columns
\RequirePackage{ifthen}           % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\newcommand{\name}[1]{\def\@name{#1}} % Defines the \name command to set name
\def\@name{}                          % Sets \@name to empty by default
\newcommand{\addressSep}{--}          % Set default address separator

% One, two or three address lines can be specified
\let\@addressone\relax
\let\@addresstwo\relax
\let\@addressthree\relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\newcommand{\address}[1]{
    \@ifundefined{@addresstwo}{
        \def\@addresstwo{#1}
    }{
        \@ifundefined{@addressthree}{
            \def\@addressthree{#1}
        }{
            \def\@addressone{#1}
        }
    }
}

% \printaddress is used to style an address line (given as input)
\newcommand{\printaddress}[1]{
\begingroup
\def\\{\addressSep\ }
\rightline{#1}
\endgroup
\addressskip
}

% \printname is used to print the name as a page header
\newcommand{\printname}{
    \begingroup
    \MakeUppercase{\namesize\bfseries\@name}\hfil
    \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
    \ori@document % Begin document
    \printname    % Print the name specified with \name
    \@ifundefined{@addressone}{}{   % Print the first address if specified
        \printaddress{\@addressone}}
    \@ifundefined{@addresstwo}{}{   % Print the second address if specified
        \printaddress{\@addresstwo}}
    \@ifundefined{@addressthree}{}{ % Print the third address if specified
        \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
    \vspace{-0.2em}
    \sectionskip
    \MakeUppercase{\bfseries #1} % Section title
    \sectionlineskip
    \hrule % Horizontal line
    \small
    \begin{list}{}{ % List for each individual item in the section
            \setlength{\leftmargin}{1.5em} % Margin within the section
        }
        \item[]
              }{
    \end{list}
    \vspace{-0.2em}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
{\bfseries #1} \hfill {#2} % Bold company name and date on the right
\ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
\\
{\em #3} \hfill {\em #4} % Italic job title and location
}\smallskip
\footnotesize
\begin{list}{\textbf{--}}{\leftmargin=1.5em} % \textbf{--} used for bullets, no indentation
    \itemsep-0.2em \vspace{-0.2em} % Compress items in list together for aesthetics
    }{
\end{list}
\vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\newcommand{\namesize}{\huge}          % Size of the name at the top of the document
\newcommand{\addressskip}{\smallskip}  % The space between the two address (or phone/email) lines
\newcommand{\sectionlineskip}{\smallskip} % The space above the horizontal line for each section
\newcommand{\nameskip}{\bigskip}       % The space after your name at the top
\newcommand{\sectionskip}{}            % The space after the heading section
