Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0C67AF0CE
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 18:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbjIZQd6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 12:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjIZQd5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 12:33:57 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3489BF
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 09:33:48 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3215f19a13aso9128980f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695746027; x=1696350827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT8PYahBcmeV1i3knHjOc6xfoWl/NIGkd05va5IeqGY=;
        b=gjzMAfo5X4rL+eE62kk4F+srC21zBZcYH7eeOyhjEf2IPu7iuGHAq/SbVVwlVqWA91
         uuCkeap4pS0jumPkkO3ksEo9RwVHeoM9mGgmtDgiNwWaZ78PQjqgb9FeOtKbRpXEwKUt
         1CxZd40xGw02QhSOIclGLQ0hdm8cdj3LVt4eKGrkf3IS5JOexpGKEc/KT4YWu5HrXChH
         PnI16JVrI1Swyt8hLr+vTfdrp+9axoz4A3XtWupIFjwV/fi5ckbeNN3gyueAT9h8oq1z
         IH1iE5jeqmCfpSGlesVYNdlV6g4RWmY+aY1DC9hd5SOahzMv/8BIZySm9D1cQzRCS5rx
         XveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695746027; x=1696350827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HT8PYahBcmeV1i3knHjOc6xfoWl/NIGkd05va5IeqGY=;
        b=syD+1oYoTSqJ9rxdGaZwt7vHKfKnp+wVQL2Ewos3+gG+/jIhCjrBzcctnoh0mcTZbH
         iNEVc3lb0jOkXRwhV1jD96DsvXkbc2wr3Q7ME+jFkYHJGTkBOF0F0Xn/B5Dnga2XexUf
         LGLTChf6zcaxj833b9jjeR83fvqJKbcrY76GnNdn+0fITEUY1FX+kehhV/D2fwA1qffe
         ntvzSnhibaTS6cJuJDGGrqv9zuQk0bASRgQavm0eYlJpJgRjD1OVC+N70ub7Rw0c4Ijr
         4a/a8E6Cj8fjXqOc+zRFwn8ZzBUsYHcdRw5O/9A+oV0BHiraE/I+FB/Opbu+U0MDQ/C9
         a7aw==
X-Gm-Message-State: AOJu0YwjFMFvBfWURiE4W3h70oi5I63DVkWNDJxM7uk457gfN9pBFu0Y
        b52A90rCQZKgPU4n+LzfJa/m0h1FLSlp7zgQ8kpKfp3MGH5Jo9RQSNY=
X-Google-Smtp-Source: AGHT+IF+BOhA7VgSdw+Z/NjsRsx+5BHHWFOmnUu/VRiRwXOZk70GHl8qOxGVCmIv5qKpHKJQgIxFKpbdyzKYx9zwu7c=
X-Received: by 2002:adf:fdc8:0:b0:31f:9a0d:167f with SMTP id
 i8-20020adffdc8000000b0031f9a0d167fmr8589199wrs.50.1695746026880; Tue, 26 Sep
 2023 09:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230926133725.5c3fb96e@endymion.delvare>
