// Import external packages
// Math and symbols
#import "@preview/physica:0.9.7": *
#import "@preview/circuiteria:0.2.0": *
// Podpisy tabel lądują na górze
#show figure.where(kind: "table"): set figure.caption(position: top)
// Drawing circuit diagrams
#import "@preview/circuiteria:0.2.0": *

// Numerowanie wzorów
#set math.equation(numbering: "(1)")

// Numerowanie stron
#set page(numbering: "1")

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
  #align(right)[27.05.2026] 
]

#title[
  Elektronika Raport
  Laboratorium VI
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
  image("./6_1/IMG_4527.png", width: 100%),
  alt: "Chart png here",
  caption: [Stanowisko 5
  ],
) <stanowisko>

#pagebreak()

= Ćwiczenie 6.1
== Treść
Wykorzystując płytkę UA-1, połącz układ komparatora napięcia LM 311 według poniżej
przedstawionego schematu. Wybierz amplitudę sygnałów z generatora (np. 5V) wiedząc że jego
wyjściowe napięcie chwilowe nie może wykraczać poza zakres napięcia zasilającego komparator.
Potencjometrem P nastaw napięcie z zakresu międzyszczytowego generatora, tak aby uzyskać na
wyjściu fale prostokątną. Zbadaj przebieg napięcia wyjściowego komparatora dla różnych
kształtów napięć i częstotliwości generatora. Wykonaj to samo ćwiczenie używając wzmacniacza
operacyjnego zamiast komparatora napięcia.

== Teoria
Komparator napięcia to układ elektroniczny, który porównuje dwa napięcia i generuje sygnał wyjściowy w zależności od tego, które z nich jest większe. W przypadku komparatora LM311, gdy napięcie na wejściu nieodwracającym (+) jest większe niż na wejściu odwracającym (-), wyjście komparatora jest wysokie (logiczne 1). Gdy napięcie na wejściu odwracającym (-) jest większe niż na wejściu nieodwracającym (+), wyjście komparatora jest niskie (logiczne 0). Komparator jest często używany do generowania sygnałów prostokątnych z sygnałów o różnych kształtach, takich jak sinusoidalne czy trójkątne. Wzmacniacz operacyjny może być również używany jako komparator, ale nie jest zoptymalizowany do tego celu, ponieważ może mieć wolniejszą odpowiedź i większe zużycie energii w porównaniu do dedykowanego komparatora.

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./6_1/komparator.png", width: 50%, height: 30%),
  alt: "Chart png here",
  caption: [Schemat komparatora LM311
  ],
) <stanowisko>


== Zbudowna płytka

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./6_1/IMG_4529.jpg", width: 60%),
  alt: "Chart png here",
  caption: [Wbudowana płytka z komparatorem LM311
  ],
) <stanowisko>

#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_1/IMG_4530.png", width: 100%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Pomiar potencjometru P]
    ) <przebieg_kwadrat>
  ],
  [
    #figure(
      image("./6_1/IMG_4531.png", width: 100%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Wynik pomiaru potencjometru P = 0.215 V]
    ) <przebieg_sinus>
  ]
)

== Wyniki pomiarów - Komparator napięcia
Zbadano przebieg napięcia wyjściowego komparatora dla różnych kształtów napięć i częstotliwości generatora Zgodnie z instrukcją wybrano bezpieczną amplitudę, aby wyjściowe napięcie chwilowe nie wykraczało poza zakres napięcia zasilającego komparator. Następnie potencjometrem P nastawiono napięcie z zakresu międzyszczytowego generatora (0.215 V) w celu uzyskania na wyjściu fali prostokątnej. Poniżej przedstawiono zrzuty ekranu z przebiegu napięcia wyjściowego komparatora dla różnych kształtów napięć i częstotliwości.

*Zółty sygnał to sygnał wejściowy, a niebieski to sygnał wyjściowy*

#grid(
  columns: 3,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_1/komparator/0.215mv_square.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał prostokątny 10 kHz]
    ) <przebieg_kwadrat>
  ],
  [
    #figure(
      image("./6_1/komparator/0.215mv_triangle.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał trójkątny 10 kHz]
    ) <przebieg_trojkat>
  ],
  [
    #figure(
      image("./6_1/komparator/0.215mv.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał sinusoidalny 10 kHz]
    ) <przebieg_sinus>
  ]
)

