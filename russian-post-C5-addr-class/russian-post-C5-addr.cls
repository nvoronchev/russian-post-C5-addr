%% Author:      Nikita Voronchev <n.voronchev@gmail.com>
%% Description: Стилевой файл, позволяющий оформить конверты C5 приближенно к отечественным стандартам.
%% 
%% Вызов команды \Mail{}{}{}{}{}{} с 6-ю аргументами формирует одну страницу, предназначенную для печати на одном конверте. Аргументы:
%%   1 -- первая строка ``Кому''
%%   2 -- вторая строка ``Кому''
%%   3 -- третья строка ``Кому''
%%   4 -- индекс получателя
%%   5 -- первая строка ``Куда''
%%   6 -- вторая строка ``Куда''
%%
%% Информация об отправителе предварительно задается командами:
%%   \FromName{}  -- одна строка ``От кого''
%%   \FromAddrA{} -- первая строка ``Откуда''
%%   \FromAddrB{} -- вторая строка ``Откуда''
%%   \FromAddrC{} -- третья строка ``Откуда''
%%   \FromInd{}   -- индекс отправителя
%% По умолчанию эти поля будут пустыми. Такой подход позволяет без особых затруднений сгенировать множество конвертов с одинаковыми 
%% адресами отправления. Полезно, к примеру, при рассылки автореферата диссертации.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{russian-post-C5-addr}[2015/03/28 0.1.0 Russian post C5 addresses]

\LoadClass[12pt]{report}

\RequirePackage[
  papersize={229mm,162mm},
  left=10mm, right=17mm, top=17mm, bottom=0mm
]{geometry}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T2A]{fontenc}
\RequirePackage{xifthen,graphicx}

\DeclareFontFamily{T2A}{Pechkin}{}
\DeclareFontShape{T2A}{Pechkin}{m}{n}{<-> Pechkin}{}
\DeclareFontShape{T2A}{Pechkin}{b}{n}{<-> Pechkin}{}


\pagestyle{empty}


\newcommand{\FromNameVal}{}
\newcommand{\FromAddrAVal}{}
\newcommand{\FromAddrBVal}{}
\newcommand{\FromAddrCVal}{}
\newcommand{\FromIndVal}{}
\newcommand{\FromName}[1]{\renewcommand{\FromNameVal}{#1}}
\newcommand{\FromAddrA}[1]{\renewcommand{\FromAddrAVal}{#1}}
\newcommand{\FromAddrB}[1]{\renewcommand{\FromAddrBVal}{#1}}
\newcommand{\FromAddrC}[1]{\renewcommand{\FromAddrCVal}{#1}}
\newcommand{\FromInd}[1]{\renewcommand{\FromIndVal}{#1}}

\newcommand{\myundrln}[2]{\begingroup
  \underline{\makebox[#1]{\vphantom{|}#2\hfill}}
  \endgroup
}

\newcommand{\FromRow}[2][]{
  \ifthenelse{\isempty{#1}}
    {\parbox[b][6.5mm][b]{85mm}{\myundrln{85mm}{\,#2}}}
    {\parbox[b][6.5mm][b]{85mm}{\parbox{18mm}{\textit{#1}}\myundrln{67mm}{\,#2}}}
}
\newcommand{\ToRow}[2][]{
  \ifthenelse{\isempty{#1}}
    {\parbox[b][6.5mm][b]{115mm}{\myundrln{115mm}{\,#2}}}
    {\parbox[b][6.5mm][b]{115mm}{\parbox{13mm}{\textit{#1}}\myundrln{102mm}{\,#2}}}
}

\newcommand{\Mail}[6]{
  \newpage
  \noindent
  \parbox[b][32mm][c]{85mm}{
    \vspace*{4mm}
    \FromRow[От кого:]{\FromNameVal}
    \FromRow[Откуда:]{\FromAddrAVal}
    \FromRow{\FromAddrBVal}
    \FromRow{\FromAddrCVal}
    \parbox{85mm}{\vspace{-1.5px}\hspace{46.5mm}\fbox{\parbox[][8mm][t]{35mm}{\textit{\tiny\hspace*{0.1ex}Индекс места отправления} \\ \hspace*{2.8em}{\large \FromIndVal}} } }
  }
  \hfill
  \parbox[b][32mm][t]{15mm}{
  \vspace*{-3mm}
  \begin{tabular}{c|}
    \hline
    \parbox[t][15mm][t]{15mm}{\makebox{}}
  \end{tabular}
  }

  \vspace{55mm}

  \noindent
  \parbox[b][15mm][c]{90mm}{
    \vspace{62mm}
    \scalebox{1.452}{\huge\fontfamily{Pechkin}\selectfont\`{}#4}
  }
  \parbox[b][1mm][c]{115mm}{
    \ToRow[Кому:]{#1}
    \ToRow{#2}
    \ToRow{#3}
    \ToRow[Куда:]{#5}
    \ToRow{#6}
    \parbox{85mm}{\vspace{-1.5px}\fbox{\parbox[][8mm][t]{35mm}{\textit{\tiny\hspace*{2ex}Индекс места назначения} \\ \hspace*{2.8em}{\large #4}} } }
  }
}