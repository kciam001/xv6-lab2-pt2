
_shm_cnt:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
   struct uspinlock lock;
   int cnt;
};

int main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	83 ec 30             	sub    $0x30,%esp
int pid;
int i=0;
struct shm_cnt *counter;
printf(1,"Hello\n");
    1014:	68 14 18 00 00       	push   $0x1814
    1019:	6a 01                	push   $0x1
    101b:	e8 a0 04 00 00       	call   14c0 <printf>
  pid=fork();
    1020:	e8 35 03 00 00       	call   135a <fork>
  sleep(1);
    1025:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
{
int pid;
int i=0;
struct shm_cnt *counter;
printf(1,"Hello\n");
  pid=fork();
    102c:	89 c6                	mov    %eax,%esi
    102e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  sleep(1);
    1031:	e8 bc 03 00 00       	call   13f2 <sleep>

//shm_open: first process will create the page, the second will just attach to the same page
//we get the virtual address of the page returned into counter
//which we can now use but will be shared between the two processes
  
shm_open(1,(char **)&counter);
    1036:	5b                   	pop    %ebx
    1037:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     uacquire(&(counter->lock));
     counter->cnt++;
     urelease(&(counter->lock));

//print something because we are curious and to give a chance to switch process
     if(i%1000 == 0)
    103a:	bb d3 4d 62 10       	mov    $0x10624dd3,%ebx

//shm_open: first process will create the page, the second will just attach to the same page
//we get the virtual address of the page returned into counter
//which we can now use but will be shared between the two processes
  
shm_open(1,(char **)&counter);
    103f:	5f                   	pop    %edi
    1040:	50                   	push   %eax
    1041:	6a 01                	push   $0x1
    1043:	e8 ba 03 00 00       	call   1402 <shm_open>
printf(1, "Now Here!\n"); 
    1048:	58                   	pop    %eax
    1049:	5a                   	pop    %edx
    104a:	68 1b 18 00 00       	push   $0x181b
    104f:	6a 01                	push   $0x1
    1051:	e8 6a 04 00 00       	call   14c0 <printf>
    1056:	83 c4 10             	add    $0x10,%esp
    1059:	b8 2d 18 00 00       	mov    $0x182d,%eax
    105e:	85 f6                	test   %esi,%esi
    1060:	be 26 18 00 00       	mov    $0x1826,%esi
    1065:	0f 44 f0             	cmove  %eax,%esi
//  printf(1,"%s returned successfully from shm_open with counter %x\n", pid? "Child": "Parent", counter); 
  for(i = 0; i < 10000; i++)
    1068:	31 ff                	xor    %edi,%edi
    106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    {
     uacquire(&(counter->lock));
    1070:	83 ec 0c             	sub    $0xc,%esp
    1073:	ff 75 e4             	pushl  -0x1c(%ebp)
    1076:	e8 65 07 00 00       	call   17e0 <uacquire>
     counter->cnt++;
    107b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    107e:	83 40 04 01          	addl   $0x1,0x4(%eax)
     urelease(&(counter->lock));
    1082:	89 04 24             	mov    %eax,(%esp)
    1085:	e8 76 07 00 00       	call   1800 <urelease>

//print something because we are curious and to give a chance to switch process
     if(i%1000 == 0)
    108a:	89 f8                	mov    %edi,%eax
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	f7 eb                	imul   %ebx
    1091:	89 f8                	mov    %edi,%eax
    1093:	c1 f8 1f             	sar    $0x1f,%eax
    1096:	c1 fa 06             	sar    $0x6,%edx
    1099:	29 c2                	sub    %eax,%edx
    109b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    10a1:	39 d7                	cmp    %edx,%edi
    10a3:	75 1a                	jne    10bf <main+0xbf>
       printf(1,"Counter in %s is %d at address %x\n",pid? "Parent" : "Child", counter->cnt, counter);
    10a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10a8:	83 ec 0c             	sub    $0xc,%esp
    10ab:	50                   	push   %eax
    10ac:	ff 70 04             	pushl  0x4(%eax)
    10af:	56                   	push   %esi
    10b0:	68 68 18 00 00       	push   $0x1868
    10b5:	6a 01                	push   $0x1
    10b7:	e8 04 04 00 00       	call   14c0 <printf>
    10bc:	83 c4 20             	add    $0x20,%esp
//which we can now use but will be shared between the two processes
  
shm_open(1,(char **)&counter);
printf(1, "Now Here!\n"); 
//  printf(1,"%s returned successfully from shm_open with counter %x\n", pid? "Child": "Parent", counter); 
  for(i = 0; i < 10000; i++)
    10bf:	83 c7 01             	add    $0x1,%edi
    10c2:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
    10c8:	75 a6                	jne    1070 <main+0x70>
//print something because we are curious and to give a chance to switch process
     if(i%1000 == 0)
       printf(1,"Counter in %s is %d at address %x\n",pid? "Parent" : "Child", counter->cnt, counter);
}
  
  if(pid)
    10ca:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    10cd:	85 c9                	test   %ecx,%ecx
    10cf:	74 2a                	je     10fb <main+0xfb>
     {
       printf(1,"Counter in parent is %d\n",counter->cnt);
    10d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10d4:	52                   	push   %edx
    10d5:	ff 70 04             	pushl  0x4(%eax)
    10d8:	68 33 18 00 00       	push   $0x1833
    10dd:	6a 01                	push   $0x1
    10df:	e8 dc 03 00 00       	call   14c0 <printf>
    wait();
    10e4:	e8 81 02 00 00       	call   136a <wait>
    10e9:	83 c4 10             	add    $0x10,%esp
    } else
    printf(1,"Counter in child is %d\n\n",counter->cnt);

//shm_close: first process will just detach, next one will free up the shm_table entry (but for now not the page)
   shm_close(1);
    10ec:	83 ec 0c             	sub    $0xc,%esp
    10ef:	6a 01                	push   $0x1
    10f1:	e8 14 03 00 00       	call   140a <shm_close>
   exit();
    10f6:	e8 67 02 00 00       	call   1362 <exit>
  if(pid)
     {
       printf(1,"Counter in parent is %d\n",counter->cnt);
    wait();
    } else
    printf(1,"Counter in child is %d\n\n",counter->cnt);
    10fb:	50                   	push   %eax
    10fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ff:	ff 70 04             	pushl  0x4(%eax)
    1102:	68 4c 18 00 00       	push   $0x184c
    1107:	6a 01                	push   $0x1
    1109:	e8 b2 03 00 00       	call   14c0 <printf>
    110e:	83 c4 10             	add    $0x10,%esp
    1111:	eb d9                	jmp    10ec <main+0xec>
    1113:	66 90                	xchg   %ax,%ax
    1115:	66 90                	xchg   %ax,%ax
    1117:	66 90                	xchg   %ax,%ax
    1119:	66 90                	xchg   %ax,%ax
    111b:	66 90                	xchg   %ax,%ax
    111d:	66 90                	xchg   %ax,%ax
    111f:	90                   	nop

00001120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 45 08             	mov    0x8(%ebp),%eax
    1127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    112a:	89 c2                	mov    %eax,%edx
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1130:	83 c1 01             	add    $0x1,%ecx
    1133:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1137:	83 c2 01             	add    $0x1,%edx
    113a:	84 db                	test   %bl,%bl
    113c:	88 5a ff             	mov    %bl,-0x1(%edx)
    113f:	75 ef                	jne    1130 <strcpy+0x10>
    ;
  return os;
}
    1141:	5b                   	pop    %ebx
    1142:	5d                   	pop    %ebp
    1143:	c3                   	ret    
    1144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    114a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	56                   	push   %esi
    1154:	53                   	push   %ebx
    1155:	8b 55 08             	mov    0x8(%ebp),%edx
    1158:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    115b:	0f b6 02             	movzbl (%edx),%eax
    115e:	0f b6 19             	movzbl (%ecx),%ebx
    1161:	84 c0                	test   %al,%al
    1163:	75 1e                	jne    1183 <strcmp+0x33>
    1165:	eb 29                	jmp    1190 <strcmp+0x40>
    1167:	89 f6                	mov    %esi,%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1170:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1173:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1176:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1179:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    117d:	84 c0                	test   %al,%al
    117f:	74 0f                	je     1190 <strcmp+0x40>
    1181:	89 f1                	mov    %esi,%ecx
    1183:	38 d8                	cmp    %bl,%al
    1185:	74 e9                	je     1170 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1187:	29 d8                	sub    %ebx,%eax
}
    1189:	5b                   	pop    %ebx
    118a:	5e                   	pop    %esi
    118b:	5d                   	pop    %ebp
    118c:	c3                   	ret    
    118d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1190:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1192:	29 d8                	sub    %ebx,%eax
}
    1194:	5b                   	pop    %ebx
    1195:	5e                   	pop    %esi
    1196:	5d                   	pop    %ebp
    1197:	c3                   	ret    
    1198:	90                   	nop
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011a0 <strlen>:

