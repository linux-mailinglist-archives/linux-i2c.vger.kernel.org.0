Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E13139730E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 14:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhFAMRa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 08:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhFAMRa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 08:17:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9355CC061574
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 05:15:47 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i10so9402356lfj.2
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jun 2021 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bu9ve3rC8ApMo4G9TTJMtps4LjPNRzJl/TqG5EVCmwI=;
        b=Xz2YOxXRPkdL6rG1PRw/RHjDT7hXhFCq2IrXt09LtYRgLt5DP4Fm6Vxc2joxJhONdi
         dWIlnKQQvxr0Ebezku04Brgmobw8Y/yVyY1D9ZLdR6Ly/Tz9vXk+/FqrJnrU4mF+xf/J
         0xa3ucoDchRzCC20nVW+pIyBtacY/Uyf4pJFuBZGQWrdoaiN0CfepSnXiHqPNOijXCsl
         +EvwiGmEzLVNI/9nGWQLsr+6cz2IIIoQmS3gF8341pUQFeoQnkV21n/ESVHs9HsvhrRO
         C8efzTVocoA05mVV8tcEQMot2/2GcghtEi1y3MarX2oF4nn45alXeMsUSZ1k5SfO5pGZ
         eGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bu9ve3rC8ApMo4G9TTJMtps4LjPNRzJl/TqG5EVCmwI=;
        b=R9q3bs1qN/UZKACUMiCotVuEimmEyIWJziLPu96MMFLV0bfj582L8d/0ElkmsW4iUC
         jsX5Mn5SnLJ2jwe+EaUkH5mOce6DnLYhjF3vYuiwn443BEAw+Las45yCaU8k/9BLU6xb
         5OBNzPaeZPdniZLvcMC7IT1CW3CtDm2VGRZI9CitDQrR1m7RhJKJfLfj0kDQLfPs1XM3
         03jAsmX/hLI+U2kKFb6PyZMo3xGSTD2HTa7a4w7/nxbEM7JNMgzkZBLVTgB3vyZY6qi5
         xSqOaD4c2VA2dIFjTcmQaLpfp2G1UsxSwdFPzSKZgo+LkQRf+JyM526GIqKFdBiGA3+/
         qbjA==
X-Gm-Message-State: AOAM531RYdow+tqlaGg8vEOncTEqLQ3K6SiKNElJnN2tyvLly0BdFRT1
        bgKb+mgcGHoMhJTksVA0KXY=
X-Google-Smtp-Source: ABdhPJy3H+IswSahDA4FXTgFup1MAI+gSwoQV4H/EJCwMSUq31jRxdwNZEm1aC6Gm3MKhXrV/2DGvQ==
X-Received: by 2002:a05:6512:3e2:: with SMTP id n2mr19352799lfq.301.1622549745952;
        Tue, 01 Jun 2021 05:15:45 -0700 (PDT)
Received: from localhost ([188.244.36.26])
        by smtp.gmail.com with ESMTPSA id u13sm1995306ljk.133.2021.06.01.05.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 05:15:45 -0700 (PDT)
Date:   Tue, 1 Jun 2021 15:15:42 +0300
From:   Alexander Fomichev <fomichev.ru@gmail.com>
To:     Diego Santa Cruz <Diego.SantaCruz@spinetix.com>,
        linux-i2c@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux@yadro.com
Subject: Re: [PATCH] misc: eeprom: at24: fix NVMEM name with custom AT24
 device name
Message-ID: <20210601121542.a6gboyskhthd2bbv@yadro.com>
References: <20201203214703.18258-1-Diego.SantaCruz () spinetix ! com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203214703.18258-1-Diego.SantaCruz () spinetix ! com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 03, 2020 at 09:47:03PM +0000, Diego Santa Cruz wrote:
> When the "label" property is set on the AT24 EEPROM the NVMEM devid is
> set to NVMEM_DEVID_NONE, but it is not effective since there is a
> leftover line setting it back to NVMEM_DEVID_AUTO a few lines after.
> 
> Fixes: 61f764c307f6 ("eeprom: at24: Support custom device names for AT24 EEPROMs")
> Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> ---
>  drivers/misc/eeprom/at24.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 35fabaf539b7..fbf69148b5ad 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -704,7 +704,6 @@ static int at24_probe(struct i2c_client *client)
>  
>  	nvmem_config.type = NVMEM_TYPE_EEPROM;
>  	nvmem_config.dev = dev;
> -	nvmem_config.id = NVMEM_DEVID_AUTO;
>  	nvmem_config.read_only = !writable;
>  	nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
>  	nvmem_config.owner = THIS_MODULE;

