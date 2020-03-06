#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>
#include <linux/kernel.h>   
 
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Patryk Kaniewski");
MODULE_INFO(intree, "Y");

static int simple_init(void)
{
	printk(KERN_ALERT "inicjalizacja");
	return 0;
}
 
static void simple_cleanup(void)
{
	printk(KERN_WARNING "zamkniecie");
}
 
module_init(simple_init);
module_exit(simple_cleanup);