#grid(
  columns: 3,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_1/komparator/10khz 0.25V square.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał prostokątny 100 kHz]
    ) <przebieg_kwadrat>
  ],
  [
    #figure(
      image("./6_1/komparator/100khz 0.25V triangle.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał trójkątny 100 kHz]
    ) <przebieg_trojkat>
  ],
  [
    #figure(
      image("./6_1/komparator/100khz 0.25V.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał sinusoidalny 100 kHz]
    ) <przebieg_sinus>
  ]
)

#figure(
  kind: "table",
  supplement: [Tabela],
  table(
    columns: 4,
    align: center,
    [*Częstotliwość $f$*], [*Napięcie $U_"we"$ (mV)*], [*Napięcie wyj. $U_"wy"$ (V)*], [*Wzmocnienie $k_u$*],
    [22.00 kHz], [739.4], [4.722], [6.39],
    [33.00 kHz], [739.4], [4.721], [6.38],
    [52.02 kHz], [739.4], [4.797], [6.49],
    [98.07 kHz], [739.4], [4.879], [6.60],
    [163.9 kHz], [759.7], [4.879], [6.42],
    [277.4 kHz], [759.7], [4.877], [6.42],
    [400.9 kHz], [759.7], [4.877], [6.42],
    [500.7 kHz], [759.7], [4.877], [6.42],
    [840.8 kHz], [759.7], [4.877], [6.42],
    [1.440 MHz], [740.2], [4.799], [6.48],
    [2.752 MHz], [700.0], [4.641], [6.63],
    [4.860 MHz], [659.4], [1.681], [2.55],
    [5.093 MHz], [660.3], [0.240], [0.36],
    [5.235 MHz], [640.5], [0.080], [0.12],
  ),
  caption: [Charakterystyka amplitudowa komparatora odczytana z oscyloskopu]
) <tabela_charakterystyka>

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./6_1/komparator/charakterystyka_komparatora_pro.png", width: 80%),
  alt: "Chart png here",
  caption: [Wykres charakterystyki amplitudowej komparatora
  ],
) <stanowisko>

== Wyniki pomiarów - Wzmacniacz operacyjny

To samo ćwiczenie wykonano używając wzmacniacza operacyjnego zamiast komparatora napięcia.

#grid(
  columns: 3,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_1/wzmacniacz/1khz wzmiacniacz 0.75V.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał sinusoidalny 1 kHz]
    ) <przebieg_kwadrat>
  ],
  [
    #figure(
      image("./6_1/wzmacniacz/1khz wzmiacniacz 0.75V triangle.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał trójkątny 1 kHz]
    ) <przebieg_trojkat>
  ],
  [
    #figure(
      image("./6_1/wzmacniacz/1khz wzmiacniacz 0.75V square.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał prostokątny 1 kHz]
    ) <przebieg_sinus>
  ]
)

#grid(
  columns: 3,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_1/wzmacniacz/100khz wzmiacniacz 3.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał sinusoidalny 100 kHz]
    ) <przebieg_kwadrat>
  ],
  [
    #figure(
      image("./6_1/wzmacniacz/100khz wzmiacniacz.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał trójkątny 100 kHz]
    ) <przebieg_trojkat>
  ],
  [
    #figure(
      image("./6_1/wzmacniacz/100khz wzmiacniacz 2.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał prostokątny 100 kHz]
    ) <przebieg_sinus>
  ]
)

Wykres wykorzystany z Laboratorium III

#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./6_1/wzmacniacz/wykres_amplitudy.png", width: 80%, height: 31%),
  alt: "Chart png here",
  caption: [Wykres charakterystyki amplitudowej wzmacniacza
  ],
) <stanowisko>

Jak widać na poniższych zrzutach, przy wyższych częstotliwościach zwykły wzmacniacz operacyjny zaczyna się dusić i mocno zniekształca sygnał w porównaniu do dedykowanego układu LM311.

== Wnioski
Z przeprowadzonych pomiarów wynika, że komparator napięcia LM311 skutecznie generuje sygnał prostokątny z różnych kształtów napięć wejściowych, takich jak sinusoidalne, trójkątne i prostokątne, nawet przy wyższych częstotliwościach. Wzmacniacz operacyjny, choć może być używany jako komparator, nie jest zoptymalizowany do tego celu i zaczyna się dusić przy wyższych częstotliwościach, co prowadzi do znacznego zniekształcenia sygnału wyjściowego. Dlatego dedykowany komparator jest bardziej odpowiedni do zastosowań wymagających szybkiego przełączania i precyzyjnego porównywania napięć.

