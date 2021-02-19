Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374C631FFC9
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 21:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhBSU0h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 15:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhBSU03 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Feb 2021 15:26:29 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377B9C061574
        for <linux-i2c@vger.kernel.org>; Fri, 19 Feb 2021 12:25:49 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id b3so10235585wrj.5
        for <linux-i2c@vger.kernel.org>; Fri, 19 Feb 2021 12:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=eIcquyZ5NqBwCY99rHJF6ld01+MgU1q0xgCJiImoLXQ=;
        b=aStF2z3HMTUpVWqLxXedCnM6nAYrFFH7UGYXPERMXza2hzOKY1mlTECvKfh7+vQC/M
         vLEaHj/bOQ4WObX/EBqJbF+Q290BY8Yem2STALUS0+HH8rKEx9coXUiwAWAcdjzIZCET
         D0EZqXaIxDab4KX5MJcBPp2UZn96DrHUik3z8JltJ9BGdGe90VKLK2XtacRxii5GTTsp
         IQvr7NnmGohPntFgSaqkug9eNVNJhPsKywzX9d9rXxna0xXCwB4Iq5b+TgNlYPvmugd/
         ADMZPICDEeW54aZe5eQz11K6ftx53YJq35bEvhvl1mdANgPdpDr3EPjfhMktz3ioBq7b
         lT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=eIcquyZ5NqBwCY99rHJF6ld01+MgU1q0xgCJiImoLXQ=;
        b=E2kA/2FI2lW6HrD/V/0LdffkI9OgpErgRG/U8KYGBAC0xfOESVZuMpg+CKHjBLIke5
         /t+Ug2FedbTK7Cco/QjZ+1ToPfQnLY5X9gzdz+ZnXcYJH0L2ei7nMOLyLXVia1kKJIZv
         BVqyr+dGYEIcTfznN5dxKhL2ykmYZJ2u7TomQ4e0U4BoKrGXG5eYjsIaETaajseGFt7b
         bZvnf09NDjcZpyuXVQI9ooqXwHakcL2Vnk3nCBHWd5Hu2NK3qbXcBwmcfEmJiWRWBfyQ
         c4uFnGMCrej4TRh4d8exW6yxlvo1MWrjOwr/dsQfgB0r/06HhZuORMCGuUZMG6geVXKb
         ztuA==
X-Gm-Message-State: AOAM533w9OX1HofN6K+wf/eXKZ+f3AQMnZnNR9n2k+vKfMLMdF+RRH3L
        W0qY/vLA+cHabsHDmks0ynM=
X-Google-Smtp-Source: ABdhPJzhQ2JmDlTpBucrBuZU97cMEH6YOoBvAzRGBWT4L5EMEjgUR4jAF7dRAMIJk4EifERbZYGOtA==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr10863236wrw.183.1613766347645;
        Fri, 19 Feb 2021 12:25:47 -0800 (PST)
Received: from [192.168.1.148] ([31.127.148.152])
        by smtp.gmail.com with ESMTPSA id t2sm13484985wru.53.2021.02.19.12.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 12:25:47 -0800 (PST)
To:     linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com
From:   Raphael Djondo <raphael.djondo.cavpoint@gmail.com>
Subject: Kernel panics in i2c_dw_isr and possible fix
Message-ID: <3c53714b-72a7-6725-9821-38869410c371@gmail.com>
Date:   Fri, 19 Feb 2021 20:25:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all on the SYNOPSYS DESIGNWARE I2C DRIVER list,


I run  Ubuntu 20.04.2 LTS Linux on a DELL Alienware Aurora R7.

On shutdown, the kernel panics, with something the following panic message (omitting timestamps):


 [ 221.9 ] : RIP:  [] i2c_dw_isr.cold+0x262/0x5ac 

 [ 221.9 ] : Kernel panic - not syncing : Fatal Exception in interrupt 


For Linux kernel hwe-5.8-5.8.0-43.49 (tag origin/hwe-5.8) cloned from the the mainline long term support Kernel from Ubuntu at git://kernel.ubuntu.com/ubuntu/ubuntu-focal.git, I was able to trace the problem to a l NULL pointer dereference; IP at i2c_dw_isr.cold+0x262/0x5ac which corresponds to line 274 of drivers/i2c/busses/i2c-designware-master.c [git commit 0daede80f8700]: 

In function i2c_dw_xfer_msg(): u32 addr = msgs[dev->msg_write_idx].addr;

 


Other people suffering from the issue

Similar crashes reported for the same driver:

https://bugzilla.kernel.org/show_bug.cgi?id=205225


I have documented here some links of other people who have continued to suffer from this bug.

https://www.reddit.com/r/Fedora/comments/gclczy/fedora_32_kernel_panic/

https://unix.stackexchange.com/a/446913/52937

https://bbs.archlinux.org/viewtopic.php?id=254334

https://bbs.archlinux.org/viewtopic.php?id=224521

https://helloworldproject.blogspot.com/2016/11/installing-ubuntu-1610-on-alienware.html



Suggested fix

Using printk functions, I can see that the pointer (i2c_msg

*) dev->msgs  points to NULL.

Testing whether the msg is NULL have proven to fix the issue on my machine for the last couple of weeks.



Add Linux hardware configuration


  *

    Processor info

$ cat /proc/cpuinfo

processor    : 0

vendor_id    : GenuineIntel

cpu family    : 6

model       : 94

model name    : Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz


  *

    Modules

$ cat /proc/modules

rfcomm 81920 4 - Live 0x0000000000000000

xt_conntrack 16384 1 - Live 0x0000000000000000

xt_MASQUERADE 20480 1 - Live 0x0000000000000000

nf_conntrack_netlink 49152 0 - Live 0x0000000000000000

nfnetlink 16384 2 nf_conntrack_netlink, Live 0x0000000000000000

xfrm_user 36864 1 - Live 0x0000000000000000

xfrm_algo 16384 1 xfrm_user, Live 0x0000000000000000

xt_addrtype 16384 2 - Live 0x0000000000000000

iptable_filter 16384 1 - Live 0x0000000000000000

iptable_nat 16384 1 - Live 0x0000000000000000

nf_nat 45056 2 xt_MASQUERADE,iptable_nat, Live 0x0000000000000000

nf_conntrack 147456 4 xt_conntrack,xt_MASQUERADE,nf_conntrack_netlink,nf_nat, Live 0x0000000000000000

