# titletrack.sh
A script to give media files meaningful names based on metadata.

Requires avprobe/ffprobe

## Usage:
    titletrack.sh [FILE]

Renames each FILE to 'TRACK - TITLE.FORMAT'

## Example:
    $ ls
    4F8B-SH_28831034831747311-00.mpg
    4F8B-SH_28831034831747311-01.mpg
    4F8B-SH_28831034831747311-02.mpg
    4F8B-SH_28831034831747311-03.mpg
    $ titletrack.sh *
    $ ls
    '01 - Shostakovich - Piano Concerto No. 1 in C Minor, Op. 35 - I. Allegro moderato - Allegro vivace - Moderato.mp3'
    '02 - Shostakovich - Piano Concerto No. 1 in C Minor, Op. 35 - II. Lento.mp3'
    '03 - Shostakovich - Piano Concerto No. 1 in C Minor, Op. 35 - III. Moderato.mp3'
    '04 - Shostakovich - Piano Concerto No. 1 in C Minor, Op. 35 - IV. Allegro con brio - Presto - Allegretto poco moderato - Allegro con brio.mp3'