= Ćwiczenie 6.3
== Treść
3. Przetwornik A/C typu FLASH
- 3.1 Zapoznać się z budową i działaniem modułów przetwornika A/C typu FLASH: 
  - a) modułu komparatorów, 
  - b) transkodera RPP-S (Ręcznie Programowana Pamięć Stała) 
  - c) transkodera RPP-SRAN (Ręcznie Programowana Pamięć SRAM).

- 3.2 Programowanie transkodera RPP-S.
Połączyć moduł komparatorów z transkoderem RPP-S. Na wejście modułu komparatora podać
regulowane napięcie stałe. Zmieniając poziom napięcia wejściowego zaprogramować transkoder
w ten sposób, aby wartość binarna na wyjściu transkodera odpowiadała ilości zapalonych diod na
module komparatorów (czyli była proporcjonalna do napięcia wejściowego). Zwrócić uwagę iż
diody na wyjściu RPP-S reprezentują stany zanegowane.

- 3.3 Badanie działania przetwornika.
Po zaprogramowaniu pamięci stałej dołączyć do układu płytkę konwertera C/A a na wejście
modułu komparatorów podać sinusoidalne napięcie zmienne. Pamiętać, ze konwerter pracuje
prawidłowo tylko w zakresie napięcia powyżej 0 V. Używając oscyloskopu porównać przebieg
napięcia wejściowego i napięcia po kolejnych konwersjach w układach A/C i C/A. Jaka jest
rozdzielczość napięciowa konwertera typy FLASH. Porównać ją z odpowiednią wartością
otrzymaną dla przetwornika badanego w punkcie 2.
- 3.4 Użycie modułu z pamięcią SRAM.
Zmodyfikować konfigurację układu przetwornika zastępując transkoder RPP-S transkoderem z
pamięcią SRAM. Postępując analogicznie jak opisano w punktach 3.2 i 3.3 zaprogramować
pamięć SRAM i sprawdzić działanie przetwornika. Układ można zaprojektować w ten sposób
aby amplituda sygnału po konwersji ulegała odwróceniu.
- 3.5 Dla przebiegu sinusoidalnego określić zakres częstotliwości, w którym przetwornik działa prawidłowo.

=== 3.1 Budowa i działanie

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./6_3/3_1/IMG_4538.png", width: 60%),
  alt: "Chart png here",
  caption: [Budowa przetwornika A/C typu FLASH
  ],
) <stanowisko>

Przetwornik analogowo-cyfrowy typu FLASH składa się z trzech głównych modułów: modułu komparatorów, transkodera RPP-S (Ręcznie Programowana Pamięć Stała) oraz transkodera RPP-SRAN (Ręcznie Programowana Pamięć SRAM).

 *Moduł komparatorów:* Zawiera zestaw komparatorów napięcia, które na bieżąco porównują napięcie wejściowe z ustalonymi poziomami odniesienia. Każdy komparator generuje sygnał wyjściowy, który jednoznacznie wskazuje, czy napięcie wejściowe jest wyższe, czy niższe od danego progu napięciowego.

 *Transkoder RPP-S (Pamięć Stała):* Jest to moduł programowany ręcznie w celu przypisania określonych wartości binarnych do kombinacji sygnałów wyjściowych z modułu komparatorów. Programowanie realizuje się poprzez ustawienie odpowiednich napięć na wejściach modułu komparatorów, co skutkuje zapaleniem określonych diod na wyjściu transkodera. Należy zwrócić uwagę, że diody na wyjściu RPP-S reprezentują stany zanegowane zapalona dioda sygnalizuje niski stan logiczny (0), natomiast zgaszona wskazuje na wysoki stan logiczny (1).

*Transkoder RPP-SRAN (Pamięć SRAM):* Moduł ten jest programowany w sposób analogiczny do pamięci stałej, jednakże wykorzystanie pamięci ulotnej SRAM pozwala na dynamiczną zmianę konfiguracji podczas działania układu. Zapewnia to znacznie większą elastyczność i umożliwia przeprowadzanie bardziej zaawansowanych operacji konwersji A/C.

