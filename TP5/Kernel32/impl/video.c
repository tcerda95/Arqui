

#define VIDEO_ROWS 25
#define VIDEO_COLS 80
#define VIDEO_ADDR 0xB8000
#define WHITE_TEXT 0x07

static char* video = (char *) VIDEO_ADDR;

static int cursor = 0;  // static pues es propia del driver de video

void video_clearScreen() {
    int i = 0;
    while (i < VIDEO_COLS*VIDEO_COLS*2) {
	video[i++] = ' ';
	video[i++] = WHITE_TEXT;
    }
}

void video_print(char *msg) {
    while (*msg != '\0') {
	video[cursor++] = *msg++;
	cursor++;
    }
}
