// Import external packages
// Math and symbols
#import "@preview/physica:0.9.7": *
// Drawing circuit diagrams
#import "@preview/circuiteria:0.2.0": *

// Fix numbering and document look
#set heading(numbering: "1.")
#show title: set text(size: 20pt)
#show title: set align(center)
#set text(
  lang: "pl",
)
#set par(justify: true)
#set page(margin: 2cm)
#set heading(numbering: "1.")
#show heading: it => {
  if it.level > 1 {
    // We just render the body text.
    // This removes the number AND the indent.
    block(
      sticky: true,
      // above: 1.5em,
      // below: 1em,
      text(weight: "bold", size: 1.1em, it.body),
    )
  } else {
    // Let level 1 headings pass through normally
    it
  }
}
// ======================================
// Document Start
// ======================================

#text(size: 14pt, weight: 600)[
  #align(right)[03.04.2026]
]

#title[
  Elektronika Raport
  Laboratorium II
]
#text(size: 14pt)[
  #grid(
    columns: (1fr, 1fr),
    align(center)[Mateusz Kamiński], align(center)[Stanowisko 5],
  )
]

\
\
\


// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4134.png", width: 100%),
  alt: "Chart png here",
  caption: [Stanowisko 5
  ],
) <stanowisko>

#pagebreak()

= Przygotowanie
Przed przystąpieniem do pomiarów właściwych dokonano weryfikacji współpracy oscyloskopu z generatorem funkcyjnym.

Kluczowym krokiem było poprawne dopasowanie impedancji, aby uniknąć dwukrotnego przekłamania odczytu amplitudy sygnału. W tym celu:
- Na generatorze przejście do menu ustawień wyjścia: _Top Menu $arrow.r$ Output Menu ­$arrow.r$ Load Impedance_.
- Zmiana trybu pracy na _High Z_ (wysoka impedancja)

Dzięki temu dopasowano impedancję wyjściową generatora do wysoko­-omowego wejścia oscyloskopu, co 
wyeliminowało błąd mnożenia amplitudy i pozwoliło na uzyskanie rzeczywistego odczytu.

== Pojęcia
*Multimetr cyfrowy* (często nazywany miernikiem uniwersalnym) to podstawowe narzędzie diagnostyczne i pomiarowe w elektronice, które łączy w sobie funkcje kilku różnych przyrządów. W zależności od wybranego trybu pracy, pozwala na pomiar wielu wielkości elektrycznych, z których najważniejsze to:
- *Napięcie (V)* -- funkcja woltomierza (wymaga podłączenia równoległego do badanego elementu).
- *Natężenie prądu (A)* -- funkcja amperomierza (wymaga wpięcia szeregowego w obwód).
- *Rezystancja ($Omega$)* -- funkcja omomierza.
- *Pojemność kondensatora (F)* - funkcja faradomierza

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4135.png", width: 60%),
  alt: "Chart png here",
  caption: [Wygląd multimetru cyfrowego CD731a marki Sanwa
  ],
) <multimetr>


W ramach niniejszego ćwiczenia multimetr został wykorzystany jako omomierz i faradomierz w celu wyznaczenia rzeczywistych wartości elementów biernych układu (rezystorów oraz kondensatora) przed ich podłączeniem do zasilania.
= Ćwiczenie 2.1: Układ różniczkujący <teoria>

== Teoria 

*Układ różniczkujący RC* to pasywny obwód elektryczny, który z punktu widzenia analizy częstotliwościowej pełni rolę filtru górnoprzepustowego (przepuszcza sygnały o wysokich częstotliwościach, tłumiąc te o niskich).


// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/CR.png", width: 70%),
  alt: "Chart png here",
  caption: [Widok układu rózniczkującego CR 
  ],
) <CR>

*Budowa układu:* (zob. @CR)
Obwód ten składa się z dwóch podstawowych elementów biernych:
- *Kondensatora (C)* -- włączonego szeregowo ze źródłem napięcia wejściowego $u_1(t)$.
- *Rezystora (R)* -- włączonego równolegle, z którego zacisków pobierane jest napięcie wyjściowe $u_2(t)$.

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4149.png", width: 70%, height: 50%),
  alt: "Chart png here",
  caption: [Zbudowany układ CR na płytce RLC Nr 8 
  ],
) <ukladCR>

Głównym parametrem opisującym ten układ jest *stała czasowa* $tau$, która determinuje szybkość reakcji obwodu i wyrażona jest wzorem:
$ tau = R times C $

Układ ten generuje na wyjściu sygnał będący (w przybliżeniu) 
matematyczną pochodną sygnału wejściowego. 
Z układem różniczkującym wiąże się *dolna częstotliwość graniczna* $f_d$. Jest to częstotliwość, dla której tłumienie układu wynosi $-3 "dB"$. Wyznacza się ją z teoretycznego wzoru:
$ f_d = 1 / (2 pi R C) $