=== 3.2 Programowanie transkodera RPP-S


#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_3/3_2/IMG_4539.JPG", width: 100%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Nadanie stałej wartości napięcia]
    ) <przebieg_kwadrat>
  ],
  [
    #figure(
      image("./6_3/3_2/IMG_4540.png", width: 100%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Praca przetwornika A/C typu FLASH z transkoderem RPP-S]
    ) <przebieg_sinus>
  ]
)

Diody na module komparatorów wizualizują stany logiczne wyjść poszczególnych komparatorów. Wraz ze wzrostem napięcia wejściowego, komparatory kolejno zmieniają swój stan, generując sygnał w postaci tzw. kodu termometrycznego (zapalanie się kolejnych diod w rzędzie). 

Proces programowania transkodera RPP-S polega na regulacji napięcia wejściowego i fizycznym przypisywaniu (za pomocą przełączników układu) odpowiedniej wartości binarnej do konkretnej liczby aktywnych komparatorów. W ten sposób uzyskuje się liniową proporcjonalność między analogowym napięciem wejściowym a cyfrową wartością binarną na wyjściu układu. Zgodnie ze specyfikacją, należy uwzględnić fakt, że diody na wyjściu transkodera RPP-S reprezentują stany zanegowane - świecąca dioda oznacza stan niski (logiczne 0), natomiast zgaszona stan wysoki (logiczne 1).

Przykład użycia:
#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_3/3_2/IMG_4542.png", width: 80%, height: 40%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Maksymalne napięcie]
    ) <przebieg_kwadrat>
  ],
  [
    #figure(
      image("./6_3/3_2/IMG_4543.JPG", width: 80%, height: 40%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Inne napięcie]
    ) <przebieg_sinus>
  ]
)

=== 3.3 Badanie działania przetwornika

Po zaprogramowaniu pamięci stałej, do układu wpięto konwerter C/A, a na wejście podano zmienne napięcie (sinusoidalne oraz trójkątne). Zgodnie z wytycznymi, zadbano o to, by napięcie nie spadało poniżej 0 V, aby układ pracował w swoim optymalnym zakresie.

Na oscyloskopie zaobserwowano klasyczny efekt działania cyfrowego przetwarzania sygnałów - gładki przebieg analogowy z wejścia (żółty) zamienił się w "schodki" po stronie wyjściowej (niebieski). Jest to bezpośredni dowód na kwantyzację sygnału przez przetwornik A/C. Każdy schodek odpowiada zmianie stanu na wyjściu modułu komparatorów po przekroczeniu kolejnego progu napięcia odniesienia.

#grid(
  columns: 3,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_3/3_3/schodki 3_3.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał sinusoidalny i widoczna kwantyzacja (efekt schodków)]
    ) <przebieg_sinus_schodki>
  ],
  [
    #figure(
      image("./6_3/3_3/square real 3_3.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał prostokątny]
    ) <przebieg_sinus_schodki>
  ],
  [
    #figure(
      image("./6_3/3_3/square 3_3.png", width: 100%),
      kind: "chart",
      supplement: [Wykres],
      caption: [Sygnał trójkątny]
    ) <przebieg_trojkat_schodki>
  ]
)

#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQC8B0kqMGBZTKb2aUemB2IxAdzjDbdZS9lGqdOkaJquDIw?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=9qhDvA")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania dla fali sinusoidalnej*
    ]
  ]
]

#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQAVKEOthSyBTo8BywiSBA2ZAZWXln3jIrV9JXvv62WTEQQ?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=C99cBG")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania dla fali prostokątnej*
    ]
  ]
]

#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQBEwP70OKKuSo2AuiDJtaFuASNM5KoirJmRgtFOg0F-zq8?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=YJAI1Z")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania dla fali trójkątnej*
    ]
  ]
]
#v(1em)

== 3.4 Użycie modułu z pamięcią SRAM

Zgodnie z instrukcją, z układu wyleciał ręczny transkoder RPP-S, a jego miejsce zajął moduł z pamięcią SRAM. Samo programowanie przebiegło podobnie jak w poprzednim punkcie, ale z tą różnicą, że SRAM daje nam znacznie większe pole do popisu i można go dynamicznie przeprogramować oraz zaprogramowano sygnał z odwrotną amplitudą, czyli binarnie szliśmy w dół do zera.