nf_defrag_ipv6 24576 1 nf_conntrack, Live 0x0000000000000000

nf_defrag_ipv4 16384 1 nf_conntrack, Live 0x0000000000000000

libcrc32c 16384 2 nf_nat,nf_conntrack, Live 0x0000000000000000

bpfilter 884736 0 - Live 0x0000000000000000

br_netfilter 28672 0 - Live 0x0000000000000000

bridge 192512 1 br_netfilter, Live 0x0000000000000000

stp 16384 1 bridge, Live 0x0000000000000000

llc 16384 2 bridge,stp, Live 0x0000000000000000

aufs 258048 0 - Live 0x0000000000000000

vboxnetadp 28672 0 - Live 0x0000000000000000 (OE)

vboxnetflt 28672 0 - Live 0x0000000000000000 (OE)

vboxdrv 516096 2 vboxnetadp,vboxnetflt, Live 0x0000000000000000 (OE)

cmac 16384 2 - Live 0x0000000000000000

algif_hash 16384 1 - Live 0x0000000000000000

algif_skcipher 16384 1 - Live 0x0000000000000000

af_alg 28672 6 algif_hash,algif_skcipher, Live 0x0000000000000000

bnep 24576 2 - Live 0x0000000000000000

overlay 118784 0 - Live 0x0000000000000000

binfmt_misc 24576 1 - Live 0x0000000000000000

nls_iso8859_1 16384 1 - Live 0x0000000000000000

intel_rapl_msr 20480 0 - Live 0x0000000000000000

intel_rapl_common 28672 1 intel_rapl_msr, Live 0x0000000000000000

x86_pkg_temp_thermal 20480 0 - Live 0x0000000000000000

intel_powerclamp 20480 0 - Live 0x0000000000000000

coretemp 20480 0 - Live 0x0000000000000000

kvm_intel 286720 0 - Live 0x0000000000000000

kvm 712704 1 kvm_intel, Live 0x0000000000000000

crct10dif_pclmul 16384 1 - Live 0x0000000000000000

ghash_clmulni_intel 16384 0 - Live 0x0000000000000000

nvidia_uvm 1011712 0 - Live 0x0000000000000000 (OE)

aesni_intel 372736 3 - Live 0x0000000000000000

snd_hda_codec_realtek 126976 1 - Live 0x0000000000000000

crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000

nvidia_drm 49152 9 - Live 0x0000000000000000 (POE)

cryptd 24576 3 ghash_clmulni_intel,crypto_simd, Live 0x0000000000000000

snd_hda_codec_generic 81920 1 snd_hda_codec_realtek, Live 0x0000000000000000

nvidia_modeset 1183744 11 nvidia_drm, Live 0x0000000000000000 (POE)

ledtrig_audio 16384 1 snd_hda_codec_generic, Live 0x0000000000000000

glue_helper 16384 1 aesni_intel, Live 0x0000000000000000

rapl 20480 0 - Live 0x0000000000000000

intel_cstate 20480 0 - Live 0x0000000000000000

mei_hdcp 24576 0 - Live 0x0000000000000000

nvidia 19746816 448 nvidia_uvm,nvidia_modeset, Live 0x0000000000000000 (POE)

snd_hda_codec_hdmi 61440 2 - Live 0x0000000000000000

snd_hda_intel 53248 8 - Live 0x0000000000000000

snd_intel_dspcfg 24576 1 snd_hda_intel, Live 0x0000000000000000

snd_hda_codec 139264 4 snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel, Live 0x0000000000000000

snd_hda_core 94208 5 snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec, Live 0x0000000000000000

snd_hwdep 20480 1 snd_hda_codec, Live 0x0000000000000000

btusb 57344 0 - Live 0x0000000000000000

iwlmvm 393216 0 - Live 0x0000000000000000

i915 2195456 5 - Live 0x0000000000000000

snd_pcm 114688 5 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_core, Live 0x0000000000000000

btrtl 24576 1 btusb, Live 0x0000000000000000

btbcm 16384 1 btusb, Live 0x0000000000000000

mac80211 905216 1 iwlmvm, Live 0x0000000000000000

snd_seq_midi 20480 0 - Live 0x0000000000000000

btintel 28672 1 btusb, Live 0x0000000000000000

snd_seq_midi_event 16384 1 snd_seq_midi, Live 0x0000000000000000

libarc4 16384 1 mac80211, Live 0x0000000000000000

drm_kms_helper 217088 2 nvidia_drm,i915, Live 0x0000000000000000

snd_rawmidi 36864 1 snd_seq_midi, Live 0x0000000000000000

bluetooth 577536 31 rfcomm,bnep,btusb,btrtl,btbcm,btintel, Live 0x0000000000000000

snd_seq 69632 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000

input_leds 16384 0 - Live 0x0000000000000000

dell_wmi 20480 0 - Live 0x0000000000000000

cec 53248 2 i915,drm_kms_helper, Live 0x0000000000000000

ecdh_generic 16384 1 bluetooth, Live 0x0000000000000000

iwlwifi 352256 1 iwlmvm, Live 0x0000000000000000

ecc 32768 1 ecdh_generic, Live 0x0000000000000000

dell_smbios 28672 1 dell_wmi, Live 0x0000000000000000

rc_core 57344 1 cec, Live 0x0000000000000000

alienware_wmi 20480 0 - Live 0x0000000000000000

i2c_algo_bit 16384 1 i915, Live 0x0000000000000000

snd_seq_device 16384 3 snd_seq_midi,snd_rawmidi,snd_seq, Live 0x0000000000000000

efi_pstore 16384 0 - Live 0x0000000000000000

dcdbas 20480 1 dell_smbios, Live 0x0000000000000000

snd_timer 40960 2 snd_pcm,snd_seq, Live 0x0000000000000000

fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000

syscopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000

sysfillrect 16384 1 drm_kms_helper, Live 0x0000000000000000

sparse_keymap 16384 1 dell_wmi, Live 0x0000000000000000

cfg80211 778240 3 iwlmvm,mac80211,iwlwifi, Live 0x0000000000000000

dell_wmi_descriptor 20480 2 dell_wmi,dell_smbios, Live 0x0000000000000000

wmi_bmof 16384 0 - Live 0x0000000000000000

sysimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000

