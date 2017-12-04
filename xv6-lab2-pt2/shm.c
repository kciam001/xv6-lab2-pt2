#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
  struct proc * curproc = myproc();

  acquire(&(shm_table.lock));

  int currId = 0;
  int foundId = -1;

  //cprintf("In Lock\n");
  for (int i=0; i < 64; i++) {
    currId = shm_table.shm_pages[i].id;
    if (id == currId){
      uint va = PGROUNDUP(curproc->sz); 
      char * frame = shm_table.shm_pages[i].frame;
      if (mappages(curproc->pgdir, (char*)va, PGSIZE, V2P(frame), PTE_W|PTE_U) <0) {
        release(&(shm_table.lock));
        panic("Messed up\n");
      }
      shm_table.shm_pages[i].refcnt += 1;
      *pointer = (char*)va;
      goto release;
    }
    if (foundId == -1 && currId == 0) {
      foundId = currId;
    }
  }
  //cprintf("Here now?\n");
  shm_table.shm_pages[foundId].id = id;
  char * frame = kalloc();
  memset(frame, 0, PGSIZE);
  shm_table.shm_pages[foundId].frame = frame;
  shm_table.shm_pages[foundId].refcnt = 1;
  uint va = PGROUNDUP(curproc->sz);
  if(mappages(curproc->pgdir, (char*)va, PGSIZE, V2P(frame), PTE_W|PTE_U) < 0){
    release(&(shm_table.lock));
    panic("Messed up!\n");
  }
  *pointer = (char*)va;
  curproc->sz = PGROUNDUP(curproc->sz) + PGSIZE;
  goto release;
  release:
  release(&(shm_table.lock));
//cprintf("Out of Lock\n");
return 1; //added to remove compiler warning -- you should decide what to return

}


int shm_close(int id) {
//you write this too!




return 0; //added to remove compiler warning -- you should decide what to return
}
