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
- Napięcie dodatnie: *11.89V*
- Napięcie ujemne: *-11.90V*
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
  caption: [Schemat wzmacniacza operacyjnego odwracającego
  ],
) <wzmacniacz_odwracajacy> 


== Budowa układu
W naszym przypadku $R_f = R_2$, dlatego do budowy układu wykorzystano następujące rezystory:
- $R_1 = $ *10 kΩ*
- $R_f = $ *100 kΩ*

Przybliżone wartości zmierzone miernikiem:
- $R_1 = $ *9.997 kΩ*
- $R_f = $ *100.1 kΩ*

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

#let pliki = (
  // Hz
  "100hz.png", "200hz.png", "300hz.png", "400hz.png", "500hz.png", "600hz.png", "700hz.png", "800hz.png", "900hz.png",
  // kHz (pojedyncze)
  "1khz.png", "2khz.png", "3khz.png", "4khz.png", "5khz.png", "6khz.png", "7khz.png", "8khz.png", "9khz.png",
  // kHz (dziesiątki)
  "10khz.png", "20khz.png", "30khz.png", "40khz.png", "50khz.png", "60khz.png", "70khz.png", "80khz.png", "90khz.png",
  // kHz (setki)
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
      kind: "chart",
      supplement: [Wykres],
      image("./2_2/" + plik, width: 95%), 
      caption: [Częstotliwość: #plik.replace(".png", "").replace("khz", " kHz").replace("mhz", " MHz").replace("hz", " Hz")],
    )
  ])
)

// Miejsce na wykresy z Origin/SciDavis
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/2.6mhz (graniczna).png", width: 80%, height: 29%),
  caption: [2.6 MHz - wartość graniczna, przy której sygnał wyjściowy jest 10 razy mniejszy od wejściowego],
)

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/wykres_fazy.png", width: 80%),
  caption: [Charakterystyka fazowa - przesunięcie fazowe między wejściem a wyjściem w funkcji częstotliwości],
) <wykres_faza>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/wykres_amplitudy.png", width: 80%),
  caption: [Charakterystyka częstotliwościowa (amplitudowa) - zależność wzmocnienia od częstotliwości],
) <wykres_amplituda>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_2/charakterystyka_zbiorcza.png", width: 80%),
  caption: [Zbiorcza charakterystyka amplitudowo-fazowa wzmacniacza odwracającego],
) <wykres_zbiorczy>

Jak widać na wykresie, wzmacniacz zapewnia stabilne wzmocnienie na poziomie x10 aż do okolic 30-40 kHz. Po przekroczeniu tej granicy zaczyna się równia pochyła – układ po prostu przestaje wyrabiać. Amplituda spada, a faza całkowicie odchodzi od teoretycznych 180 stopni. Winowajcą jest ograniczone pasmo przenoszenia samego układu scalonego, które przy wysokich częstotliwościach zaczynają działać jak filtr dolnoprzepustowy.