uint
strlen(char *s)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    11a6:	80 39 00             	cmpb   $0x0,(%ecx)
    11a9:	74 12                	je     11bd <strlen+0x1d>
    11ab:	31 d2                	xor    %edx,%edx
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
    11b0:	83 c2 01             	add    $0x1,%edx
    11b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11b7:	89 d0                	mov    %edx,%eax
    11b9:	75 f5                	jne    11b0 <strlen+0x10>
    ;
  return n;
}
    11bb:	5d                   	pop    %ebp
    11bc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    11bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    11bf:	5d                   	pop    %ebp
    11c0:	c3                   	ret    
    11c1:	eb 0d                	jmp    11d0 <memset>
    11c3:	90                   	nop
    11c4:	90                   	nop
    11c5:	90                   	nop
    11c6:	90                   	nop
    11c7:	90                   	nop
    11c8:	90                   	nop
    11c9:	90                   	nop
    11ca:	90                   	nop
    11cb:	90                   	nop
    11cc:	90                   	nop
    11cd:	90                   	nop
    11ce:	90                   	nop
    11cf:	90                   	nop

000011d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	57                   	push   %edi
    11d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11da:	8b 45 0c             	mov    0xc(%ebp),%eax
    11dd:	89 d7                	mov    %edx,%edi
    11df:	fc                   	cld    
    11e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11e2:	89 d0                	mov    %edx,%eax
    11e4:	5f                   	pop    %edi
    11e5:	5d                   	pop    %ebp
    11e6:	c3                   	ret    
    11e7:	89 f6                	mov    %esi,%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <strchr>:

