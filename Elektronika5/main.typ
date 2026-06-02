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
  #align(right)[13.05.2026] 
]

#title[
  Elektronika Raport
  Laboratorium V
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
  image("./5_1/IMG_4426.png", width: 100%),
  alt: "Chart png here",
  caption: [Stanowisko 5
  ],
) <stanowisko>

#pagebreak()


= Ćwiczenie 5.1

== Treść
Zbadaj przerzutnik jednozboczowy D korzystając z układu scalonego 7474. Stan
logiczny 1 podaj na wejścia za pomocą opornika 1 kΩ połączonego z +5 V, natomiast
stan logicznego zera podaj za pomocą opornika około 400 Ω połączonego z 0 V lub
połącz bezpośrednio wejście z 0 V napięcia zasilania. Do taktowania wejścia zegarowego
użyj sygnału z impulsatora na płytce montaż.

== Teoria
Przerzutnik typu D jest podstawowym synchronicznym elementem pamiętającym, stosowanym w układach cyfrowych. Jego zadaniem jest zapamiętanie wartości logicznej (pojedyńczego bitu) doprowadzonej do wejścia danych *D* w chwili aktywnego zbocza sygnału zegarowego *CLK*. W przypadku przerzutnika jednozboczowego stan wyjścia nie zmienia się przez cały czas trwania impulsu zegarowego, lecz tylko w krótkim momencie przejścia zegara ze stanu niskiego do wysokiego.

#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./5_1/przerzutnikD.png"),
      kind: "photo", 
      supplement: [Zdjęcie],
      caption: [Schemat układu 7474]
    )
  ],
  [
    #figure(
      image("./5_1/funkcja.png"),
      kind: "table",
      supplement: [Tabela],
      caption: [Tabela logiczna układu 7474]
    ) <tabela_D>
  ], 
)

== Płytka montażowa

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./5_1/UC-2.png", width: 70%),
  alt: "Chart png here",
  caption: [Schemat płytki UC-2
  ],
)

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  rotate(-90deg)[
    #image("./5_1/IMG_4275.png", width: 60%, height: 50%) 
  ],
  caption: [Zdjęcie układu płytki UC-2],
) <uklad_foto>

== Oporniki użyte do podłączenia wejść

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./5_1/IMG_4427.png", width: 60%, height: 40%) ,
  alt: "Chart png here",
  caption: [Podpięcie oporników do 5V oraz 0V
  ],
)

- *Opornik 10 kΩ* do podłączenia stanu logicznego 1 - wyniósł około 9.98 $k Omega$.
- *Opornik około 400 Ω* do podłączenia stanu logicznego 0 - wyniósł około 390 $Omega$.

== Procedura zapisu do przerzutnika

Żeby układ zapamiętał nasze dane trzeba wykonać kombinację:

+ *Zbocze narastające (Wejście CLK):* Przerzutnik D ma to do siebie, że jest układem synchronicznym. Kompletnie ignoruje to, co dzieje się na wejściu D, dopóki nie dostanie sygnału z zegara. Dlatego po ustawieniu stanu, podawaliśmy impuls na wejście zegarowe *CLK*.
+ *Zatrzask:* W ułamku sekundy, na aktywnym zboczu sygnału zegarowego, układ zapamiętał to, co dostał na wejściu D, prosto na wyjście *Q*. Stan został sprzętowo zapamiętany, co widać na załączonych obrazkach.

#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./5_1/IMG_4428.png"), 
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Zapis logicznej "0" do przerzutnika D]
    )
  ],
  [
    #figure(
      image("./5_1/IMG_4429.png"),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Zapis logicznego "1" do przerzutnika D]
    )
  ]
)

#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQBgV2dxB7JJQZUWgDdXafvUATNLdxe48Gl1VXfvJolnI1o?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=Q0ymLu")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania przerzutnika D*
    ]
  ]
]
#v(1em)

#figure(
  table(
    columns: 2,
    table.header([*Od*], [*Do*]),
    [Impulsator górny], [CLK1],
    [Impulsator dolny], [$D_1$],
    [$Q_1$], [Próbnik],
    [+5 V], [Vcc],
    [0 V], [GND],
  ),
  caption: [Schemat połączeń 7474],
)

