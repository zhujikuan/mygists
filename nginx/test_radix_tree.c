/*
	practice nginx radix tree lib 

*/

#include<stdio.h>
#include<ngx_config.h>
#include<ngx_core.h>
int main(){
	ngx_int_t        rc;
	uintptr_t        tmp_num;
	ngx_radix_tree_t *mytree = 0;
	ngx_pagesize = getpagesize();
	ngx_pool_t       *mypool = ngx_create_pool(1024, NULL);
	mytree = ngx_radix_tree_create(mypool,-1);
	
	//insert
	rc = ngx_radix32tree_insert(mytree, 1,0xFFFFFFFF,101);
	printf("insert 1 ,%d\n",rc);
	rc = ngx_radix32tree_insert(mytree, 2,0xFFFFFFFF,202);
	printf("insert 2 ,%d\n",rc);	
	rc = ngx_radix32tree_insert(mytree, 4,0xFFFFFFFF,404);
	printf("insert 4 ,%d\n",rc);
	rc = ngx_radix32tree_insert(mytree, 6,0xFFFFFFFF,606);
	printf("insert 6 ,%d\n",rc);

	//find
	tmp_num = ngx_radix32tree_find(mytree, 1);
	printf("1:get %p\n",tmp_num);
	tmp_num = ngx_radix32tree_find(mytree, 2);
	printf("2:get %p\n",tmp_num);
	tmp_num = ngx_radix32tree_find(mytree, 4);
	printf("4:get %p\n",tmp_num);
	tmp_num = ngx_radix32tree_find(mytree, 6);
	printf("6:get %p\n",tmp_num);
	tmp_num = ngx_radix32tree_find(mytree, 3);
	printf("3:get %p\n",tmp_num);

	//delete
	rc = ngx_radix32tree_delete(mytree, 1, 0xFFFFFFFF);
	tmp_num = ngx_radix32tree_find(mytree, 1);
	printf("1:get %p\n",tmp_num);
	if(NGX_RADIX_NO_VALUE == tmp_num){
		printf("get null :%x \n",NGX_RADIX_NO_VALUE);
	}
	
	return 0;
}