char*
strchr(const char *s, char c)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	53                   	push   %ebx
    11f4:	8b 45 08             	mov    0x8(%ebp),%eax
    11f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11fa:	0f b6 10             	movzbl (%eax),%edx
    11fd:	84 d2                	test   %dl,%dl
    11ff:	74 1d                	je     121e <strchr+0x2e>
    if(*s == c)
    1201:	38 d3                	cmp    %dl,%bl
    1203:	89 d9                	mov    %ebx,%ecx
    1205:	75 0d                	jne    1214 <strchr+0x24>
    1207:	eb 17                	jmp    1220 <strchr+0x30>
    1209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1210:	38 ca                	cmp    %cl,%dl
    1212:	74 0c                	je     1220 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1214:	83 c0 01             	add    $0x1,%eax
    1217:	0f b6 10             	movzbl (%eax),%edx
    121a:	84 d2                	test   %dl,%dl
    121c:	75 f2                	jne    1210 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    121e:	31 c0                	xor    %eax,%eax
}
    1220:	5b                   	pop    %ebx
    1221:	5d                   	pop    %ebp
    1222:	c3                   	ret    
    1223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <gets>:

char*
gets(char *buf, int max)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
    1235:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1236:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1238:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    123b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    123e:	eb 29                	jmp    1269 <gets+0x39>
    cc = read(0, &c, 1);
    1240:	83 ec 04             	sub    $0x4,%esp
    1243:	6a 01                	push   $0x1
    1245:	57                   	push   %edi
    1246:	6a 00                	push   $0x0
    1248:	e8 2d 01 00 00       	call   137a <read>
    if(cc < 1)
    124d:	83 c4 10             	add    $0x10,%esp
    1250:	85 c0                	test   %eax,%eax
    1252:	7e 1d                	jle    1271 <gets+0x41>
      break;
    buf[i++] = c;
    1254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1258:	8b 55 08             	mov    0x8(%ebp),%edx
    125b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    125d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    125f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1263:	74 1b                	je     1280 <gets+0x50>
    1265:	3c 0d                	cmp    $0xd,%al
    1267:	74 17                	je     1280 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1269:	8d 5e 01             	lea    0x1(%esi),%ebx
    126c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    126f:	7c cf                	jl     1240 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1271:	8b 45 08             	mov    0x8(%ebp),%eax
    1274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1278:	8d 65 f4             	lea    -0xc(%ebp),%esp
    127b:	5b                   	pop    %ebx
    127c:	5e                   	pop    %esi
    127d:	5f                   	pop    %edi
    127e:	5d                   	pop    %ebp
    127f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1280:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1283:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1289:	8d 65 f4             	lea    -0xc(%ebp),%esp
    128c:	5b                   	pop    %ebx
    128d:	5e                   	pop    %esi
    128e:	5f                   	pop    %edi
    128f:	5d                   	pop    %ebp
    1290:	c3                   	ret    
    1291:	eb 0d                	jmp    12a0 <stat>
    1293:	90                   	nop
    1294:	90                   	nop
    1295:	90                   	nop
    1296:	90                   	nop
    1297:	90                   	nop
    1298:	90                   	nop
    1299:	90                   	nop
    129a:	90                   	nop
    129b:	90                   	nop
    129c:	90                   	nop
    129d:	90                   	nop
    129e:	90                   	nop
    129f:	90                   	nop

