Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71F0399118
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 19:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFBRKX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 13:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhFBRKW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 13:10:22 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE26EC061574
        for <linux-i2c@vger.kernel.org>; Wed,  2 Jun 2021 10:08:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i10so4523952lfj.2
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jun 2021 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Pc5VZbFY4Pn5BD27RPTpjeXR1qdriQQphimIFaM6VeU=;
        b=Uoq+1OMmdJsCtThbaBUn4Br86JvTjXAhH6Ln0aqXrVKDOHkEYXG/NntObXuFVWUbp7
         dw0kne8G8EhVQdILYZ2TRsbe063PZ+IfD5sr7lc5TbS3IgAIqHuPPiE7n7P2KStdXxxH
         FunfQH7jReqm3ify4smUG6Ir9nBXfmZatUbZU8AQEehYDzu6BgoWmfhN0KoCO2w1d67M
         Yz8t6I5KtN5m6E++s6qqOOPhJ4QUfjM74io105Lrzu/p2wA1Aqw2cymiXDu73VNu6GeK
         bEg9J+IuUXCP5BUpcGTEJDrsicSeRUZuuqlkoj8ZwaxYItzhhqNBguMCvHPu+vv9KQTf
         9mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Pc5VZbFY4Pn5BD27RPTpjeXR1qdriQQphimIFaM6VeU=;
        b=VLf9McBZYk2YZJxeECdnIQWULAryzCT52dJnNvH65myvkLqahpmnBUsHVz+5xQicD3
         R86MALjjs4aVhFQ6enojpNucTCd2BAQ6A1NQD/gpty+KeJ6jTdazEQfhzRDWoeIocdl5
         4D7I+bq4ZNJl57VoOjhy0NGftHKlxQHwPcxIPjLVygtChiz5qVy8VqsoVBsuYV4+ZD0J
         +JAW/I/IkTlZg6jUyvTiDwVeJb03UlWhWR/mhSKAs9tTi+Nm9EbhaVxAT1LuPfIAfx7v
         wVrDJYOe2B6b+uUKbeeBiPpAcYDe2uasOgQ4GDB8TfYgufKkM7txcwyOPV9f+qLvdX+0
         1/Vw==
X-Gm-Message-State: AOAM532H2cHE144TVZIIGNDl6+npIQ3XiaALSB5kG9vBVxNk23e7K5JR
        nwoA/Wgy/ZkoIBJPnC8ZamM=
X-Google-Smtp-Source: ABdhPJyLZFzZLBCkMtEBzY2P0lICeF7YK60huhuR6GvmbqpuYXRd0mAs2/2MBAXObOHrrFo+NZDMDw==
X-Received: by 2002:ac2:5334:: with SMTP id f20mr6422145lfh.190.1622653705843;
        Wed, 02 Jun 2021 10:08:25 -0700 (PDT)
Received: from localhost ([62.217.184.187])
        by smtp.gmail.com with ESMTPSA id l12sm47222lfe.36.2021.06.02.10.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 10:08:24 -0700 (PDT)
Date:   Wed, 2 Jun 2021 20:08:23 +0300
From:   Alexander Fomichev <fomichev.ru@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux@yadro.com
Subject: Re: [PATCH] eeprom: at24: Support custom device names for AT24
 EEPROMs
Message-ID: <20210602170823.vnshp2gfrcay35nx@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 24, 2020 at 03:20:39PM +0200, Jon Hunter wrote:
> By using the label property, a more descriptive name can be populated
> for AT24 EEPROMs NVMEM device. Update the AT24 driver to check to see
> if the label property is present and if so, use this as the name for
> NVMEM device. Please note that when the 'label' property is present for
> the AT24 EEPROM, we do not want the NVMEM driver to append the 'devid'
> to the name and so the nvmem_config.id is initialised to
> NVMEM_DEVID_NONE.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2fde53dcfc97..4aa96d8e78ef 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -713,8 +713,28 @@ static int at24_probe(struct i2c_client *client)
>  			return err;
>  	}
>  
> +	/*
> +	 * If the 'label' property is not present for the AT24 EEPROM,
> +	 * then nvmem_config.id is initialised to NVMEM_DEVID_AUTO,
> +	 * and this will append the 'devid' to the name of the NVMEM
> +	 * device. This is purely legacy and the AT24 driver has always
> +	 * defaulted to this. However, if the 'label' property is
> +	 * present then this means that the name is specified by the
> +	 * firmware and this name should be used verbatim and so it is
> +	 * not necessary to append the 'devid'.
> +	 */
> +	if (device_property_present(dev, "label")) {
> +		nvmem_config.id = NVMEM_DEVID_NONE;
> +		err = device_property_read_string(dev, "label",
> +						  &nvmem_config.name);
> +		if (err)
> +			return err;
> +	} else {
> +		nvmem_config.id = NVMEM_DEVID_AUTO;
> +		nvmem_config.name = dev_name(dev);
> +	}
> +
>  	nvmem_config.type = NVMEM_TYPE_EEPROM;
> -	nvmem_config.name = dev_name(dev);
>  	nvmem_config.dev = dev;
>  	nvmem_config.id = NVMEM_DEVID_AUTO;
>  	nvmem_config.read_only = !writable;

