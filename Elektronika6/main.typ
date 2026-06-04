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
  image("./6_1/komparator/charakterystyka_komparatora_pro.png", width: 80%, height: 31%),
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