000012a0 <stat>:

int
stat(char *n, struct stat *st)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a5:	83 ec 08             	sub    $0x8,%esp
    12a8:	6a 00                	push   $0x0
    12aa:	ff 75 08             	pushl  0x8(%ebp)
    12ad:	e8 f0 00 00 00       	call   13a2 <open>
  if(fd < 0)
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	85 c0                	test   %eax,%eax
    12b7:	78 27                	js     12e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	ff 75 0c             	pushl  0xc(%ebp)
    12bf:	89 c3                	mov    %eax,%ebx
    12c1:	50                   	push   %eax
    12c2:	e8 f3 00 00 00       	call   13ba <fstat>
    12c7:	89 c6                	mov    %eax,%esi
  close(fd);
    12c9:	89 1c 24             	mov    %ebx,(%esp)
    12cc:	e8 b9 00 00 00       	call   138a <close>
  return r;
    12d1:	83 c4 10             	add    $0x10,%esp
    12d4:	89 f0                	mov    %esi,%eax
}
    12d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12d9:	5b                   	pop    %ebx
    12da:	5e                   	pop    %esi
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    12e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12e5:	eb ef                	jmp    12d6 <stat+0x36>
    12e7:	89 f6                	mov    %esi,%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	53                   	push   %ebx
    12f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f7:	0f be 11             	movsbl (%ecx),%edx
    12fa:	8d 42 d0             	lea    -0x30(%edx),%eax
    12fd:	3c 09                	cmp    $0x9,%al
    12ff:	b8 00 00 00 00       	mov    $0x0,%eax
    1304:	77 1f                	ja     1325 <atoi+0x35>
    1306:	8d 76 00             	lea    0x0(%esi),%esi
    1309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1310:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1313:	83 c1 01             	add    $0x1,%ecx
    1316:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    131a:	0f be 11             	movsbl (%ecx),%edx
    131d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1320:	80 fb 09             	cmp    $0x9,%bl
    1323:	76 eb                	jbe    1310 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1325:	5b                   	pop    %ebx
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret    
    1328:	90                   	nop
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001330 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	56                   	push   %esi
    1334:	53                   	push   %ebx
    1335:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1338:	8b 45 08             	mov    0x8(%ebp),%eax
    133b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    133e:	85 db                	test   %ebx,%ebx
    1340:	7e 14                	jle    1356 <memmove+0x26>
    1342:	31 d2                	xor    %edx,%edx
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    134c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    134f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1352:	39 da                	cmp    %ebx,%edx
    1354:	75 f2                	jne    1348 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1356:	5b                   	pop    %ebx
    1357:	5e                   	pop    %esi
    1358:	5d                   	pop    %ebp
    1359:	c3                   	ret    

0000135a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    135a:	b8 01 00 00 00       	mov    $0x1,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <exit>:
SYSCALL(exit)
    1362:	b8 02 00 00 00       	mov    $0x2,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <wait>:
SYSCALL(wait)
    136a:	b8 03 00 00 00       	mov    $0x3,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <pipe>:
SYSCALL(pipe)
    1372:	b8 04 00 00 00       	mov    $0x4,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <read>:
SYSCALL(read)
    137a:	b8 05 00 00 00       	mov    $0x5,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <write>:
SYSCALL(write)
    1382:	b8 10 00 00 00       	mov    $0x10,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <close>:
SYSCALL(close)
    138a:	b8 15 00 00 00       	mov    $0x15,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <kill>:
SYSCALL(kill)
    1392:	b8 06 00 00 00       	mov    $0x6,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <exec>:
SYSCALL(exec)
    139a:	b8 07 00 00 00       	mov    $0x7,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <open>:
SYSCALL(open)
    13a2:	b8 0f 00 00 00       	mov    $0xf,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <mknod>:
SYSCALL(mknod)
    13aa:	b8 11 00 00 00       	mov    $0x11,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <unlink>:
SYSCALL(unlink)
    13b2:	b8 12 00 00 00       	mov    $0x12,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <fstat>:
SYSCALL(fstat)
    13ba:	b8 08 00 00 00       	mov    $0x8,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <link>:
SYSCALL(link)
    13c2:	b8 13 00 00 00       	mov    $0x13,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <mkdir>:
SYSCALL(mkdir)
    13ca:	b8 14 00 00 00       	mov    $0x14,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <chdir>:
SYSCALL(chdir)
    13d2:	b8 09 00 00 00       	mov    $0x9,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <dup>:
SYSCALL(dup)
    13da:	b8 0a 00 00 00       	mov    $0xa,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <getpid>:
SYSCALL(getpid)
    13e2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <sbrk>:
SYSCALL(sbrk)
    13ea:	b8 0c 00 00 00       	mov    $0xc,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <sleep>:
SYSCALL(sleep)
    13f2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <uptime>:
SYSCALL(uptime)
    13fa:	b8 0e 00 00 00       	mov    $0xe,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <shm_open>:
SYSCALL(shm_open)
    1402:	b8 16 00 00 00       	mov    $0x16,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <shm_close>:
SYSCALL(shm_close)	
    140a:	b8 17 00 00 00       	mov    $0x17,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    
    1412:	66 90                	xchg   %ax,%ax
    1414:	66 90                	xchg   %ax,%ax
    1416:	66 90                	xchg   %ax,%ax
    1418:	66 90                	xchg   %ax,%ax
    141a:	66 90                	xchg   %ax,%ax
    141c:	66 90                	xchg   %ax,%ax
    141e:	66 90                	xchg   %ax,%ax