This change has a serious defect, as it doesn't guarantee a name
uniqueness. For my case there are a bunch of NVMEM devices with
'dimm-spd' name. So the module initialization fails with several error
dumps in dmesg, like following:

[    4.784679] at24 3-0051: supply vcc not found, using dummy regulator
[    4.784781] sysfs: cannot create duplicate filename '/bus/nvmem/devices/dimm-spd'
[    4.784783] CPU: 24 PID: 1354 Comm: systemd-udevd Not tainted 5.13.0-rc4-at24-catch+ #25
[    4.784787] Call Trace:
[    4.784789] [c00000003f3eb010] [c000000000914700] dump_stack+0xc4/0x114 (unreliable)
[    4.784797] [c00000003f3eb060] [c00000000061c5c8] sysfs_warn_dup+0x88/0xc0
[    4.784803] [c00000003f3eb0e0] [c00000000061ccec] sysfs_do_create_link_sd+0x17c/0x190
[    4.784809] [c00000003f3eb130] [c000000000ac3014] bus_add_device+0x94/0x1d0
[    4.784817] [c00000003f3eb1b0] [c000000000abe7b8] device_add+0x428/0xb90
[    4.784822] [c00000003f3eb2a0] [c000000000debbd0] nvmem_register+0x220/0xe00
[    4.784829] [c00000003f3eb390] [c000000000dec80c] devm_nvmem_register+0x5c/0xc0
[    4.784835] [c00000003f3eb3d0] [c008000016f40c20] at24_probe+0x668/0x940 [at24]
[    4.784845] [c00000003f3eb650] [c000000000cfecd4] i2c_device_probe+0x194/0x650
[    4.784850] [c00000003f3eb6f0] [c000000000ac4d3c] really_probe+0x1cc/0x790
[    4.784855] [c00000003f3eb790] [c000000000ac545c] driver_probe_device+0x15c/0x200
[    4.784861] [c00000003f3eb810] [c000000000ac5ecc] device_driver_attach+0x11c/0x130
[    4.784866] [c00000003f3eb850] [c000000000ac5fd0] __driver_attach+0xf0/0x200
[    4.784873] [c00000003f3eb8d0] [c000000000ac1158] bus_for_each_dev+0xa8/0x130
[    4.784879] [c00000003f3eb930] [c000000000ac4104] driver_attach+0x34/0x50
[    4.784885] [c00000003f3eb950] [c000000000ac35f0] bus_add_driver+0x1b0/0x2f0
[    4.784893] [c00000003f3eb9e0] [c000000000ac70b4] driver_register+0xb4/0x1c0
[    4.784900] [c00000003f3eba50] [c000000000cfe498] i2c_register_driver+0x78/0x120
[    4.784905] [c00000003f3ebad0] [c008000016f41260] at24_init+0x6c/0x88 [at24]
[    4.784914] [c00000003f3ebb30] [c0000000000122c0] do_one_initcall+0x60/0x2c0
[    4.784920] [c00000003f3ebc00] [c0000000002537bc] do_init_module+0x7c/0x350
[    4.784926] [c00000003f3ebc90] [c000000000257904] __do_sys_finit_module+0xd4/0x160
[    4.784932] [c00000003f3ebdb0] [c00000000002c104] system_call_exception+0xf4/0x200
[    4.784938] [c00000003f3ebe10] [c00000000000cf70] system_call_vectored_common+0xf0/0x268
[    4.784944] --- interrupt: 3000 at 0x7c1adac4b4c4
[    4.784948] NIP:  00007c1adac4b4c4 LR: 0000000000000000 CTR: 0000000000000000
[    4.784951] REGS: c00000003f3ebe80 TRAP: 3000   Not tainted  (5.13.0-rc4-at24-catch+)
[    4.784955] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48222844  XER: 00000000
[    4.784976] IRQMASK: 0
               GPR00: 0000000000000161 00007fffefc78b90 00007c1adad37000 0000000000000006
               GPR04: 00000f6614d56be0 0000000000000000 0000000000000006 0000000000000000
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007c1adafde680 0000000020000000 0000000000000000
               GPR16: 0000000000000000 00000f66118b1980 00000f66118b1a18 00000f66118b1948
               GPR20: 0000000000000000 00000f6614d60500 00007fffefc78df0 00000f6614d535c0
               GPR24: 00000f6614d56be0 00000f6614d60500 000000000000000c 00000f6614d49cb0
               GPR28: 00000f6614d56be0 0000000000020000 0000000000000000 00000f6614d60500
[    4.785033] NIP [00007c1adac4b4c4] 0x7c1adac4b4c4
[    4.785036] LR [0000000000000000] 0x0
[    4.785040] --- interrupt: 3000
[    4.785146] at24: probe of 3-0051 failed with error -17


It needs either to use NVMEM_DEVID_AUTO flag irrespective of the 'label'
property or to add a sort of counter suffix to the name field.


Reported-by: Alexander Fomichev <fomichev.ru@gmail.com>
CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>

-- 
Regards,
  Alexander
