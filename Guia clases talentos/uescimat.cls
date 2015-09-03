% uescimat.cls 
%
% Autor: MSc. Humberto Sermeno
% Creacion: Noviembre 5, 2006

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uescimat}[2006/11/05 Documentos CIMAT, UES]

\typeout{*}
\typeout{* Formatos Estandar para Documentos}
\typeout{* por MSc. Humberto Sermeno - Noviembre 2006}
\typeout{* Facultad de Ciencias Naturales y Matematica}
\typeout{*}

\newcommand{\es@evaluacion}{0}
\newcommand{\usa@grupos}{0}

\DeclareOption{evaluacion}{\renewcommand{\es@evaluacion}{1}}
\DeclareOption{grupos}{\renewcommand{\usa@grupos}{1}}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage[spanish]{babel}
\decimalpoint
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{multirow}
\RequirePackage{enumerate}
\RequirePackage{paralist}
\RequirePackage{latexsym,amsmath,amssymb,amsthm}
\RequirePackage[paper=letterpaper,right=2.5cm,left=2.5cm,top=2cm,bottom=2cm]{geometry}
\RequirePackage[pdftex]{graphicx}


\newcommand{\@autor}{*}
\newcommand{\@titulo}{*}
\newcommand{\@fecha}{*}
\newcommand{\@materia}{*}
\newcommand{\@ciclo}{*}
\newcommand{\ano@academico}{*}
\newcommand{\fecha@entrega}{*}
\newcommand{\@grupo}{*}