00001420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	89 c6                	mov    %eax,%esi
    1428:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    142b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    142e:	85 db                	test   %ebx,%ebx
    1430:	74 7e                	je     14b0 <printint+0x90>
    1432:	89 d0                	mov    %edx,%eax
    1434:	c1 e8 1f             	shr    $0x1f,%eax
    1437:	84 c0                	test   %al,%al
    1439:	74 75                	je     14b0 <printint+0x90>
    neg = 1;
    x = -xx;
    143b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    143d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1444:	f7 d8                	neg    %eax
    1446:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1449:	31 ff                	xor    %edi,%edi
    144b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    144e:	89 ce                	mov    %ecx,%esi
    1450:	eb 08                	jmp    145a <printint+0x3a>
    1452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1458:	89 cf                	mov    %ecx,%edi
    145a:	31 d2                	xor    %edx,%edx
    145c:	8d 4f 01             	lea    0x1(%edi),%ecx
    145f:	f7 f6                	div    %esi
    1461:	0f b6 92 94 18 00 00 	movzbl 0x1894(%edx),%edx
  }while((x /= base) != 0);
    1468:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    146a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    146d:	75 e9                	jne    1458 <printint+0x38>
  if(neg)
    146f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1472:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1475:	85 c0                	test   %eax,%eax
    1477:	74 08                	je     1481 <printint+0x61>
    buf[i++] = '-';
    1479:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    147e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1481:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1485:	8d 76 00             	lea    0x0(%esi),%esi
    1488:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    148b:	83 ec 04             	sub    $0x4,%esp
    148e:	83 ef 01             	sub    $0x1,%edi
    1491:	6a 01                	push   $0x1
    1493:	53                   	push   %ebx
    1494:	56                   	push   %esi
    1495:	88 45 d7             	mov    %al,-0x29(%ebp)
    1498:	e8 e5 fe ff ff       	call   1382 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    149d:	83 c4 10             	add    $0x10,%esp
    14a0:	39 df                	cmp    %ebx,%edi
    14a2:	75 e4                	jne    1488 <printint+0x68>
    putc(fd, buf[i]);
}
    14a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14a7:	5b                   	pop    %ebx
    14a8:	5e                   	pop    %esi
    14a9:	5f                   	pop    %edi
    14aa:	5d                   	pop    %ebp
    14ab:	c3                   	ret    
    14ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    14b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    14b2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    14b9:	eb 8b                	jmp    1446 <printint+0x26>
    14bb:	90                   	nop
    14bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	57                   	push   %edi
    14c4:	56                   	push   %esi
    14c5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14c6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14c9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14cc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14d5:	0f b6 1e             	movzbl (%esi),%ebx
    14d8:	83 c6 01             	add    $0x1,%esi
    14db:	84 db                	test   %bl,%bl
    14dd:	0f 84 b0 00 00 00    	je     1593 <printf+0xd3>
    14e3:	31 d2                	xor    %edx,%edx
    14e5:	eb 39                	jmp    1520 <printf+0x60>
    14e7:	89 f6                	mov    %esi,%esi
    14e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14f0:	83 f8 25             	cmp    $0x25,%eax
    14f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    14f6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14fb:	74 18                	je     1515 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14fd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1500:	83 ec 04             	sub    $0x4,%esp
    1503:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1506:	6a 01                	push   $0x1
    1508:	50                   	push   %eax
    1509:	57                   	push   %edi
    150a:	e8 73 fe ff ff       	call   1382 <write>
    150f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1512:	83 c4 10             	add    $0x10,%esp
    1515:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1518:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    151c:	84 db                	test   %bl,%bl
    151e:	74 73                	je     1593 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1520:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1522:	0f be cb             	movsbl %bl,%ecx
    1525:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1528:	74 c6                	je     14f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    152a:	83 fa 25             	cmp    $0x25,%edx
    152d:	75 e6                	jne    1515 <printf+0x55>
      if(c == 'd'){
    152f:	83 f8 64             	cmp    $0x64,%eax
    1532:	0f 84 f8 00 00 00    	je     1630 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1538:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    153e:	83 f9 70             	cmp    $0x70,%ecx
    1541:	74 5d                	je     15a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1543:	83 f8 73             	cmp    $0x73,%eax
    1546:	0f 84 84 00 00 00    	je     15d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    154c:	83 f8 63             	cmp    $0x63,%eax
    154f:	0f 84 ea 00 00 00    	je     163f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1555:	83 f8 25             	cmp    $0x25,%eax
    1558:	0f 84 c2 00 00 00    	je     1620 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    155e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1561:	83 ec 04             	sub    $0x4,%esp
    1564:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1568:	6a 01                	push   $0x1
    156a:	50                   	push   %eax
    156b:	57                   	push   %edi
    156c:	e8 11 fe ff ff       	call   1382 <write>
    1571:	83 c4 0c             	add    $0xc,%esp
    1574:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1577:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    157a:	6a 01                	push   $0x1
    157c:	50                   	push   %eax
    157d:	57                   	push   %edi
    157e:	83 c6 01             	add    $0x1,%esi
    1581:	e8 fc fd ff ff       	call   1382 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1586:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    158a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    158d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    158f:	84 db                	test   %bl,%bl
    1591:	75 8d                	jne    1520 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1593:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1596:	5b                   	pop    %ebx
    1597:	5e                   	pop    %esi
    1598:	5f                   	pop    %edi
    1599:	5d                   	pop    %ebp
    159a:	c3                   	ret    
    159b:	90                   	nop
    159c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15a8:	6a 00                	push   $0x0
    15aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    15ad:	89 f8                	mov    %edi,%eax
    15af:	8b 13                	mov    (%ebx),%edx
    15b1:	e8 6a fe ff ff       	call   1420 <printint>
        ap++;
    15b6:	89 d8                	mov    %ebx,%eax
    15b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    15bd:	83 c0 04             	add    $0x4,%eax
    15c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15c3:	e9 4d ff ff ff       	jmp    1515 <printf+0x55>
    15c8:	90                   	nop
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    15d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15d3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15d5:	83 c0 04             	add    $0x4,%eax
    15d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    15db:	b8 8c 18 00 00       	mov    $0x188c,%eax
    15e0:	85 db                	test   %ebx,%ebx
    15e2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    15e5:	0f b6 03             	movzbl (%ebx),%eax
    15e8:	84 c0                	test   %al,%al
    15ea:	74 23                	je     160f <printf+0x14f>
    15ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    15f6:	83 ec 04             	sub    $0x4,%esp
    15f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    15fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15fe:	50                   	push   %eax
    15ff:	57                   	push   %edi
    1600:	e8 7d fd ff ff       	call   1382 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1605:	0f b6 03             	movzbl (%ebx),%eax
    1608:	83 c4 10             	add    $0x10,%esp
    160b:	84 c0                	test   %al,%al
    160d:	75 e1                	jne    15f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    160f:	31 d2                	xor    %edx,%edx
    1611:	e9 ff fe ff ff       	jmp    1515 <printf+0x55>
    1616:	8d 76 00             	lea    0x0(%esi),%esi
    1619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1620:	83 ec 04             	sub    $0x4,%esp
    1623:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1626:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1629:	6a 01                	push   $0x1
    162b:	e9 4c ff ff ff       	jmp    157c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1630:	83 ec 0c             	sub    $0xc,%esp
    1633:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1638:	6a 01                	push   $0x1
    163a:	e9 6b ff ff ff       	jmp    15aa <printf+0xea>
    163f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1642:	83 ec 04             	sub    $0x4,%esp
    1645:	8b 03                	mov    (%ebx),%eax
    1647:	6a 01                	push   $0x1
    1649:	88 45 e4             	mov    %al,-0x1c(%ebp)
    164c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    164f:	50                   	push   %eax
    1650:	57                   	push   %edi
    1651:	e8 2c fd ff ff       	call   1382 <write>
    1656:	e9 5b ff ff ff       	jmp    15b6 <printf+0xf6>
    165b:	66 90                	xchg   %ax,%ax
    165d:	66 90                	xchg   %ax,%ax
    165f:	90                   	nop

00001660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1661:	a1 78 1b 00 00       	mov    0x1b78,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1666:	89 e5                	mov    %esp,%ebp
    1668:	57                   	push   %edi
    1669:	56                   	push   %esi
    166a:	53                   	push   %ebx
    166b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    166e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1670:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1673:	39 c8                	cmp    %ecx,%eax
    1675:	73 19                	jae    1690 <free+0x30>
    1677:	89 f6                	mov    %esi,%esi
    1679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1680:	39 d1                	cmp    %edx,%ecx
    1682:	72 1c                	jb     16a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1684:	39 d0                	cmp    %edx,%eax
    1686:	73 18                	jae    16a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1688:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    168a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    168c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    168e:	72 f0                	jb     1680 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1690:	39 d0                	cmp    %edx,%eax
    1692:	72 f4                	jb     1688 <free+0x28>
    1694:	39 d1                	cmp    %edx,%ecx
    1696:	73 f0                	jae    1688 <free+0x28>
    1698:	90                   	nop
    1699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    16a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16a6:	39 d7                	cmp    %edx,%edi
    16a8:	74 19                	je     16c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16ad:	8b 50 04             	mov    0x4(%eax),%edx
    16b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16b3:	39 f1                	cmp    %esi,%ecx
    16b5:	74 23                	je     16da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    16b9:	a3 78 1b 00 00       	mov    %eax,0x1b78
}
    16be:	5b                   	pop    %ebx
    16bf:	5e                   	pop    %esi
    16c0:	5f                   	pop    %edi
    16c1:	5d                   	pop    %ebp
    16c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16c3:	03 72 04             	add    0x4(%edx),%esi
    16c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16c9:	8b 10                	mov    (%eax),%edx
    16cb:	8b 12                	mov    (%edx),%edx
    16cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16d0:	8b 50 04             	mov    0x4(%eax),%edx
    16d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16d6:	39 f1                	cmp    %esi,%ecx
    16d8:	75 dd                	jne    16b7 <free+0x57>
    p->s.size += bp->s.size;
    16da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    16dd:	a3 78 1b 00 00       	mov    %eax,0x1b78
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    16ea:	5b                   	pop    %ebx
    16eb:	5e                   	pop    %esi
    16ec:	5f                   	pop    %edi
    16ed:	5d                   	pop    %ebp
    16ee:	c3                   	ret    
    16ef:	90                   	nop