== Pomiary dla PR i CLR

#grid(
  columns: 3,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./5_1/IMG_4448.png"), 
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [PR = 0, CLR = 1
      ]
    )
  ],
  [
    #figure(
      image("./5_1/IMG_4449.png"),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [PR = 1, CLR = 0]
    )
  ],
  [
    #figure(
      image("./5_1/IMG_4449.png"),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [PR = 0, CLR = 0]
    )
  ]
)

== Wnioski
- *Charakterystyka synchroniczna:* Układ 7474 reaguje na zmiany stanu wejścia danych D wyłącznie przy wystąpieniu aktywnego zbocza narastającego na wejściu zegarowym CLK. Zmiany sygnału D w czasie poza impulsem zegarowym nie wpływają na stan wyjściowy układu.
- *Funkcja zatrzasku (pamięci):* Przerzutnik poprawnie realizuje funkcję jednobitowej komórki pamięci, utrzymując stan stabilny na wyjściu aż do momentu podania kolejnego impulsu synchronizującego.
- *Stany wyjściowe:* Wyjścia Q oraz $~$Q zachowywały pełną komplementarność w każdym cyklu pracy układu, co potwierdza brak występowania stanów nieustalonych przy zastosowanych poziomach napięć wejściowych.

= Ćwiczenie 5.2

== Treść
Wybierz jeden z czterech przerzutników D Latch (wyzwalanych poziomem) w układzie
scalonym 7475 i zbadaj jego działanie. Podaj na wejście zegarowe sygnał taktujący
z impulsatora płytki UC-1. Na wejście informacyjne podaj sygnał z drugiego impulsatora
przed, w czasie trwania oraz po sygnale taktującym. Opisz działanie tego przerzutnika.

== Teoria

Przerzutnik typu D Latch, w odróżnieniu od przerzutnika jednozboczowego, jest układem asynchronicznym, który reaguje na zmiany stanu wejścia danych D w czasie, gdy sygnał zegarowy CLK jest aktywny (zazwyczaj wysoki). Oznacza to, że przerzutnik D Latch "otwiera się" i pozwala na bezpośrednie przekazywanie sygnału z wejścia D na wyjście Q tak długo, jak długo CLK pozostaje w stanie aktywnym. Gdy CLK przechodzi do stanu nieaktywnego (niski), przerzutnik "zamyka się", zatrzymując ostatnią wartość z wejścia D i utrzymując ją na wyjściu Q aż do momentu ponownego aktywowania CLK.

#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./5_2/przerzutnikD.png"),
      kind: "photo", 
      supplement: [Zdjęcie],
      caption: [Schemat układu 7475]
    )
  ],
  [
    #figure(
      image("./5_2/funkcja.png"),
      kind: "table",
      supplement: [Tabela],
      caption: [Tabela logiczna układu 7475]
    ) <tabela_D>
  ], 
)

== Procedura zapisu do przerzutnika
Aby zapisać dane do przerzutnika D Latch, należy wykonać następujące kroki:
1. *Ustawienie stanu na wejściu D:* Przed aktywacją sygnału zegarowego, należy ustawić odpowiedni stan logiczny (0 lub 1) na wejściu D, korzystając z oporników do podłączenia do +5 V lub 0 V.
2. *Aktywacja sygnału zegarowego (CLK):* Następnie należy podać sygnał taktujący na wejście CLK, co spowoduje "otwarcie" przerzutnika i przekazanie stanu z wejścia D na wyjście Q.
3. *Obserwacja stanu wyjścia Q:* Podczas trwania sygnału CLK, zmiany na wejściu D będą bezpośrednio odzwierciedlane na wyjściu Q. Po zakończeniu sygnału CLK, przerzutnik "zamknie się", zatrzymując ostatnią wartość z wejścia D na wyjściu Q.

#figure(
  image("./5_2/IMG_4431.png", width: 60%, height: 40%) , 
  kind: "photo",
  supplement: [Zdjęcie],
  caption: [Zbudowany przerzutnik D Latch na układzie 7475
  ],
)