This commit (4e302c3b568eaf2aeebba804c07aba5d921a8c9e) makes a regress
on powerpc64 systems. Tested on YADRO VESNIN (POWER8) and SuperMicro/IBM
9006-22P (POWER9) servers.

The error is logged multiple times in dmesg as following fragment:

[    5.164711] CPU: 26 PID: 1532 Comm: systemd-udevd Tainted: G        W         5.12.0-at24-catch+ #10
[    5.164714] Call Trace:
[    5.164715] [c000000052e2f010] [c000000000913610] dump_stack+0xc4/0x114 (unreliable)
[    5.164721] [c000000052e2f060] [c00000000061bb88] sysfs_warn_dup+0x88/0xc0
[    5.164726] [c000000052e2f0e0] [c00000000061c2ac] sysfs_do_create_link_sd+0x17c/0x190
[    5.164730] [c000000052e2f130] [c000000000ac1854] bus_add_device+0x94/0x1d0
[    5.164735] [c000000052e2f1b0] [c000000000abcff8] device_add+0x428/0xb90
[    5.164738] [c000000052e2f2a0] [c000000000dea270] nvmem_register+0x220/0xe00
[    5.164743] [c000000052e2f390] [c000000000deaeac] devm_nvmem_register+0x5c/0xc0
[    5.164747] [c000000052e2f3d0] [c008000016ca0c1c] at24_probe+0x664/0x8d0 [at24]
[    5.164753] [c000000052e2f650] [c000000000cfd404] i2c_device_probe+0x194/0x650
[    5.164757] [c000000052e2f6f0] [c000000000ac357c] really_probe+0x1cc/0x790
[    5.164761] [c000000052e2f790] [c000000000ac3c9c] driver_probe_device+0x15c/0x200
[    5.164766] [c000000052e2f810] [c000000000ac470c] device_driver_attach+0x11c/0x130
[    5.164771] [c000000052e2f850] [c000000000ac4810] __driver_attach+0xf0/0x200
[    5.164775] [c000000052e2f8d0] [c000000000abf998] bus_for_each_dev+0xa8/0x130
[    5.164779] [c000000052e2f930] [c000000000ac2944] driver_attach+0x34/0x50
[    5.164783] [c000000052e2f950] [c000000000ac1e30] bus_add_driver+0x1b0/0x2f0
[    5.164788] [c000000052e2f9e0] [c000000000ac58f4] driver_register+0xb4/0x1c0
[    5.164792] [c000000052e2fa50] [c000000000cfcbc8] i2c_register_driver+0x78/0x120
[    5.164796] [c000000052e2fad0] [c008000016ca11f0] at24_init+0x6c/0x88 [at24]
[    5.164801] [c000000052e2fb30] [c0000000000122c0] do_one_initcall+0x60/0x2c0
[    5.164805] [c000000052e2fc00] [c000000000253bdc] do_init_module+0x7c/0x350
[    5.164809] [c000000052e2fc90] [c000000000257d24] __do_sys_finit_module+0xd4/0x160
[    5.164813] [c000000052e2fdb0] [c00000000002bfb4] system_call_exception+0xf4/0x200
[    5.164817] [c000000052e2fe10] [c00000000000cf70] system_call_vectored_common+0xf0/0x268
[    5.164821] --- interrupt: 3000 at 0x7f35ee3fb4c4
[    5.164823] NIP:  00007f35ee3fb4c4 LR: 0000000000000000 CTR: 0000000000000000
[    5.164825] REGS: c000000052e2fe80 TRAP: 3000   Tainted: G        W          (5.12.0-at24-catch+)
[    5.164828] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44222884  XER: 00000000
[    5.164842] IRQMASK: 0
               GPR00: 0000000000000161 00007ffffbf36390 00007f35ee4e7000 0000000000000006
               GPR04: 00007f35ee6ab510 0000000000000000 0000000000000006 0000000000000000
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007f35ee78e680 0000000020000000 0000000000000000
               GPR16: 0000000000000000 00000c0344781980 00000c0344781a18 00000c0344781948
               GPR20: 0000000000000000 00000c0350142a20 00007ffffbf365f0 00000c03501b4d90
               GPR24: 0000000000000000 00000c0350142a20 0000000000020000 00000c0350139830
               GPR28: 00007f35ee6ab510 0000000000020000 0000000000000000 00000c0350142a20
[    5.164883] NIP [00007f35ee3fb4c4] 0x7f35ee3fb4c4
[    5.164885] LR [0000000000000000] 0x0
[    5.164887] --- interrupt: 3000
[    5.165102] at24: probe of 8-0057 failed with error -17


Reverting the patch solves the issue.


Reported-by: Alexander Fomichev <fomichev.ru@gmail.com>
CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC: linux@yadro.com

-- 
Regards,
  Alexander
