REM pdflatex default build command:
REM pdflatex.exe $synctexoption $fullname
REM $synctexoption has problems with handover to batch, but it is always -synctex=1, so hard coded

REM bibtex default build command:
REM bibtex.exe $basename

REM Aufruf mit build.bat $directory $fullname $basename

cd /d %1

C:\texlive\2017\bin\win32\pdflatex.exe -synctex=1 %2
C:\texlive\2017\bin\win32\bibtex.exe %3
C:\texlive\2017\bin\win32\pdflatex.exe -synctex=1 %2