8250_dw 16384 0 - Live 0x0000000000000000

snd 94208 26 snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_seq_device,snd_timer, Live 0x0000000000000000

mei_me 40960 1 - Live 0x0000000000000000

ee1004 20480 0 - Live 0x0000000000000000

intel_wmi_thunderbolt 20480 0 - Live 0x0000000000000000

soundcore 16384 1 snd, Live 0x0000000000000000

mei 106496 3 mei_hdcp,mei_me, Live 0x0000000000000000

mxm_wmi 16384 0 - Live 0x0000000000000000

mac_hid 16384 0 - Live 0x0000000000000000

acpi_pad 184320 0 - Live 0x0000000000000000

sch_fq_codel 20480 5 - Live 0x0000000000000000

parport_pc 45056 0 - Live 0x0000000000000000

ppdev 24576 0 - Live 0x0000000000000000

lp 20480 0 - Live 0x0000000000000000

parport 65536 3 parport_pc,ppdev,lp, Live 0x0000000000000000

drm 552960 13 nvidia_drm,i915,drm_kms_helper, Live 0x0000000000000000

ip_tables 32768 2 iptable_filter,iptable_nat, Live 0x0000000000000000

x_tables 45056 5 xt_conntrack,xt_MASQUERADE,xt_addrtype,iptable_filter,ip_tables, Live 0x0000000000000000

autofs4 45056 2 - Live 0x0000000000000000

hid_generic 16384 0 - Live 0x0000000000000000

usbhid 57344 0 - Live 0x0000000000000000

hid 135168 2 hid_generic,usbhid, Live 0x0000000000000000

crc32_pclmul 16384 0 - Live 0x0000000000000000

i2c_i801 32768 0 - Live 0x0000000000000000

i2c_smbus 20480 1 i2c_i801, Live 0x0000000000000000

alx 49152 0 - Live 0x0000000000000000

mdio 16384 1 alx, Live 0x0000000000000000

nvme 45056 2 - Live 0x0000000000000000

intel_lpss_pci 20480 0 - Live 0x0000000000000000

ahci 40960 4 - Live 0x0000000000000000

nvme_core 110592 4 nvme, Live 0x0000000000000000

intel_lpss 16384 1 intel_lpss_pci, Live 0x0000000000000000

idma64 20480 0 - Live 0x0000000000000000

xhci_pci 20480 0 - Live 0x0000000000000000

libahci 36864 1 ahci, Live 0x0000000000000000

virt_dma 20480 1 idma64, Live 0x0000000000000000

xhci_pci_renesas 20480 1 xhci_pci, Live 0x0000000000000000

wmi 32768 7 dell_wmi,dell_smbios,alienware_wmi,dell_wmi_descriptor,wmi_bmof,intel_wmi_thunderbolt,mxm_wmi, Live 0x0000000000000000

video 49152 2 i915,dell_wmi, Live 0x0000000000000000

pinctrl_sunrisepoint 28672 0 - Live 0x0000000000000000

pinctrl_intel 28672 1 pinctrl_sunrisepoint, Live 0x0000000000000000



  *

    IO ports

cat /proc/ioports

0000-0000 : PCI Bus 0000:00

  0000-0000 : dma1

  0000-0000 : pic1

  0000-0000 : timer0

  0000-0000 : timer1

  0000-0000 : keyboard

  0000-0000 : keyboard

  0000-0000 : rtc0

  0000-0000 : dma page reg

  0000-0000 : pic2

  0000-0000 : dma2

  0000-0000 : fpu

    0000-0000 : PNP0C04:00

  0000-0000 : serial

  0000-0000 : iTCO_wdt

  0000-0000 : pnp 00:02

  0000-0000 : pnp 00:03

  0000-0000 : pnp 00:00

  0000-0000 : pnp 00:00

0000-0000 : PCI conf1

0000-0000 : PCI Bus 0000:00

  0000-0000 : pnp 00:02

  0000-0000 : pnp 00:02

    0000-0000 : ACPI PM1a_EVT_BLK

    0000-0000 : ACPI PM1a_CNT_BLK

    0000-0000 : ACPI PM_TMR

    0000-0000 : ACPI PM2_CNT_BLK

    0000-0000 : pnp 00:05

    0000-0000 : ACPI GPE0_BLK

  0000-0000 : PCI Bus 0000:05

    0000-0000 : 0000:05:00.0

  0000-0000 : PCI Bus 0000:02

    0000-0000 : 0000:02:00.0

  0000-0000 : PCI Bus 0000:01

    0000-0000 : 0000:01:00.0

  0000-0000 : 0000:00:02.0

  0000-0000 : 0000:00:1f.4

    0000-0000 : i801_smbus

  0000-0000 : 0000:00:17.0

    0000-0000 : ahci

  0000-0000 : 0000:00:17.0

    0000-0000 : ahci

  0000-0000 : 0000:00:17.0

    0000-0000 : ahci

  0000-0000 : pnp 00:08

  0000-0000 : pnp 00:02

    0000-0000 : pnp 00:02

      0000-0000 : pnp 00:02



  *

    IO mem

cat /proc/iomem

00000000-00000000 : Reserved

00000000-00000000 : System RAM

00000000-00000000 : Reserved

00000000-00000000 : System RAM

00000000-00000000 : Reserved

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

00000000-00000000 : PCI Bus 0000:00

  00000000-00000000 : System ROM

00000000-00000000 : System RAM

  00000000-00000000 : Crash kernel

00000000-00000000 : System RAM

00000000-00000000 : System RAM

00000000-00000000 : System RAM

00000000-00000000 : System RAM

00000000-00000000 : ACPI Non-volatile Storage

00000000-00000000 : Reserved

00000000-00000000 : System RAM

00000000-00000000 : Reserved

00000000-00000000 : System RAM

00000000-00000000 : Reserved

00000000-00000000 : ACPI Tables

00000000-00000000 : ACPI Non-volatile Storage

00000000-00000000 : Reserved

00000000-00000000 : System RAM

00000000-00000000 : RAM buffer

00000000-00000000 : Reserved

00000000-00000000 : RAM buffer

00000000-00000000 : Reserved

  00000000-00000000 : Graphics Stolen Memory

