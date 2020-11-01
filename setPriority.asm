
_setPriority:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
    int new_priority, old_priority, pid;
    if(argc != 3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)
{
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx
    if(argc != 3)
  1d:	74 13                	je     32 <main+0x32>
    {
        printf(2, "Usage: setPriority <new_priority> <pid>\n");
  1f:	50                   	push   %eax
  20:	50                   	push   %eax
  21:	68 e8 07 00 00       	push   $0x7e8
  26:	6a 02                	push   $0x2
  28:	e8 53 04 00 00       	call   480 <printf>
        exit();
  2d:	e8 e1 02 00 00       	call   313 <exit>
    }

    new_priority = atoi(argv[1]);
  32:	83 ec 0c             	sub    $0xc,%esp
  35:	ff 73 04             	pushl  0x4(%ebx)
  38:	e8 63 02 00 00       	call   2a0 <atoi>
  3d:	89 c6                	mov    %eax,%esi
    pid = atoi(argv[2]);
  3f:	58                   	pop    %eax
  40:	ff 73 08             	pushl  0x8(%ebx)
  43:	e8 58 02 00 00       	call   2a0 <atoi>

    if(new_priority < 0 || new_priority > 100)
  48:	83 c4 10             	add    $0x10,%esp
    pid = atoi(argv[2]);
  4b:	89 c3                	mov    %eax,%ebx
    if(new_priority < 0 || new_priority > 100)
  4d:	83 fe 64             	cmp    $0x64,%esi
  50:	77 2b                	ja     7d <main+0x7d>
    {
        printf(2, "Priority value can only range from 0-100\n");
        exit();
    }

    old_priority = set_priority(new_priority, pid);
  52:	52                   	push   %edx
  53:	52                   	push   %edx
  54:	50                   	push   %eax
  55:	56                   	push   %esi
  56:	e8 68 03 00 00       	call   3c3 <set_priority>
    if(old_priority == -1)
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	83 f8 ff             	cmp    $0xffffffff,%eax
  61:	74 2d                	je     90 <main+0x90>
    {
        printf(2, "No process with pid %d exists\n", pid);
        exit();
    }
    
    printf(1, "Priority of process with pid %d was updated successfully from %d to %d\n", pid, old_priority, new_priority);
  63:	83 ec 0c             	sub    $0xc,%esp
  66:	56                   	push   %esi
  67:	50                   	push   %eax
  68:	53                   	push   %ebx
  69:	68 60 08 00 00       	push   $0x860
  6e:	6a 01                	push   $0x1
  70:	e8 0b 04 00 00       	call   480 <printf>
    exit();
  75:	83 c4 20             	add    $0x20,%esp
  78:	e8 96 02 00 00       	call   313 <exit>
        printf(2, "Priority value can only range from 0-100\n");
  7d:	51                   	push   %ecx
  7e:	51                   	push   %ecx
  7f:	68 14 08 00 00       	push   $0x814
  84:	6a 02                	push   $0x2
  86:	e8 f5 03 00 00       	call   480 <printf>
        exit();
  8b:	e8 83 02 00 00       	call   313 <exit>
        printf(2, "No process with pid %d exists\n", pid);
  90:	50                   	push   %eax
  91:	53                   	push   %ebx
  92:	68 40 08 00 00       	push   $0x840
  97:	6a 02                	push   $0x2
  99:	e8 e2 03 00 00       	call   480 <printf>
        exit();
  9e:	e8 70 02 00 00       	call   313 <exit>
  a3:	66 90                	xchg   %ax,%ax
  a5:	66 90                	xchg   %ax,%ax
  a7:	66 90                	xchg   %ax,%ax
  a9:	66 90                	xchg   %ax,%ax
  ab:	66 90                	xchg   %ax,%ax
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	f3 0f 1e fb          	endbr32 
  b4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  b5:	31 c0                	xor    %eax,%eax
{
  b7:	89 e5                	mov    %esp,%ebp
  b9:	53                   	push   %ebx
  ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  c7:	83 c0 01             	add    $0x1,%eax
  ca:	84 d2                	test   %dl,%dl
  cc:	75 f2                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  ce:	89 c8                	mov    %ecx,%eax
  d0:	5b                   	pop    %ebx
  d1:	5d                   	pop    %ebp
  d2:	c3                   	ret    
  d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	53                   	push   %ebx
  e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ee:	0f b6 01             	movzbl (%ecx),%eax
  f1:	0f b6 1a             	movzbl (%edx),%ebx
  f4:	84 c0                	test   %al,%al
  f6:	75 19                	jne    111 <strcmp+0x31>
  f8:	eb 26                	jmp    120 <strcmp+0x40>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 100:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 104:	83 c1 01             	add    $0x1,%ecx
 107:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 10a:	0f b6 1a             	movzbl (%edx),%ebx
 10d:	84 c0                	test   %al,%al
 10f:	74 0f                	je     120 <strcmp+0x40>
 111:	38 d8                	cmp    %bl,%al
 113:	74 eb                	je     100 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 115:	29 d8                	sub    %ebx,%eax
}
 117:	5b                   	pop    %ebx
 118:	5d                   	pop    %ebp
 119:	c3                   	ret    
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 120:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 122:	29 d8                	sub    %ebx,%eax
}
 124:	5b                   	pop    %ebx
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax

00000130 <strlen>:

uint
strlen(const char *s)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 13a:	80 3a 00             	cmpb   $0x0,(%edx)
 13d:	74 21                	je     160 <strlen+0x30>
 13f:	31 c0                	xor    %eax,%eax
 141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 148:	83 c0 01             	add    $0x1,%eax
 14b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 14f:	89 c1                	mov    %eax,%ecx
 151:	75 f5                	jne    148 <strlen+0x18>
    ;
  return n;
}
 153:	89 c8                	mov    %ecx,%eax
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 160:	31 c9                	xor    %ecx,%ecx
}
 162:	5d                   	pop    %ebp
 163:	89 c8                	mov    %ecx,%eax
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	57                   	push   %edi
 178:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 17b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17e:	8b 45 0c             	mov    0xc(%ebp),%eax
 181:	89 d7                	mov    %edx,%edi
 183:	fc                   	cld    
 184:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 186:	89 d0                	mov    %edx,%eax
 188:	5f                   	pop    %edi
 189:	5d                   	pop    %ebp
 18a:	c3                   	ret    
 18b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 18f:	90                   	nop

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 19e:	0f b6 10             	movzbl (%eax),%edx
 1a1:	84 d2                	test   %dl,%dl
 1a3:	75 16                	jne    1bb <strchr+0x2b>
 1a5:	eb 21                	jmp    1c8 <strchr+0x38>
 1a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ae:	66 90                	xchg   %ax,%ax
 1b0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1b4:	83 c0 01             	add    $0x1,%eax
 1b7:	84 d2                	test   %dl,%dl
 1b9:	74 0d                	je     1c8 <strchr+0x38>
    if(*s == c)
 1bb:	38 d1                	cmp    %dl,%cl
 1bd:	75 f1                	jne    1b0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1c8:	31 c0                	xor    %eax,%eax
}
 1ca:	5d                   	pop    %ebp
 1cb:	c3                   	ret    
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d9:	31 f6                	xor    %esi,%esi
{
 1db:	53                   	push   %ebx
 1dc:	89 f3                	mov    %esi,%ebx
 1de:	83 ec 1c             	sub    $0x1c,%esp
 1e1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1e4:	eb 33                	jmp    219 <gets+0x49>
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1f6:	6a 01                	push   $0x1
 1f8:	50                   	push   %eax
 1f9:	6a 00                	push   $0x0
 1fb:	e8 33 01 00 00       	call   333 <read>
    if(cc < 1)
 200:	83 c4 10             	add    $0x10,%esp
 203:	85 c0                	test   %eax,%eax
 205:	7e 1c                	jle    223 <gets+0x53>
      break;
    buf[i++] = c;
 207:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 20b:	83 c7 01             	add    $0x1,%edi
 20e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 211:	3c 0a                	cmp    $0xa,%al
 213:	74 23                	je     238 <gets+0x68>
 215:	3c 0d                	cmp    $0xd,%al
 217:	74 1f                	je     238 <gets+0x68>
  for(i=0; i+1 < max; ){
 219:	83 c3 01             	add    $0x1,%ebx
 21c:	89 fe                	mov    %edi,%esi
 21e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 221:	7c cd                	jl     1f0 <gets+0x20>
 223:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 225:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 228:	c6 03 00             	movb   $0x0,(%ebx)
}
 22b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22e:	5b                   	pop    %ebx
 22f:	5e                   	pop    %esi
 230:	5f                   	pop    %edi
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	8b 75 08             	mov    0x8(%ebp),%esi
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	01 de                	add    %ebx,%esi
 240:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 242:	c6 03 00             	movb   $0x0,(%ebx)
}
 245:	8d 65 f4             	lea    -0xc(%ebp),%esp
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5f                   	pop    %edi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <stat>:

int
stat(const char *n, struct stat *st)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	56                   	push   %esi
 258:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	6a 00                	push   $0x0
 25e:	ff 75 08             	pushl  0x8(%ebp)
 261:	e8 f5 00 00 00       	call   35b <open>
  if(fd < 0)
 266:	83 c4 10             	add    $0x10,%esp
 269:	85 c0                	test   %eax,%eax
 26b:	78 2b                	js     298 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 26d:	83 ec 08             	sub    $0x8,%esp
 270:	ff 75 0c             	pushl  0xc(%ebp)
 273:	89 c3                	mov    %eax,%ebx
 275:	50                   	push   %eax
 276:	e8 f8 00 00 00       	call   373 <fstat>
  close(fd);
 27b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 27e:	89 c6                	mov    %eax,%esi
  close(fd);
 280:	e8 be 00 00 00       	call   343 <close>
  return r;
 285:	83 c4 10             	add    $0x10,%esp
}
 288:	8d 65 f8             	lea    -0x8(%ebp),%esp
 28b:	89 f0                	mov    %esi,%eax
 28d:	5b                   	pop    %ebx
 28e:	5e                   	pop    %esi
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 298:	be ff ff ff ff       	mov    $0xffffffff,%esi
 29d:	eb e9                	jmp    288 <stat+0x38>
 29f:	90                   	nop

000002a0 <atoi>:

int
atoi(const char *s)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	53                   	push   %ebx
 2a8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ab:	0f be 02             	movsbl (%edx),%eax
 2ae:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2b1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2b4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2b9:	77 1a                	ja     2d5 <atoi+0x35>
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop
    n = n*10 + *s++ - '0';
 2c0:	83 c2 01             	add    $0x1,%edx
 2c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ca:	0f be 02             	movsbl (%edx),%eax
 2cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d0:	80 fb 09             	cmp    $0x9,%bl
 2d3:	76 eb                	jbe    2c0 <atoi+0x20>
  return n;
}
 2d5:	89 c8                	mov    %ecx,%eax
 2d7:	5b                   	pop    %ebx
 2d8:	5d                   	pop    %ebp
 2d9:	c3                   	ret    
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	57                   	push   %edi
 2e8:	8b 45 10             	mov    0x10(%ebp),%eax
 2eb:	8b 55 08             	mov    0x8(%ebp),%edx
 2ee:	56                   	push   %esi
 2ef:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f2:	85 c0                	test   %eax,%eax
 2f4:	7e 0f                	jle    305 <memmove+0x25>
 2f6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2f8:	89 d7                	mov    %edx,%edi
 2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 300:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 301:	39 f8                	cmp    %edi,%eax
 303:	75 fb                	jne    300 <memmove+0x20>
  return vdst;
}
 305:	5e                   	pop    %esi
 306:	89 d0                	mov    %edx,%eax
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    

0000030b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 30b:	b8 01 00 00 00       	mov    $0x1,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <exit>:
SYSCALL(exit)
 313:	b8 02 00 00 00       	mov    $0x2,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <wait>:
SYSCALL(wait)
 31b:	b8 03 00 00 00       	mov    $0x3,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <waitx>:
SYSCALL(waitx)
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <pipe>:
SYSCALL(pipe)
 32b:	b8 04 00 00 00       	mov    $0x4,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <read>:
SYSCALL(read)
 333:	b8 05 00 00 00       	mov    $0x5,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <write>:
SYSCALL(write)
 33b:	b8 10 00 00 00       	mov    $0x10,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <close>:
SYSCALL(close)
 343:	b8 15 00 00 00       	mov    $0x15,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <kill>:
SYSCALL(kill)
 34b:	b8 06 00 00 00       	mov    $0x6,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <exec>:
SYSCALL(exec)
 353:	b8 07 00 00 00       	mov    $0x7,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <open>:
SYSCALL(open)
 35b:	b8 0f 00 00 00       	mov    $0xf,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <mknod>:
SYSCALL(mknod)
 363:	b8 11 00 00 00       	mov    $0x11,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <unlink>:
SYSCALL(unlink)
 36b:	b8 12 00 00 00       	mov    $0x12,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <fstat>:
SYSCALL(fstat)
 373:	b8 08 00 00 00       	mov    $0x8,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <link>:
SYSCALL(link)
 37b:	b8 13 00 00 00       	mov    $0x13,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <mkdir>:
SYSCALL(mkdir)
 383:	b8 14 00 00 00       	mov    $0x14,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <chdir>:
SYSCALL(chdir)
 38b:	b8 09 00 00 00       	mov    $0x9,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <dup>:
SYSCALL(dup)
 393:	b8 0a 00 00 00       	mov    $0xa,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <getpid>:
SYSCALL(getpid)
 39b:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <sbrk>:
SYSCALL(sbrk)
 3a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <sleep>:
SYSCALL(sleep)
 3ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <uptime>:
SYSCALL(uptime)
 3b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <cps>:
SYSCALL(cps)
 3bb:	b8 17 00 00 00       	mov    $0x17,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <set_priority>:
 3c3:	b8 18 00 00 00       	mov    $0x18,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    
 3cb:	66 90                	xchg   %ax,%ax
 3cd:	66 90                	xchg   %ax,%ax
 3cf:	90                   	nop