#figure(
  kind: "table",
  supplement: [Tabela],
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    table.header([*Częstotliwość*], [*$U_"we"$ ["V"]*], [*$U_"wy"$ ["V"]*], [*Wzmocnienie $K$ [-]*], [*Faza $|phi|$ [$degree$]*]),
    
    [$100$ Hz], [$1.04$], [$10.400$], [$10.00$], [$180.00$],
    [$200$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.30$],
    [$300$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.30$],
    [$400$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.40$],
    [$500$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.50$],
    [$600$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.50$],
    [$700$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.60$],
    [$800$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.70$],
    [$900$ Hz], [$1.04$], [$10.240$], [$9.85$], [$180.80$],
    [$1$ kHz], [$1.04$], [$10.240$], [$9.85$], [$180.90$],
    [$2$ kHz], [$1.04$], [$10.240$], [$9.85$], [$181.50$],
    [$3$ kHz], [$1.04$], [$10.160$], [$9.77$], [$182.30$],
    [$4$ kHz], [$1.04$], [$10.160$], [$9.77$], [$183.30$],
    [$5$ kHz], [$1.04$], [$10.160$], [$9.77$], [$183.90$],
    [$6$ kHz], [$1.04$], [$10.160$], [$9.77$], [$184.60$],
    [$7$ kHz], [$1.04$], [$10.080$], [$9.69$], [$185.40$],
    [$8$ kHz], [$1.04$], [$10.080$], [$9.69$], [$186.30$],
    [$9$ kHz], [$1.04$], [$10.000$], [$9.62$], [$187.10$],
    [$10$ kHz], [$1.04$], [$10.000$], [$9.62$], [$187.90$],
    [$20$ kHz], [$1.04$], [$9.680$], [$9.49$], [$199.20$],
    [$30$ kHz], [$1.04$], [$8.560$], [$8.39$], [$216.20$],
    [$40$ kHz], [$1.04$], [$6.960$], [$6.69$], [$230.20$],
    [$50$ kHz], [$1.04$], [$5.760$], [$5.54$], [$239.10$],
    [$60$ kHz], [$1.04$], [$4.800$], [$4.62$], [$245.00$],
    [$70$ kHz], [$1.04$], [$4.160$], [$4.00$], [$249.50$],
    [$80$ kHz], [$1.04$], [$3.680$], [$3.54$], [$252.70$],
    [$90$ kHz], [$1.04$], [$3.360$], [$3.23$], [$255.40$],
    [$100$ kHz], [$1.04$], [$2.960$], [$2.85$], [$257.70$],
    [$200$ kHz], [$1.04$], [$1.500$], [$1.44$], [$270.40$],
    [$300$ kHz], [$1.04$], [$0.984$], [$0.95$], [$277.80$],
    [$500$ kHz], [$1.04$], [$0.592$], [$0.56$], [$290.50$],
    [$700$ kHz], [$1.04$], [$0.416$], [$0.39$], [$301.90$],
    [$900$ kHz], [$1.04$], [$0.328$], [$0.32$], [$312.90$],
    [$1$ MHz], [$1.04$], [$0.256$], [$0.25$], [$325.10$],
    [$1.4$ MHz], [$1.02$], [$0.208$], [$0.20$], [$337.10$],
    [$1.7$ MHz], [$1.01$], [$0.160$], [$0.16$], [$344.10$],
    [$2$ MHz], [$1.00$], [$0.132$], [$0.13$], [$352.90$],
    [$2.3$ MHz], [$0.98$], [$0.116$], [$0.12$], [$11.12$],
    [$2.6$ MHz], [$0.98$], [$0.100$], [$0.10$], [$21.26$]
  ),
  caption: [Zbiorcze zestawienie pomiarów charakterystyki wzmacniacza odwracającego.]
) <tabela_pomiary_odwracajacy>


== Podsumowanie
- *Działanie układu:* Zmontowany wzmacniacz odwracający spełnia swoje zadanie – zgodnie z teorią odwraca fazę sygnału wejściowego o 180 stopni.
- *Wzmocnienie:* Stosunek użytych rezystorów sprzężenia sprawdził się w praktyce, dając nam równe, dziesięciokrotne przebicie amplitudy dla niskich i średnich częstotliwości.
- *Praktyka:* Pomiary udowodniły, że "idealny wzmacniacz operacyjny" istnieje tylko na papierze. W rzeczywistości każdy układ ma swoją częstotliwość graniczną, po której układ (wzmacniacz) traci swoje nominalne parametry.



= Ćwiczenie 3.3: Sumator o dwóch wejściach
== Treść
Zmontować sumator o dwóch wejściach.  Zsumować drgania sinusoidalne z dwóch generatorów,
obserwować zdudnienia przebiegów.
== Teoria
Sumator dodaje do siebie sygnały z kilku wejść. Podanie dwóch fal sinusoidalnych o podobnej amplitudzie i nieznacznie różnej częstotliwości powoduje powstanie zjawiska dudnień, czyli fali o pulsującej amplitudzie.

== Schemat układu
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./2_3/sumator.png", width: 80%),
  caption: [Schemat ideowy dwuwejściowego sumatora napięć odwracającego],
)

== Budowa układu
Wykorzystane rezystory i napięcia w układzie sumatora:
- $U_1 = $ *[1.000 V]*
- $U_2 = $ *[1.000 V]*
- $R_1 = $ *[9.98 kΩ]*
- $R_2 = $ *[9.99 kΩ]*
- $R_f = $ *[10.1 kΩ]*