#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQDYwF1uZ08OTrlZ7pWHQKe8AWjjDdXZwDJNoB0q_zs7f9U?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=rk820x")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania przerzutnika D Latch*
    ]
  ]
]
#v(1em)

#figure(
  table(
    columns: 2,
    table.header([*Od*], [*Do*]),
    [Impulsator górny], [1C, 2C],
    [Impulsator dolny], [1D],
    [$Q_1$], [Próbnik],
    [+5 V], [Vcc],
    [0 V], [GND],
  ),
  caption: [Schemat połączeń 7475],
)

== Wnioski

Na podstawie analizy działania układu 7475 (D Latch) oraz zarejestrowanego materiału wideo, sformułowano następujące wnioski:

- *Wrażliwość na poziom:* W przeciwieństwie do układu 7474, przerzutnik 7475 reaguje na wysoki poziom sygnału zegarowego (CLK), a nie tylko na jego zbocze. Przez cały czas, gdy na wejściach enable (1C, 2C) utrzymuje się stan wysoki, układ pracuje w trybie przezroczystym - każda zmiana na wejściu danych (1D) natychmiastowo i bezpośrednio mapuje się na wyjście $Q_1$.
- *Skuteczność zatrzaskiwania danych:* Potwierdzono działanie funkcji pamięci przy przejściu sygnału CLK ze stanu wysokiego w niski. Późniejsze machanie stanami na impulsatorze dolnym (przy CLK = 0) nie wywołuje żadnej reakcji wyjścia.
- *Zastosowanie:* Doświadczenie pokazało, że D Latch świetnie nadaje się na szybki bufor pamięci (zatrzaskuje dane „w locie”).
- *Poprawność montażu:* Stabilne stany logiczne uzyskane na próbniku oraz zgodność z dołączoną tabelą stanów potwierdzają prawidłowe zmapowanie wyprowadzeń układu (Vcc, GND, linie danych i zegara) na płytce montażowej.


= Ćwiczenie 5.3

== Treść
Zbudować układ dzielący (redukujący) częstotliwość przez dwa korzystając z licznika
binarnego 7493. Zarejestrować przebiegi wejściowe i wyjściowe.

== Teoria
Układ 7493 jest 4-bitowym licznikiem binarnym, który może być skonfigurowany do pracy jako dzielnik częstotliwości przez dwa. Aby osiągnąć ten efekt, należy odpowiednio połączyć wyjścia licznika, tak aby każde przejście z jednego stanu do drugiego powodowało zmianę stanu na wyjściu $Q_0$ (najmłodszy bit). W rezultacie, sygnał na wyjściu $Q_0$ będzie miał połowę częstotliwości sygnału wejściowego CLK.


#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./5_3/przerzutnik7493.png"),
      kind: "photo", 
      supplement: [Zdjęcie],
      caption: [Schemat układu 7493]
    )
  ],
  [
    #figure(
      image("./5_3/funkcja.png"),
      kind: "table",
      supplement: [Tabela],
      caption: [Tabela resetów układu 7493]
    ) <tabela_D>
  ], 
)

== Procedura budowy dzielnika częstotliwości
Aby zbudować dzielnik częstotliwości przez dwa za pomocą układu 7493, należy wykonać następujące kroki:
1. *Konfiguracja wejść:* Ustaw wejścia reset (pins 2 i 3) na stan wysoki, aby zresetować licznik do stanu początkowego.
2. *Podłączenie sygnału zegarowego:* Podłącz sygnał taktujący do wejścia CLK (INPUT A) (pin 14). Sygnał ten będzie sterował zmianami stanu licznika.
3. *Obserwacja wyjścia:* Monitoruj wyjście $Q_A$ (pin 12), które będzie generować sygnał o połowie częstotliwości sygnału wejściowego CLK.