00000000-00000000 : PCI Bus 0000:00

  00000000-00000000 : 0000:00:02.0

  00000000-00000000 : PCI Bus 0000:01

    00000000-00000000 : 0000:01:00.0

    00000000-00000000 : 0000:01:00.0

  00000000-00000000 : 0000:00:02.0

  00000000-00000000 : PCI Bus 0000:01

    00000000-00000000 : 0000:01:00.0

      00000000-00000000 : nvidia

    00000000-00000000 : 0000:01:00.0

    00000000-00000000 : 0000:01:00.1

      00000000-00000000 : ICH HD audio

  00000000-00000000 : PCI Bus 0000:05

    00000000-00000000 : 0000:05:00.0

      00000000-00000000 : alx

  00000000-00000000 : PCI Bus 0000:04

    00000000-00000000 : 0000:04:00.0

      00000000-00000000 : iwlwifi

  00000000-00000000 : PCI Bus 0000:03

    00000000-00000000 : 0000:03:00.0

      00000000-00000000 : xhci-hcd

  00000000-00000000 : PCI Bus 0000:02

    00000000-00000000 : 0000:02:00.0

      00000000-00000000 : nvme

  00000000-00000000 : 0000:00:1f.3

    00000000-00000000 : ICH HD audio

  00000000-00000000 : 0000:00:14.0

    00000000-00000000 : xhci-hcd

  00000000-00000000 : 0000:00:1f.3

    00000000-00000000 : ICH HD audio

  00000000-00000000 : 0000:00:1f.2

  00000000-00000000 : 0000:00:17.0

    00000000-00000000 : ahci

  00000000-00000000 : 0000:00:1f.4

  00000000-00000000 : 0000:00:1e.0

    00000000-00000000 : lpss_dev

      00000000-00000000 : serial

    00000000-00000000 : lpss_priv

    00000000-00000000 : idma64.2

      00000000-00000000 : idma64.2 idma64.2

  00000000-00000000 : 0000:00:17.0

    00000000-00000000 : ahci

  00000000-00000000 : 0000:00:17.0

    00000000-00000000 : ahci

  00000000-00000000 : 0000:00:16.0

    00000000-00000000 : mei_me

  00000000-00000000 : 0000:00:15.1

    00000000-00000000 : lpss_dev

      00000000-00000000 : i2c_designware.1 lpss_dev

    00000000-00000000 : lpss_priv

    00000000-00000000 : idma64.1

      00000000-00000000 : idma64.1 idma64.1

  00000000-00000000 : 0000:00:15.0

    00000000-00000000 : lpss_dev

      00000000-00000000 : i2c_designware.0 lpss_dev

    00000000-00000000 : lpss_priv

    00000000-00000000 : idma64.0

      00000000-00000000 : idma64.0 idma64.0

  00000000-00000000 : pnp 00:06

00000000-00000000 : PCI MMCONFIG 0000 [bus 00-ff]

  00000000-00000000 : Reserved

    00000000-00000000 : pnp 00:06

00000000-00000000 : PCI Bus 0000:00

  00000000-00000000 : pnp 00:07

  00000000-00000000 : INT345D:00

    00000000-00000000 : INT345D:00 INT345D:00

  00000000-00000000 : pnp 00:07

  00000000-00000000 : INT345D:00

    00000000-00000000 : INT345D:00 INT345D:00

  00000000-00000000 : INT345D:00

    00000000-00000000 : INT345D:00 INT345D:00

  00000000-00000000 : pnp 00:07

    00000000-00000000 : iTCO_wdt

  00000000-00000000 : Reserved

  00000000-00000000 : pnp 00:07

  00000000-00000000 : pnp 00:07

  00000000-00000000 : pnp 00:07

00000000-00000000 : Reserved

  00000000-00000000 : IOAPIC 0

00000000-00000000 : HPET 0

  00000000-00000000 : PNP0103:00

00000000-00000000 : pnp 00:06

00000000-00000000 : pnp 00:06

00000000-00000000 : pnp 00:06

00000000-00000000 : pnp 00:06

00000000-00000000 : MSFT0101:00

  00000000-00000000 : MSFT0101:00

00000000-00000000 : pnp 00:06

00000000-00000000 : dmar0

00000000-00000000 : dmar1

00000000-00000000 : Local APIC

  00000000-00000000 : Reserved

00000000-00000000 : Reserved

  00000000-00000000 : INT0800:00

    00000000-00000000 : pnp 00:06

00000000-00000000 : System RAM

  00000000-00000000 : Kernel code

  00000000-00000000 : Kernel rodata

  00000000-00000000 : Kernel data

  00000000-00000000 : Kernel bss

00000000-00000000 : RAM buffer





  *

    PCI Info

00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers (rev 07)

    Subsystem: Dell Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ >SERR- <PERR- INTx-

    Latency: 0

    Capabilities: [e0] Vendor Specific Information: Len=10 <?>

    Kernel driver in use: skl_uncore


