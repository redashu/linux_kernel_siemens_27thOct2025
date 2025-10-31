# linux_kernel_siemens_27thOct2025

### Boot loader config file 

<img src="boot1.png">


### few grub related commands 

```
595  cat  /etc/default/grub 
  596  grub2-mkconfig  
  597  grub2-mkconfig    | grep -i nosound 
  598  vim /boot/grub2/grub.cfg 
  599  grub2-mkconfig    


```