#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
  #figure(
    image("./5_3/IMG_4436.png", width: 80%, height: 40%) , 
    kind: "photo",
    supplement: [Zdjęcie],
    caption: [Zbudowany dzielnik częstotliwości na układzie 7493
    ])
  ],
  [
    #figure(
      image("./5_3/JK 1khz 0.5khz.png"),
      kind: "photo",
      supplement: [Zdjęcie],
      caption: [Wejście 1kHz, wyjście 0.5 kHz]
    ) <tabela_D>
  ] 
)

Jak widać na załączonych obrazkach, sygnał na wyjściu $Q_A$ ma połowę częstotliwości sygnału wejściowego CLK, co potwierdza poprawne działanie układu jako dzielnika częstotliwości przez dwa.

#figure(
  table(
    columns: 2,
    table.header([*Od*], [*Do*]),
    [Generator], [INPUT A],
    [Logiczne 0], [$R_"0(1)"$],
    [Logiczne 0], [$R_"0(2)"$],
    [$Q_A$], [Oscyloskop],
    [+5 V], [Vcc],
    [0 V], [GND],
  ),
  caption: [Schemat połączeń dzielnika 7493],
)

== Wnioski
- *Działanie dzielnika częstotliwości:* Układ 7493 poprawnie realizuje funkcję dzielnika częstotliwości przez dwa, co potwierdza obserwacja sygnału na wyjściu $Q_A$ o połowie częstotliwości sygnału wejściowego CLK.
- *Stabilność sygnału:* Sygnał na wyjściu $Q_A$ jest stabilny i nie wykazuje zakłóceń, co świadczy o prawidłowym działaniu układu.

= Ćwiczenie 5.4

== Treść
Zbudować na bazie
układu JK (7493) licznik
modulo 16.
Wyzwalając ręcznie
impulsator obserwować
poszczególne stany
licznika przy pomocy
woltomierza lub diod
elektroluminescencyjnych.

== Teoria
Licznik modulo 16, zbudowany na bazie układu JK (7493), jest 4-bitowym licznikiem binarnym, który zlicza od 0 do 15 (16 stanów). Po osiągnięciu stanu 15, licznik resetuje się do stanu 0. Aby zbudować taki licznik, należy odpowiednio skonfigurować wejścia układu oraz podłączyć sygnał zegarowy, który będzie sterował zmianami stanu licznika. Obserwacja poszczególnych stanów licznika może być realizowana za pomocą woltomierza lub diod elektroluminescencyjnych, które będą wskazywać aktualny stan licznika.

== Procedura budowy licznika modulo 16

Aby z układu 7493 wycisnąć pełne liczenie do 16, należy go odpowiednio spiąć, łącząc jego wewnętrzne sekcje:

1. *Czyszczenie i start (Reset):* Aby wyzerować licznik, na wejścia kasujące (piny 2 i 3) podajemy na chwilę stan wysoki. To ustawia licznik w stanie początkowym (0000).
2. *Podłączenie zegara głównego:* Sygnał taktujący (z impulsatora lub generatora) podłączamy do wejścia zegarowego pierwszej sekcji - `INPUT A` (pin 14).
3. *Kaskadowe łączenie sekcji (Mostkowanie):* Układ 7493 składa się z dzielnika przez 2 oraz dzielnika przez 8. Aby uzyskać licznik modulo 16, należy fizycznie połączyć wyjście pierwszej sekcji $Q_A$ (pin 12) z wejściem zegarowym drugiej sekcji `INPUT B` (pin 1). Dzięki temu sygnał przeniesienia napędza kolejne bity.
4. *Obserwacja stanów:* Stany licznika odczytujemy podłączając diody lub próbnik stanów logicznych do wyjść $Q_A$, $Q_B$, $Q_C$ i $Q_D$ (odpowiednio piny 12, 9, 8, 11). Przy każdym impulsie zegarowym obserwujemy inkrementację wartości binarnej od 0 (0000) do 15 (1111).

#figure(
  image("./5_4/modulo16.png", width: 70%, height: 55%) , 
  kind: "photo",
  supplement: [Zdjęcie],
  caption: [Zbudowany licznik modulo 16 na układzie 7493
  ],
)