Z kolei teoretyczna charakterystyka amplitudowa, czyli stosunek amplitudy wyjściowej do wejściowej w funkcji częstotliwości $k(f)$, opisana jest równaniem:
$ k(f) = U_"wy"(f) / U_"we"(f) = (f/f_d) / sqrt(1 + (f/f_d)^2) $

Kąt przesunięcia fazowego $phi$ określa, o jaki kąt sygnał wyjściowy "wyprzedza" sygnał wejściowy. 
Teoretyczną wartość przesunięcia fazowego w funkcji częstotliwości opisuje wzór:

$ phi(f) = arctan(f_d / f) $ 

Warto zaznaczyć charakterystyczne punkty tej zależności: dla częstotliwości równej częstotliwości granicznej ($f = f_d$) przesunięcie fazowe wynosi dokładnie $45^o$. Dla częstotliwości bardzo niskich kąt ten dąży do $90^o$, natomiast dla bardzo wysokich dąży do $0^o$.

== Pomiary i obliczenia teorytyczne <45stopni>
Zgodnie z instrukcją, zmontowano układ różniczkujący o stałej czasowej $tau$ z przedziału $0.1 - 1$ ms. 
Na podstawie pomiarów miernikiem uniwersalnym uzyskano następujące parametry elementów:
- $C = 143 "nF"$
- $R_2 = 0.784 "k"Omega$

Dla samego rezystora $R_2$, stała czasowa wynosiła:
$ tau_2 = R_2 times C = 784 times 143 times 10^(-9) approx 0.11 "ms" $

W celu uzyskania bezpieczniejszej wartości z zadanego przedziału, połączono szeregowo rezystory, dodając $R_1 = 3.66 "k"Omega$. 
Całkowita rezystancja wyniosła $R = R_1 + R_2 = 4.444 "k"Omega$. Ostateczna stała czasowa układu wyniosła:
$ tau = R times C = 4444 times 143 times 10^(-9) approx 0.635 "ms" $

Częstotliwość graniczna układu wynosi teoretycznie:
$ f_d = 1 / (2 pi R C) = 1 / (2 pi times 0.635 times 10^(-3)) approx 250.6 "Hz" $

== Metodyka pomiarowa na przykładzie sygnału 1 kHz
Przed przystąpieniem do seryjnych pomiarów charakterystyki częstotliwościowej, szczegółowo przeanalizowano odpowiedź układu dla sygnału testowego o częstotliwości 1 kHz i amplitudzie bliskiej 2 V.

Należy w tym miejscu odnotować specyficzną konfigurację podłączenia kanałów pomiarowych do badanego obwodu, widoczną na zarejestrowanych oscylogramach:
- *Kanał 2 (niebieski)* odpowiada za sygnał wejściowy ($U_"we"$). Jego amplituda pozostaje na praktycznie stałym poziomie niezależnie od częstotliwości.
- *Kanał 1 (żółty)* obrazuje sygnał wyjściowy ($U_"wy"$). Amplituda tego sygnału rośnie wraz ze wzrostem częstotliwości, co jest zachowaniem prawidłowym dla filtru górnoprzepustowego.

// ==========================================
// Chart
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/1khz.png", width: 70%),
  alt: "Chart png here",
  caption: [Sygnał wejściowy (niebieski) i wyjściowy (żółty) dla częstotliwości 1 kHz
  ],
) <1khz>
// To ref in code use @chart_name_to_reference

Dla powyższego przypadku odczytano z narzędzi pomiarowych oscyloskopu następujące wartości:
- $U_"we" = 1.979 "V"$ (odczyt Meas 1)
- $U_"wy" = 1.921 "V"$ (odczyt Meas 2)
    
Na tej podstawie wyliczono wzmocnienie układu $k$:
$ k = U_"wy" / U_"we" = 1.921 / 1.979 approx 0.971 $

Aparatura wskazała również przesunięcie fazowe między sygnałami równe $345.9^o$ (Meas 7). Ponieważ w układzie różniczkującym sygnał wyjściowy fizycznie wyprzedza sygnał wejściowy, oscyloskop mierzy kąt z perspektywy sygnału opóźnionego. Rzeczywisty kąt przesunięcia fazowego $phi$ wynosi zatem:
$ phi = 360^o - 345.9^o = 14.1^o $

== Wyznaczenie dolnej częstotliwości granicznej ($f_d$)
Przed wykonaniem pełnej serii pomiarów, odszukano eksperymentalną dolną częstotliwość graniczną. Zmieniano częstotliwość sygnału wejściowego do momentu, w którym amplituda wyjściowa spadła do poziomu około $70.7%$ amplitudy wejściowej (co odpowiada spadkowi wzmocnienia o $-3 "dB"$).

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/granica dolna.png", width: 70%),
  alt: "Częstotliwość graniczna",
  caption: [Wyznaczenie dolnej częstotliwości granicznej układu różniczkującego]
) <granica_dolna>

