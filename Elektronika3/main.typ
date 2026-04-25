// Import external packages
// Math and symbols
#import "@preview/physica:0.9.7": *
// Podpisy tabel lądują na górze
#show figure.where(kind: "table"): set figure.caption(position: top)
// Drawing circuit diagrams
#import "@preview/circuiteria:0.2.0": *

// Numerowanie wzorów
#set math.equation(numbering: "(1)")

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
    block(
      sticky: true,
      text(weight: "bold", size: 1.1em, it.body),
    )
  } else {
    it
  }
}
// ======================================
// Document Start
// ======================================

#text(size: 14pt, weight: 600)[
  #align(right)[22.04.2026] 
]

#title[
  Elektronika Raport
  Laboratorium III
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
  image("./2_1/IMG_4218.png", width: 100%),
  alt: "Chart png here",
  caption: [Stanowisko 5
  ],
) <stanowisko>

#pagebreak()

= Ćwiczenie 3.1: Schemat Płytki UA-1
== Treść
Zapoznać się ze schematem ideowym układu wzmacniacza operacyjnego.

== Płytka montażowa
// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./2_1/PlytkaUA.png", width: 80%), // WRZUĆ SWOJĄ FOTĘ LUB ZOSTAW TĘ
  alt: "Płytka UA",
  caption: [Widok płytki montażowej UA-1 ze wzmacniaczem operacyjnym],
) <plytka_ua>

Zanotowane wartości napięć na pinach zasilacza:
- Napięcie dodatnie: *11.98V*
- Napięcie ujemne: *-12.01V*
- Napięcie masy: *0V*

= Ćwiczenie 3.2: Wzmacniacz odwracający fazę o wzmocnieniu 10
== Treść
Zmontować sumator o dwóch wejściach.  Zsumować drgania sinusoidalne z dwóch generatorów,
obserwować zdudnienia przebiegów.
== Teoria
=== Sprzężenie zwrotne
Sprzężeniem zwrotnym nazywa się oddziaływanie skutku na przyczynę.
Za pomocą sprzężenia zwrotnego można wpływać na własności urządzeń elektronicznych.
Podstawowym układem elektronicznym, w którym stosuje się sprzężenie zwrotne jest
*wzmacniacz*. Część sygnału wyjściowego, zwana sygnałem zwrotnym, zostaje skierowana
do wejścia układu i zsumowana z sygnałem wejściowym.

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./2_2/wzmacniacz_bez_sprzezenia.png", width: 70%),
      alt: "Chart png here",
      caption: [Schemat wzmacniacza bez sprzężenia zwrotnego
      ],
    ) <photo1>],

  align(center)[
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./2_2/wzmaczniacz_ze_sprzezeniem.png", width: 70%),
      alt: "Chart png here",
      caption: [Schemat wzmacniacza z sprzężeniem zwrotnym
      ],
    ) <photo2>],
)


=== Wzmacniacz operacyjny

Wzmacniacz operacyjny (patrz @wzmacniacz) jest to wzmacniacz o bardzo dużym wzmocnieniu napięciowym, który posiada dwa wejścia i jedno wyjście.

Jedno z wejść ($U_-$) nosi nazwę odwracającego – sygnał wyjściowy jest przesunięty w fazie o 180° względem sygnału przyłożonego do tego wejścia.

Drugie wejście ($U_+$) nazywa się nieodwracającym – sygnał wyjściowy jest zgodny w fazie z sygnałem podanym na to wejście.

Wzmacniacz operacyjny realizuje funkcję:
$ U_"WY" = K(U_+ - U_-) $

Wzmacniacz operacyjny jest przeznaczony zwykle do pracy z zewnętrznym obwodem sprzężenia zwrotnego, które decyduje o głównych własnościach całego układu. Wzmacniacz operacyjny jest najbardziej uniwersalnym układem analogowym o bardzo szerokich możliwościach zastosowań. Wzmacniacze operacyjne realizowane są w postaci układów scalonych.

Zasilane są zazwyczaj napięciami symetrycznymi ($U_"CC" = +15 "V"$, $U_"EE" = -15 "V"$).


// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./2_2/wzmacniacz_operacyjny.png", width: 70%),
  alt: "Chart png here",
  caption: [Schemat wzmacniacza operacyjnego z zaznaczonymi wejściami odwracającym i nieodwracającym
  ],
) <wzmacniacz>


=== Wzmaczniacz odwracający
Wzmaczniacz odwracający fazę (patrz @wzmacniacz_odwracajacy) to układ, który mnoży amplitudę sygnału wejściowego i odwraca jego fazę o 180 stopni. Sygnał wejściowy podajemy na wejście odwracające ($U_-$). Sprzężenie zwrotne realizujemy poprzez rezystor $R_2$. Na wejście nieodwracające ($U_+$) podłączamy masę (0V). Wzmocnienie określa stosunek rezystancji w pętli sprzężenia zwrotnego. Wzór na napięcie wyjściowe:
$ U_"wy" = - R_f / R_1 U_"we" $
Aby uzyskać wzmocnienie 10-krotne, należy dobrać opornik $R_f$ tak, aby był 10 razy większy od $R_1$.