#figure(
  table(
    columns: 2,
    table.header([*Od*], [*Do*]),
    [Impulsator górny], [INPUT A],
    [$Q_A$], [INPUT B],
    [$Q_A$], [LED1],
    [$Q_B$], [LED2],
    [$Q_C$], [LED3],
    [$Q_D$], [LED4],
    [Logiczne 0], [$R_"0(1)"$],
    [Logiczne 0], [$R_"0(2)"$],
    [+5 V], [Vcc],
    [0 V], [GND],
  ),
  caption: [Schemat połączeń 7493 (modulo 10)],
)

#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQBlX3kIOMHGQq_LfJYZZ924AaRBpMF9aMzPaO5nvCXQYEw?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=3oGBiD")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania licznika modulo 16*
    ]
  ]
]
#v(1em)

= Ćwiczenie 5.5

== Treść
Zbudować na bazie
układu JK (7493) licznik
modulo 10.
Wyzwalając ręcznie
impulsator obserwować
poszczególne stany
licznika przy pomocy
woltomierza lub diod
elektroluminescencyjnych.

== Teoria
Licznik modulo 10, zbudowany na bazie układu JK (7493), jest 4-bitowym licznikiem binarnym, który zlicza od 0 do 9 (10 stanów). Po osiągnięciu stanu 9, licznik resetuje się do stanu 0. Aby zbudować taki licznik, należy odpowiednio skonfigurować wejścia układu oraz podłączyć sygnał zegarowy, który będzie sterował zmianami stanu licznika. Obserwacja poszczególnych stanów licznika może być realizowana za pomocą woltomierza lub diod elektroluminescencyjnych, które będą wskazywać aktualny stan licznika.

== Procedura budowy licznika modulo 10
Aby przekształcić układ 7493 z licznika modulo 16 na licznik dziesiętny (modulo 10), należy wymusić jego wcześniejsze wyzerowanie. Dokonuje się tego poprzez odpowiednie sprzężenie zwrotne:

1. *Łączenie sekcji (Mostkowanie):* Podobnie jak w poprzednim przypadku, łączymy wyjście pierwszej sekcji $Q_A$ (pin 12) z wejściem zegarowym drugiej sekcji `INPUT B` (pin 1).
2. *Podłączenie sygnału zegarowego:* Sygnał taktujący podłączamy do wejścia zegarowego `INPUT A`.
3. *Konfiguracja resetu (Sprzężenie zwrotne):* Układ 7493 posiada dwa wejścia kasujące (piny 2 i 3). Układ zeruje się, gdy na *obu* tych wejściach pojawi się stan logicznej "1". Chcemy, aby reset nastąpił przy liczbie 10 (binarnie 1010), co oznacza jedynki na wyjściach $Q_B$ oraz $Q_D$. Dlatego łączymy:
  - Wejście kasujące 1 (pin 2) z wyjściem $Q_B$ (pin 9).
  - Wejście kasujące 2 (pin 3) z wyjściem $Q_D$ (pin 11).
4. *Obserwacja stanów licznika:* Diody lub próbnik podłączamy do wyjść $Q_A$, $Q_B$, $Q_C$ i $Q_D$. Dzięki sprzężeniu zwrotnemu, ułamek sekundy po wejściu w stan 10 (1010), układ automatycznie się wyzeruje.

#figure(
  image("./5_4/modulo10.png", width: 60%, height: 45%) , 
  kind: "photo",
  supplement: [Zdjęcie],
  caption: [Zbudowany licznik modulo 10 na układzie 7493
  ],
)

#figure(
  table(
    columns: 2,
    table.header([*Od*], [*Do*]),
    [Impulsator górny], [INPUT A],
    [QA], [INPUT B],
    [QA], [LED1],
    [QB], [LED2],
    [QC], [LED3],
    [QD], [LED4],
    [QD], [$R_"0(1)"$],
    [QB], [$R_"0(2)"$],
    [+5 V], [Vcc],
    [0 V], [GND],
  ),
  caption: [Schemat połączeń 7493 (modulo 10)],
)