#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./6_3/3_4/IMG_4547.png", width: 100%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Podpięcie modułu z pamięcią SRAM]
    ) <sram_normal>
  ],
  [
    #figure(
      image("./6_3/3_4/IMG_4549.png", width: 100%),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Działanie modułu o stałej wartości napięcia z odwróconą amplitudą]
    ) <sram_inverted>
  ]
)


#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQDGvkAMfnHZQbCThVvKE6AbAXCJ7uzmtEojYOopb7rOtMs?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=yQFaNe")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania przetwornika*
    ]
  ]
]
#v(1em)

=== 3.5 Zakres częstotliwości pracy przetwornika

Ostatnim etapem tego ćwiczenia było określenie zakresu częstotliwości, w którym przetwornik A/C typu FLASH zachowuje się stabilnie i działa prawidłowo. W tym celu na wejście układu podano sygnał sinusoidalny, a następnie stopniowo zwiększano jego częstotliwość, bacznie obserwując zrekonstruowany sygnał na oscyloskopie.

*Wyniki pomiarów:*
Z przeprowadzonych testów wynika, że przetwornik działał bez zarzutu do częstotliwości około *78 kHz*. 

Po przekroczeniu tej granicy układ zaczął łapać zadyszkę. Fizyczne ograniczenia elementów (czas propagacji sygnału w komparatorach i pamięci SRAM/RPP-S) sprawiły, że układ nie nadążał z próbkowaniem i konwersją. W efekcie charakterystyczne, równe "schodki" ulegały rozmyciu, a sygnał wyjściowy stawał się mocno zniekształcony, co jednoznacznie wyznaczyło kres możliwości pracy poprawnej tego stanowiska.

#grid(
  columns: 3,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/1hz.png", width: 100%),
      caption: [1 Hz]
    ) <freq_1hz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/4.9hz.png", width: 100%),
      caption: [4.9 Hz]
    ) <freq_4_9hz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/59hz.png", width: 100%),
      caption: [59 Hz]
    ) <freq_59hz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/300hz.png", width: 100%),
      caption: [300 Hz]
    ) <freq_300hz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/660hz.png", width: 100%),
      caption: [660 Hz]
    ) <freq_660hz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/1.7khz.png", width: 100%),
      caption: [1.7 kHz]
    ) <freq_1_7khz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/11.3khz.png", width: 100%),
      caption: [11.3 kHz]
    ) <freq_11_3khz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/77.9khz.png", width: 100%),
      caption: [77.9 kHz]
    ) <freq_77_9khz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/117khz.png", width: 100%),
      caption: [117 kHz]
    ) <freq_117khz>
  ],
  [
    #figure(
      kind : "chart",
      supplement: [Wykres],
      image("./6_3/3_5/221khz.png", width: 100%),
      caption: [221 kHz]
    ) <freq_221khz>
  ]
)

== Wnioski 
Na podstawie przeprowadzonych badań przetwornika A/C typu FLASH oraz analizy zebranych oscylogramów, można sformułować następujące wnioski końcowe:

* Weryfikacja działania przetwornika:* Pomyślnie zaprogramowaliśmy transkoder tak, aby generował poprawne wartości binarne. Zrzuty z oscyloskopu ze świetnie widocznymi "schodkami" udowodniły, że nasz układ skutecznie próbkuje i kwantyzuje gładki sygnał wejściowy.

  *Testy pamięci SRAM:* Udało nam się bez problemu zastąpić klasyczny przełącznikowy transkoder pamięcią SRAM. Udowodniliśmy jej użyteczność, sprzętowo odwracając amplitudę sygnału w locie. Pokazało to, że tego typu pamięć daje ogromną swobodę w szybkiej zmianie działania całego układu.

   *Sprawdzenie granic możliwości układu:* Przeprowadziliśmy testy stresowe, zwiększając częstotliwość sygnału wejściowego. Udało się zaobserwować, że o ile przy kilku-kilkudziesięciu kilohercach układ radzi sobie świetnie, to powyżej 100 kHz zaczyna gubić klatki. Przy około 221 kHz doszliśmy do ściany - elektronika przestała nadążać z konwersją, co objawiło się drastycznym spadkiem amplitudy i potężnym przesunięciem fazowym.

#pagebreak()

// Główny spis treści
#pagebreak()
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