Z powyższego oscylogramu odczytano:
- Amplituda sygnału wejściowego ($U_"we"$): $1.000 "V"$
- Amplituda sygnału wyjściowego ($U_"wy"$): $700.0 "mV" = 0.700 "V"$
- Częstotliwość ($f_d$): $252.1 "Hz"$

Obliczone wzmocnienie dla tego punktu wynosi:
$ k = 0.700 / 1.000 = 0.700 $
Wartość ta niezwykle precyzyjnie odpowiada teoretycznemu spadkowi wzmocnienia do poziomu $1/sqrt(2) approx 0.707$. 

Kąt przesunięcia fazowego odczytany z urządzenia wynosił $314.5^o$, co po przeliczeniu zgodnie z przyjętą metodyką daje:
$ phi = 360^o - 314.5^o = 45.5^o $

Wynik ten jest niemal identyczny z wartością teoretyczną omówioną w @45stopni, która dla częstotliwości granicznej wynosi równo $45^o$. Eksperymentalna częstotliwość graniczna ($252.1 "Hz"$) również bardzo dokładnie pokrywa się z wyliczoną na wstępie wartością teoretyczną ($250.6 "Hz"$).

Opisana powyżej metodyka odczytu amplitud (uwzględniająca nietypowe przypisanie kanałów) oraz przeliczania kąta przesunięcia fazowego została zastosowana w sposób ujednolicony dla wszystkich pozostałych częstotliwości. Wyniki pomiarów dla szerokiego przedziału zebrano w tabeli zbiorczej w kolejnym podrozdziale.
\
\

Kolejno zebrane pomiary w kolejności rosnącej częstotliwości w zakresach:
- Od częstotliwości 100 Hz do 1 kHz, krok co 100 Hz,

- Od częstotliwości 1 kHz do 10 kHz, krok co 1 kHz,

- Od częstotliwości 10 kHz do 100 kHz, krok co 10 kHz,

- Od częstotliwości 100 kHz do 300 kHz, krok co 100 kHz.