== Zmontowany układ
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  rotate(-90deg)[
    #image("./2_3/IMG_4220.png", width: 70%, height: 50%) 
  ],
  caption: [Zmontowany układ sumatora na płytce prototypowej UA-1],
) <wykres_zbiorczy>

== Pomiary i obserwacje
Na początek zsumowanie dwóch fal sinusoidalnych o równych częstotliwościach $U_1 = U_2 = 1.000 V$:
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/suma sygnalow.png", width: 85%),
  caption: [Przebieg czasowy sumy dwóch sygnałów o identycznej częstotliwości.],
) <dudnienia3>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/dudnienie.png", width: 85%),
  caption: [Potwierdzenie sumy sygnałów na wyjściu sumatora.],
)

Pomiary kursorami:
- Częstotliwość sygnału wyjściowego: *[1.000 kHz]* (pozostaje niezmieniona)
- Częstotliwość sygnału zsumowanego: *[2.160 Hz]*
- Faza sygnału zsumowanego: *[180.4 °]*

Co się zgadza z naszymi oczekiwaniami – otrzymujemy falę o częstotliwości równej sumie częstotliwości obu sygnałów wejściowych, a jego faza jest odwrócona o 180 stopni względem sygnałów wejściowych.

== Dudnienia
Dudnienia to zjawisko powstające w wyniku nakładania się dwóch fal o podobnych częstotliwościach. W naszym przypadku, gdy $U_1$ i $U_2$ mają bardzo zbliżone częstotliwości, na wyjściu obserwujemy falę o pulsującej amplitudzie. Częstotliwość dudnień jest wtedy dokładnie równa wartości bezwzględnej z różnicy częstotliwości obu sygnałów wejściowych ($f_"dud" = |f_1 - f_2|$).


#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    // Uwaga: sprawdź czy to na pewno .png, wcześniej wrzucałeś .jpg!
    image("./2_3/generator_1V.png", width: 95%),
    caption: [Generator 1: $f_1 = 1.000 "kHz"$]
  ),
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    image("./2_3/generator_1050V.png", width: 95%),
    caption: [Generator 2: $f_2 = 1.050 "kHz"$]
  )
)

Aby zaobserwować dudnienia w praktyce, ustawiliśmy niewielką różnicę częstotliwości. Przy $f_1 = 1000 "Hz"$ oraz $f_2 = 1050 "Hz"$, różnica wynosi $Delta f = 50 "Hz"$.

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/dudnienie_widac.png", width: 85%),
  caption: [Widok dudnień z oddalonej skali],
) <dudnienia_ogolne>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/dudnien wiecej.png", width: 85%),
  caption: [Dudnienia w przybliżonej skali],
) <dudnienia_wiecej>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/dudnienie duze.png", width: 85%),
  caption: [Dudnienia duże. Pomiary kursorami wskazują częstotliwość obwiedni wynoszącą 49.48 Hz.],
) <dudnienia_maks>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/dudnienie male.png", width: 85%),
  caption: [Dudnienia małe. Pomiary kursorami dla sygnału wewnątrz obwiedni wskazują częstotliwość 1.03 kHz.],
) <dudnienia_min>

Warto zaznaczyć, że sygnał "wypełniający" obwiednię dudnień oscyluje z częstotliwością równą średniej arytmetycznej obu sygnałów wejściowych:
$ f_"śr" = (f_1 + f_2) / 2 = (1000 "Hz" + 1050 "Hz") / 2 = 1025 "Hz" $

Wynik ten z dobrym przybliżeniem idealnie pokrywa się z wartością $1.03 "kHz"$, którą zmierzyliśmy ręcznie kursorami.

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/dudnienie duze.png", width: 85%),
  caption: [Dudnienia dla $Delta f = 50 "Hz"$],
) 

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./2_3/dudnienie male.png", width: 85%),
  caption: [Średnia arytmetyczna częstotliwości obu sygnałów wejściowych, czyli $f_"dud" = (f_1 + f_2) / 2$],
) 

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