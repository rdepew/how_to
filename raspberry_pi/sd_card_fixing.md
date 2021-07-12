# Fixing an SD Card

Once you've got Raspbian programmed on an SD card, you'll
have a devil of a time trying to reformat it so you can
reuse it.

The SD card has two partitions on it. You need to delete
everything from both partitions, and then remove the 
partitions.

Then you need to reformat the SD card, and if it's larger
than 32GB, you have to reformat it again.

(Why? Because cards larger than 32GB are SDXC cards, and
formatting programs always format them using exFAT. But
the booatloader on the RPi only recognizes FAT32.)

So here's how you do it.

## 1. Erase the partition.

Try to do it the regular way. On Linux, the `gparted` tool
is a really nice tool for doing this. First, you'll need
to know what the SD card is called. It's usually something
like /dev/sdb or /dev/sdc. Partitions on /dev/sdx will be 
called /dev/sdx1, /dev/sdx2, and so on.

On a Linux PC, run the command `blkid` or the command 
`mount` to list all of the \dev\sdx devices. Then insert
the SD card and run the command again.

IT'S NOT /dev/sda !!!!! DON'T DO ANYTHING TO /dev/sda.
That's your hard disk drive. If you mess that up, you're
hosed.

Now that you know what it's called, run `gparted`. Click
on the partition you want to delete, then click the trash
can. This only marks it for deletion. To actually delete
it, click on the green checkmark. 

Even though it looks like this works, it usually does not
work. To find out for sure, remove the SD card, re-insert
it, and look at its contents. You'll probably be 
disappointed to find everything there that was there 
before.

### 2. When nothing else works

When nothing else works, you'll use the `dd` command to 
copy an imaginary device called /dev/zero all over the
stubborn card -- not just the partition, but the entire
card. Here's the `dd` command for erasing 
the partition /dev/sdc.
```
sudo dd if=/dev/zero of=/dev/sdc status=progress
```

If you omit the `status=progress` parameter, it will
still work, silently, and you won't know it's done
until it's done. For a 64GB card, that's about 6.5 hours.

### 3. Format it as FAT32

Now I'm going to recommend you download the Raspberry Pi
Imager tool. You don't have to use it to burn the SD 
card. Just use it to format the card.
You can download it from raspberrypi.org/downloads , for
Ubuntu, Windows, or MacOS.

When you run it, click on "Source" and scroll down until
you see "Erase (Format as FAT32). Then select the 
correct drive for it, then click "Go". 

### 4. You're done.

Now you can use it as you wish with your RPi.