Zebrane oscylogramy dla kolejnych częstotliwości pomiarowych:

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,

  // --- ZAKRES 100 Hz - 900 Hz ---
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/100hz.png", width: 100%),
      alt: "Oscylogram 100 Hz",
      caption: [Sygnał dla f = 100 Hz]
    ) <100hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/200hz.png", width: 100%),
      alt: "Oscylogram 200 Hz",
      caption: [Sygnał dla f = 200 Hz]
    ) <200hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/300hz.png", width: 100%),
      alt: "Oscylogram 300 Hz",
      caption: [Sygnał dla f = 300 Hz]
    ) <300hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/400hz.png", width: 100%),
      alt: "Oscylogram 400 Hz",
      caption: [Sygnał dla f = 400 Hz]
    ) <400hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/500hz.png", width: 100%),
      alt: "Oscylogram 500 Hz",
      caption: [Sygnał dla f = 500 Hz]
    ) <500hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/600hz.png", width: 100%),
      alt: "Oscylogram 600 Hz",
      caption: [Sygnał dla f = 600 Hz]
    ) <600hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/700hz.png", width: 100%),
      alt: "Oscylogram 700 Hz",
      caption: [Sygnał dla f = 700 Hz]
    ) <700hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/800hz.png", width: 100%),
      alt: "Oscylogram 800 Hz",
      caption: [Sygnał dla f = 800 Hz]
    ) <800hz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/900hz.png", width: 100%),
      alt: "Oscylogram 900 Hz",
      caption: [Sygnał dla f = 900 Hz]
    ) <900hz>
  ],

  // --- ZAKRES 1 kHz - 9 kHz ---
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/1khz.png", width: 100%),
      alt: "Oscylogram 1 kHz",
      caption: [Sygnał dla f = 1 kHz]
    ) <1khz_grid>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/2khz.png", width: 100%),
      alt: "Oscylogram 2 kHz",
      caption: [Sygnał dla f = 2 kHz]
    ) <2khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/3khz.png", width: 100%),
      alt: "Oscylogram 3 kHz",
      caption: [Sygnał dla f = 3 kHz]
    ) <3khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/4khz.png", width: 100%),
      alt: "Oscylogram 4 kHz",
      caption: [Sygnał dla f = 4 kHz]
    ) <4khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/5khz.png", width: 100%),
      alt: "Oscylogram 5 kHz",
      caption: [Sygnał dla f = 5 kHz]
    ) <5khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/6khz.png", width: 100%),
      alt: "Oscylogram 6 kHz",
      caption: [Sygnał dla f = 6 kHz]
    ) <6khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/7khz.png", width: 100%),
      alt: "Oscylogram 7 kHz",
      caption: [Sygnał dla f = 7 kHz]
    ) <7khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/8khz.png", width: 100%),
      alt: "Oscylogram 8 kHz",
      caption: [Sygnał dla f = 8 kHz]
    ) <8khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/9khz.png", width: 100%),
      alt: "Oscylogram 9 kHz",
      caption: [Sygnał dla f = 9 kHz]
    ) <9khz>
  ],

  // --- ZAKRES 10 kHz - 90 kHz ---
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/10khz.png", width: 100%),
      alt: "Oscylogram 10 kHz",
      caption: [Sygnał dla f = 10 kHz]
    ) <10khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/20khz.png", width: 100%),
      alt: "Oscylogram 20 kHz",
      caption: [Sygnał dla f = 20 kHz]
    ) <20khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/30khz.png", width: 100%),
      alt: "Oscylogram 30 kHz",
      caption: [Sygnał dla f = 30 kHz]
    ) <30khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/40khz.png", width: 100%),
      alt: "Oscylogram 40 kHz",
      caption: [Sygnał dla f = 40 kHz]
    ) <40khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/50khz.png", width: 100%),
      alt: "Oscylogram 50 kHz",
      caption: [Sygnał dla f = 50 kHz]
    ) <50khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/60khz.png", width: 100%),
      alt: "Oscylogram 60 kHz",
      caption: [Sygnał dla f = 60 kHz]
    ) <60khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/70khz.png", width: 100%),
      alt: "Oscylogram 70 kHz",
      caption: [Sygnał dla f = 70 kHz]
    ) <70khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/80khz.png", width: 100%),
      alt: "Oscylogram 80 kHz",
      caption: [Sygnał dla f = 80 kHz]
    ) <80khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/90khz.png", width: 100%),
      alt: "Oscylogram 90 kHz",
      caption: [Sygnał dla f = 90 kHz]
    ) <90khz>
  ],

  // --- ZAKRES 100 kHz - 300 kHz ---
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/100khz.png", width: 100%),
      alt: "Oscylogram 100 kHz",
      caption: [Sygnał dla f = 100 kHz]
    ) <100khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/200khz.png", width: 100%),
      alt: "Oscylogram 200 kHz",
      caption: [Sygnał dla f = 200 kHz]
    ) <200khz>
  ],
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/300khz.png", width: 100%),
      alt: "Oscylogram 300 kHz",
      caption: [Sygnał dla f = 300 kHz]
    ) <300khz>
  ]
)

#[
  #set table(
    stroke: 1pt + luma(180),
    fill: (x, y) => if y == 0 { luma(40) } else if calc.even(y) { luma(235) },
    inset: 7pt,
  )

  #show table.cell: it => {
    if it.y == 0 {
      set text(white)
      strong(it)
    } else {
      it
    }
  }

*Uwaga do pomiaru dla częstotliwości 100 Hz:*
\
Z uwagi na brak odczytu bezpośredniego kąta przesunięcia fazowego z oscyloskopu, 
wartość $phi$ dla $f$ = 100Hz wyznaczono analitycznie. Wykorzystano w tym celu zmierzoną 
amplitudę wyjściową ($U_"wy" = 0.7199V$) przy napięciu wejściowym $U_"we" = 1.98V$, wyliczając wzmocnienie 
$k approx 0.364$. Ponieważ w filtrze RC 
zachodzi zależność $k = cos(phi)$, szukany kąt obliczono jako:
$ phi = arccos(0.364) approx 68.7^o $

  #figure(
    kind: "table",
    supplement: [Tabela],
    table(
      columns: (1fr, 1fr, 1fr),
      align: center + horizon,
      table.header([*Częstotliwość*], [*Amplituda $k$ [-]*], [*Przesunięcie $ phi $ [$degree$]*]),
      
      [$100$ Hz], [_*$0.364$*_], [_*$68.7$*_],
      [$200$ Hz], [$0.626$], [$51.7$],
      [$252.1$ Hz (graniczna)], [$0.700$], [$45.5$],
      [$300$ Hz], [$0.767$], [$40.3$],
      [$400$ Hz], [$0.848$], [$32.3$],
      [$500$ Hz], [$0.889$], [$26.9$],
      [$600$ Hz], [$0.919$], [$22.9$],
      [$700$ Hz], [$0.929$], [$19.9$],
      [$800$ Hz], [$0.951$], [$17.4$],
      [$900$ Hz], [$0.960$], [$15.8$],
      [$1$ kHz], [$0.970$], [$14.1$],
      [$2$ kHz], [$0.990$], [$7.0$],
      [$3$ kHz], [$0.990$], [$4.6$],
      [$4$ kHz], [$0.990$], [$3.3$],
      [$5$ kHz], [$0.990$], [$2.6$],
      [$6$ kHz], [$0.990$], [$2.2$],
      [$7$ kHz], [$0.990$], [$1.8$],
      [$8$ kHz], [$0.990$], [$1.5$],
      [$9$ kHz], [$0.990$], [$17.6$], // Zakłócenie pomiaru 
      [$10$ kHz], [$0.990$], [$1.5$],
      [$20$ kHz], [$0.970$], [$7.9$],
      [$30$ kHz], [$0.990$], [$34.3$],
      [$40$ kHz], [$0.990$], [$25.4$],
      [$50$ kHz], [$0.990$], [$18.4$],
      [$60$ kHz], [$0.989$], [$17.0$],
      [$70$ kHz], [$1.000$], [$0.3$],
      [$80$ kHz], [$0.999$], [$0.3$],
      [$90$ kHz], [$1.010$], [$11.3$],
      [$100$ kHz], [$1.010$], [$41.0$],
      [$200$ kHz], [$1.010$], [$25.8$],
      [$300$ kHz], [$1.010$], [$193.6$] // Znaczny błąd pomiaru cyfrowego
    ),
    caption: [Zbiorcze zestawienie wzmocnienia oraz kąta przesunięcia fazowego w szerokim paśmie częstotliwości.
    ],
  ) <highpass_filter_table>
]