\newcommand{\titulo}[1]{\renewcommand{\@titulo}{#1}}
\renewcommand{\title}[1]{\titulo{#1}}

\newcommand{\autor}[1]{\renewcommand{\@autor}{#1}}
\renewcommand{\author}[1]{\autor{#1}}

\newcommand{\fecha}[1]{\renewcommand{\@fecha}{#1}}
\renewcommand{\date}[1]{\fecha{#1}}

\newcommand{\materia}[1]{\renewcommand{\@materia}{#1}}
\newcommand{\curso}[1]{\materia{#1}}
\newcommand{\ciclo}[1]{\renewcommand{\@ciclo}{#1}}
\newcommand{\anoacademico}[1]{\renewcommand{\ano@academico}{#1}}
\newcommand{\entrega}[1]{\renewcommand{\fecha@entrega}{#1}}
\newcommand{\grupo}[1]{\renewcommand{\@grupo}{#1}}

\renewcommand{\maketitle}{
\noindent\begin{minipage}[b]{.5\textwidth}
\includegraphics[height=2cm]{logo.png}
\end{minipage}%
\begin{minipage}[b][2cm][s]{.5\textwidth}
	\begin{flushright}
		\MakeUppercase{\@materia}
		\if*\@autor\else
			\\\textsc{\@autor}
		\fi
		\if*\@fecha\else
			\\\textsc{\@fecha}
		\fi
		\if*\@ciclo\else
			\\\textsc{Ciclo \@ciclo\if*\ano@academico\else -\ano@academico\fi}
		\fi
		\ifnum\usa@grupos=1
			\\\textsc{Grupo \if*\@grupo\makebox[1cm]{\hrulefill}\else\@grupo\fi}
		\fi
	\end{flushright}
\end{minipage}\\
\begin{minipage}[t]{\textwidth}
\centerline{\bfseries\large\@titulo}
\if*\fecha@entrega \else
	\centerline{Fecha de entrega: \fecha@entrega}
\fi
\end{minipage}\vspace{.5cm}%


%\ifnum\es@evaluacion=1%
%	\noindent\mbox{Nombre:}\hspace{.5mm}\hrulefill	\hspace{3mm}\mbox{Carnet:}\hspace{.5mm}\makebox[3cm]{\hrulefill}\fi
%\vspace{0.3cm}
\dotfill
%\dotfill
}

\newcounter{contador@problemas}[section]
\setcounter{contador@problemas}{0}

\newcounter{contador@creditoextra}
\setcounter{contador@creditoextra}{0}

\newcounter{contador@parte}
\setcounter{contador@parte}{0}

\newenvironment{indicaciones}{\noindent\textsc{\textbf{Indicaciones:} \\ }}{\vspace{3mm}}
\newenvironment{parte}[1][*]{%
	\addtocounter{contador@parte}{1}
	\noindent\textsc{\bfseries\large{Parte \thecontador@parte}}
	\normalfont{\if*#1\else\emph{(#1)}\fi\\}}%
	{\vspace{5mm}}
\newenvironment{problema}[1][*]{%
	\addtocounter{contador@problemas}{1}
	\noindent\textsc{\bfseries\large{Problema \thecontador@problemas}}
	\normalfont{\if*#1\else\emph{(#1)}\fi\\}}%
	{\vspace{5mm}} %\dotfill
\newenvironment{creditoextra}[1][*]{%
	\addtocounter{contador@creditoextra}{1}
	\noindent\textsc{\bfseries\large{Cr\'edito Extra \thecontador@creditoextra}}
	\normalfont{\if*#1\else\emph{(#1)}\fi\\}}%
	{\vspace{5mm}}
% 
% CONJUNTOS
% 
% Naturales
\newcommand{\mnaturales}{$\conjesp{N}$ }
\newcommand{\naturales}{\conjesp{N}}
% Enteros Positivos
\newcommand{\mentpos}{$\conjesp{P}$ }
\newcommand{\entpos}{\conjesp{P}}
% Enteros
\newcommand{\menteros}{$\conjesp{Z}$ }
\newcommand{\enteros}{\conjesp{Z}}
% Racionales
\newcommand{\mracionales}{$\conjesp{Q}$ }
\newcommand{\racionales}{\conjesp{Q}}
% Irracionales
\newcommand{\mnracionales}{$\conjesp{Q'}$ }
\newcommand{\nracionales}{\conjesp{Q'}}
% Reales
\newcommand{\mreales}{$\conjesp{R}$ }
\newcommand{\reales}{\conjesp{R}}

\newcommand{\complemento}[1]{{#1}^{\prime}}
\newcommand{\talque}{\hspace{1mm}\vert\hspace{1mm}}
\newcommand{\conj}[1]{\MakeUppercase{#1}}
\newcommand{\mconj}[1]{$\MakeUppercase{#1}$}
\newcommand{\ele}[1]{\MakeLowercase{#1}}
\newcommand{\mele}[1]{$\MakeLowercase{#1}$}
\newcommand{\mconjp}[2]{$\conj{#1}(\conj{#2})$}
\newcommand{\conjp}[2]{\conj{#1}(\conj{#2})}
\newcommand{\cconj}[1]{\conj{#1}^\prime}
\newcommand{\mcconj}[1]{$\cconj{#1}$}
\newcommand{\conjesp}[1]{\mathbb{#1}}
\newcommand{\muniversal}{$\conjesp{U}$}
\newcommand{\universal}{\conjesp{U}}
\newcommand{\muniverso}{\muniversal}
\newcommand{\universo}{\universal}
\newcommand{\potencia}[1]{\mathscr{P}(#1)}
\newcommand{\mpotencia}[1]{$\potencia{#1}$}
\newcommand{\conjfam}[1]{\mathcal{#1}}
\newcommand{\mconjfam}[1]{$\conjfam{#1}$}

% 
% Relaciones
% 
\newcommand{\rel}[1]{\conj{#1}}
\newcommand{\nrel}[1]{\conj{#1}\hspace{-.9em}\diagup}
\newcommand{\related}[3]{#1\rel{#2}#3}
\newcommand{\mrelated}[3]{#1\mrel{#2}#3}
\newcommand{\nrelated}[3]{#1\nrel{#2}#3}
\newcommand{\mnrelated}[3]{#1\mnrel{#2}#3}
\newcommand{\relinv}[1]{\conj{#1}^{-1}}
\newcommand{\mrel}[1]{$\rel{#1}$}
\newcommand{\mrelinv}[1]{$\conj{#1}^{-1}$}
\newcommand{\mnrel}[1]{$\nrel{#1}$}

\newcommand{\particion}[1]{\mathpzc{#1}}
\newcommand{\mparticion}[1]{$\particion{#1}$}

% 
% Funciones
% 
\newcommand{\func}[1]{#1}
\newcommand{\funceval}[2]{\func{#1}(#2)}
\newcommand{\funcinv}[1]{\func{#1}^{-1}}
\newcommand{\funcdef}[3]{\func{#1}: \conj{#2}\rightarrow\conj{#3}}
\newcommand{\funcdefa}[3]{\func{#1}: #2\rightarrow #3}
\newcommand{\fidentica}[1]{\conj{1}_{\conj{#1}}}
\newcommand{\fcomp}[2]{\func{#1}\circ\func{#2}}
\newcommand{\mfunc}[1]{$\func{#1}$}
\newcommand{\mfunceval}[2]{$\func{#1}{#2}$}
\newcommand{\mfuncinv}[1]{$\funcinv{#1}$}
\newcommand{\mfuncdef}[3]{$\funcdef{#1}{#2}{#3}$}
\newcommand{\mfuncdefa}[3]{$\funcdefa{#1}{#2}{#3}$}
\newcommand{\mfidentica}[1]{$\fidentica{#1}$}
\newcommand{\mfcomp}[2]{$\fcomp{#1}{#2}$}

% 
% Logica
% 
\newcommand{\y}{\wedge}
\renewcommand{\o}{\vee}
\newcommand{\implica}{\rightarrow}
\newcommand{\eqlogica}{\Leftrightarrow}
\newcommand{\imlogica}{\Rightarrow}
\newcommand{\sisolosi}{\leftrightarrow}


\setlength{\parindent}{0cm}

