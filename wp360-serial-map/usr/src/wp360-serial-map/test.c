#include <linux/serial.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <stdio.h>

struct serial_rs485 rs485conf = {0};
char* devices[] = {"/dev/ttyWP360-2", "/dev/ttyWP360-3", "/dev/ttyWP360-4"};

int main(void) {
  int ret = 0;
  for (int i = 0; i < 3; i++) {
    char *device = devices[i];
    int fd = open (device, O_RDWR);
    if (fd < 0) {
      fprintf(stderr, "Could not open device `%s`\n", device);
      ret |= -1;
    }
    rs485conf.flags |= SER_RS485_ENABLED;
    if (ioctl (fd, TIOCSRS485, &rs485conf) < 0) {
      fprintf(stderr, "Could not set rs485 mode on device `%s`\n", device);
      ret |= -2;
    }
  }
  return ret;
}