// ==========================================
// Chart
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/charakterystyka_amplitudowa_proste_nazwy.png", width: 100%),
  alt: "Chart png here",
  caption: [Wykres przedstawia nałożone na siebie punkty pomiarowe, krzywą teoretyczną wyliczoną z wartości elementów oraz krzywą dopasowaną matematycznie metodą najmniejszych kwadratów.
  ],
) <amplituda>

// ==========================================
// Chart
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/charakterystyka_fazowa_proste_nazwy.png", width: 100%),
  alt: "Chart png here",
  caption: [Widoczne są znaczne odstępstwa wskazań oscyloskopu przy bardzo wysokich częstotliwościach (powyżej 30 kHz), wynikające prawdopodobnie ze specyfiki pomiaru przebiegów szybkozmiennych przez aparaturę.
  ],
) <faza>

== Dodatkowe zdjęcia do Ćwiczenia 2.1

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4136.png", width: 100%),
  alt: "Chart png here",
  caption: [Widok stanowiska, wraz z płytka RLC, generatorem oraz oscyloskopem 
  ],
) <photo_name_to_reference>


#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,

  // --- ZAKRES 100 Hz - 900 Hz ---
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4138.png", width: 100%),
      caption: [Generator sygnału dla f = 50 Hz]
    ) 
  ],
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4139.png", width: 100%),
      caption: [Generator sygnału dla f = 100 Hz]
    )
  ])


// ==========================================
// Chart
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/uklad rozniczkowy.png", width: 100%),
  alt: "Chart png here",
  caption: [Test układu rózniczkowego
  ],
)

= Ćwiczenie 2.2: Odpowiedź układu na różne wymuszenia
Celem tej części ćwiczenia było sprawdzenie odpowiedzi badanego układu różniczkującego na pobudzenie sygnałem odkształconym (falą prostokątną oraz trójkątną) dla różnych wartości okresu $T$ względem stałej czasowej układu $tau$.

== a) Ustalenie okresów
W pierwszej części, w sekcji Teoria sprawozdania wyliczono rzeczywistą stałą
 czasową układu: $tau approx 0.635 "ms"$. 
 Na tej podstawie wyznaczono trzy charakterystyczne okresy fali testowej:

1. *Okres mniejszy od stałej czasowej ($T = 0.1 tau$):*
$ T_"mniejszy" = 0.1 times 0.635 "ms" approx 0.0635 "ms" quad (f approx 15.7 "kHz") $

2. *Okres porównywalny ze stałą czasową ($T = 1.0 tau$):*
$ T_"porównywalny" = 1.0 times 0.635 "ms" = 0.635 "ms" quad (f approx 1.57 "kHz") $

3. *Okres znacznie większy od stałej czasowej ($T = 10 tau$):*
$ T_"większy" = 10 times 0.635 "ms" = 6.35 "ms" quad (f approx 157 "Hz") $

== b) Odpowiedź na falę prostokątną
Na generatorze sygnału ustawiono wymuszenie w postaci fali prostokątnej o wyliczonych wcześniej trzech charakterystycznych okresach: mniejszym ($0.5 tau$), porównywalnym ($1 tau$) oraz większym ($10 tau$). Poniżej zamieszczono zestawienia zarejestrowanych oscylogramów odpowiedzi układu różniczkującego (po lewej) wraz z odpowiadającymi im odczytami z generatora funkcyjnego (po prawej).

