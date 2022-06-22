Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB041554230
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 07:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356662AbiFVFQx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 01:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbiFVFQw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 01:16:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6305F35DFF
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jun 2022 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655875010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Is/Unnu/MCp28LMHQht26zEZfUU7ClU6IPvmWsa/FRY=;
        b=C/4w1R+pZHy77haJ1b9m0tMmbXHczn5HMH2OymzHQcRvG4d4AhvBRqRQCgpWHwgq5lySyW
        g1ozY2E9Me4pYMsYvNG/FNH0dW0RGagw8RU5jIsxr85/871hdm8UBhxAi3k9ZNj3fdP+KI
        gXt5nMeWZcPtud/Zx/0DHjWLZJ38e7U=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-9ZtnXzsRPJCH64bQYA6ynA-1; Wed, 22 Jun 2022 01:16:48 -0400
X-MC-Unique: 9ZtnXzsRPJCH64bQYA6ynA-1
Received: by mail-pj1-f72.google.com with SMTP id 92-20020a17090a09e500b001d917022847so5571170pjo.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jun 2022 22:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Is/Unnu/MCp28LMHQht26zEZfUU7ClU6IPvmWsa/FRY=;
        b=tn5t06cYerxrlhqCq2rOuRZ4C/74usDmnj1INEZjU5utHpihcMVixnsFbXPLq6eJI+
         rVmY+SvCEW+XQVfbVgmRzl8zXySD0UKGCM6hDD26y5kVEMIAhUHYr9m265hYxmNAJX2t
         Qg5EnGLiKWggkrZ2lvOeMAeG0Vx4ws8LpZMhN+vQj6PTgFhtmkLq3jagIPcbBnm7+83G
         BkOKNXkyJ1Nj/OLV+UFgG9csMFDbJCnpkUVHmCCs2JmsMavgUasmr6pg61Gg6LgGBKtl
         Bpc/rXelsuSGxbjVTx1wS5DB7eWIxCmHKayqh5X6newuey3biPgCETk9mI6RhAn6HEHW
         TjeA==
X-Gm-Message-State: AJIora8PsWzqxU15GFNiX6lfZXxxgMAOxOBNslVsH2jj3noL4NRQ9cVn
        nXbfKenyeyxPC8OWSLmwkvrk1rJ7vgcFT8HDgNLD5KUNEuq3MZth4sNUKFDGOH9HSqyoc6roAoj
        9L9CY417k8xShR8Wx0+yKIXJIULIBVxXUZXrX
X-Received: by 2002:a17:902:db0d:b0:168:f71a:2fc6 with SMTP id m13-20020a170902db0d00b00168f71a2fc6mr32349393plx.15.1655875007232;
        Tue, 21 Jun 2022 22:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEJQDhboVXIEDcwzEAS/g784AS5mVzfg+vG8Y6jEy/xwistNciP1EWp/+sg5/XKAPvbplCXucas0ZjWh9PWDQ=
X-Received: by 2002:a17:902:db0d:b0:168:f71a:2fc6 with SMTP id
 m13-20020a170902db0d00b00168f71a2fc6mr32349370plx.15.1655875006872; Tue, 21
 Jun 2022 22:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
 <20220617093818.37a721a3@endymion.delvare> <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
 <20220621144822.1d9228de@endymion.delvare> <0ce578ba-cdc7-6084-6119-10170d5e80a1@amd.com>
In-Reply-To: <0ce578ba-cdc7-6084-6119-10170d5e80a1@amd.com>
From:   Yi Zhang <yi.zhang@redhat.com>
Date:   Wed, 22 Jun 2022 13:16:35 +0800
Message-ID: <CAHj4cs-c+u4F4AVNkjCvOdy7o=sAn3ni=Lt34Sa0iL0TK+rpaw@mail.gmail.com>
Subject: Re: [bug report] kmemleak from driver i2c_piix4
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 21, 2022 at 10:29 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
>
>
>
> On 6/21/22 07:48, Jean Delvare wrote:
>
> > Yi Zhang, can you please test this patch and confirm that it solves the
> > memory leak?

Yes, it was fixed by your patch, feel free to add
Tested-by: Yi Zhang <yi.zhang@redhat.com>

> >
> > Terry, please review/comment.
> >
> > If my analysis is correct then the sp5100_wdt and thinkpad_acpi drivers
> > suffer from a similar leak and need to be fixed the same way.
> >
>
> Hi Jean,
>
> Your analysis is correct. The kfree() call is missing during the release in i2c-piix4 and
> sp5100_tco driver patches. Let me know if there is anything I can do.

I guess I reproduced you mentioned sp5100_tco driver mem leak?

unreferenced object 0xffff8882aa28e580 (size 64):
  comm "systemd-udevd", pid 909, jiffies 4294723115 (age 1091.326s)
  hex dump (first 32 bytes):
    00 03 d8 fe 00 00 00 00 07 03 d8 fe 00 00 00 00  ................
    60 a3 83 c0 ff ff ff ff 00 02 40 80 00 00 00 00  `.........@.....
  backtrace:
    [<0000000000f660c7>] kmem_cache_alloc_trace+0x169/0x2a0
    [<0000000072801446>] __request_region+0x52/0xb0
    [<00000000b6580dac>] sp5100_tco_probe+0x5c7/0x98e [sp5100_tco]
    [<00000000a4d2b832>] platform_probe+0xad/0x200
    [<00000000de5f0bc2>] really_probe+0x389/0x9b0
    [<0000000066128dc6>] __driver_probe_device+0x2bc/0x470
    [<00000000c11a18e4>] driver_probe_device+0x4a/0x120
    [<0000000030500515>] __device_attach_driver+0x1b3/0x280
    [<000000003bdf095d>] bus_for_each_drv+0x11f/0x1b0
    [<00000000c321e46b>] __device_attach+0x205/0x3c0
    [<000000003d858a16>] bus_probe_device+0x1a6/0x260
    [<000000005df24665>] device_add+0xa2c/0x1ae0
    [<000000000ce86b32>] platform_device_add+0x2c2/0x710
    [<000000009c49c0a6>] platform_device_register_full+0x34b/0x470
    [<00000000cfb75755>] 0xffffffffc08e80fa
    [<000000002fe1be8f>] do_one_initcall+0xfb/0x580

(gdb) l *(sp5100_tco_probe+0x5c7)
0xc17 is in sp5100_tco_probe (drivers/watchdog/sp5100_tco.c:349).
344 struct resource *res;
345 void __iomem *addr;
346 int ret;
347 u32 val;
348
349 res = request_mem_region_muxed(EFCH_PM_ACPI_MMIO_PM_ADDR,
350        EFCH_PM_ACPI_MMIO_PM_SIZE,
351        "sp5100_tco");
352
353 if (!res) {

>


-- 
Best Regards,
  Yi Zhang