000003d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	83 ec 3c             	sub    $0x3c,%esp
 3d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3dc:	89 d1                	mov    %edx,%ecx
{
 3de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3e1:	85 d2                	test   %edx,%edx
 3e3:	0f 89 7f 00 00 00    	jns    468 <printint+0x98>
 3e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3ed:	74 79                	je     468 <printint+0x98>
    neg = 1;
 3ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3f8:	31 db                	xor    %ebx,%ebx
 3fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 400:	89 c8                	mov    %ecx,%eax
 402:	31 d2                	xor    %edx,%edx
 404:	89 cf                	mov    %ecx,%edi
 406:	f7 75 c4             	divl   -0x3c(%ebp)
 409:	0f b6 92 b0 08 00 00 	movzbl 0x8b0(%edx),%edx
 410:	89 45 c0             	mov    %eax,-0x40(%ebp)
 413:	89 d8                	mov    %ebx,%eax
 415:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 418:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 41b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 41e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 421:	76 dd                	jbe    400 <printint+0x30>
  if(neg)
 423:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 426:	85 c9                	test   %ecx,%ecx
 428:	74 0c                	je     436 <printint+0x66>
    buf[i++] = '-';
 42a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 42f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 431:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 436:	8b 7d b8             	mov    -0x48(%ebp),%edi
 439:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 43d:	eb 07                	jmp    446 <printint+0x76>
 43f:	90                   	nop
 440:	0f b6 13             	movzbl (%ebx),%edx
 443:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 446:	83 ec 04             	sub    $0x4,%esp
 449:	88 55 d7             	mov    %dl,-0x29(%ebp)
 44c:	6a 01                	push   $0x1
 44e:	56                   	push   %esi
 44f:	57                   	push   %edi
 450:	e8 e6 fe ff ff       	call   33b <write>
  while(--i >= 0)
 455:	83 c4 10             	add    $0x10,%esp
 458:	39 de                	cmp    %ebx,%esi
 45a:	75 e4                	jne    440 <printint+0x70>
    putc(fd, buf[i]);
}
 45c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45f:	5b                   	pop    %ebx
 460:	5e                   	pop    %esi
 461:	5f                   	pop    %edi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 468:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 46f:	eb 87                	jmp    3f8 <printint+0x28>
 471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 478:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	57                   	push   %edi
 488:	56                   	push   %esi
 489:	53                   	push   %ebx
 48a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 48d:	8b 75 0c             	mov    0xc(%ebp),%esi
 490:	0f b6 1e             	movzbl (%esi),%ebx
 493:	84 db                	test   %bl,%bl
 495:	0f 84 b4 00 00 00    	je     54f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 49b:	8d 45 10             	lea    0x10(%ebp),%eax
 49e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4a1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4a4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 4a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4a9:	eb 33                	jmp    4de <printf+0x5e>
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
 4b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4b3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	74 17                	je     4d4 <printf+0x54>
  write(fd, &c, 1);
 4bd:	83 ec 04             	sub    $0x4,%esp
 4c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4c3:	6a 01                	push   $0x1
 4c5:	57                   	push   %edi
 4c6:	ff 75 08             	pushl  0x8(%ebp)
 4c9:	e8 6d fe ff ff       	call   33b <write>
 4ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4d1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4d4:	0f b6 1e             	movzbl (%esi),%ebx
 4d7:	83 c6 01             	add    $0x1,%esi
 4da:	84 db                	test   %bl,%bl
 4dc:	74 71                	je     54f <printf+0xcf>
    c = fmt[i] & 0xff;
 4de:	0f be cb             	movsbl %bl,%ecx
 4e1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4e4:	85 d2                	test   %edx,%edx
 4e6:	74 c8                	je     4b0 <printf+0x30>
      }
    } else if(state == '%'){
 4e8:	83 fa 25             	cmp    $0x25,%edx
 4eb:	75 e7                	jne    4d4 <printf+0x54>
      if(c == 'd'){
 4ed:	83 f8 64             	cmp    $0x64,%eax
 4f0:	0f 84 9a 00 00 00    	je     590 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4f6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4fc:	83 f9 70             	cmp    $0x70,%ecx
 4ff:	74 5f                	je     560 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 501:	83 f8 73             	cmp    $0x73,%eax
 504:	0f 84 d6 00 00 00    	je     5e0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 50a:	83 f8 63             	cmp    $0x63,%eax
 50d:	0f 84 8d 00 00 00    	je     5a0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 513:	83 f8 25             	cmp    $0x25,%eax
 516:	0f 84 b4 00 00 00    	je     5d0 <printf+0x150>
  write(fd, &c, 1);
 51c:	83 ec 04             	sub    $0x4,%esp
 51f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 523:	6a 01                	push   $0x1
 525:	57                   	push   %edi
 526:	ff 75 08             	pushl  0x8(%ebp)
 529:	e8 0d fe ff ff       	call   33b <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 52e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 531:	83 c4 0c             	add    $0xc,%esp
 534:	6a 01                	push   $0x1
 536:	83 c6 01             	add    $0x1,%esi
 539:	57                   	push   %edi
 53a:	ff 75 08             	pushl  0x8(%ebp)
 53d:	e8 f9 fd ff ff       	call   33b <write>
  for(i = 0; fmt[i]; i++){
 542:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 546:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 549:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 54b:	84 db                	test   %bl,%bl
 54d:	75 8f                	jne    4de <printf+0x5e>
    }
  }
}
 54f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 552:	5b                   	pop    %ebx
 553:	5e                   	pop    %esi
 554:	5f                   	pop    %edi
 555:	5d                   	pop    %ebp
 556:	c3                   	ret    
 557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 10 00 00 00       	mov    $0x10,%ecx
 568:	6a 00                	push   $0x0
 56a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	8b 13                	mov    (%ebx),%edx
 572:	e8 59 fe ff ff       	call   3d0 <printint>
        ap++;
 577:	89 d8                	mov    %ebx,%eax
 579:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57c:	31 d2                	xor    %edx,%edx
        ap++;
 57e:	83 c0 04             	add    $0x4,%eax
 581:	89 45 d0             	mov    %eax,-0x30(%ebp)
 584:	e9 4b ff ff ff       	jmp    4d4 <printf+0x54>
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 0a 00 00 00       	mov    $0xa,%ecx
 598:	6a 01                	push   $0x1
 59a:	eb ce                	jmp    56a <printf+0xea>
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5a6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 5a8:	6a 01                	push   $0x1
        ap++;
 5aa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5ad:	57                   	push   %edi
 5ae:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 5b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b4:	e8 82 fd ff ff       	call   33b <write>
        ap++;
 5b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bf:	31 d2                	xor    %edx,%edx
 5c1:	e9 0e ff ff ff       	jmp    4d4 <printf+0x54>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 5d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5d3:	83 ec 04             	sub    $0x4,%esp
 5d6:	e9 59 ff ff ff       	jmp    534 <printf+0xb4>
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop
        s = (char*)*ap;
 5e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5e3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5e5:	83 c0 04             	add    $0x4,%eax
 5e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5eb:	85 db                	test   %ebx,%ebx
 5ed:	74 17                	je     606 <printf+0x186>
        while(*s != 0){
 5ef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5f2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5f4:	84 c0                	test   %al,%al
 5f6:	0f 84 d8 fe ff ff    	je     4d4 <printf+0x54>
 5fc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ff:	89 de                	mov    %ebx,%esi
 601:	8b 5d 08             	mov    0x8(%ebp),%ebx
 604:	eb 1a                	jmp    620 <printf+0x1a0>
          s = "(null)";
 606:	bb a8 08 00 00       	mov    $0x8a8,%ebx
        while(*s != 0){
 60b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 60e:	b8 28 00 00 00       	mov    $0x28,%eax
 613:	89 de                	mov    %ebx,%esi
 615:	8b 5d 08             	mov    0x8(%ebp),%ebx
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
          s++;
 623:	83 c6 01             	add    $0x1,%esi
 626:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 629:	6a 01                	push   $0x1
 62b:	57                   	push   %edi
 62c:	53                   	push   %ebx
 62d:	e8 09 fd ff ff       	call   33b <write>
        while(*s != 0){
 632:	0f b6 06             	movzbl (%esi),%eax
 635:	83 c4 10             	add    $0x10,%esp
 638:	84 c0                	test   %al,%al
 63a:	75 e4                	jne    620 <printf+0x1a0>
 63c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 8e fe ff ff       	jmp    4d4 <printf+0x54>
 646:	66 90                	xchg   %ax,%ax
 648:	66 90                	xchg   %ax,%ax
 64a:	66 90                	xchg   %ax,%ax
 64c:	66 90                	xchg   %ax,%ax
 64e:	66 90                	xchg   %ax,%ax

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	f3 0f 1e fb          	endbr32 
 654:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 655:	a1 60 0b 00 00       	mov    0xb60,%eax
{
 65a:	89 e5                	mov    %esp,%ebp
 65c:	57                   	push   %edi
 65d:	56                   	push   %esi
 65e:	53                   	push   %ebx
 65f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 662:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 664:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 667:	39 c8                	cmp    %ecx,%eax
 669:	73 15                	jae    680 <free+0x30>
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
 670:	39 d1                	cmp    %edx,%ecx
 672:	72 14                	jb     688 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 674:	39 d0                	cmp    %edx,%eax
 676:	73 10                	jae    688 <free+0x38>
{
 678:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67a:	8b 10                	mov    (%eax),%edx
 67c:	39 c8                	cmp    %ecx,%eax
 67e:	72 f0                	jb     670 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 680:	39 d0                	cmp    %edx,%eax
 682:	72 f4                	jb     678 <free+0x28>
 684:	39 d1                	cmp    %edx,%ecx
 686:	73 f0                	jae    678 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 fa                	cmp    %edi,%edx
 690:	74 1e                	je     6b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 692:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 69b:	39 f1                	cmp    %esi,%ecx
 69d:	74 28                	je     6c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 69f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6a1:	5b                   	pop    %ebx
  freep = p;
 6a2:	a3 60 0b 00 00       	mov    %eax,0xb60
}
 6a7:	5e                   	pop    %esi
 6a8:	5f                   	pop    %edi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret    
 6ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 6b0:	03 72 04             	add    0x4(%edx),%esi
 6b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b6:	8b 10                	mov    (%eax),%edx
 6b8:	8b 12                	mov    (%edx),%edx
 6ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c3:	39 f1                	cmp    %esi,%ecx
 6c5:	75 d8                	jne    69f <free+0x4f>
    p->s.size += bp->s.size;
 6c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ca:	a3 60 0b 00 00       	mov    %eax,0xb60
    p->s.size += bp->s.size;
 6cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d5:	89 10                	mov    %edx,(%eax)
}
 6d7:	5b                   	pop    %ebx
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6e0:	f3 0f 1e fb          	endbr32 
 6e4:	55                   	push   %ebp
 6e5:	89 e5                	mov    %esp,%ebp
 6e7:	57                   	push   %edi
 6e8:	56                   	push   %esi
 6e9:	53                   	push   %ebx
 6ea:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6f0:	8b 3d 60 0b 00 00    	mov    0xb60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f6:	8d 70 07             	lea    0x7(%eax),%esi
 6f9:	c1 ee 03             	shr    $0x3,%esi
 6fc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6ff:	85 ff                	test   %edi,%edi
 701:	0f 84 a9 00 00 00    	je     7b0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 707:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 709:	8b 48 04             	mov    0x4(%eax),%ecx
 70c:	39 f1                	cmp    %esi,%ecx
 70e:	73 6d                	jae    77d <malloc+0x9d>
 710:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 716:	bb 00 10 00 00       	mov    $0x1000,%ebx
 71b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 71e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 725:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 728:	eb 17                	jmp    741 <malloc+0x61>
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 730:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 732:	8b 4a 04             	mov    0x4(%edx),%ecx
 735:	39 f1                	cmp    %esi,%ecx
 737:	73 4f                	jae    788 <malloc+0xa8>
 739:	8b 3d 60 0b 00 00    	mov    0xb60,%edi
 73f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 741:	39 c7                	cmp    %eax,%edi
 743:	75 eb                	jne    730 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 745:	83 ec 0c             	sub    $0xc,%esp
 748:	ff 75 e4             	pushl  -0x1c(%ebp)
 74b:	e8 53 fc ff ff       	call   3a3 <sbrk>
  if(p == (char*)-1)
 750:	83 c4 10             	add    $0x10,%esp
 753:	83 f8 ff             	cmp    $0xffffffff,%eax
 756:	74 1b                	je     773 <malloc+0x93>
  hp->s.size = nu;
 758:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 75b:	83 ec 0c             	sub    $0xc,%esp
 75e:	83 c0 08             	add    $0x8,%eax
 761:	50                   	push   %eax
 762:	e8 e9 fe ff ff       	call   650 <free>
  return freep;
 767:	a1 60 0b 00 00       	mov    0xb60,%eax
      if((p = morecore(nunits)) == 0)
 76c:	83 c4 10             	add    $0x10,%esp
 76f:	85 c0                	test   %eax,%eax
 771:	75 bd                	jne    730 <malloc+0x50>
        return 0;
  }
}
 773:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 776:	31 c0                	xor    %eax,%eax
}
 778:	5b                   	pop    %ebx
 779:	5e                   	pop    %esi
 77a:	5f                   	pop    %edi
 77b:	5d                   	pop    %ebp
 77c:	c3                   	ret    
    if(p->s.size >= nunits){
 77d:	89 c2                	mov    %eax,%edx
 77f:	89 f8                	mov    %edi,%eax
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 788:	39 ce                	cmp    %ecx,%esi
 78a:	74 54                	je     7e0 <malloc+0x100>
        p->s.size -= nunits;
 78c:	29 f1                	sub    %esi,%ecx
 78e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 791:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 794:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 797:	a3 60 0b 00 00       	mov    %eax,0xb60
}
 79c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 79f:	8d 42 08             	lea    0x8(%edx),%eax
}
 7a2:	5b                   	pop    %ebx
 7a3:	5e                   	pop    %esi
 7a4:	5f                   	pop    %edi
 7a5:	5d                   	pop    %ebp
 7a6:	c3                   	ret    
 7a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 7b0:	c7 05 60 0b 00 00 64 	movl   $0xb64,0xb60
 7b7:	0b 00 00 
    base.s.size = 0;
 7ba:	bf 64 0b 00 00       	mov    $0xb64,%edi
    base.s.ptr = freep = prevp = &base;
 7bf:	c7 05 64 0b 00 00 64 	movl   $0xb64,0xb64
 7c6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 7cb:	c7 05 68 0b 00 00 00 	movl   $0x0,0xb68
 7d2:	00 00 00 
    if(p->s.size >= nunits){
 7d5:	e9 36 ff ff ff       	jmp    710 <malloc+0x30>
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 0a                	mov    (%edx),%ecx
 7e2:	89 08                	mov    %ecx,(%eax)
 7e4:	eb b1                	jmp    797 <malloc+0xb7>