#grid(
  columns: (1fr, 1fr),
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/mniejszy prosto.png", width: 100%),
      alt: "Oscylogram 0.5 tau",
      caption: [Sygnał dla $T = 0.5 tau$. Wyjście nie nadąża opadać do zera.]
    ) <prostokat_mniejszy_osc>
  ],
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4142.png", width: 90%),
      alt: "Generator 0.5 tau",
      caption: [Ustawienia generatora dla $T = 0.5 tau$.]
    ) <prostokat_mniejszy_gen>
  ]
)

#grid(
  columns: (1fr, 1fr),
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/porownywalny prosto.png", width: 100%),
      alt: "Oscylogram 1 tau",
      caption: [Sygnał prostokątny o okresie porównywalnym ze stałą czasową ($T = 1 tau$).]
    ) <prostokat_porownywalny_osc>
  ],
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4143.png", width: 90%),
      alt: "Generator 1 tau",
      caption: [Ustawienia generatora dla $T = 1 tau$.]
    ) <prostokat_porownywalny_gen>
  ]
)

#grid(
  columns: (1fr, 1fr),
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/wieksza prosto.png", width: 100%),
      alt: "Oscylogram 10 tau",
      caption: [Sygnał dla $T = 10 tau$. Widoczne prawidłowe różniczkowanie ("szpilki").]
    ) <prostokat_wiekszy_osc>
  ],
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4144.png", width: 90%),
      alt: "Generator 10 tau",
      caption: [Ustawienia generatora dla $T = 10 tau$.]
    ) <prostokat_wiekszy_gen>
  ]
)
\
\
#pagebreak()
== c) Odpowiedź na falę trójkątną
Podobnie jak w podpunkcie b), zmieniono jedynie rodzaj fali na trójkątną.

#grid(
  columns: (1fr, 1fr),
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/mniejszy.png", width: 100%),
      alt: "Oscylogram 0.5 tau",
      caption: [Sygnał dla $T = 0.5 tau$. Sygnał wyjściowy ulega zniekształceniu i nie przypomina pochodnej wejścia.]
    ) <trojkat_mniejszy_osc>
  ],
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4145.png", width: 90%),
      alt: "Generator 0.5 tau",
      caption: [Ustawienia generatora dla $T = 0.5 tau$.]
    ) <trojkat_mniejszy_gen>
  ]
)

#grid(
  columns: (1fr, 1fr),
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/porównywalna.png", width: 100%),
      alt: "Oscylogram 1 tau",
      caption: [Sygnał trójkątny o okresie porównywalnym ze stałą czasową ($T = 1 tau$).]
    ) <trojkat_porownywalny_osc>
  ],
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4146.png", width: 90%),
      alt: "Generator 1 tau",
      caption: [Ustawienia generatora dla $T = 1 tau$.]
    ) <trojkat_porownywalny_gen>
  ]
)

#grid(
  columns: (1fr, 1fr),
  [
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/wiekszy.png", width: 100%),
      alt: "Oscylogram 10 tau",
      caption: [Sygnał dla $T = 10 tau$. Widoczne prawidłowe różniczkowanie (na wyjściu otrzymano falę prostokątną).]
    ) <trojkat_wiekszy_osc>
  ],
  [
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4144.png", width: 90%),
      alt: "Generator 10 tau",
      caption: [Ustawienia generatora dla $T = 10 tau$.]
    ) <trojkat_wiekszy_gen>
  ]
)

== d) Wnioski
Na podstawie zarejestrowanych oscylogramów można jednoznacznie stwierdzić, że układ typu filtr górnoprzepustowy (CR) pełni funkcję układu różniczkującego jedynie przy spełnieniu określonego warunku częstotliwościowego. 

Układ różniczkuje sygnał poprawnie wyłącznie wtedy, gdy stała czasowa
układu jest znacznie mniejsza od okresu sygnału wejściowego ($tau << T$). W naszym przypadku najlepsze efekty wizualne (krótkie impulsy zwane "szpilkami" dla fali prostokątnej oraz fala prostokątna dla wejściowej fali trójkątnej)
zaobserwowano dla okresu $T = 10 tau$. Dla okresów mniejszych ($T = 0.5 tau$) układ nie nadążał, w wyniku czego na wyjściu obserwowano sygnał bardzo zbliżony do wejściowego (brak różniczkowania).