In-Reply-To: <20230926133725.5c3fb96e@endymion.delvare>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Sep 2023 09:33:35 -0700
Message-ID: <CAKwvOdmFwJK72u8eFbbBY4tz3OjiakfBKUdRNdKdG0GGq52ZTQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: Drop legacy muxing pseudo-drivers
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 26, 2023 at 4:37=E2=80=AFAM Jean Delvare <jdelvare@suse.de> wro=
te:
>
> The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> written at a time when the i2c core did not support muxing. They are
> essentially board-specific hacks. If we had to add support for these
> boards today, we would implement it in a completely different way.
>
> These Tyan server boards are 18 years old by now, so I very much doubt
> any of these is still running today. So let's just drop this clumsy
> code. If anyone really still needs this support and complains, I'll
> rewrite it in a proper way on top of i2c-mux.
>
> This also fixes the following warnings:
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' wa=
s not declared. Should it be static?
> drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' =
was not declared. Should it be static?
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch!
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  MAINTAINERS                            |    2
>  drivers/i2c/busses/Kconfig             |   26 ---
>  drivers/i2c/busses/Makefile            |    2
>  drivers/i2c/busses/i2c-amd756-s4882.c  |  245 --------------------------=
-------
>  drivers/i2c/busses/i2c-amd756.c        |    4
>  drivers/i2c/busses/i2c-nforce2-s4985.c |  240 --------------------------=
------
>  drivers/i2c/busses/i2c-nforce2.c       |   16 --
>  7 files changed, 1 insertion(+), 534 deletions(-)
>
> --- linux-6.5.orig/MAINTAINERS
> +++ linux-6.5/MAINTAINERS
> @@ -9779,12 +9779,10 @@ F:      Documentation/i2c/busses/i2c-viapro.r
>  F:     drivers/i2c/busses/i2c-ali1535.c
>  F:     drivers/i2c/busses/i2c-ali1563.c
>  F:     drivers/i2c/busses/i2c-ali15x3.c
> -F:     drivers/i2c/busses/i2c-amd756-s4882.c
>  F:     drivers/i2c/busses/i2c-amd756.c
>  F:     drivers/i2c/busses/i2c-amd8111.c
>  F:     drivers/i2c/busses/i2c-i801.c
>  F:     drivers/i2c/busses/i2c-isch.c
> -F:     drivers/i2c/busses/i2c-nforce2-s4985.c
>  F:     drivers/i2c/busses/i2c-nforce2.c
>  F:     drivers/i2c/busses/i2c-piix4.c
>  F:     drivers/i2c/busses/i2c-sis5595.c
> --- linux-6.5.orig/drivers/i2c/busses/Kconfig
> +++ linux-6.5/drivers/i2c/busses/Kconfig
> @@ -62,19 +62,6 @@ config I2C_AMD756
>           This driver can also be built as a module.  If so, the module
>           will be called i2c-amd756.
>
> -config I2C_AMD756_S4882
> -       tristate "SMBus multiplexing on the Tyan S4882"
> -       depends on I2C_AMD756 && X86
> -       help
> -         Enabling this option will add specific SMBus support for the Ty=
an
> -         S4882 motherboard.  On this 4-CPU board, the SMBus is multiplex=
ed
> -         over 8 different channels, where the various memory module EEPR=
OMs
> -         and temperature sensors live.  Saying yes here will give you ac=
cess
> -         to these in addition to the trunk.
> -
> -         This driver can also be built as a module.  If so, the module
> -         will be called i2c-amd756-s4882.
> -
>  config I2C_AMD8111
>         tristate "AMD 8111"
>         depends on PCI
> @@ -248,19 +235,6 @@ config I2C_NFORCE2
>           This driver can also be built as a module.  If so, the module
>           will be called i2c-nforce2.
>
> -config I2C_NFORCE2_S4985
> -       tristate "SMBus multiplexing on the Tyan S4985"
> -       depends on I2C_NFORCE2 && X86
> -       help
> -         Enabling this option will add specific SMBus support for the Ty=
an
> -         S4985 motherboard.  On this 4-CPU board, the SMBus is multiplex=
ed
> -         over 4 different channels, where the various memory module EEPR=
OMs
> -         live.  Saying yes here will give you access to these in additio=
n
> -         to the trunk.
> -
> -         This driver can also be built as a module.  If so, the module
> -         will be called i2c-nforce2-s4985.
> -
>  config I2C_NVIDIA_GPU
>         tristate "NVIDIA GPU I2C controller"
>         depends on PCI
> --- linux-6.5.orig/drivers/i2c/busses/Makefile
> +++ linux-6.5/drivers/i2c/busses/Makefile
> @@ -14,7 +14,6 @@ obj-$(CONFIG_I2C_ALI1535)     +=3D i2c-ali1535
>  obj-$(CONFIG_I2C_ALI1563)      +=3D i2c-ali1563.o
>  obj-$(CONFIG_I2C_ALI15X3)      +=3D i2c-ali15x3.o
>  obj-$(CONFIG_I2C_AMD756)       +=3D i2c-amd756.o
> -obj-$(CONFIG_I2C_AMD756_S4882) +=3D i2c-amd756-s4882.o
>  obj-$(CONFIG_I2C_AMD8111)      +=3D i2c-amd8111.o
>  obj-$(CONFIG_I2C_CHT_WC)       +=3D i2c-cht-wc.o
>  obj-$(CONFIG_I2C_I801)         +=3D i2c-i801.o
> @@ -22,7 +21,6 @@ obj-$(CONFIG_I2C_ISCH)                +=3D i2c-isch.o
>  obj-$(CONFIG_I2C_ISMT)         +=3D i2c-ismt.o
>  obj-$(CONFIG_I2C_NCT6793)      +=3D i2c-nct6793.o
>  obj-$(CONFIG_I2C_NFORCE2)      +=3D i2c-nforce2.o
> -obj-$(CONFIG_I2C_NFORCE2_S4985)        +=3D i2c-nforce2-s4985.o
>  obj-$(CONFIG_I2C_NVIDIA_GPU)   +=3D i2c-nvidia-gpu.o
>  obj-$(CONFIG_I2C_PIIX4)                +=3D i2c-piix4.o
>  obj-$(CONFIG_I2C_SIS5595)      +=3D i2c-sis5595.o
> --- linux-6.5.orig/drivers/i2c/busses/i2c-amd756-s4882.c
> +++ /dev/null
> @@ -1,245 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * i2c-amd756-s4882.c - i2c-amd756 extras for the Tyan S4882 motherboard
> - *
> - * Copyright (C) 2004, 2008 Jean Delvare <jdelvare@suse.de>
> - */
> -
> -/*
> - * We select the channels by sending commands to the Philips
> - * PCA9556 chip at I2C address 0x18. The main adapter is used for
> - * the non-multiplexed part of the bus, and 4 virtual adapters
> - * are defined for the multiplexed addresses: 0x50-0x53 (memory
> - * module EEPROM) located on channels 1-4, and 0x4c (LM63)
> - * located on multiplexed channels 0 and 5-7. We define one
> - * virtual adapter per CPU, which corresponds to two multiplexed
> - * channels:
> - *   CPU0: virtual adapter 1, channels 1 and 0
> - *   CPU1: virtual adapter 2, channels 2 and 5
> - *   CPU2: virtual adapter 3, channels 3 and 6
> - *   CPU3: virtual adapter 4, channels 4 and 7
> - */
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/slab.h>
> -#include <linux/init.h>
> -#include <linux/i2c.h>
> -#include <linux/mutex.h>
> -
> -extern struct i2c_adapter amd756_smbus;
> -
> -static struct i2c_adapter *s4882_adapter;
> -static struct i2c_algorithm *s4882_algo;
> -
> -/* Wrapper access functions for multiplexed SMBus */
> -static DEFINE_MUTEX(amd756_lock);
> -
> -static s32 amd756_access_virt0(struct i2c_adapter * adap, u16 addr,
> -                              unsigned short flags, char read_write,
> -                              u8 command, int size,
> -                              union i2c_smbus_data * data)
> -{
> -       int error;
> -
> -       /* We exclude the multiplexed addresses */
> -       if (addr =3D=3D 0x4c || (addr & 0xfc) =3D=3D 0x50 || (addr & 0xfc=
) =3D=3D 0x30
> -        || addr =3D=3D 0x18)
> -               return -ENXIO;
> -
> -       mutex_lock(&amd756_lock);
> -
> -       error =3D amd756_smbus.algo->smbus_xfer(adap, addr, flags, read_w=
rite,
> -                                             command, size, data);
> -
> -       mutex_unlock(&amd756_lock);
> -
> -       return error;
> -}
> -
> -/* We remember the last used channels combination so as to only switch
> -   channels when it is really needed. This greatly reduces the SMBus
> -   overhead, but also assumes that nobody will be writing to the PCA9556
> -   in our back. */
> -static u8 last_channels;
> -
> -static inline s32 amd756_access_channel(struct i2c_adapter * adap, u16 a=
ddr,
> -                                       unsigned short flags, char read_w=
rite,
> -                                       u8 command, int size,
> -                                       union i2c_smbus_data * data,
> -                                       u8 channels)
> -{
> -       int error;
> -
> -       /* We exclude the non-multiplexed addresses */
> -       if (addr !=3D 0x4c && (addr & 0xfc) !=3D 0x50 && (addr & 0xfc) !=
=3D 0x30)
> -               return -ENXIO;
> -
> -       mutex_lock(&amd756_lock);
> -
> -       if (last_channels !=3D channels) {
> -               union i2c_smbus_data mplxdata;
> -               mplxdata.byte =3D channels;
> -
> -               error =3D amd756_smbus.algo->smbus_xfer(adap, 0x18, 0,
> -                                                     I2C_SMBUS_WRITE, 0x=
01,
> -                                                     I2C_SMBUS_BYTE_DATA=
,
> -                                                     &mplxdata);
> -               if (error)
> -                       goto UNLOCK;
> -               last_channels =3D channels;
> -       }
> -       error =3D amd756_smbus.algo->smbus_xfer(adap, addr, flags, read_w=
rite,
> -                                             command, size, data);
> -
> -UNLOCK:
> -       mutex_unlock(&amd756_lock);
> -       return error;
> -}
> -
> -static s32 amd756_access_virt1(struct i2c_adapter * adap, u16 addr,
> -                              unsigned short flags, char read_write,
> -                              u8 command, int size,
> -                              union i2c_smbus_data * data)
> -{
> -       /* CPU0: channels 1 and 0 enabled */
> -       return amd756_access_channel(adap, addr, flags, read_write, comma=
nd,
> -                                    size, data, 0x03);
> -}
> -
> -static s32 amd756_access_virt2(struct i2c_adapter * adap, u16 addr,
> -                              unsigned short flags, char read_write,
> -                              u8 command, int size,
> -                              union i2c_smbus_data * data)
> -{
> -       /* CPU1: channels 2 and 5 enabled */
> -       return amd756_access_channel(adap, addr, flags, read_write, comma=
nd,
> -                                    size, data, 0x24);
> -}
> -
> -static s32 amd756_access_virt3(struct i2c_adapter * adap, u16 addr,
> -                              unsigned short flags, char read_write,
> -                              u8 command, int size,
> -                              union i2c_smbus_data * data)
> -{
> -       /* CPU2: channels 3 and 6 enabled */
> -       return amd756_access_channel(adap, addr, flags, read_write, comma=
nd,
> -                                    size, data, 0x48);
> -}
> -
> -static s32 amd756_access_virt4(struct i2c_adapter * adap, u16 addr,
> -                              unsigned short flags, char read_write,
> -                              u8 command, int size,
> -                              union i2c_smbus_data * data)
> -{
> -       /* CPU3: channels 4 and 7 enabled */
> -       return amd756_access_channel(adap, addr, flags, read_write, comma=
nd,
> -                                    size, data, 0x90);
> -}
> -
> -static int __init amd756_s4882_init(void)
> -{
> -       int i, error;
> -       union i2c_smbus_data ioconfig;
> -
> -       if (!amd756_smbus.dev.parent)
> -               return -ENODEV;
> -
> -       /* Configure the PCA9556 multiplexer */
> -       ioconfig.byte =3D 0x00; /* All I/O to output mode */
> -       error =3D i2c_smbus_xfer(&amd756_smbus, 0x18, 0, I2C_SMBUS_WRITE,=
 0x03,
> -                              I2C_SMBUS_BYTE_DATA, &ioconfig);
> -       if (error) {
> -               dev_err(&amd756_smbus.dev, "PCA9556 configuration failed\=
n");
> -               error =3D -EIO;
> -               goto ERROR0;
> -       }
> -
> -       /* Unregister physical bus */
> -       i2c_del_adapter(&amd756_smbus);
> -
> -       printk(KERN_INFO "Enabling SMBus multiplexing for Tyan S4882\n");
> -       /* Define the 5 virtual adapters and algorithms structures */
> -       if (!(s4882_adapter =3D kcalloc(5, sizeof(struct i2c_adapter),
> -                                     GFP_KERNEL))) {
> -               error =3D -ENOMEM;
> -               goto ERROR1;
> -       }
> -       if (!(s4882_algo =3D kcalloc(5, sizeof(struct i2c_algorithm),
> -                                  GFP_KERNEL))) {
> -               error =3D -ENOMEM;
> -               goto ERROR2;
> -       }
> -
> -       /* Fill in the new structures */
> -       s4882_algo[0] =3D *(amd756_smbus.algo);
> -       s4882_algo[0].smbus_xfer =3D amd756_access_virt0;
> -       s4882_adapter[0] =3D amd756_smbus;
> -       s4882_adapter[0].algo =3D s4882_algo;
> -       s4882_adapter[0].dev.parent =3D amd756_smbus.dev.parent;
> -       for (i =3D 1; i < 5; i++) {
> -               s4882_algo[i] =3D *(amd756_smbus.algo);
> -               s4882_adapter[i] =3D amd756_smbus;
> -               snprintf(s4882_adapter[i].name, sizeof(s4882_adapter[i].n=
ame),
> -                        "SMBus 8111 adapter (CPU%d)", i-1);
> -               s4882_adapter[i].algo =3D s4882_algo+i;
> -               s4882_adapter[i].dev.parent =3D amd756_smbus.dev.parent;
> -       }
> -       s4882_algo[1].smbus_xfer =3D amd756_access_virt1;
> -       s4882_algo[2].smbus_xfer =3D amd756_access_virt2;
> -       s4882_algo[3].smbus_xfer =3D amd756_access_virt3;
> -       s4882_algo[4].smbus_xfer =3D amd756_access_virt4;
> -
> -       /* Register virtual adapters */
> -       for (i =3D 0; i < 5; i++) {
> -               error =3D i2c_add_adapter(s4882_adapter+i);
> -               if (error) {
> -                       printk(KERN_ERR "i2c-amd756-s4882: "
> -                              "Virtual adapter %d registration "
> -                              "failed, module not inserted\n", i);
> -                       for (i--; i >=3D 0; i--)
> -                               i2c_del_adapter(s4882_adapter+i);
> -                       goto ERROR3;
> -               }
> -       }
> -
> -       return 0;
> -
> -ERROR3:
> -       kfree(s4882_algo);
> -       s4882_algo =3D NULL;
> -ERROR2:
> -       kfree(s4882_adapter);
> -       s4882_adapter =3D NULL;
> -ERROR1:
> -       /* Restore physical bus */
> -       i2c_add_adapter(&amd756_smbus);
> -ERROR0:
> -       return error;
> -}
> -
> -static void __exit amd756_s4882_exit(void)
> -{
> -       if (s4882_adapter) {
> -               int i;
> -
> -               for (i =3D 0; i < 5; i++)
> -                       i2c_del_adapter(s4882_adapter+i);
> -               kfree(s4882_adapter);
> -               s4882_adapter =3D NULL;
> -       }
> -       kfree(s4882_algo);
> -       s4882_algo =3D NULL;
> -
> -       /* Restore physical bus */
> -       if (i2c_add_adapter(&amd756_smbus))
> -               printk(KERN_ERR "i2c-amd756-s4882: "
> -                      "Physical bus restoration failed\n");
> -}
> -
> -MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
> -MODULE_DESCRIPTION("S4882 SMBus multiplexing");
> -MODULE_LICENSE("GPL");
> -
> -module_init(amd756_s4882_init);
> -module_exit(amd756_s4882_exit);
> --- linux-6.5.orig/drivers/i2c/busses/i2c-amd756.c
> +++ linux-6.5/drivers/i2c/busses/i2c-amd756.c
> @@ -283,7 +283,7 @@ static const struct i2c_algorithm smbus_
>         .functionality  =3D amd756_func,
>  };
>
> -struct i2c_adapter amd756_smbus =3D {
> +static struct i2c_adapter amd756_smbus =3D {
>         .owner          =3D THIS_MODULE,
>         .class          =3D I2C_CLASS_HWMON | I2C_CLASS_SPD,
>         .algo           =3D &smbus_algorithm,
> @@ -398,5 +398,3 @@ module_pci_driver(amd756_driver);
>  MODULE_AUTHOR("Merlin Hughes <merlin@merlin.org>");
>  MODULE_DESCRIPTION("AMD756/766/768/8111 and nVidia nForce SMBus driver")=
;
>  MODULE_LICENSE("GPL");
> -
> -EXPORT_SYMBOL(amd756_smbus);
> --- linux-6.5.orig/drivers/i2c/busses/i2c-nforce2-s4985.c
> +++ /dev/null
> @@ -1,240 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * i2c-nforce2-s4985.c - i2c-nforce2 extras for the Tyan S4985 motherboa=
rd
> - *
> - * Copyright (C) 2008 Jean Delvare <jdelvare@suse.de>
> - */
> -
> -/*
> - * We select the channels by sending commands to the Philips
> - * PCA9556 chip at I2C address 0x18. The main adapter is used for
> - * the non-multiplexed part of the bus, and 4 virtual adapters
> - * are defined for the multiplexed addresses: 0x50-0x53 (memory
> - * module EEPROM) located on channels 1-4. We define one virtual
> - * adapter per CPU, which corresponds to one multiplexed channel:
> - *   CPU0: virtual adapter 1, channel 1
> - *   CPU1: virtual adapter 2, channel 2
> - *   CPU2: virtual adapter 3, channel 3
> - *   CPU3: virtual adapter 4, channel 4
> - */
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/slab.h>
> -#include <linux/init.h>
> -#include <linux/i2c.h>
> -#include <linux/mutex.h>
> -
> -extern struct i2c_adapter *nforce2_smbus;
> -
> -static struct i2c_adapter *s4985_adapter;
> -static struct i2c_algorithm *s4985_algo;
> -
> -/* Wrapper access functions for multiplexed SMBus */
> -static DEFINE_MUTEX(nforce2_lock);
> -
> -static s32 nforce2_access_virt0(struct i2c_adapter *adap, u16 addr,
> -                               unsigned short flags, char read_write,
> -                               u8 command, int size,
> -                               union i2c_smbus_data *data)
> -{
> -       int error;
> -
> -       /* We exclude the multiplexed addresses */
> -       if ((addr & 0xfc) =3D=3D 0x50 || (addr & 0xfc) =3D=3D 0x30
> -        || addr =3D=3D 0x18)
> -               return -ENXIO;
> -
> -       mutex_lock(&nforce2_lock);
> -       error =3D nforce2_smbus->algo->smbus_xfer(adap, addr, flags, read=
_write,
> -                                               command, size, data);
> -       mutex_unlock(&nforce2_lock);
> -
> -       return error;
> -}
> -
> -/* We remember the last used channels combination so as to only switch
> -   channels when it is really needed. This greatly reduces the SMBus
> -   overhead, but also assumes that nobody will be writing to the PCA9556
> -   in our back. */
> -static u8 last_channels;
> -
> -static inline s32 nforce2_access_channel(struct i2c_adapter *adap, u16 a=
ddr,
> -                                        unsigned short flags, char read_=
write,
> -                                        u8 command, int size,
> -                                        union i2c_smbus_data *data,
> -                                        u8 channels)
> -{
> -       int error;
> -
> -       /* We exclude the non-multiplexed addresses */
> -       if ((addr & 0xfc) !=3D 0x50 && (addr & 0xfc) !=3D 0x30)
> -               return -ENXIO;
> -
> -       mutex_lock(&nforce2_lock);
> -       if (last_channels !=3D channels) {
> -               union i2c_smbus_data mplxdata;
> -               mplxdata.byte =3D channels;
> -
> -               error =3D nforce2_smbus->algo->smbus_xfer(adap, 0x18, 0,
> -                                                       I2C_SMBUS_WRITE, =
0x01,
> -                                                       I2C_SMBUS_BYTE_DA=
TA,
> -                                                       &mplxdata);
> -               if (error)
> -                       goto UNLOCK;
> -               last_channels =3D channels;
> -       }
> -       error =3D nforce2_smbus->algo->smbus_xfer(adap, addr, flags, read=
_write,
> -                                               command, size, data);
> -
> -UNLOCK:
> -       mutex_unlock(&nforce2_lock);
> -       return error;
> -}
> -
> -static s32 nforce2_access_virt1(struct i2c_adapter *adap, u16 addr,
> -                               unsigned short flags, char read_write,
> -                               u8 command, int size,
> -                               union i2c_smbus_data *data)
> -{
> -       /* CPU0: channel 1 enabled */
> -       return nforce2_access_channel(adap, addr, flags, read_write, comm=
and,
> -                                     size, data, 0x02);
> -}
> -
> -static s32 nforce2_access_virt2(struct i2c_adapter *adap, u16 addr,
> -                               unsigned short flags, char read_write,
> -                               u8 command, int size,
> -                               union i2c_smbus_data *data)
> -{
> -       /* CPU1: channel 2 enabled */
> -       return nforce2_access_channel(adap, addr, flags, read_write, comm=
and,
> -                                     size, data, 0x04);
> -}
> -
> -static s32 nforce2_access_virt3(struct i2c_adapter *adap, u16 addr,
> -                               unsigned short flags, char read_write,
> -                               u8 command, int size,
> -                               union i2c_smbus_data *data)
> -{
> -       /* CPU2: channel 3 enabled */
> -       return nforce2_access_channel(adap, addr, flags, read_write, comm=
and,
> -                                     size, data, 0x08);
> -}
> -
> -static s32 nforce2_access_virt4(struct i2c_adapter *adap, u16 addr,
> -                               unsigned short flags, char read_write,
> -                               u8 command, int size,
> -                               union i2c_smbus_data *data)
> -{
> -       /* CPU3: channel 4 enabled */
> -       return nforce2_access_channel(adap, addr, flags, read_write, comm=
and,
> -                                     size, data, 0x10);
> -}
> -
> -static int __init nforce2_s4985_init(void)
> -{
> -       int i, error;
> -       union i2c_smbus_data ioconfig;
> -
> -       if (!nforce2_smbus)
> -               return -ENODEV;
> -
> -       /* Configure the PCA9556 multiplexer */
> -       ioconfig.byte =3D 0x00; /* All I/O to output mode */
> -       error =3D i2c_smbus_xfer(nforce2_smbus, 0x18, 0, I2C_SMBUS_WRITE,=
 0x03,
> -                              I2C_SMBUS_BYTE_DATA, &ioconfig);
> -       if (error) {
> -               dev_err(&nforce2_smbus->dev, "PCA9556 configuration faile=
d\n");
> -               error =3D -EIO;
> -               goto ERROR0;
> -       }
> -
> -       /* Unregister physical bus */
> -       i2c_del_adapter(nforce2_smbus);
> -
> -       printk(KERN_INFO "Enabling SMBus multiplexing for Tyan S4985\n");
> -       /* Define the 5 virtual adapters and algorithms structures */
> -       s4985_adapter =3D kcalloc(5, sizeof(struct i2c_adapter), GFP_KERN=
EL);
> -       if (!s4985_adapter) {
> -               error =3D -ENOMEM;
> -               goto ERROR1;
> -       }
> -       s4985_algo =3D kcalloc(5, sizeof(struct i2c_algorithm), GFP_KERNE=
L);
> -       if (!s4985_algo) {
> -               error =3D -ENOMEM;
> -               goto ERROR2;
> -       }
> -
> -       /* Fill in the new structures */
> -       s4985_algo[0] =3D *(nforce2_smbus->algo);
> -       s4985_algo[0].smbus_xfer =3D nforce2_access_virt0;
> -       s4985_adapter[0] =3D *nforce2_smbus;
> -       s4985_adapter[0].algo =3D s4985_algo;
> -       s4985_adapter[0].dev.parent =3D nforce2_smbus->dev.parent;
> -       for (i =3D 1; i < 5; i++) {
> -               s4985_algo[i] =3D *(nforce2_smbus->algo);
> -               s4985_adapter[i] =3D *nforce2_smbus;
> -               snprintf(s4985_adapter[i].name, sizeof(s4985_adapter[i].n=
ame),
> -                        "SMBus nForce2 adapter (CPU%d)", i - 1);
> -               s4985_adapter[i].algo =3D s4985_algo + i;
> -               s4985_adapter[i].dev.parent =3D nforce2_smbus->dev.parent=
;
> -       }
> -       s4985_algo[1].smbus_xfer =3D nforce2_access_virt1;
> -       s4985_algo[2].smbus_xfer =3D nforce2_access_virt2;
> -       s4985_algo[3].smbus_xfer =3D nforce2_access_virt3;
> -       s4985_algo[4].smbus_xfer =3D nforce2_access_virt4;
> -
> -       /* Register virtual adapters */
> -       for (i =3D 0; i < 5; i++) {
> -               error =3D i2c_add_adapter(s4985_adapter + i);
> -               if (error) {
> -                       printk(KERN_ERR "i2c-nforce2-s4985: "
> -                              "Virtual adapter %d registration "
> -                              "failed, module not inserted\n", i);
> -                       for (i--; i >=3D 0; i--)
> -                               i2c_del_adapter(s4985_adapter + i);
> -                       goto ERROR3;
> -               }
> -       }
> -
> -       return 0;
> -
> -ERROR3:
> -       kfree(s4985_algo);
> -       s4985_algo =3D NULL;
> -ERROR2:
> -       kfree(s4985_adapter);
> -       s4985_adapter =3D NULL;
> -ERROR1:
> -       /* Restore physical bus */
> -       i2c_add_adapter(nforce2_smbus);
> -ERROR0:
> -       return error;
> -}
> -
> -static void __exit nforce2_s4985_exit(void)
> -{
> -       if (s4985_adapter) {
> -               int i;
> -
> -               for (i =3D 0; i < 5; i++)
> -                       i2c_del_adapter(s4985_adapter+i);
> -               kfree(s4985_adapter);
> -               s4985_adapter =3D NULL;
> -       }
> -       kfree(s4985_algo);
> -       s4985_algo =3D NULL;
> -
> -       /* Restore physical bus */
> -       if (i2c_add_adapter(nforce2_smbus))
> -               printk(KERN_ERR "i2c-nforce2-s4985: "
> -                      "Physical bus restoration failed\n");
> -}
> -
> -MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
> -MODULE_DESCRIPTION("S4985 SMBus multiplexing");
> -MODULE_LICENSE("GPL");
> -
> -module_init(nforce2_s4985_init);
> -module_exit(nforce2_s4985_exit);
> --- linux-6.5.orig/drivers/i2c/busses/i2c-nforce2.c
> +++ linux-6.5/drivers/i2c/busses/i2c-nforce2.c
> @@ -117,20 +117,6 @@ static const struct dmi_system_id nforce
>
>  static struct pci_driver nforce2_driver;
>
> -/* For multiplexing support, we need a global reference to the 1st
> -   SMBus channel */
> -#if IS_ENABLED(CONFIG_I2C_NFORCE2_S4985)
> -struct i2c_adapter *nforce2_smbus;
> -EXPORT_SYMBOL_GPL(nforce2_smbus);
> -
> -static void nforce2_set_reference(struct i2c_adapter *adap)
> -{
> -       nforce2_smbus =3D adap;
> -}
> -#else
> -static inline void nforce2_set_reference(struct i2c_adapter *adap) { }
> -#endif
> -
>  static void nforce2_abort(struct i2c_adapter *adap)
>  {
>         struct nforce2_smbus *smbus =3D adap->algo_data;
> @@ -411,7 +397,6 @@ static int nforce2_probe(struct pci_dev
>                 return -ENODEV;
>         }
>
> -       nforce2_set_reference(&smbuses[0].adapter);
>         return 0;
>  }
>
> @@ -420,7 +405,6 @@ static void nforce2_remove(struct pci_de
>  {
>         struct nforce2_smbus *smbuses =3D pci_get_drvdata(dev);
>
> -       nforce2_set_reference(NULL);
>         if (smbuses[0].base) {
>                 i2c_del_adapter(&smbuses[0].adapter);
>                 release_region(smbuses[0].base, smbuses[0].size);
>
>
> --
> Jean Delvare
> SUSE L3 Support



--=20
Thanks,
~Nick Desaulniers