00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16) (rev 07) (prog-if 00 [Normal decode])

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 122

    Bus: primary=00, secondary=01, subordinate=01, sec-latency=0

    I/O behind bridge: 0000e000-0000efff [size=4K]

    Memory behind bridge: de000000-df0fffff [size=17M]

    Prefetchable memory behind bridge: 00000000c0000000-00000000d1ffffff [size=288M]

    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-

    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-

       PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

    Capabilities: [88] Subsystem: Dell Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16)

    Capabilities: [80] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-

       Address: fee00238  Data: 0000

    Capabilities: [a0] Express (v2) Root Port (Slot+), MSI 00

       DevCap:    MaxPayload 256 bytes, PhantFunc 0

           ExtTag- RBE+

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

           MaxPayload 256 bytes, MaxReadReq 128 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-

       LnkCap:    Port #2, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <256ns, L1 <8us

           ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+

       LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 8GT/s (ok), Width x8 (downgraded)

           TrErr- Train- SlotClk+ DLActive- BWMgmt+ ABWMgmt+

       SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-

           Slot #1, PowerLimit 75.000W; Interlock- NoCompl+

       SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-

           Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-

       SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-

           Changed: MRL- PresDet+ LinkState-

       RootCap: CRSVisible-

       RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-

       RootSta: PME ReqID 0000, PMEStatus- PMEPending-

       DevCap2: Completion Timeout: Not Supported, TimeoutDis-, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Via WAKE#, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, LN System CLS Not Supported, TPHComp-, ExtTPHComp-, ARIFwd-

             AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS+

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Via WAKE# ARIFwd-

             AtomicOpsCtl: ReqEn- EgressBlck-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+, EqualizationPhase1+

             EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-

    Capabilities: [100 v1] Virtual Channel

       Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1

       Arb:    Fixed- WRR32- WRR64- WRR128-

       Ctrl:    ArbSelect=Fixed

       Status:    InProgress-

       VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-

           Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-

           Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff

           Status:    NegoPending- InProgress-

    Capabilities: [140 v1] Root Complex Link

       Desc:    PortNumber=02 ComponentID=01 EltType=Config

       Link0:    Desc:    TargetPort=00 TargetComponent=01 AssocRCRB- LinkType=MemMapped LinkValid+

           Addr:    00000000fed19000

    Capabilities: [d94 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Kernel driver in use: pcieport


00:02.0 VGA compatible controller: Intel Corporation HD Graphics 530 (rev 06) (prog-if 00 [VGA controller])

    Subsystem: Dell HD Graphics 530

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 148

    Region 0: Memory at dd000000 (64-bit, non-prefetchable) [size=16M]

    Region 2: Memory at b0000000 (64-bit, prefetchable) [size=256M]

    Region 4: I/O ports at f000 [size=64]

    Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]

    Capabilities: [40] Vendor Specific Information: Len=0c <?>

    Capabilities: [70] Express (v2) Root Complex Integrated Endpoint, MSI 00

       DevCap:    MaxPayload 128 bytes, PhantFunc 0

           ExtTag- RBE+ FLReset+

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-

           MaxPayload 128 bytes, MaxReadReq 128 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-

       DevCap2: Completion Timeout: Not Supported, TimeoutDis-, NROPrPrP-, LTR-

             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-

             AtomicOpsCap: 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled

             AtomicOpsCtl: ReqEn-

    Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-

       Address: fee00018  Data: 0000

    Capabilities: [d0] Power Management version 2

       Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

       Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [100 v1] Process Address Space ID (PASID)

       PASIDCap: Exec+ Priv-, Max PASID Width: 14

       PASIDCtl: Enable- Exec- Priv-

    Capabilities: [200 v1] Address Translation Service (ATS)

       ATSCap:    Invalidate Queue Depth: 00

       ATSCtl:    Enable-, Smallest Translation Unit: 00

    Capabilities: [300 v1] Page Request Interface (PRI)

       PRICtl: Enable- Reset-

       PRISta: RF- UPRGI- Stopped-

       Page Request Capacity: 00008000, Page Request Allocation: 00000000

    Kernel driver in use: i915

    Kernel modules: i915


00:14.0 USB controller: Intel Corporation 100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller (rev 31) (prog-if 30 [XHCI])

    Subsystem: Dell 100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 129

    Region 0: Memory at df510000 (64-bit, non-prefetchable) [size=64K]

    Capabilities: [70] Power Management version 2

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0-,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+

       Address: 00000000fee00358  Data: 0000

    Kernel driver in use: xhci_hcd

    Kernel modules: xhci_pci


00:15.0 Signal processing controller: Intel Corporation 100 Series/C230 Series Chipset Family Serial IO I2C Controller #0 (rev 31)

    Subsystem: Dell 100 Series/C230 Series Chipset Family Serial IO I2C Controller

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0, Cache Line Size: 64 bytes

    Interrupt: pin A routed to IRQ 16

    Region 0: Memory at df530000 (64-bit, non-prefetchable) [size=4K]

    Capabilities: [80] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

       Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [90] Vendor Specific Information: Len=14 <?>

    Kernel driver in use: intel-lpss

    Kernel modules: intel_lpss_pci


00:15.1 Signal processing controller: Intel Corporation 100 Series/C230 Series Chipset Family Serial IO I2C Controller #1 (rev 31)

    Subsystem: Dell 100 Series/C230 Series Chipset Family Serial IO I2C Controller

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0, Cache Line Size: 64 bytes

    Interrupt: pin B routed to IRQ 17

    Region 0: Memory at df52f000 (64-bit, non-prefetchable) [size=4K]

    Capabilities: [80] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

       Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [90] Vendor Specific Information: Len=14 <?>

    Kernel driver in use: intel-lpss

    Kernel modules: intel_lpss_pci


00:16.0 Communication controller: Intel Corporation 100 Series/C230 Series Chipset Family MEI Controller #1 (rev 31)

    Subsystem: Dell 100 Series/C230 Series Chipset Family MEI Controller

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 146

    Region 0: Memory at df52e000 (64-bit, non-prefetchable) [size=4K]

    Capabilities: [50] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot+,D3cold-)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+

       Address: 00000000fee00598  Data: 0000

    Kernel driver in use: mei_me

    Kernel modules: mei_me


00:17.0 SATA controller: Intel Corporation Q170/Q150/B150/H170/H110/Z170/CM236 Chipset SATA Controller [AHCI Mode] (rev 31) (prog-if 01 [AHCI 1.0])

    Subsystem: Dell Q170/Q150/B150/H170/H110/Z170/CM236 Chipset SATA Controller [AHCI Mode]

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 127

    Region 0: Memory at df528000 (32-bit, non-prefetchable) [size=8K]

    Region 1: Memory at df52d000 (32-bit, non-prefetchable) [size=256]

    Region 2: I/O ports at f090 [size=8]

    Region 3: I/O ports at f080 [size=4]

    Region 4: I/O ports at f060 [size=32]

    Region 5: Memory at df52c000 (32-bit, non-prefetchable) [size=2K]

    Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-

       Address: fee00318  Data: 0000

    Capabilities: [70] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot+,D3cold-)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004

    Kernel driver in use: ahci

    Kernel modules: ahci