#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQAlo9rcc4hFRpG7uFvqWfzQAcOzxUg0dz3I14Bq6kkynHs?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=4lYRTi")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania licznika modulo 10*
    ]
  ]
]
#v(1em)

== Wnioski końcowe: Liczniki układu 7493

Na podstawie przeprowadzonych pomiarów i testów układu 7493 w dwóch konfiguracjach sprzętowych, sformułowano następujące wnioski:

- *Przerzucanie bitów:* Zbudowanie pełnego licznika modulo 16 potwierdziło, że układ 7493 składa się z dwóch wewnętrznych modułów (dzielnika przez 2 oraz dzielnika przez 8). Dopiero sprzęgnięcie wyjścia $Q_A$ z wejściem zegarowym drugiej sekcji pozwala na pełne zliczanie 4-bitowe od 0000 do 1111.
- *Skuteczność skracania cyklu (Modulo 10):* Weryfikacja układu w konfiguracji dekadowej dowiodła poprawności działania asynchronicznego systemu zerowania. Zastosowanie sprzężenia zwrotnego z wyjść $Q_B$ i $Q_D$ na piny kasujące skutecznie resetuje licznik ułamek sekundy po osiągnięciu stanu 1010. W efekcie uzyskano stabilną pętlę liczenia od 0 do 9.
- *Krytyczna rola wejść Reset:* Doświadczenie uwydatniło konieczność rygorystycznego zarządzania wejściami kasującymi. Warunkiem koniecznym do swobodnego zliczania (w trybie mod 16) jest bezwzględne zwarcie ich do poziomu niskiego (GND).

= Ćwiczenie 5.6

== Treść
Sprawdź działanie rejestrów 74164 i 74165. Połącz wyjścia równoległe rejestru 74164
z wejściami wskaźników na płytce UC-1. Kontrolując próbnikiem zadaj na wejście
szeregowe różne stany logiczne, przed, w czasie trwania i po sygnale taktującym
zadawanym na wejście zegarowe. Wymienione czynności wykonaj przy różnym stanie
wejścia kasującego. Opisz działanie tego rejestru

== Teoria
Rejestry 74164 i 74165 to układy scalone służące do przechowywania i przesyłania danych w systemach cyfrowych. Rejestr 74164 jest 8-bitowym rejestrem przesuwnym, który umożliwia przesuwanie danych w prawo lub w lewo, podczas gdy rejestr 74165 jest 8-bitowym rejestrem równoległym, który pozwala na równoczesne odczytywanie i zapisywanie danych. Oba rejestry posiadają wejścia szeregowe oraz równoległe, a także wejścia zegarowe i kasujące, które kontrolują ich działanie.


#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./5_5/74164.png"),
      kind: "photo", 
      supplement: [Zdjęcie],
      caption: [Schemat układu 74164]
    )
  ],
  [
    #figure(
      image("./5_5/funkcja4.png"),
      kind: "table",
      supplement: [Tabela],
      caption: [Tabela logiczna układu 74164]
    ) <tabela_D>
  ], 
)

#grid(
  columns: 2,
  gutter: 1em,
  inset: (top: 1em, bottom: 1em),
  [
    #figure(
      image("./5_5/74165.png"),
      kind: "photo", 
      supplement: [Zdjęcie],
      caption: [Schemat układu 74165]
    )
  ],
  [
    #figure(
      image("./5_5/funkcja5.png"),
      kind: "table",
      supplement: [Tabela],
      caption: [Tabela logiczna układu 74165]
    ) <tabela_D>
  ], 
)

== Procedura testowania rejestru 74164 (SIPO)

Badanie 8-bitowego rejestru przesuwnego o wejściu szeregowym i wyjściach równoległych (Serial-In, Parallel-Out) przeprowadzono według następujących kroków:

1. *Stan wejścia kasującego (CLR):* Sprawdzono asynchroniczne działanie wejścia czyszczącego. Podanie stanu niskiego (0 V) na pin `CLR` powoduje natychmiastowe zerowanie wszystkich wyjść ($Q_A$ do $Q_H$), niezależnie od stanu zegara. Aby rejestr zaczął pracować, na wejściu `CLR` musi być stan wysoki.
2. *Wprowadzanie danych przed sygnałem CLK:* Ustawiono stan wysoki na wejściu szeregowym przed podaniem impulsu zegarowego. Układ nie zmienił swojego stanu - potwierdza to synchroniczność wpisu danych względem zbocza zegara.
3. *Taktowanie układu (Zapis):* Klikano impulsatorem na wejście zegarowe `CLK`. Zaobserwowano, że z każdym uderzeniem zegara stan z wejścia szeregowego jest przepisywany na wyjście $Q_A$, a dotychczasowa zawartość rejestru przesuwa się o jedną pozycję w prawo (w kierunku $Q_H$).
4. *Zmiana stanu po sygnale:* Modyfikacja stanu wejścia szeregowego po przejściu zbocza zegarowego nie wpływa na aktualne wyjścia, co dowodzi, że układ zatrzaskuje dane wyłącznie w momencie zmiany stanu zegara z niskiego na wysoki.

#figure(
  image("./5_5/pierwszy_uklad.png", width: 80%, height: 60%) , 
  kind: "photo",
  supplement: [Zdjęcie],
  caption: [Zbudowany rejestr szeregowy 74164
  ],
)

#figure(
  table(
    columns: 2,
    table.header([*Od (Płytka)*], [*Do (Układ 74164)*]),
    [Impulsator dolny], [CLK (pin 8)],
    [Impulsator górny], [A, B (pin 1, 2)],
    [+5 V lub 0 V], [CLR (pin 9)],
    [$Q_A$], [LED1],
    [$Q_B$], [LED2],
    [$Q_C$], [LED3],
    [$Q_D$], [LED4],
    [$Q_E$], [LED5],
    [$Q_F$], [LED6],
    [$Q_G$], [LED7],
    [$Q_H$], [LED8],
    [+5 V], [Vcc (pin 14)],
    [0 V], [GND (pin 7)],
  ),
  caption: [Schemat połączeń rejestru 74164 (SIPO)],
)

Na wejście CLR podczas pracy podajemy stan wysoki, jeśli chcemy zresetować rejestr, podajemy sygnał niski.

#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQBGlxDLxM01Q7fstoxJCPwkAeggzunaCKXYG3yqqNA54Po?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=JcTGnr")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania rejestru szeregowego*
    ]
  ]
]
#v(1em)

== Testowanie: rejestr szeregowego 74164 + rejestr równoległy 74165

W celu weryfikacji pełnej konwersji danych szeregowo-równoległych (SIPO) oraz równoległo-szeregowych (PISO), połączono oba układy w jeden system transmisyjny.

1. *Wpis równoległy do układu 74165:* Na wejścia równoległe rejestru 74165 zadano słowo binarne `10100101`. Poprzez aktywację wejścia `SH/LD` (Shift/Load) w stan niski, słowo to zostało asynchronicznie załadowane do wnętrza układu.
2. *Transmisja szeregowa:* Wyjście szeregowe rejestru 74165 ($Q_H$) połączono z wejściem szeregowym rejestru 74164. 
3. *Wspólne taktowanie:* Podając impulsy zegarowe na oba układy jednocześnie, realizowano proces jednoczesnego wysuwania bitów z układu 74165 i wsuwania ich do układu 74164.
4. *Wynik końcowy:* Po wykonaniu pełnego cyklu 8 impulsów taktujących, na wyjściach równoległych rejestru 74164 uzyskano identyczne słowo wyjściowe: `10100101`. Sukces transmisji potwierdził poprawność działania obu struktur rejestrowych oraz kierunek przesuwu danych od lewej ($Q_A$) do prawej ($Q_H$).