== Schemat układu
// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./2_2/odwracajacy_faze.png", width: 70%),
  alt: "Chart png here",
  caption: [Schemat wzmacniacza operacyjnego z zaznaczonymi wejściami odwracającym i nieodwracającym
  ],
) <wzmacniacz_odwracajacy> 


== Budowa układu
W naszym przypadku $R_f = R_2$, dlatego do budowy układu wykorzystano następujące rezystory:
- $R_1 = $ *10 kΩ*
- $R_f = $ *100 kΩ*

Przybliżone wartości zmierzone miernikiem:
- $R_1 = $ *9.97 kΩ*
- $R_f = $ *98.9 kΩ*

== Zmontowany układ

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  // Używaj samej funkcji rotate na zewnątrz, to daje lepszą kontrolę
  rotate(-90deg)[
    #image("./2_2/wzmaczniacz_odwracajacy.png", width: 70%, height: 50%) 
  ],
  caption: [Układ wzmacniacza odwracającego zmontowany na płytce UA-1],
) <uklad_foto>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/Wszystkie_pomiary.png", width: 80%),
  caption: [Pomiar amplitudy wejścia/wyjścia oraz fazy dla wzmacniacza odwracającego fazę],
)

Zgodnie z teorią na wyjściu uzyskujemy sygnał o 10-krotnie większej amplitudzie i odwróconej fazie względem sygnału wejściowego, przy niezmienionej częstotliwości. Pomiary kursorami oscyloskopu:
- Amplituda sygnału wejściowego: *[1.040 V]*
- Amplituda sygnału wyjściowego: *[10.20 V]*
- Częstotliwość sygnału wejściowego: *[999.9 Hz]*
- Częstotliwość sygnału wyjściowego: *[1000 Hz]*
- Różnica faz: *[180.8°]* 

== Dodatkowe zdjęcia/obserwacje

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/Wzmaczniacz x10.png", width: 80%),
  caption: [Za duża skala, przez co amplituda się rozjeżdża],
)

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/Wzmaczniacz_faza_x10.png", width: 80%),
  caption: [Amplituda 2V, Wyjście 20V, wyraźnie odwrócona faza],
)

== Charakterystyka częstotliwościowa i fazowa
Przeprowadzono pomiary dla rosnącej częstotliwości w celu wyznaczenia górnej częstotliwości granicznej ($f_g$), przy której sygnał wyjściowy staje się 10 razy mniejszy.

== Pomiary do charakterystyki częstotliwościowej i fazowej
// Dokładna lista plików odczytana z Twojego screena:
#let pliki = (
  // Hz
  "100hz.png", "200hz.png", "300hz.png", "400hz.png", "500hz.png", "600hz.png", "700hz.png", "800hz.png", "900hz.png",
  // kHz (pojedyncze)
  "1khz.png", "2khz.png", "3khz.png", "4khz.png", "5khz.png", "6khz.png", "7khz.png", "8khz.png", "9khz.png",
  // kHz (dziesiątki)
  "10khz.png", "20khz.png", "30khz.png", "40khz.png", "50khz.png", "60khz.png", "70khz.png", "80khz.png", "90khz.png",
  // kHz (setki - uwaga, celowo usunięto 600 i 800 bo ich nie masz!)
  "100khz.png", "200khz.png", "300khz.png", "500khz.png", "700khz.png", "900khz.png",
  // MHz
  "1.1mhz.png", "1.4mhz.png", "1.7mhz.png", "2mhz.png", "2.3mhz.png" 
)

// Rozrzucamy to automatycznie do grida
#grid(
  columns: (1fr, 1fr), // 2 zdjęcia w rzędzie
  gutter: 1em,
  align: center,
  ..pliki.map(plik => [
    #figure(
      image("./2_2/" + plik, width: 95%), 
      caption: [Częstotliwość: #plik.replace(".png", "").replace(" (graniczna)", "")]
    )
  ])
)

// Miejsce na wykresy z Origin/SciDavis
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/2.6mhz (graniczna).png", width: 80%, height: 29%),
  caption: [2.6 MHz - wartość graniczna, przy której sygnał wyjściowy jest 10 razy mniejszy od wejściowego],
) <charakterystyka>


== Ćwiczenie 3.3: Sumator o dwóch wejściach
=== Teoria
Sumator dodaje do siebie sygnały z kilku wejść. Podanie dwóch fal sinusoidalnych o podobnej amplitudzie i nieznacznie różnej częstotliwości powoduje powstanie zjawiska dudnień, czyli fali o pulsującej amplitudzie.

=== Zadanie praktyczne
Wykorzystane rezystory w układzie sumatora:
- $R_1 = $ *[TUTAJ]*
- $R_2 = $ *[TUTAJ]*
- $R_f = $ *[TUTAJ]*

Zaobserwowano nałożenie dwóch fal sinusoidalnych z generatorów.

// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("./screens/placeholder.png", width: 85%), // PODMIEŃ NA FOTE DUDNIEN
//   caption: [Wizualizacja zjawiska dudnień po zsumowaniu fal],
// ) <dudnienia3>

Pomiary kursorami:
- Częstotliwość sygnału zsumowanego (wypadkowa): *[WPISZ Hz]*
- Częstotliwość obwiedni (dudnień): *[WPISZ Hz]*


== Ćwiczenie 3.4: Przerzutnik Schmitta
=== Teoria
Przerzutnik Schmitta to komparator z pętlą dodatniego sprzężenia zwrotnego. Charakteryzuje się zjawiskiem histerezy, co uodparnia go na zaszumienie sygnału wejściowego. Niezależnie od podanego kształtu fali (sinus, trójkąt), na wyjściu generuje ostry przebieg prostokątny. Napięcie przerzutu liczy się ze wzoru:
$ U_p = R_2 / (R_1 + R_2) U_"wy" $

=== Zadanie praktyczne
Układ zmontowano w celu uzyskania histerezy równej 1V. Użyte rezystory (ustawione na potencjometrach):
- $R_1 = $ *[TUTAJ]*
- $R_2 = $ *[TUTAJ]*

// #grid(
//   columns: (1fr, 1fr),
//   align(center)[
//     #figure(
//       kind: "chart",
//       supplement: [Wykres],
//       image("./screens/placeholder.png", width: 95%), // PODMIEŃ (SINUS)
//       caption: [Wyjście dla sygnału sinusoidalnego],
//     ) <schmitt_sin>],

//   align(center)[
//     #figure(
//       kind: "chart",
//       supplement: [Wykres],
//       image("./screens/placeholder.png", width: 95%), // PODMIEŃ (TRÓJKĄT)
//       caption: [Wyjście dla sygnału trójkątnego],
//     ) <schmitt_tri>],
// )

// === Pętla histerezy (Tryb X-Y)
// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("./screens/placeholder.png", width: 80%), // PODMIEŃ NA WYKRES XY Z OSCYLOSKOPU
//   caption: [Zmierzona statyczna charakterystyka układu (histereza)],
// ) <histereza>


== Ćwiczenie 3.5: Multiwibrator astabilny
=== Teoria
Multiwibrator astabilny to generator drgań prostokątnych, który nie posiada stabilnego stanu operacyjnego. Cyklicznie przerzuca swoje stany ładując i rozładowując kondensator. Teoretyczny okres drgań ($T$) oblicza się ze wzoru:
$ T = 2 R C ln((1 + gamma)/(1 - gamma)), quad "gdzie" quad gamma = R_2 / (R_1 + R_2) $

=== Zadanie praktyczne
Do budowy układu wykorzystano elementy o parametrach:
- $C = $ *[TUTAJ]*
- $R_1 = $ *[TUTAJ]*
- $R_2 = $ *[TUTAJ]*

// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("./screens/placeholder.png", width: 80%), // PODMIEŃ FOTKE IMPULSÓW
//   caption: [Przebiegi impulsów na wejściu układu i w punkcie "1"],
// ) <multiwibrator>

*Porównanie okresu drgań:*
- Wartość wyliczona teoretycznie: *[WPISZ WYNIK]*
- Wartość zmierzona kursorami: *[WPISZ WYNIK]*


== Podsumowanie
Laboratorium umożliwiło empiryczne zapoznanie się ze specyfiką pracy wzmacniaczy operacyjnych. Zbudowano i przetestowano w praktyce cztery różne aplikacje tego samego podzespołu: wzmacniacz odwracający, sumator napięć, przerzutnik Schmitta oraz multiwibrator astabilny. Pomiary za pomocą oscyloskopu w dużej mierze pokryły się z matematycznymi obliczeniami teoretycznymi układów z ujemnym i dodatnim sprzężeniem zwrotnym.

=== Załącznik: Notatki
// Odkomentuj jeśli wrzucasz notatki w txt
// #read("./notatki3.txt")

#pagebreak()

// Główny spis treści
#outline(title: [Spis treści])
#v(2em)

// Spis rysunków
#outline(
  title: [Spis rysunków],
  target: figure.where(kind: "photo").or(figure.where(kind: "chart"))
)
#v(2em)

// Spis tabel
#outline(
  title: [Spis tabel],
  target: figure.where(kind: "table")
)

// #grid(
//   columns: (1fr, 1fr),
//   align(center)[
//     #figure(
//       kind: "photo",
//       supplement: [Zdjęcie],
//       image("/photos/IMG_4068.jpg", width: 70%),
//       alt: "Chart png here",
//       caption: [Cat
//       ],
//     ) <photo1>],

//   align(center)[
//     #figure(
//       kind: "photo",
//       supplement: [Zdjęcie],
//       image("/photos/IMG_4068.jpg", width: 70%),
//       alt: "Chart png here",
//       caption: [Kitty Cat
//       ],
//     ) <photo2>],
// )

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
// )


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
// )/ )