000016f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	57                   	push   %edi
    16f4:	56                   	push   %esi
    16f5:	53                   	push   %ebx
    16f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16fc:	8b 15 78 1b 00 00    	mov    0x1b78,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1702:	8d 78 07             	lea    0x7(%eax),%edi
    1705:	c1 ef 03             	shr    $0x3,%edi
    1708:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    170b:	85 d2                	test   %edx,%edx
    170d:	0f 84 a3 00 00 00    	je     17b6 <malloc+0xc6>
    1713:	8b 02                	mov    (%edx),%eax
    1715:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1718:	39 cf                	cmp    %ecx,%edi
    171a:	76 74                	jbe    1790 <malloc+0xa0>
    171c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1722:	be 00 10 00 00       	mov    $0x1000,%esi
    1727:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    172e:	0f 43 f7             	cmovae %edi,%esi
    1731:	ba 00 80 00 00       	mov    $0x8000,%edx
    1736:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    173c:	0f 46 da             	cmovbe %edx,%ebx
    173f:	eb 10                	jmp    1751 <malloc+0x61>
    1741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1748:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    174a:	8b 48 04             	mov    0x4(%eax),%ecx
    174d:	39 cf                	cmp    %ecx,%edi
    174f:	76 3f                	jbe    1790 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1751:	39 05 78 1b 00 00    	cmp    %eax,0x1b78
    1757:	89 c2                	mov    %eax,%edx
    1759:	75 ed                	jne    1748 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    175b:	83 ec 0c             	sub    $0xc,%esp
    175e:	53                   	push   %ebx
    175f:	e8 86 fc ff ff       	call   13ea <sbrk>
  if(p == (char*)-1)
    1764:	83 c4 10             	add    $0x10,%esp
    1767:	83 f8 ff             	cmp    $0xffffffff,%eax
    176a:	74 1c                	je     1788 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    176c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    176f:	83 ec 0c             	sub    $0xc,%esp
    1772:	83 c0 08             	add    $0x8,%eax
    1775:	50                   	push   %eax
    1776:	e8 e5 fe ff ff       	call   1660 <free>
  return freep;
    177b:	8b 15 78 1b 00 00    	mov    0x1b78,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1781:	83 c4 10             	add    $0x10,%esp
    1784:	85 d2                	test   %edx,%edx
    1786:	75 c0                	jne    1748 <malloc+0x58>
        return 0;
    1788:	31 c0                	xor    %eax,%eax
    178a:	eb 1c                	jmp    17a8 <malloc+0xb8>
    178c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1790:	39 cf                	cmp    %ecx,%edi
    1792:	74 1c                	je     17b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1794:	29 f9                	sub    %edi,%ecx
    1796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    179c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    179f:	89 15 78 1b 00 00    	mov    %edx,0x1b78
      return (void*)(p + 1);
    17a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    17a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17ab:	5b                   	pop    %ebx
    17ac:	5e                   	pop    %esi
    17ad:	5f                   	pop    %edi
    17ae:	5d                   	pop    %ebp
    17af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    17b0:	8b 08                	mov    (%eax),%ecx
    17b2:	89 0a                	mov    %ecx,(%edx)
    17b4:	eb e9                	jmp    179f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    17b6:	c7 05 78 1b 00 00 7c 	movl   $0x1b7c,0x1b78
    17bd:	1b 00 00 
    17c0:	c7 05 7c 1b 00 00 7c 	movl   $0x1b7c,0x1b7c
    17c7:	1b 00 00 
    base.s.size = 0;
    17ca:	b8 7c 1b 00 00       	mov    $0x1b7c,%eax
    17cf:	c7 05 80 1b 00 00 00 	movl   $0x0,0x1b80
    17d6:	00 00 00 
    17d9:	e9 3e ff ff ff       	jmp    171c <malloc+0x2c>
    17de:	66 90                	xchg   %ax,%ax

000017e0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17e0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17e1:	b9 01 00 00 00       	mov    $0x1,%ecx
    17e6:	89 e5                	mov    %esp,%ebp
    17e8:	8b 55 08             	mov    0x8(%ebp),%edx
    17eb:	90                   	nop
    17ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17f0:	89 c8                	mov    %ecx,%eax
    17f2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17f5:	85 c0                	test   %eax,%eax
    17f7:	75 f7                	jne    17f0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17f9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    17fe:	5d                   	pop    %ebp
    17ff:	c3                   	ret    

00001800 <urelease>:

void urelease (struct uspinlock *lk) {
    1800:	55                   	push   %ebp
    1801:	89 e5                	mov    %esp,%ebp
    1803:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1806:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    180b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1811:	5d                   	pop    %ebp
    1812:	c3                   	ret    
