#define VM_PROGRAM "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."

#include <stdio.h>

#define PAPER_SIZE 128                   //纸带长度
#define VM_OUT(...) putchar(__VA_ARGS__) //BF图灵机的输出流
#define VM_GET_IN() getchar()            //BF图灵机的输入流
#define STACK_SIZE 16                    //堆栈长度

#ifdef DEBUG
#define VM_LOG(...) printf(__VA_ARGS__) //BF图灵机的日志输出流
#endif

////////////////////////////////////////////////////////////////////////////////
/////////////      移植与调试仅需修改上面的代码, 下面的不用动      /////////////////
////////////////////////////////////////////////////////////////////////////////

//需要输出某一个步骤时的内存时, 将这个函数(宏)放到那里
//必须工作在DEBUG模式下
#define PAPER_LOG()                                                              \
    VM_LOG("\n-------------------------------------------------------------\n"); \
    VM_LOG("sp = %d [l:0x%04X,b:%d], stack:", sp, sp / 4, sp % 4);               \
    for (int t = 0; t < STACK_SIZE; t++)                                         \
    {                                                                            \
        if (t % 4 == 0)                                                          \
        {                                                                        \
            VM_LOG("\n");                                                        \
            VM_LOG("l:0x%04X   |  ", t / 4);                                     \
        }                                                                        \
        VM_LOG("%04x ", stack[t]);                                               \
    }                                                                            \
    VM_LOG("\n\n");                                                              \
    VM_LOG("ptr = %d [l:0x%04X , b:%d], ", ptr, ptr / 8, ptr % 8);               \
    VM_LOG(" paper (Memory value) :\n");                                         \
    VM_LOG("Address    |  HEX                      |  ASCII\n");                 \
    VM_LOG("--------------------------------------------------\n");              \
    for (int i = 0, j = 0; i < (PAPER_SIZE / 8); i++)                            \
    {                                                                            \
        VM_LOG("l:0x%04X   |  ", i);                                             \
        for (j = 0; j < 8; j++)                                                  \
        {                                                                        \
            VM_LOG("%02X ", 0x000000FF & paper[i * 8 + j]);                      \
        }                                                                        \
        VM_LOG(" |  ");                                                          \
        for (j = 0; j < 8; j++)                                                  \
        {                                                                        \
            if ((paper[i * 8 + j] >= 0x20) && (paper[i * 8 + j] <= 0x7E))        \
            {                                                                    \
                VM_LOG("%c", paper[i * 8 + j]);                                  \
            }                                                                    \
            else                                                                 \
            {                                                                    \
                VM_LOG("·");                                                     \
            }                                                                    \
        }                                                                        \
        VM_LOG("\n");                                                            \
    }                                                                            \
    VM_LOG("-------------------------------------------------------------\n");

//////////////////////////////////////////////////////////////////////////////////////////////////

#if (((PAPER_SIZE & PAPER_SIZE - 1) != 0) || (PAPER_SIZE < 8))
#error PAPER_SIZE must be 2^n and large than 8, where n is Natural number
#endif
#if ((STACK_SIZE % 4 != 0) || (STACK_SIZE < 4))
#error STACK_SIZE must be 4*n, where n is positive integer
#endif

#define HALF_PAPER_SIZE PAPER_SIZE / 2

typedef char paper_typedef;

paper_typedef program[PAPER_SIZE];
paper_typedef paper[PAPER_SIZE] = {0};
int ptr = HALF_PAPER_SIZE;
int stack[STACK_SIZE] = {0};
int sp = 0;

char *strcpy(char *strDest, const char *strSrc)
{
    char *address = strDest;
    while ((*strDest++ = *strSrc++) != '\0')
        ;
    return address;
}

void vm_Turing_run()
{
    int size = 0, pc = 0;
    for (; program[size] != '\0'; ++size)
        ;
    for (; pc < size; ++pc)
    {
        if (!sp && program[pc] == ']')
        {
#ifdef DEBUG
            VM_LOG("stack error: SP is already 0 but ']'\n");
#endif
            break;
        }
        switch (program[pc])
        {
        case '+':
            ++paper[ptr];
            break;
        case '-':
            --paper[ptr];
            break;
        case '[':
            stack[sp] = pc;
            ++sp;
            break;
        case ']':
            pc = paper[ptr] ? stack[sp - 1] : pc;
            sp -= (!paper[ptr]);
            break;
        case '>':
            ++ptr;
            break;
        case '<':
            --ptr;
            break;
        case ',':
            paper[ptr] = VM_GET_IN();
            break;
        case '.':
            VM_OUT(paper[ptr]);
            break;
        }
        if (ptr >= PAPER_SIZE || ptr < 0)
        {
#ifdef DEBUG
            VM_LOG("Memory error: paper size too small!\n");
#endif
            break;
        }
        if (sp >= STACK_SIZE)
        {
#ifdef DEBUG
            VM_LOG("Stack error: stack overflow!\n");
#endif
            break;
        }
    }
    return;
}

int main()
{
    strcpy(program, VM_PROGRAM);
    vm_Turing_run();
#ifdef DEBUG
    PAPER_LOG();
#endif
    return 0;
}