00:1b.0 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #17 (rev f1) (prog-if 00 [Normal decode])

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 123

    Bus: primary=00, secondary=02, subordinate=02, sec-latency=0

    I/O behind bridge: 0000d000-0000dfff [size=4K]

    Memory behind bridge: df400000-df4fffff [size=1M]

    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled]

    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-

    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-

       PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

    Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00

       DevCap:    MaxPayload 256 bytes, PhantFunc 0

           ExtTag- RBE+

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

           MaxPayload 128 bytes, MaxReadReq 128 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #17, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <16us

           ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+

       LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 8GT/s (ok), Width x4 (ok)

           TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-

       SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-

           Slot #20, PowerLimit 25.000W; Interlock- NoCompl+

       SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-

           Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-

       SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-

           Changed: MRL- PresDet- LinkState+

       RootCap: CRSVisible-

       RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-

       RootSta: PME ReqID 0000, PMEStatus- PMEPending-

       DevCap2: Completion Timeout: Range ABC, TimeoutDis+, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, LN System CLS Not Supported, TPHComp-, ExtTPHComp-, ARIFwd+

             AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled ARIFwd-

             AtomicOpsCtl: ReqEn- EgressBlck-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+, EqualizationPhase1+

             EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-

    Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-

       Address: fee00258  Data: 0000

    Capabilities: [90] Subsystem: Dell 100 Series/C230 Series Chipset Family PCI Express Root Port

    Capabilities: [a0] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [100 v1] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover+ Timeout+ AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

       RootCmd: CERptEn- NFERptEn- FERptEn-

       RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-

             FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0

       ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000

    Capabilities: [140 v1] Access Control Services

       ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-

       ACSCtl:    SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-

    Capabilities: [220 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Kernel driver in use: pcieport


00:1c.0 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #2 (rev f1) (prog-if 00 [Normal decode])

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin B routed to IRQ 124

    Bus: primary=00, secondary=03, subordinate=03, sec-latency=0

    I/O behind bridge: 0000f000-00000fff [disabled]

    Memory behind bridge: df300000-df3fffff [size=1M]

    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled]

    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-

    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-

       PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

    Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00

       DevCap:    MaxPayload 256 bytes, PhantFunc 0

           ExtTag- RBE+

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

           MaxPayload 256 bytes, MaxReadReq 128 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #2, Speed 8GT/s, Width x1, ASPM not supported

           ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+

       LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 8GT/s (ok), Width x1 (ok)

           TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-

       SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-

           Slot #5, PowerLimit 10.000W; Interlock- NoCompl+

       SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-

           Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-

       SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-

           Changed: MRL- PresDet- LinkState+

       RootCap: CRSVisible-

       RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-

       RootSta: PME ReqID 0000, PMEStatus- PMEPending-

       DevCap2: Completion Timeout: Range ABC, TimeoutDis+, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, LN System CLS Not Supported, TPHComp-, ExtTPHComp-, ARIFwd+

             AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled ARIFwd-

             AtomicOpsCtl: ReqEn- EgressBlck-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+, EqualizationPhase1+

             EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-

    Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-

       Address: fee00278  Data: 0000

    Capabilities: [90] Subsystem: Dell 100 Series/C230 Series Chipset Family PCI Express Root Port

    Capabilities: [a0] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [100 v1] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

       RootCmd: CERptEn- NFERptEn- FERptEn-

       RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-

             FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0

       ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000

    Capabilities: [140 v1] Access Control Services

       ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-

       ACSCtl:    SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-

    Capabilities: [220 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Kernel driver in use: pcieport


00:1c.2 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #3 (rev f1) (prog-if 00 [Normal decode])

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin C routed to IRQ 125

    Bus: primary=00, secondary=04, subordinate=04, sec-latency=0

    I/O behind bridge: 0000f000-00000fff [disabled]

    Memory behind bridge: df200000-df2fffff [size=1M]

    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled]

    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-

    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-

       PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

    Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00

       DevCap:    MaxPayload 256 bytes, PhantFunc 0

           ExtTag- RBE+

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

           MaxPayload 128 bytes, MaxReadReq 128 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #3, Speed 8GT/s, Width x1, ASPM L1, Exit Latency L1 <16us

           ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+

       LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 2.5GT/s (downgraded), Width x1 (ok)

           TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-

       SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-

           Slot #6, PowerLimit 10.000W; Interlock- NoCompl+

       SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-

           Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-

       SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-

           Changed: MRL- PresDet- LinkState+

       RootCap: CRSVisible-

       RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-

       RootSta: PME ReqID 0000, PMEStatus- PMEPending-

       DevCap2: Completion Timeout: Range ABC, TimeoutDis+, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, LN System CLS Not Supported, TPHComp-, ExtTPHComp-, ARIFwd+

             AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled ARIFwd-

             AtomicOpsCtl: ReqEn- EgressBlck-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, EqualizationPhase1-

             EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-

    Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-

       Address: fee002b8  Data: 0000

    Capabilities: [90] Subsystem: Dell 100 Series/C230 Series Chipset Family PCI Express Root Port

    Capabilities: [a0] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [100 v1] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

       RootCmd: CERptEn- NFERptEn- FERptEn-

       RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-

             FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0

       ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000

    Capabilities: [140 v1] Access Control Services

       ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-

       ACSCtl:    SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-

    Capabilities: [220 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Kernel driver in use: pcieport


00:1c.3 PCI bridge: Intel Corporation 100 Series/C230 Series Chipset Family PCI Express Root Port #4 (rev f1) (prog-if 00 [Normal decode])

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin D routed to IRQ 126

    Bus: primary=00, secondary=05, subordinate=05, sec-latency=0

    I/O behind bridge: 0000c000-0000cfff [size=4K]

    Memory behind bridge: df100000-df1fffff [size=1M]

    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled]

    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-

    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-

       PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

    Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00

       DevCap:    MaxPayload 256 bytes, PhantFunc 0

           ExtTag- RBE+

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

           MaxPayload 256 bytes, MaxReadReq 128 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #4, Speed 8GT/s, Width x1, ASPM not supported

           ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+

       LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 2.5GT/s (downgraded), Width x1 (ok)

           TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-

       SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-

           Slot #7, PowerLimit 10.000W; Interlock- NoCompl+

       SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-

           Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-

       SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-

           Changed: MRL- PresDet- LinkState+

       RootCap: CRSVisible-

       RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-

       RootSta: PME ReqID 0000, PMEStatus- PMEPending-

       DevCap2: Completion Timeout: Range ABC, TimeoutDis+, NROPrPrP-, LTR-

             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, LN System CLS Not Supported, TPHComp-, ExtTPHComp-, ARIFwd+

             AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-

             AtomicOpsCtl: ReqEn- EgressBlck-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, EqualizationPhase1-

             EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-

    Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-

       Address: fee002f8  Data: 0000

    Capabilities: [90] Subsystem: Dell 100 Series/C230 Series Chipset Family PCI Express Root Port

    Capabilities: [a0] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [100 v1] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

       RootCmd: CERptEn- NFERptEn- FERptEn-

       RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-

             FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0

       ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000

    Capabilities: [140 v1] Access Control Services

       ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-

       ACSCtl:    SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-

    Capabilities: [220 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Kernel driver in use: pcieport


00:1e.0 Signal processing controller: Intel Corporation 100 Series/C230 Series Chipset Family Serial IO UART #0 (rev 31)

    Subsystem: Dell 100 Series/C230 Series Chipset Family Serial IO UART

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0, Cache Line Size: 64 bytes

    Interrupt: pin A routed to IRQ 20

    Region 0: Memory at df52b000 (64-bit, non-prefetchable) [size=4K]

    Capabilities: [80] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

       Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [90] Vendor Specific Information: Len=14 <?>

    Kernel driver in use: intel-lpss

    Kernel modules: intel_lpss_pci


00:1f.0 ISA bridge: Intel Corporation Z170 Chipset LPC/eSPI Controller (rev 31)

    Subsystem: Dell Z170 Chipset LPC/eSPI Controller

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0


00:1f.2 Memory controller: Intel Corporation 100 Series/C230 Series Chipset Family Power Management Controller (rev 31)

    Subsystem: Dell 100 Series/C230 Series Chipset Family Power Management Controller

    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Region 0: Memory at df524000 (32-bit, non-prefetchable) [disabled] [size=16K]


00:1f.3 Audio device: Intel Corporation 100 Series/C230 Series Chipset Family HD Audio Controller (rev 31)

    Subsystem: Dell 100 Series/C230 Series Chipset Family HD Audio Controller

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 32

    Interrupt: pin A routed to IRQ 149

    Region 0: Memory at df520000 (64-bit, non-prefetchable) [size=16K]

    Region 4: Memory at df500000 (64-bit, non-prefetchable) [size=64K]

    Capabilities: [50] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0-,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+

       Address: 00000000fee005d8  Data: 0000

    Kernel driver in use: snd_hda_intel

    Kernel modules: snd_hda_intel


00:1f.4 SMBus: Intel Corporation 100 Series/C230 Series Chipset Family SMBus (rev 31)

    Subsystem: Dell 100 Series/C230 Series Chipset Family SMBus

    Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Interrupt: pin A routed to IRQ 16

    Region 0: Memory at df52a000 (64-bit, non-prefetchable) [size=256]

    Region 4: I/O ports at f040 [size=32]

    Kernel driver in use: i801_smbus

    Kernel modules: i2c_i801


01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 1070] (rev a1) (prog-if 00 [VGA controller])

    Subsystem: Dell GP104 [GeForce GTX 1070]

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 155

    Region 0: Memory at de000000 (32-bit, non-prefetchable) [size=16M]

    Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]

    Region 3: Memory at d0000000 (64-bit, prefetchable) [size=32M]

    Region 5: I/O ports at e000 [size=128]

    Expansion ROM at df000000 [virtual] [disabled] [size=512K]

    Capabilities: [60] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+

       Address: 00000000fee00698  Data: 0000

    Capabilities: [78] Express (v2) Legacy Endpoint, MSI 00

       DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us

           ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-

           MaxPayload 256 bytes, MaxReadReq 512 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-

       LnkCap:    Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <1us, L1 <4us

           ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+

       LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 8GT/s (ok), Width x8 (downgraded)

           TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

       DevCap2: Completion Timeout: Range AB, TimeoutDis+, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Via message, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-

             AtomicOpsCap: 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled

             AtomicOpsCtl: ReqEn-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+, EqualizationPhase1+

             EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-

    Capabilities: [100 v1] Virtual Channel

       Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1

       Arb:    Fixed- WRR32- WRR64- WRR128-

       Ctrl:    ArbSelect=Fixed

       Status:    InProgress-

       VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-

           Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-

           Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff

           Status:    NegoPending- InProgress-

    Capabilities: [250 v1] Latency Tolerance Reporting

       Max snoop latency: 34326183936ns

       Max no snoop latency: 34326183936ns

    Capabilities: [128 v1] Power Budgeting <?>

    Capabilities: [420 v2] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

    Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>

    Capabilities: [900 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Kernel driver in use: nvidia

    Kernel modules: nvidiafb, nouveau, nvidia_drm, nvidia


01:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Controller (rev a1)

    Subsystem: Dell GP104 High Definition Audio Controller

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin B routed to IRQ 17

    Region 0: Memory at df080000 (32-bit, non-prefetchable) [size=16K]

    Capabilities: [60] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

       Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+

       Address: 0000000000000000  Data: 0000

    Capabilities: [78] Express (v2) Endpoint, MSI 00

       DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us

           ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 75.000W

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+

           MaxPayload 256 bytes, MaxReadReq 512 bytes

       DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-

       LnkCap:    Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <1us, L1 <4us

           ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+

       LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 8GT/s (ok), Width x8 (downgraded)

           TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

       DevCap2: Completion Timeout: Range AB, TimeoutDis+, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Via message, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, TPHComp-, ExtTPHComp-

             AtomicOpsCap: 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled

             AtomicOpsCtl: ReqEn-

       LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, EqualizationPhase1-

             EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-

    Capabilities: [100 v2] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

    Kernel driver in use: snd_hda_intel

    Kernel modules: snd_hda_intel


02:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM951/PM951 (rev 01) (prog-if 02 [NVM Express])

    Subsystem: Samsung Electronics Co Ltd NVMe SSD Controller SM951/PM951

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 16

    NUMA node: 0

    Region 0: Memory at df400000 (64-bit, non-prefetchable) [size=16K]

    Region 2: I/O ports at d000 [size=256]

    Capabilities: [40] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+

       Address: 0000000000000000  Data: 0000

    Capabilities: [70] Express (v2) Endpoint, MSI 00

       DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited

           ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 25.000W

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-

           MaxPayload 128 bytes, MaxReadReq 512 bytes

     �� DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us

           ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+

       LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 8GT/s (ok), Width x4 (ok)

           TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

       DevCap2: Completion Timeout: Not Supported, TimeoutDis+, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, TPHComp-, ExtTPHComp-

             AtomicOpsCap: 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled

             AtomicOpsCtl: ReqEn-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+, EqualizationPhase1+

             EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-

    Capabilities: [b0] MSI-X: Enable+ Count=9 Masked-

       Vector table: BAR=0 offset=00003000

       PBA: BAR=0 offset=00002000

    Capabilities: [100 v2] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

    Capabilities: [148 v1] Device Serial Number 00-00-00-00-00-00-00-00

    Capabilities: [158 v1] Power Budgeting <?>

    Capabilities: [168 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Capabilities: [188 v1] Latency Tolerance Reporting

       Max snoop latency: 3145728ns

       Max no snoop latency: 3145728ns

    Capabilities: [190 v1] L1 PM Substates

       L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+

             PortCommonModeRestoreTime=10us PortTPowerOnTime=10us

       L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-

               T_CommonMode=0us LTR1.2_Threshold=0ns

       L1SubCtl2: T_PwrOn=10us

    Kernel driver in use: nvme

    Kernel modules: nvme


03:00.0 USB controller: ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller (prog-if 30 [XHCI])

    Subsystem: Dell ASM1142 USB 3.1 Host Controller

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0, Cache Line Size: 64 bytes

    Interrupt: pin A routed to IRQ 17

    Region 0: Memory at df300000 (64-bit, non-prefetchable) [size=32K]

    Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+

       Address: 0000000000000000  Data: 0000

    Capabilities: [68] MSI-X: Enable+ Count=8 Masked-

       Vector table: BAR=0 offset=00002000

       PBA: BAR=0 offset=00002080

    Capabilities: [78] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0-,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [80] Express (v2) Endpoint, MSI 00

       DevCap:    MaxPayload 512 bytes, PhantFunc 0, Latency L0s <64ns, L1 <2us

           ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10.000W

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+

           MaxPayload 256 bytes, MaxReadReq 512 bytes

       DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #1, Speed 8GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <2us, L1 unlimited

           ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+

       LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 8GT/s (ok), Width x1 (downgraded)

           TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

       DevCap2: Completion Timeout: Not Supported, TimeoutDis-, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Not Supported, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, TPHComp-, ExtTPHComp-

             AtomicOpsCap: 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF Disabled

             AtomicOpsCtl: ReqEn-

       LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+, EqualizationPhase1+

             EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-

    Capabilities: [100 v1] Virtual Channel

       Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1

       Arb:    Fixed- WRR32- WRR64- WRR128-

       Ctrl:    ArbSelect=Fixed

       Status:    InProgress-

       VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-

           Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-

           Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff

           Status:    NegoPending- InProgress-

    Capabilities: [200 v1] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

    Capabilities: [280 v1] Secondary PCI Express

       LnkCtl3: LnkEquIntrruptEn-, PerformEqu-

       LaneErrStat: 0

    Capabilities: [300 v1] Latency Tolerance Reporting

       Max snoop latency: 40960ns

       Max no snoop latency: 40960ns

    Kernel driver in use: xhci_hcd

    Kernel modules: xhci_pci


04:00.0 Network controller: Intel Corporation Wireless 3165 (rev 79)

    Subsystem: Intel Corporation Wireless 3165

    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 147

    Region 0: Memory at df200000 (64-bit, non-prefetchable) [size=8K]

    Capabilities: [c8] Power Management version 3

       Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)

       Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+

       Address: 00000000fee005b8  Data: 0000

    Capabilities: [40] Express (v2) Endpoint, MSI 00

       DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 unlimited

           ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0.000W

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+ FLReset-

           MaxPayload 128 bytes, MaxReadReq 128 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L1, Exit Latency L1 <32us

           ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+

       LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)

           TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

       DevCap2: Completion Timeout: Range B, TimeoutDis+, NROPrPrP-, LTR+

             10BitTagComp-, 10BitTagReq-, OBFF Via WAKE#, ExtFmt-, EETLPPrefix-

             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-

             FRS-, TPHComp-, ExtTPHComp-

             AtomicOpsCap: 32bit- 64bit- 128bitCAS-

       DevCtl2: Completion Timeout: 16ms to 55ms, TimeoutDis-, LTR+, OBFF Disabled

             AtomicOpsCtl: ReqEn-

       LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-

             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-

             Compliance De-emphasis: -6dB

       LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, EqualizationPhase1-

             EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-

    Capabilities: [100 v1] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

    Capabilities: [140 v1] Device Serial Number 58-fb-84-ff-ff-56-a5-a4

    Capabilities: [14c v1] Latency Tolerance Reporting

       Max snoop latency: 3145728ns

       Max no snoop latency: 3145728ns

    Capabilities: [154 v1] L1 PM Substates

       L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+

             PortCommonModeRestoreTime=30us PortTPowerOnTime=60us

       L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-

               T_CommonMode=0us LTR1.2_Threshold=0ns

       L1SubCtl2: T_PwrOn=10us

    Kernel driver in use: iwlwifi

    Kernel modules: iwlwifi