#figure(
  table(
    columns: 2,
    table.header([*Od*], [*Do*]),
    
    // Zasilanie i sterowanie wspólne
    [Impulsator dolny], [74165 CLK],
    [Impulsator dolny], [74164 CLK],
    [Impulsator górny], [CLR (74164)],
    [+5 V lub 0 V (SH/LD)], [74165 SH/LD],
    
    // Wejścia równoległe 74165 (Słowo 10100101)
    [+5 V], [A],
    [0 V], [B],
    [+5 V], [C],
    [0 V], [D],
    [0 V], [E],
    [+5 V], [F],
    [0 V], [G],
    [+5 V], [H],
    
    // Połączenie między układami (Magistrala szeregowa)
    [74165 $Q_H$], [74164 A],
    [74165 $Q_H$], [74164 B],
    
    // Wyjścia równoległe 74164 na wskaźniki
    [$Q_A$], [LED1],
    [$Q_B$], [LED2],
    [$Q_C$], [LED3],
    [$Q_D$], [LED4],
    [$Q_E$], [LED5],
    [$Q_F$], [LED6],
    [$Q_G$], [LED7],
    [$Q_H$], [LED8],
    
  ),
  caption: [Schemat połączeń magistrali transmisyjnej 74165 (PISO) -> 74164 (SIPO)],
)

_ *UWAGA* :Z uwagi na podawanie słów na ledy od lewej do prawej, po ośmiu taktach zegara słowo jest widoczne w postaci odwrotnej. _

#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/g/personal/mateusz_1_kaminski_student_uj_edu_pl/IQDe0c9hUc7cT6cSOoTb1asyAbVMakZkOTAtAVb5c8YN7X4?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=LvemaD")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć działanie rejestru szeregowego oraz rejestru równoległego*
    ]
  ]
]
#v(1em)

== Wnioski
Przerzut danych z rejestru równoległego (74165) do szeregowego (74164) działa zgodnie z przewidywaniami teoretycznymi. Kluczowa sprawa to kolejność: *najpierw trzeba to słowo fizycznie wpisać/załadować* do pamięci pierwszego układu (za pomocą pinu `SH/LD`). Po poprawnym wpisie i 8 taktach wspólnego zegara, na wyjściu dostajemy dokładnie to, co wrzuciliśmy na początku.


= Podsumowanie laboratorium

Przeprowadzone ćwiczenia laboratoryjne pozwoliły na szczegółową weryfikację właściwości i parametrów pracy podstawowych cyfrowych układów sekwencyjnych: przerzutników, liczników oraz rejestrów przesuwnych. Na podstawie uzyskanych wyników sformułowano następujące wnioski końcowe:

- *Charakterystyka czasowa przerzutników:* Analiza porównawcza układów 7474 oraz 7475 wykazała kluczowe różnice między strukturami wyzwalanymi zboczem a poziomem sygnału. Przerzutnik 7474 (wyzwalany zboczem narastającym) reaguje na zmianę stanu wejścia danych wyłącznie w ściśle określonym momencie dynamicznym. Z kolei przerzutnik 7475 (D-Latch) charakteryzuje się przezroczystością przez cały czas trwania wysokiego poziomu sygnału sterującego, zatrzaskując dane dopiero w momencie jego opadania.
- *Konfiguracja struktur licznikowych:* Układ pomyślnie zaimplementowano jako dzielnik częstotliwości przez 2, pełny 4-bitowy licznik modulo 16 oraz skrócony licznik dziesiętny (modulo 10). Konstrukcja licznika modulo 10 dowiodła skuteczności działania asynchronicznego sprzężenia zwrotnego, które po detekcji AND'a na pinach do resetu automatycznie zeruje strukturę.
- *Konwersja i transmisja danych:* Integracja rejestru równoległo-szeregowego (74165) z rejestrem szeregowo-równoległym (74164) pozwoliła na realizację kompletnego systemu transmisji synchronicznej. Proces bezstratnego przesłania słowa binarnego `10100101` potwierdził poprawność synchronizacji wspólnej linii zegarowej oraz asynchronicznego ładowania danych za pomocą wejścia `SH/LD`. Zaobserwowane przestrzenne odwrócenie sekwencji bitów na wskaźnikach wyjściowych wynika bezpośrednio z mechaniki przesuwu danych w strukturze rejestru SIPO.

Wszystkie badane układy scalone działały w pełni zgodnie z dokumentacją techniczną oraz modelami teoretycznymi.

= Notatki
#read("notatki.txt")

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
