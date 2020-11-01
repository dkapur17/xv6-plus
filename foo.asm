
_foo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int number_of_processes = 40;

int main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	be 64 00 00 00       	mov    $0x64,%esi
  17:	53                   	push   %ebx
  18:	31 db                	xor    %ebx,%ebx
  1a:	51                   	push   %ecx
  1b:	83 ec 1c             	sub    $0x1c,%esp
  int j;
  for (j = 0; j < number_of_processes; j++)
  1e:	a1 30 0b 00 00       	mov    0xb30,%eax
  23:	85 c0                	test   %eax,%eax
  25:	7f 2e                	jg     55 <main+0x55>
  27:	eb 52                	jmp    7b <main+0x7b>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (pid < 0)
    {
      printf(1, "Fork failed\n");
      continue;
    }
    if (pid == 0)
  30:	89 da                	mov    %ebx,%edx
  32:	83 e2 01             	and    $0x1,%edx
  35:	85 c0                	test   %eax,%eax
  37:	74 70                	je     a9 <main+0xa9>
             }
    //   printf(1, "Process: %d Finished\n", j);
      exit();
    }
    else{
    set_priority(100-(j%2),pid); // will only matter for PBS, comment it out if not implemented yet (better priorty for more IO intensive jobs)
  39:	83 ec 08             	sub    $0x8,%esp
  for (j = 0; j < number_of_processes; j++)
  3c:	83 c3 01             	add    $0x1,%ebx
    set_priority(100-(j%2),pid); // will only matter for PBS, comment it out if not implemented yet (better priorty for more IO intensive jobs)
  3f:	50                   	push   %eax
  40:	89 f0                	mov    %esi,%eax
  42:	29 d0                	sub    %edx,%eax
  44:	50                   	push   %eax
  45:	e8 f9 03 00 00       	call   443 <set_priority>
  4a:	83 c4 10             	add    $0x10,%esp
  for (j = 0; j < number_of_processes; j++)
  4d:	39 1d 30 0b 00 00    	cmp    %ebx,0xb30
  53:	7e 26                	jle    7b <main+0x7b>
    int pid = fork();
  55:	e8 31 03 00 00       	call   38b <fork>
    if (pid < 0)
  5a:	85 c0                	test   %eax,%eax
  5c:	79 d2                	jns    30 <main+0x30>
      printf(1, "Fork failed\n");
  5e:	83 ec 08             	sub    $0x8,%esp
  for (j = 0; j < number_of_processes; j++)
  61:	83 c3 01             	add    $0x1,%ebx
      printf(1, "Fork failed\n");
  64:	68 68 08 00 00       	push   $0x868
  69:	6a 01                	push   $0x1
  6b:	e8 90 04 00 00       	call   500 <printf>
      continue;
  70:	83 c4 10             	add    $0x10,%esp
  for (j = 0; j < number_of_processes; j++)
  73:	39 1d 30 0b 00 00    	cmp    %ebx,0xb30
  79:	7f da                	jg     55 <main+0x55>
    }
  }
  for (j = 0; j < number_of_processes+5; j++)
  7b:	31 db                	xor    %ebx,%ebx
  7d:	83 3d 30 0b 00 00 fc 	cmpl   $0xfffffffc,0xb30
  84:	7c 1e                	jl     a4 <main+0xa4>
  86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8d:	8d 76 00             	lea    0x0(%esi),%esi
  {
    wait();
  90:	e8 06 03 00 00       	call   39b <wait>
  for (j = 0; j < number_of_processes+5; j++)
  95:	a1 30 0b 00 00       	mov    0xb30,%eax
  9a:	83 c3 01             	add    $0x1,%ebx
  9d:	83 c0 04             	add    $0x4,%eax
  a0:	39 d8                	cmp    %ebx,%eax
  a2:	7d ec                	jge    90 <main+0x90>
      exit();
  a4:	e8 ea 02 00 00       	call   393 <exit>
             if(flag == 0)
  a9:	85 d2                	test   %edx,%edx
  ab:	74 38                	je     e5 <main+0xe5>
                 for(volatile int i = 0; i<100000000; i++)
  ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  b7:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
  bc:	7f 15                	jg     d3 <main+0xd3>
  be:	66 90                	xchg   %ax,%ax
  c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c3:	83 c0 01             	add    $0x1,%eax
  c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  cc:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
  d1:	7e ed                	jle    c0 <main+0xc0>
                sleep(200);    
  d3:	83 ec 0c             	sub    $0xc,%esp
  d6:	68 c8 00 00 00       	push   $0xc8
  db:	e8 4b 03 00 00       	call   42b <sleep>
  e0:	83 c4 10             	add    $0x10,%esp
  e3:	eb bf                	jmp    a4 <main+0xa4>
                 sleep(200);
  e5:	83 ec 0c             	sub    $0xc,%esp
  e8:	68 c8 00 00 00       	push   $0xc8
  ed:	e8 39 03 00 00       	call   42b <sleep>
                 for(volatile int i = 0; i<100000000; i++)
  f2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 104:	7f 9e                	jg     a4 <main+0xa4>
 106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	8b 45 e0             	mov    -0x20(%ebp),%eax
 113:	83 c0 01             	add    $0x1,%eax
 116:	89 45 e0             	mov    %eax,-0x20(%ebp)
 119:	8b 45 e0             	mov    -0x20(%ebp),%eax
 11c:	3d ff e0 f5 05       	cmp    $0x5f5e0ff,%eax
 121:	7e ed                	jle    110 <main+0x110>
 123:	e9 7c ff ff ff       	jmp    a4 <main+0xa4>
 128:	66 90                	xchg   %ax,%ax
 12a:	66 90                	xchg   %ax,%ax
 12c:	66 90                	xchg   %ax,%ax
 12e:	66 90                	xchg   %ax,%ax

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 135:	31 c0                	xor    %eax,%eax
{
 137:	89 e5                	mov    %esp,%ebp
 139:	53                   	push   %ebx
 13a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 13d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 140:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 144:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 147:	83 c0 01             	add    $0x1,%eax
 14a:	84 d2                	test   %dl,%dl
 14c:	75 f2                	jne    140 <strcpy+0x10>
    ;
  return os;
}
 14e:	89 c8                	mov    %ecx,%eax
 150:	5b                   	pop    %ebx
 151:	5d                   	pop    %ebp
 152:	c3                   	ret    
 153:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000160 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	53                   	push   %ebx
 168:	8b 4d 08             	mov    0x8(%ebp),%ecx
 16b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 16e:	0f b6 01             	movzbl (%ecx),%eax
 171:	0f b6 1a             	movzbl (%edx),%ebx
 174:	84 c0                	test   %al,%al
 176:	75 19                	jne    191 <strcmp+0x31>
 178:	eb 26                	jmp    1a0 <strcmp+0x40>
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 184:	83 c1 01             	add    $0x1,%ecx
 187:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 18a:	0f b6 1a             	movzbl (%edx),%ebx
 18d:	84 c0                	test   %al,%al
 18f:	74 0f                	je     1a0 <strcmp+0x40>
 191:	38 d8                	cmp    %bl,%al
 193:	74 eb                	je     180 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 195:	29 d8                	sub    %ebx,%eax
}
 197:	5b                   	pop    %ebx
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1a2:	29 d8                	sub    %ebx,%eax
}
 1a4:	5b                   	pop    %ebx
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
 1a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1ba:	80 3a 00             	cmpb   $0x0,(%edx)
 1bd:	74 21                	je     1e0 <strlen+0x30>
 1bf:	31 c0                	xor    %eax,%eax
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	83 c0 01             	add    $0x1,%eax
 1cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1cf:	89 c1                	mov    %eax,%ecx
 1d1:	75 f5                	jne    1c8 <strlen+0x18>
    ;
  return n;
}
 1d3:	89 c8                	mov    %ecx,%eax
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1de:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1e0:	31 c9                	xor    %ecx,%ecx
}
 1e2:	5d                   	pop    %ebp
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	57                   	push   %edi
 1f8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 201:	89 d7                	mov    %edx,%edi
 203:	fc                   	cld    
 204:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 206:	89 d0                	mov    %edx,%eax
 208:	5f                   	pop    %edi
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 45 08             	mov    0x8(%ebp),%eax
 21a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 21e:	0f b6 10             	movzbl (%eax),%edx
 221:	84 d2                	test   %dl,%dl
 223:	75 16                	jne    23b <strchr+0x2b>
 225:	eb 21                	jmp    248 <strchr+0x38>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax
 230:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 234:	83 c0 01             	add    $0x1,%eax
 237:	84 d2                	test   %dl,%dl
 239:	74 0d                	je     248 <strchr+0x38>
    if(*s == c)
 23b:	38 d1                	cmp    %dl,%cl
 23d:	75 f1                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 248:	31 c0                	xor    %eax,%eax
}
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 259:	31 f6                	xor    %esi,%esi
{
 25b:	53                   	push   %ebx
 25c:	89 f3                	mov    %esi,%ebx
 25e:	83 ec 1c             	sub    $0x1c,%esp
 261:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 264:	eb 33                	jmp    299 <gets+0x49>
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	8d 45 e7             	lea    -0x19(%ebp),%eax
 276:	6a 01                	push   $0x1
 278:	50                   	push   %eax
 279:	6a 00                	push   $0x0
 27b:	e8 33 01 00 00       	call   3b3 <read>
    if(cc < 1)
 280:	83 c4 10             	add    $0x10,%esp
 283:	85 c0                	test   %eax,%eax
 285:	7e 1c                	jle    2a3 <gets+0x53>
      break;
    buf[i++] = c;
 287:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 28b:	83 c7 01             	add    $0x1,%edi
 28e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 291:	3c 0a                	cmp    $0xa,%al
 293:	74 23                	je     2b8 <gets+0x68>
 295:	3c 0d                	cmp    $0xd,%al
 297:	74 1f                	je     2b8 <gets+0x68>
  for(i=0; i+1 < max; ){
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	89 fe                	mov    %edi,%esi
 29e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2a1:	7c cd                	jl     270 <gets+0x20>
 2a3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2a8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ae:	5b                   	pop    %ebx
 2af:	5e                   	pop    %esi
 2b0:	5f                   	pop    %edi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b7:	90                   	nop
 2b8:	8b 75 08             	mov    0x8(%ebp),%esi
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	01 de                	add    %ebx,%esi
 2c0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2c2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c8:	5b                   	pop    %ebx
 2c9:	5e                   	pop    %esi
 2ca:	5f                   	pop    %edi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    
 2cd:	8d 76 00             	lea    0x0(%esi),%esi

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	56                   	push   %esi
 2d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d9:	83 ec 08             	sub    $0x8,%esp
 2dc:	6a 00                	push   $0x0
 2de:	ff 75 08             	pushl  0x8(%ebp)
 2e1:	e8 f5 00 00 00       	call   3db <open>
  if(fd < 0)
 2e6:	83 c4 10             	add    $0x10,%esp
 2e9:	85 c0                	test   %eax,%eax
 2eb:	78 2b                	js     318 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2ed:	83 ec 08             	sub    $0x8,%esp
 2f0:	ff 75 0c             	pushl  0xc(%ebp)
 2f3:	89 c3                	mov    %eax,%ebx
 2f5:	50                   	push   %eax
 2f6:	e8 f8 00 00 00       	call   3f3 <fstat>
  close(fd);
 2fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fe:	89 c6                	mov    %eax,%esi
  close(fd);
 300:	e8 be 00 00 00       	call   3c3 <close>
  return r;
 305:	83 c4 10             	add    $0x10,%esp
}
 308:	8d 65 f8             	lea    -0x8(%ebp),%esp
 30b:	89 f0                	mov    %esi,%eax
 30d:	5b                   	pop    %ebx
 30e:	5e                   	pop    %esi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 318:	be ff ff ff ff       	mov    $0xffffffff,%esi
 31d:	eb e9                	jmp    308 <stat+0x38>
 31f:	90                   	nop

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	53                   	push   %ebx
 328:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 32b:	0f be 02             	movsbl (%edx),%eax
 32e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 331:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 334:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 339:	77 1a                	ja     355 <atoi+0x35>
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	89 c8                	mov    %ecx,%eax
 357:	5b                   	pop    %ebx
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	8b 45 10             	mov    0x10(%ebp),%eax
 36b:	8b 55 08             	mov    0x8(%ebp),%edx
 36e:	56                   	push   %esi
 36f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 372:	85 c0                	test   %eax,%eax
 374:	7e 0f                	jle    385 <memmove+0x25>
 376:	01 d0                	add    %edx,%eax
  dst = vdst;
 378:	89 d7                	mov    %edx,%edi
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    

0000038b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38b:	b8 01 00 00 00       	mov    $0x1,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <exit>:
SYSCALL(exit)
 393:	b8 02 00 00 00       	mov    $0x2,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <wait>:
SYSCALL(wait)
 39b:	b8 03 00 00 00       	mov    $0x3,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <waitx>:
SYSCALL(waitx)
 3a3:	b8 16 00 00 00       	mov    $0x16,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <pipe>:
SYSCALL(pipe)
 3ab:	b8 04 00 00 00       	mov    $0x4,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <read>:
SYSCALL(read)
 3b3:	b8 05 00 00 00       	mov    $0x5,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <write>:
SYSCALL(write)
 3bb:	b8 10 00 00 00       	mov    $0x10,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <close>:
SYSCALL(close)
 3c3:	b8 15 00 00 00       	mov    $0x15,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <kill>:
SYSCALL(kill)
 3cb:	b8 06 00 00 00       	mov    $0x6,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <exec>:
SYSCALL(exec)
 3d3:	b8 07 00 00 00       	mov    $0x7,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <open>:
SYSCALL(open)
 3db:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <mknod>:
SYSCALL(mknod)
 3e3:	b8 11 00 00 00       	mov    $0x11,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <unlink>:
SYSCALL(unlink)
 3eb:	b8 12 00 00 00       	mov    $0x12,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <fstat>:
SYSCALL(fstat)
 3f3:	b8 08 00 00 00       	mov    $0x8,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <link>:
SYSCALL(link)
 3fb:	b8 13 00 00 00       	mov    $0x13,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <mkdir>:
SYSCALL(mkdir)
 403:	b8 14 00 00 00       	mov    $0x14,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <chdir>:
SYSCALL(chdir)
 40b:	b8 09 00 00 00       	mov    $0x9,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <dup>:
SYSCALL(dup)
 413:	b8 0a 00 00 00       	mov    $0xa,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <getpid>:
SYSCALL(getpid)
 41b:	b8 0b 00 00 00       	mov    $0xb,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <sbrk>:
SYSCALL(sbrk)
 423:	b8 0c 00 00 00       	mov    $0xc,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <sleep>:
SYSCALL(sleep)
 42b:	b8 0d 00 00 00       	mov    $0xd,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <uptime>:
SYSCALL(uptime)
 433:	b8 0e 00 00 00       	mov    $0xe,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <cps>:
SYSCALL(cps)
 43b:	b8 17 00 00 00       	mov    $0x17,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <set_priority>:
 443:	b8 18 00 00 00       	mov    $0x18,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    
 44b:	66 90                	xchg   %ax,%ax
 44d:	66 90                	xchg   %ax,%ax
 44f:	90                   	nop

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 3c             	sub    $0x3c,%esp
 459:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 45c:	89 d1                	mov    %edx,%ecx
{
 45e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 461:	85 d2                	test   %edx,%edx
 463:	0f 89 7f 00 00 00    	jns    4e8 <printint+0x98>
 469:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 46d:	74 79                	je     4e8 <printint+0x98>
    neg = 1;
 46f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 476:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 478:	31 db                	xor    %ebx,%ebx
 47a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	31 d2                	xor    %edx,%edx
 484:	89 cf                	mov    %ecx,%edi
 486:	f7 75 c4             	divl   -0x3c(%ebp)
 489:	0f b6 92 7c 08 00 00 	movzbl 0x87c(%edx),%edx
 490:	89 45 c0             	mov    %eax,-0x40(%ebp)
 493:	89 d8                	mov    %ebx,%eax
 495:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 498:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 49b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 49e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4a1:	76 dd                	jbe    480 <printint+0x30>
  if(neg)
 4a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4a6:	85 c9                	test   %ecx,%ecx
 4a8:	74 0c                	je     4b6 <printint+0x66>
    buf[i++] = '-';
 4aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4bd:	eb 07                	jmp    4c6 <printint+0x76>
 4bf:	90                   	nop
 4c0:	0f b6 13             	movzbl (%ebx),%edx
 4c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4c6:	83 ec 04             	sub    $0x4,%esp
 4c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4cc:	6a 01                	push   $0x1
 4ce:	56                   	push   %esi
 4cf:	57                   	push   %edi
 4d0:	e8 e6 fe ff ff       	call   3bb <write>
  while(--i >= 0)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	39 de                	cmp    %ebx,%esi
 4da:	75 e4                	jne    4c0 <printint+0x70>
    putc(fd, buf[i]);
}
 4dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5f                   	pop    %edi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4ef:	eb 87                	jmp    478 <printint+0x28>
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	57                   	push   %edi
 508:	56                   	push   %esi
 509:	53                   	push   %ebx
 50a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 50d:	8b 75 0c             	mov    0xc(%ebp),%esi
 510:	0f b6 1e             	movzbl (%esi),%ebx
 513:	84 db                	test   %bl,%bl
 515:	0f 84 b4 00 00 00    	je     5cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 51b:	8d 45 10             	lea    0x10(%ebp),%eax
 51e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 521:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 524:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 526:	89 45 d0             	mov    %eax,-0x30(%ebp)
 529:	eb 33                	jmp    55e <printf+0x5e>
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
 530:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 533:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 538:	83 f8 25             	cmp    $0x25,%eax
 53b:	74 17                	je     554 <printf+0x54>
  write(fd, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	88 5d e7             	mov    %bl,-0x19(%ebp)
 543:	6a 01                	push   $0x1
 545:	57                   	push   %edi
 546:	ff 75 08             	pushl  0x8(%ebp)
 549:	e8 6d fe ff ff       	call   3bb <write>
 54e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 551:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 554:	0f b6 1e             	movzbl (%esi),%ebx
 557:	83 c6 01             	add    $0x1,%esi
 55a:	84 db                	test   %bl,%bl
 55c:	74 71                	je     5cf <printf+0xcf>
    c = fmt[i] & 0xff;
 55e:	0f be cb             	movsbl %bl,%ecx
 561:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 564:	85 d2                	test   %edx,%edx
 566:	74 c8                	je     530 <printf+0x30>
      }
    } else if(state == '%'){
 568:	83 fa 25             	cmp    $0x25,%edx
 56b:	75 e7                	jne    554 <printf+0x54>
      if(c == 'd'){
 56d:	83 f8 64             	cmp    $0x64,%eax
 570:	0f 84 9a 00 00 00    	je     610 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 576:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 57c:	83 f9 70             	cmp    $0x70,%ecx
 57f:	74 5f                	je     5e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 581:	83 f8 73             	cmp    $0x73,%eax
 584:	0f 84 d6 00 00 00    	je     660 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58a:	83 f8 63             	cmp    $0x63,%eax
 58d:	0f 84 8d 00 00 00    	je     620 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 593:	83 f8 25             	cmp    $0x25,%eax
 596:	0f 84 b4 00 00 00    	je     650 <printf+0x150>
  write(fd, &c, 1);
 59c:	83 ec 04             	sub    $0x4,%esp
 59f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5a3:	6a 01                	push   $0x1
 5a5:	57                   	push   %edi
 5a6:	ff 75 08             	pushl  0x8(%ebp)
 5a9:	e8 0d fe ff ff       	call   3bb <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5b1:	83 c4 0c             	add    $0xc,%esp
 5b4:	6a 01                	push   $0x1
 5b6:	83 c6 01             	add    $0x1,%esi
 5b9:	57                   	push   %edi
 5ba:	ff 75 08             	pushl  0x8(%ebp)
 5bd:	e8 f9 fd ff ff       	call   3bb <write>
  for(i = 0; fmt[i]; i++){
 5c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 5c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5cb:	84 db                	test   %bl,%bl
 5cd:	75 8f                	jne    55e <printf+0x5e>
    }
  }
}
 5cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d2:	5b                   	pop    %ebx
 5d3:	5e                   	pop    %esi
 5d4:	5f                   	pop    %edi
 5d5:	5d                   	pop    %ebp
 5d6:	c3                   	ret    
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e8:	6a 00                	push   $0x0
 5ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
 5f0:	8b 13                	mov    (%ebx),%edx
 5f2:	e8 59 fe ff ff       	call   450 <printint>
        ap++;
 5f7:	89 d8                	mov    %ebx,%eax
 5f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fc:	31 d2                	xor    %edx,%edx
        ap++;
 5fe:	83 c0 04             	add    $0x4,%eax
 601:	89 45 d0             	mov    %eax,-0x30(%ebp)
 604:	e9 4b ff ff ff       	jmp    554 <printf+0x54>
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 0a 00 00 00       	mov    $0xa,%ecx
 618:	6a 01                	push   $0x1
 61a:	eb ce                	jmp    5ea <printf+0xea>
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 620:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 623:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 626:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 628:	6a 01                	push   $0x1
        ap++;
 62a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 62d:	57                   	push   %edi
 62e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 631:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 634:	e8 82 fd ff ff       	call   3bb <write>
        ap++;
 639:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 63c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 0e ff ff ff       	jmp    554 <printf+0x54>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 650:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 653:	83 ec 04             	sub    $0x4,%esp
 656:	e9 59 ff ff ff       	jmp    5b4 <printf+0xb4>
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
        s = (char*)*ap;
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
 663:	8b 18                	mov    (%eax),%ebx
        ap++;
 665:	83 c0 04             	add    $0x4,%eax
 668:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 66b:	85 db                	test   %ebx,%ebx
 66d:	74 17                	je     686 <printf+0x186>
        while(*s != 0){
 66f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 672:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 674:	84 c0                	test   %al,%al
 676:	0f 84 d8 fe ff ff    	je     554 <printf+0x54>
 67c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 67f:	89 de                	mov    %ebx,%esi
 681:	8b 5d 08             	mov    0x8(%ebp),%ebx
 684:	eb 1a                	jmp    6a0 <printf+0x1a0>
          s = "(null)";
 686:	bb 75 08 00 00       	mov    $0x875,%ebx
        while(*s != 0){
 68b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 68e:	b8 28 00 00 00       	mov    $0x28,%eax
 693:	89 de                	mov    %ebx,%esi
 695:	8b 5d 08             	mov    0x8(%ebp),%ebx
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6a3:	83 c6 01             	add    $0x1,%esi
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	57                   	push   %edi
 6ac:	53                   	push   %ebx
 6ad:	e8 09 fd ff ff       	call   3bb <write>
        while(*s != 0){
 6b2:	0f b6 06             	movzbl (%esi),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x1a0>
 6bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 8e fe ff ff       	jmp    554 <printf+0x54>
 6c6:	66 90                	xchg   %ax,%ax
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d5:	a1 34 0b 00 00       	mov    0xb34,%eax
{
 6da:	89 e5                	mov    %esp,%ebp
 6dc:	57                   	push   %edi
 6dd:	56                   	push   %esi
 6de:	53                   	push   %ebx
 6df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6e2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e7:	39 c8                	cmp    %ecx,%eax
 6e9:	73 15                	jae    700 <free+0x30>
 6eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop
 6f0:	39 d1                	cmp    %edx,%ecx
 6f2:	72 14                	jb     708 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f4:	39 d0                	cmp    %edx,%eax
 6f6:	73 10                	jae    708 <free+0x38>
{
 6f8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fa:	8b 10                	mov    (%eax),%edx
 6fc:	39 c8                	cmp    %ecx,%eax
 6fe:	72 f0                	jb     6f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	39 d0                	cmp    %edx,%eax
 702:	72 f4                	jb     6f8 <free+0x28>
 704:	39 d1                	cmp    %edx,%ecx
 706:	73 f0                	jae    6f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 fa                	cmp    %edi,%edx
 710:	74 1e                	je     730 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 712:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 715:	8b 50 04             	mov    0x4(%eax),%edx
 718:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71b:	39 f1                	cmp    %esi,%ecx
 71d:	74 28                	je     747 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 71f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 721:	5b                   	pop    %ebx
  freep = p;
 722:	a3 34 0b 00 00       	mov    %eax,0xb34
}
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
 72b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 730:	03 72 04             	add    0x4(%edx),%esi
 733:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 736:	8b 10                	mov    (%eax),%edx
 738:	8b 12                	mov    (%edx),%edx
 73a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	75 d8                	jne    71f <free+0x4f>
    p->s.size += bp->s.size;
 747:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 74a:	a3 34 0b 00 00       	mov    %eax,0xb34
    p->s.size += bp->s.size;
 74f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 752:	8b 53 f8             	mov    -0x8(%ebx),%edx
 755:	89 10                	mov    %edx,(%eax)
}
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	f3 0f 1e fb          	endbr32 
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	57                   	push   %edi
 768:	56                   	push   %esi
 769:	53                   	push   %ebx
 76a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 770:	8b 3d 34 0b 00 00    	mov    0xb34,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 776:	8d 70 07             	lea    0x7(%eax),%esi
 779:	c1 ee 03             	shr    $0x3,%esi
 77c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 77f:	85 ff                	test   %edi,%edi
 781:	0f 84 a9 00 00 00    	je     830 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 787:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 789:	8b 48 04             	mov    0x4(%eax),%ecx
 78c:	39 f1                	cmp    %esi,%ecx
 78e:	73 6d                	jae    7fd <malloc+0x9d>
 790:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 796:	bb 00 10 00 00       	mov    $0x1000,%ebx
 79b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 79e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 7a5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 7a8:	eb 17                	jmp    7c1 <malloc+0x61>
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7b2:	8b 4a 04             	mov    0x4(%edx),%ecx
 7b5:	39 f1                	cmp    %esi,%ecx
 7b7:	73 4f                	jae    808 <malloc+0xa8>
 7b9:	8b 3d 34 0b 00 00    	mov    0xb34,%edi
 7bf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c1:	39 c7                	cmp    %eax,%edi
 7c3:	75 eb                	jne    7b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	ff 75 e4             	pushl  -0x1c(%ebp)
 7cb:	e8 53 fc ff ff       	call   423 <sbrk>
  if(p == (char*)-1)
 7d0:	83 c4 10             	add    $0x10,%esp
 7d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d6:	74 1b                	je     7f3 <malloc+0x93>
  hp->s.size = nu;
 7d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	83 c0 08             	add    $0x8,%eax
 7e1:	50                   	push   %eax
 7e2:	e8 e9 fe ff ff       	call   6d0 <free>
  return freep;
 7e7:	a1 34 0b 00 00       	mov    0xb34,%eax
      if((p = morecore(nunits)) == 0)
 7ec:	83 c4 10             	add    $0x10,%esp
 7ef:	85 c0                	test   %eax,%eax
 7f1:	75 bd                	jne    7b0 <malloc+0x50>
        return 0;
  }
}
 7f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7f6:	31 c0                	xor    %eax,%eax
}
 7f8:	5b                   	pop    %ebx
 7f9:	5e                   	pop    %esi
 7fa:	5f                   	pop    %edi
 7fb:	5d                   	pop    %ebp
 7fc:	c3                   	ret    
    if(p->s.size >= nunits){
 7fd:	89 c2                	mov    %eax,%edx
 7ff:	89 f8                	mov    %edi,%eax
 801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 808:	39 ce                	cmp    %ecx,%esi
 80a:	74 54                	je     860 <malloc+0x100>
        p->s.size -= nunits;
 80c:	29 f1                	sub    %esi,%ecx
 80e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 811:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 814:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 817:	a3 34 0b 00 00       	mov    %eax,0xb34
}
 81c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 81f:	8d 42 08             	lea    0x8(%edx),%eax
}
 822:	5b                   	pop    %ebx
 823:	5e                   	pop    %esi
 824:	5f                   	pop    %edi
 825:	5d                   	pop    %ebp
 826:	c3                   	ret    
 827:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 34 0b 00 00 38 	movl   $0xb38,0xb34
 837:	0b 00 00 
    base.s.size = 0;
 83a:	bf 38 0b 00 00       	mov    $0xb38,%edi
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 38 0b 00 00 38 	movl   $0xb38,0xb38
 846:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 84b:	c7 05 3c 0b 00 00 00 	movl   $0x0,0xb3c
 852:	00 00 00 
    if(p->s.size >= nunits){
 855:	e9 36 ff ff ff       	jmp    790 <malloc+0x30>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 860:	8b 0a                	mov    (%edx),%ecx
 862:	89 08                	mov    %ecx,(%eax)
 864:	eb b1                	jmp    817 <malloc+0xb7>
