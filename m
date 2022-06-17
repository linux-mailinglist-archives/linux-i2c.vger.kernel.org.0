Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4623854F859
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jun 2022 15:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381663AbiFQNde (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jun 2022 09:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381281AbiFQNde (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jun 2022 09:33:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 398CF2A24D
        for <linux-i2c@vger.kernel.org>; Fri, 17 Jun 2022 06:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655472812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5y7AngLUXh6Dj+wpNiSOVbOW64hCp3maZMWiNDddgAA=;
        b=GNVbj+9u6kMzc7ae3Gcda9pkVSECEgjiTQH/8wieN0KZOb7PFkUXNUHrYYD9kH41DPUJA7
        VaLbk+aKtMzmJzU4Urg7J24v1PHZ6xRfNzrMU5zTZ//oNyBENHEaPXLTGa8KWqHJtBtTLs
        dl375AURuvcFIyH3gv/sMrXS8fJWO+4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-hyFxgYeuOsGbjjB4SuK5SA-1; Fri, 17 Jun 2022 09:33:31 -0400
X-MC-Unique: hyFxgYeuOsGbjjB4SuK5SA-1
Received: by mail-pg1-f200.google.com with SMTP id 78-20020a630051000000b003fe25580679so2302628pga.9
        for <linux-i2c@vger.kernel.org>; Fri, 17 Jun 2022 06:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5y7AngLUXh6Dj+wpNiSOVbOW64hCp3maZMWiNDddgAA=;
        b=P3s+162Mz7aGqpLHPMQiRHjhL3tkzRWFERTsIWBHpPl1FhyXHEagOj1d1rrCDaeiQs
         iA/gmZOXhpzecHJmjiDKxwVqbxqCBuTKaQkyB2dv0pnpvjvSsLmfGCri/uRzEs3Gb1+q
         UC8kL+H7wlSlI+CDDGkEEjxMqwPD61WCzu1MbaP/Rw0uQZ9lIQjQn03HxNBmHLvEeOU5
         hEmFz6Dar9DhD8avbKElIBNMqQGygTy5Tf0u2EBUPqwVh+/H8yWd18l3rTYtuRGDFAb5
         18LWZMq9WYk9Lyc7yqCPaLdDAgjeEL/g1ktD9WX98cGxUDC86hwq0WminjIyZsjaq/4O
         9m5w==
X-Gm-Message-State: AJIora+VWnArSSKVFuqL/UkSKfhftYWiqZg0okuEeCZ4Uvko6fBiDAMA
        cblVpHKXGd+HvhM0mH9Sp8IFkqkEaaq3ZBILPuwn44dBIboDnMDB4MS6NvwyeYzci/UWpeZSu8q
        5EMWMi3TIJVg758LnHG0M0cWB08wXAODhgayO
X-Received: by 2002:a17:90b:1e4e:b0:1e3:47e4:92b6 with SMTP id pi14-20020a17090b1e4e00b001e347e492b6mr21598321pjb.47.1655472809900;
        Fri, 17 Jun 2022 06:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uONCj/ILrJOto8KFMpmX9i4tL/S7b2MyoxZUrVNJJsbRvaZ/QGCUzZMqhXN5SHeOp6MZVfYadwNuJEVbfraDo=
X-Received: by 2002:a17:90b:1e4e:b0:1e3:47e4:92b6 with SMTP id
 pi14-20020a17090b1e4e00b001e347e492b6mr21598292pjb.47.1655472809541; Fri, 17
 Jun 2022 06:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
 <20220617093818.37a721a3@endymion.delvare>
In-Reply-To: <20220617093818.37a721a3@endymion.delvare>
From:   Yi Zhang <yi.zhang@redhat.com>
Date:   Fri, 17 Jun 2022 21:33:16 +0800
Message-ID: <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
Subject: Re: [bug report] kmemleak from driver i2c_piix4
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
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

On Fri, Jun 17, 2022 at 3:48 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> Hi Yi Zhang,
>
> On Sat, 11 Jun 2022 17:08:20 +0800, Yi Zhang wrote:
> > I found this kmemleak from dmesg, pls help check it, thanks.
> >
> > unreferenced object 0xffff8882be7fa500 (size 64):
> >   comm "systemd-udevd", pid 851, jiffies 4294724190 (age 1880.031s)
> >   hex dump (first 32 bytes):
> >     00 03 d8 fe 00 00 00 00 07 03 d8 fe 00 00 00 00  ................
> >     20 95 85 c0 ff ff ff ff 00 02 40 80 00 00 00 00   .........@.....
> >   backtrace:
> >     [<00000000ee7a7c0d>] __request_region+0x4f/0xc0
> >     [<000000000a0d9a20>] piix4_sb800_region_request+0x69/0x150 [i2c_piix4]
> >     [<00000000bbbc5f63>] piix4_setup_sb800.constprop.0+0xfd/0x4a0 [i2c_piix4]
> >     [<0000000060da9710>] piix4_probe+0x111/0x780 [i2c_piix4]
> >     [<0000000061a2fccd>] local_pci_probe+0xdf/0x170
> >     [<00000000f879d262>] pci_call_probe+0x15f/0x4b0
> >     [<00000000b1b4235f>] pci_device_probe+0xee/0x230
> >     [<000000007b0612f3>] really_probe+0x3d7/0xa10
> >     [<0000000016a94cde>] __driver_probe_device+0x2ab/0x460
> >     [<00000000fc08f31f>] driver_probe_device+0x49/0x120
> >     [<00000000c7600ea6>] __driver_attach+0x1c1/0x420
> >     [<00000000d075fad5>] bus_for_each_dev+0x121/0x1a0
> >     [<000000003a0c2b72>] bus_add_driver+0x39f/0x570
> >     [<00000000389c6619>] driver_register+0x20f/0x390
> >     [<00000000e1871c0e>] do_one_initcall+0xfc/0x560
> >     [<00000000899e6968>] do_init_module+0x190/0x620
>
> Thanks for reporting.
>
> Which kernel version are you running? Are there patches applied to the
> i2c-piix4 driver?
The latest linux tree

>
> Which line of the source code does
> piix4_sb800_region_request+0x69/0x150 resolve to?

(gdb) l *(piix4_sb800_region_request+0x69)
0x2b9 is in piix4_sb800_region_request (drivers/i2c/busses/i2c-piix4.c:185).
180 {
181 if (mmio_cfg->use_mmio) {
182 struct resource *res;
183 void __iomem *addr;
184
185 res = request_mem_region_muxed(SB800_PIIX4_FCH_PM_ADDR,
186        SB800_PIIX4_FCH_PM_SIZE,
187        "sb800_piix4_smb");
188 if (!res) {
189 dev_err(dev,

>
> Which PCI device does the driver bind to? "lspci -nn | grep" SMBus
> should tell.
# lspci -nn | grep SMBus
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus
Controller [1022:790b] (rev 61)
>
> Which messages are printed to the kernel log when you load and unload
> the i2c-piix4 driver?

[ 1400.379156] piix4_smbus 0000:00:14.0: SMBus Host Controller at
0xb00, revision 0
[ 1400.379164] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus
port selection
[ 1400.381759] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host
Controller at 0xb20

>
> --
> Jean Delvare
> SUSE L3 Support
>


-- 
Best Regards,
  Yi Zhang