05:00.0 Ethernet controller: Qualcomm Atheros Killer E2400 Gigabit Ethernet Controller (rev 10)

    Subsystem: Dell Killer E2400 Gigabit Ethernet Controller

    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

    Latency: 0

    Interrupt: pin A routed to IRQ 19

    Region 0: Memory at df100000 (64-bit, non-prefetchable) [size=256K]

    Region 2: I/O ports at c000 [size=128]

    Capabilities: [40] Power Management version 3

       Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)

       Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

    Capabilities: [58] Express (v1) Endpoint, MSI 00

       DevCap:    MaxPayload 4096 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited

           ExtTag- AttnBtn+ AttnInd+ PwrInd+ RBE+ FLReset- SlotPowerLimit 10.000W

       DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-

           RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-

           MaxPayload 256 bytes, MaxReadReq 512 bytes

       DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-

       LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s unlimited, L1 unlimited

           ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-

       LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+

           ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-

       LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)

           TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

    Capabilities: [c0] MSI: Enable- Count=1/16 Maskable+ 64bit+

       Address: 0000000000000000  Data: 0000

       Masking: 00000000  Pending: 00000000

    Capabilities: [d8] MSI-X: Enable+ Count=16 Masked-

       Vector table: BAR=0 offset=00002000

       PBA: BAR=0 offset=00003000

    Capabilities: [100 v1] Advanced Error Reporting

       UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-

       UESvrt:    DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-

       CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-

       CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+

       AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-

           MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-

       HeaderLog: 00000000 00000000 00000000 00000000

    Capabilities: [180 v1] Device Serial Number ff-01-52-c6-14-b3-1f-ff

    Kernel driver in use: alx

    Kernel modules: alx