== Ekstra - dowód różniczkowania
W celu udowodnienia faktu, że sygnał wyjściowy jest matematyczną różniczką (pochodną po czasie) sygnału wejściowego, poddano analizie dodatkowy pomiar dla fali trójkątnej o niskiej częstotliwości ($f = 20.00 "Hz"$, $T = 50.01 "ms"$). W tym przypadku warunek $tau << T$ jest spełniony z ogromnym zapasem ($T approx 78 tau$).

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/rozniczka, trojkat duzy okres 50ms.png", width: 85%),
  alt: "Różniczkowanie fali trójkątnej",
  caption: [Różniczkowanie fali trójkątnej w czasie rzeczywistym. Widoczna niebieska fala trójkątna (wejście) oraz wyliczona fizycznie przez układ żółta fala prostokątna (wyjście).]
) <ekstra_rozniczkowanie>

*Analiza punktowa z oscylogramu:*
\
Zgodnie z matematyką rachunku różniczkowego, pochodna z funkcji liniowo rosnącej (zbocze narastające fali trójkątnej) jest wartością stałą dodatnią, a z funkcji liniowo malejącej - wartością stałą ujemną. Przebieg wyjściowy (żółty) idealnie odwzorowuje to zachowanie, tworząc falę prostokątną.

#pagebreak()
= Ćwiczenie 2.3: Układ całkujący

== Teoria

*Układ całkujący RC* to pasywny obwód elektryczny, który z punktu widzenia analizy częstotliwościowej pełni rolę filtru dolnoprzepustowego (przepuszcza sygnały o niskich częstotliwościach, tłumiąc te o wysokich).

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/Uklad RC.png", width: 70%, height: 15%), // Podmień na schemat układu RC
  alt: "Schemat układu całkującego RC",
  caption: [Widok układu całkującego RC]
) <RC>

*Budowa układu:* (zob. @RC)
W przeciwieństwie do układu różniczkującego, w układzie całkującym zmieniono kolejność elementów:
- *Rezystor (R)* -- jest teraz włączony szeregowo ze źródłem napięcia wejściowego $u_1(t)$.
- *Kondensator (C)* -- znajduje się w gałęzi równoległej, i to z niego pobierane jest napięcie wyjściowe $u_2(t)$.

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4150.png", width: 70%, height: 50%), // Podmień na zdjęcie zmontowanego RC
  alt: "Zmontowany układ RC",
  caption: [Zbudowany układ RC na płytce RLC]
) <ukladRC>

Układ ten generuje na wyjściu sygnał będący matematyczną całką sygnału wejściowego (z pewnym przybliżeniem). Głównym parametrem opisującym obwód jest ponownie stała czasowa $tau$, liczona w identyczny sposób:
$ tau = R times C $

Dla układu całkującego (filtru dolnoprzepustowego) definicja *górnej częstotliwości granicznej* $f_g$ pozostaje taka sama jak poprzednio – jest to częstotliwość, dla której tłumienie wynosi $-3 "dB"$, a jej wartość określa wzór:
$ f_g = 1 / (2 pi R C) $

Zmieniają się jednak kluczowe równania matematyczne charakteryzujące ten układ. Teoretyczna charakterystyka amplitudowa wyraża się równaniem:
$ k(f) = U_"wy"(f) / U_"we"(f) = 1 / sqrt(1 + (f/f_g)^2) $

Kąt przesunięcia fazowego $phi$ jest w tym układzie ujemny, co oznacza, że sygnał wyjściowy jest "opóźniony" w stosunku do wejściowego. Jego zależność w funkcji częstotliwości to:
$ phi(f) = - arctan(f / f_g) $ 

Charakterystyczne punkty tej charakterystyki to: dla małych częstotliwości kąt dąży do $0^o$, dla częstotliwości granicznej wynosi dokładnie $-45^o$, a dla bardzo dużych częstotliwości dąży do $-90^o$.

== Pomiary i wyznaczenie górnej częstotliwości granicznej ($f_g$)
Podobnie jak dla układu różniczkującego, wyznaczono częstotliwość graniczną układu, szukając punktu, w którym sygnał wyjściowy spada do $approx 70.7%$ amplitudy sygnału wejściowego.

Z racji zastosowania identycznych elementów ($R = 4.444 "k"Omega$, $C = 143 "nF"$), częstotliwość teoretyczna pozostaje na poziomie $250.6 "Hz"$.

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/Cgraniczne.png", width: 70%), // PODMIEŃ NA ZDJĘCIE 244Hz DLA CAŁKUJĄCEGO
  alt: "Częstotliwość graniczna całkująca",
  caption: [Wyznaczenie górnej częstotliwości granicznej dla filtru dolnoprzepustowego.]
) <granica_gorna>

Z eksperymentu wynikło, że tłumienie rzędu $-3 "dB"$ występuje przy częstotliwości $f_g = 244 "Hz"$ (zmierzone $U_"wy" = 699.9 "mV"$ przy przyjętym napięciu $1000 "mV"$). 

Należy nadmienić, że dla wysokich częstotliwości oscyloskop przestał prawidłowo mierzyć kąt przesunięcia fazowego (błąd "Low Amplitude"). Dla tych częstotliwości wartość fazy wyznaczono analitycznie ze wzoru $|phi| = arccos(k)$. Wartości te zaznaczono w tabeli kursywą i pogrubiono.

#[
  #set table(
    stroke: 1pt + luma(180),
    fill: (x, y) => if y == 0 { luma(40) } else if calc.even(y) { luma(235) },
    inset: 7pt,
  )

  #show table.cell: it => {
    if it.y == 0 {
      set text(white)
      strong(it)
    } else {
      it
    }
  }

  #figure(
    kind: "table",
    supplement: [Tabela],
    table(
      columns: (1fr, 1fr, 1.2fr, 1.2fr),
      align: center + horizon,
      table.header([*Częstotliwość*], [*Amplituda $U_"wy"$ ["mV"]*], [*Wzmocnienie $k$ [-]*], [*Faza $|phi|$ [$degree$]*]),
      
      [$30$ Hz], [$1000.0$], [$1.000$], [$7.0$],
      [$50$ Hz], [$979.2$], [$0.979$], [$11.0$],
      [$70$ Hz], [$959.8$], [$0.960$], [$14.3$],
      [$90$ Hz], [$940.8$], [$0.941$], [$19.1$],
      [$100$ Hz], [$920.2$], [$0.920$], [$21.1$],
      [$200$ Hz], [$780.6$], [$0.781$], [$37.7$],
      [$244$ Hz (graniczna)], [$699.9$], [$0.700$], [$43.2$],
      [$300$ Hz], [$640.5$], [$0.641$], [$49.0$],
      [$400$ Hz], [$520.2$], [$0.520$], [$56.7$],
      [$600$ Hz], [$379.6$], [$0.380$], [_*$67.7$*_],
      [$800$ Hz], [$299.8$], [$0.300$], [_*$72.6$*_],
      [$900$ Hz], [$259.8$], [$0.260$], [_*$74.9$*_],
      [$1$ kHz], [$220.1$], [$0.220$], [_*$77.3$*_],
      [$2$ kHz], [$100.0$], [$0.100$], [_*$84.3$*_],
      [$2.5$ kHz], [$99.9$], [$0.100$], [_*$84.3$*_],
      [$3$ kHz], [$59.9$], [$0.060$], [_*$86.6$*_],
      [$4$ kHz], [$60.0$], [$0.060$], [_*$86.6$*_],
      [$5$ kHz], [$19.9$], [$0.020$], [_*$88.9$*_],
      [$6$ kHz], [$20.2$], [$0.020$], [_*$88.8$*_],
      [$7$ kHz], [$20.0$], [$0.020$], [_*$88.9$*_],
      [$8$ kHz], [$20.0$], [$0.020$], [_*$88.9$*_],
      [$9$ kHz], [$20.0$], [$0.020$], [_*$88.9$*_],
      [$10$ kHz], [$20.0$], [$0.020$], [_*$88.9$*_],
      [$20$ kHz], [$20.0$], [$0.020$], [_*$88.9$*_]
    ),
    caption: [Zbiorcze zestawienie pomiarów charakterystyki układu całkującego.] 
  ) <lowpass_filter_table>
]

// ==========================================
// Chart
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./charakterystyka_amplitudowa_calkujacy.png", width: 100%),
  alt: "Charakterystyka amplitudowa układu całkującego",
  caption: [Charakterystyka amplitudowa układu całkującego. Sygnał jest przepuszczany dla małych częstotliwości i silnie tłumiony powyżej częstotliwości granicznej $f_g$. Zaznaczono krzywą teoretyczną oraz krzywą dopasowaną matematycznie metodą najmniejszych kwadratów.]
) <amplituda_calk>

// ==========================================
// Chart
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./charakterystyka_fazowa_calkujacy.png", width: 100%),
  alt: "Charakterystyka fazowa układu całkującego",
  caption: [Charakterystyka fazowa układu całkującego (moduł kąta opóźnienia). Wykres przedstawia dane zarejestrowane bezpośrednio z oscyloskopu (kropki) oraz dane wyliczone analitycznie dla rejonów, w których aparatura zgłosiła błąd "Low Amplitude" (krzyżyki).]
) <faza_calk>

// // ==========================================
// // Chart
// // ==========================================
// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("/photos/IMG_4068.jpg", width: 70%),
//   alt: "Chart png here",
//   caption: [Chart description
//   ],
// ) <chart_name_to_reference>
// // To ref in code use @chart_name_to_reference


// // ==========================================
// // Photo
// // ==========================================
// #figure(
//   kind: "photo",
//   supplement: [Zdjęcie],
//   image("/photos/IMG_4068.jpg", width: 70%),
//   alt: "Chart png here",
//   caption: [Photo description
//   ],
// ) <photo_name_to_reference>
