Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC13617C57
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 13:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbiKCMRs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 08:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbiKCMRq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 08:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9901A103B
        for <linux-i2c@vger.kernel.org>; Thu,  3 Nov 2022 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667477811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XQIS1g5N3Td/KW9rxVua6nawotRcVtOKOLiLxWVz3/c=;
        b=TbADWdg8xBPl141V55DVmcILTA9YL/g/9ltjnEuAH5HM+2o9sPhZQvm+4Bwqfs7fB/o6Eb
        BWgS/X6sSiIeQBvdT+E5p+JRCF0F07JgZR4jTcuDpeQYk01tYzPKuxwqeIBJXFuNOFasnY
        lHG+OuXpRePuyfoxUOZrjb2f3qYSy10=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-7cp7_KK9NlCdgYzcbtbPKw-1; Thu, 03 Nov 2022 08:16:50 -0400
X-MC-Unique: 7cp7_KK9NlCdgYzcbtbPKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 068DF8027EA;
        Thu,  3 Nov 2022 12:16:50 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.39.192.98])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 77FF71121325;
        Thu,  3 Nov 2022 12:16:48 +0000 (UTC)
Date:   Thu, 3 Nov 2022 13:16:45 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Sven =?utf-8?Q?Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>,
        Rishi Gupta <gupt21@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: NULL pointer dereferences in hid-mcp2221
Message-ID: <20221103121645.jott66kltaz6bljq@mail.corp.redhat.com>
References: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
 <caa425d9-e3a2-3764-6191-b308d94ac549@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caa425d9-e3a2-3764-6191-b308d94ac549@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Nov 02 2022, Randy Dunlap wrote:
> Hi--
> 
> [adding linux-input mailing list]
> 
> On 10/25/22 00:39, Sven Zühlsdorf wrote:
> > Hi,
> > 
> > I've run into two NULL pointer dereferences when loading the MCP2221 driver.
> > Initially I observed them running the kernel used by yocto kirkstone
> > (currently 5.15.68) but can reproduce them with a vanilla 6.1-rc1 as well.
> > All line numbers below are for hid-mcp2221.c, taken from 6.1-rc1.
> > 
> > The first one was easy to identify, in mcp2221_probe line 874 `hdev->hidraw`
> > was NULL since I compiled the kernel without CONFIG_HIDRAW enabled. Should
> > CONFIG_HID_MCP2221 perhaps depend on or imply CONFIG_HIDRAW?
> 
> Looks to me like it should. Hopefully the HID people can chime in here.

I actually don't see why this driver (and hid-cp2112.c FWIW) should
depend on hidraw. To me, the reference to hidraw is just a nicer logging
message, but I have a hard time understanding how hidraw should be
involved in the driver, and if it were, how it could not break
everything.

So IMO, we should probably change that line from the 2 drivers and
replace the hidraw part with the hid->id number which is unique.

Cheers,
Benjamin

> 
> I can't help with the second issue. Rishi?
> 
> > For the second one however, I'm stuck. The dereference happens at the top of
> > mcp_smbus_xfer since i2c_get_adapdata in line 307 returned NULL. Looking at
> > the call trace (see [dmesg output] below), mcp_smbus_xfer gets called
> > indirectly from mcp2221_probe via i2c_add_adapter in line 876, directly
> > before a call to i2c_set_adapdata. Since I couldn't identify another call to
> > i2c_set_adapdata or a write to `mcp->adapter.dev.driver_data` that could
> > potentially have initialized that field, I attempted to swap the order of
> > calling i2c_set_adapdata and i2c_add_adapter, see [attempted fix] below. While
> > the driver now loads without issue, no devices appear on the i2c bus:
> > # i2cdetect -l
> > i2c-0   smbus           SMBus I801 adapter at 5000              SMBus adapter
> > i2c-1   i2c             MCP2221 usb-i2c bridge on hidraw0       I2C adapter
> > # i2cdetect -y 1
> >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > 00:                         -- -- -- -- -- -- -- -- 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 70: -- -- -- -- -- -- -- --
> > 
> > 
> > When booting a distribution kernel (Ubunutu 22.04 with kernel 5.15.39) the bus
> > is populated as expected:
> > # i2cdetect -l
> > i2c-0   smbus           SMBus CMI adapter cmi                   SMBus adapter
> > i2c-1   smbus           SMBus iSMT adapter at 20fffab9000       SMBus adapter
> > i2c-2   smbus           SMBus I801 adapter at 5000              SMBus adapter
> > i2c-3   i2c             MCP2221 usb-i2c bridge on hidraw0       I2C adapter
> > # i2cdetect -y 3
> >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > 00:                         -- -- -- -- -- -- -- --
> > 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 20: 20 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 30: -- -- -- -- -- -- -- -- -- -- -- 3b -- -- -- --
> > 40: -- -- -- -- -- -- -- -- UU -- -- -- UU -- -- --
> > 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 70: 70 -- -- -- -- -- -- --
> > 
> > In the patches applied by Ubuntu I couldn't find anything that'd explain this
> > change in behavior. Regarding their kernel configuration the situation is
> > similar: Even incorporating almost all of Ubuntu's additions (minus some
> > signing and integrity stuff) into the config I've been using results in the
> > NULL pointer dereference in mcp_smbus_xfer. Since this still might be a case of
> > me missing some config options, I'll post my config in a response to this mail.
> > 
> > 
> > There seem to be two recent patch series for this driver:
> > https://lore.kernel.org/all/20221001005208.8010-1-matt.ranostay@konsulko.com/
> > https://lore.kernel.org/all/20220926202239.16379-1-Enrik.Berkhan@inka.de/
> > I tested both, but the behavior stays the same.
> > 
> > [attempted fix]
> > --- a/drivers/hid/hid-mcp2221.c    2022-09-19 09:31:22.539691089 +0200
> > +++ b/drivers/hid/hid-mcp2221.c    2022-09-20 15:21:37.576196331 +0200
> > @@ -873,12 +873,22 @@
> >              "MCP2221 usb-i2c bridge on hidraw%d",
> >              ((struct hidraw *)hdev->hidraw)->minor);
> > 
> > +    int adapdata_change = 0;
> > +    if(!i2c_get_adapdata(&mcp->adapter))
> > +    {
> > +        adapdata_change = 1;
> > +        hid_warn(hdev, "got NULL adapdata\n");
> > +        i2c_set_adapdata(&mcp->adapter, mcp);
> > +    }
> >      ret = i2c_add_adapter(&mcp->adapter);
> >      if (ret) {
> > +        if(adapdata_change)
> > +        {
> > +            i2c_set_adapdata(&mcp->adapter, NULL);
> > +        }
> >          hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
> >          goto err_i2c;
> >      }
> > -    i2c_set_adapdata(&mcp->adapter, mcp);
> > 
> >      /* Setup GPIO chip */
> >      mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
> > 
> > [dmesg output]
> > Shortened to just the trace, I'll post the full dmesg output in a response to
> > this mail.
> > [    1.898107] usb 1-3.4: new full-speed USB device number 5 using xhci_hcd
> > [    1.990607] cdc_acm 1-3.4:1.0: ttyACM1: USB ACM device
> > [    1.991509] hid-generic 0003:04D8:00DD.0003: hiddev96,hidraw2: USB HID v1.11 Device [Microchip Technology Inc. MCP2221 USB-I2C/UART Combo] on usb-0000:00:1e.0-3.4/input2
> > [    1.998390] mcp2221 0003:04D8:00DD.0003: hidraw2: USB HID v1.11 Device [Microchip Technology Inc. MCP2221 USB-I2C/UART Combo] on usb-0000:00:1e.0-3.4/input2
> > [    2.050149] i2c_dev: adapter [MCP2221 usb-i2c bridge on hidraw2] registered as minor 1
> > [    2.050166] i2c i2c-1: adapter [MCP2221 usb-i2c bridge on hidraw2] registered
> > [    2.050173] i2c i2c-1: found normal entry for adapter 1, addr 0x48
> > [    2.050179] BUG: kernel NULL pointer dereference, address: 0000000000000000
> > [    2.057180] #PF: supervisor read access in kernel mode
> > [    2.062347] #PF: error_code(0x0000) - not-present page
> > [    2.067517] PGD 0 P4D 0 [    2.070069] Oops: 0000 [#1] PREEMPT SMP
> > [    2.073931] CPU: 7 PID: 287 Comm: systemd-udevd Not tainted 6.1.0-rc1-yocto-standard-upstream #1
> > [    2.082761] Hardware name: Default string Default string/Default string, BIOS 1.01.10.AR01 08/05/2022
> > [    2.092025] RIP: 0010:mcp_smbus_xfer+0x29/0x348 [hid_mcp2221]
> > [    2.097811] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 45 89 cd 41 54 45 89 c4 53 48 83 ec 08 48 8b 9f e8 00 00 00 89 75 d4 89 4d d0 <48> 8b 3b 48 8b 87 b8 1b 00 00 48 8b 40 20 48 85 c0 74 07 be 20 00
> > [    2.116673] RSP: 0018:ffffa6c4409ab748 EFLAGS: 00010296
> > [    2.121929] RAX: ffffffffc0509fc0 RBX: 0000000000000000 RCX: 0000000000000000
> > [    2.129104] RDX: 0000000000000000 RSI: 0000000000000048 RDI: ffff9957c69b5830
> > [    2.136278] RBP: ffffa6c4409ab778 R08: 0000000000000000 R09: 0000000000000000
> > [    2.143450] R10: ffff995b3fede000 R11: ffff995b3ff8e000 R12: 0000000000000000
> > [    2.150625] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > [    2.157797] FS:  00007f5b4ee65600(0000) GS:ffff995b301c0000(0000) knlGS:0000000000000000
> > [    2.165932] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    2.171710] CR2: 0000000000000000 CR3: 0000000108c9b002 CR4: 0000000000770ee0
> > [    2.178884] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [    2.186059] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [    2.193232] PKRU: 55555554
> > [    2.195959] Call Trace:
> > [    2.198423]  <TASK>
> > [    2.200540]  __i2c_smbus_xfer+0x105/0x3d0
> > [    2.204578]  ? mcp_i2c_xfer+0x160/0x160 [hid_mcp2221]
> > [    2.209663]  i2c_smbus_xfer+0x62/0xe0
> > [    2.213350]  i2c_default_probe+0xf1/0x130
> > [    2.217384]  i2c_detect.isra.0.cold+0xf4/0x220
> > [    2.229989]  ? kernfs_add_one+0xe8/0x130
> > [    2.233941]  ? preempt_count_add+0x7a/0xc0
> > [    2.238063]  ? _raw_spin_lock_irqsave+0x1e/0x50
> > [    2.242623]  ? __process_new_driver+0x30/0x30
> > [    2.247007]  __process_new_adapter+0x18/0x20
> > [    2.251304]  bus_for_each_drv+0x82/0xd0
> > [    2.255167]  i2c_register_adapter.cold+0x133/0x1f4
> > [    2.259990]  i2c_add_adapter+0x5c/0x80
> > [    2.263764]  mcp2221_probe+0x138/0x250 [hid_mcp2221]
> > [    2.268762]  ? hid_lookup_quirk+0x7f/0x190
> > [    2.272884]  hid_device_probe+0xf5/0x160
> > [    2.285748]  really_probe+0xdf/0x290
> > [    2.298964]  ? pm_runtime_barrier+0x55/0x90
> > [    2.311392]  __driver_probe_device+0x78/0xe0
> > [    2.323310]  driver_probe_device+0x24/0xe0
> > [    2.327431]  __device_attach_driver+0x7d/0x100
> > [    2.337243]  ? driver_allows_async_probing+0x60/0x60
> > [    2.348108]  bus_for_each_drv+0x82/0xd0
> > [    2.351969]  ? __hid_register_driver+0x90/0x90
> > [    2.356439]  __device_attach+0xc1/0x1f0
> > [    2.360302]  ? __hid_register_driver+0x90/0x90
> > [    2.364773]  device_attach+0x10/0x20
> > [    2.368372]  device_reprobe+0x4a/0x90
> > [    2.372059]  __hid_bus_reprobe_drivers+0x56/0x60
> > [    2.376704]  bus_for_each_dev+0x7c/0xc0
> > [    2.386344]  ? hid_destroy_device+0x60/0x60
> > [    2.390554]  __hid_bus_driver_added+0x2c/0x40
> > [    2.394937]  bus_for_each_drv+0x82/0xd0
> > [    2.398800]  __hid_register_driver+0x7d/0x90
> > [    2.403096]  ? 0xffffffffc07c2000
> > [    2.406434]  mcp2221_driver_init+0x23/0x1000 [hid_mcp2221]
> > [    2.411955]  do_one_initcall+0x4f/0x210
> > [    2.415817]  ? kmalloc_trace+0x2a/0xa0
> > [    2.419593]  do_init_module+0x52/0x200
> > [    2.423367]  load_module+0x1a78/0x1c50
> > [    2.427142]  __do_sys_finit_module+0xbb/0x110
> > [    2.431525]  ? __do_sys_finit_module+0xbb/0x110
> > [    2.436086]  __x64_sys_finit_module+0x18/0x20
> > [    2.440469]  do_syscall_64+0x3d/0x90
> > [    2.444070]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> > [    2.449154] RIP: 0033:0x7f5b4efc202d
> > [    2.452755] Code: c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 4d 0e 00 f7 d8 64 89 01 48
> > [    2.471614] RSP: 002b:00007ffe16a04a18 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > [    2.479225] RAX: ffffffffffffffda RBX: 00005651bb4c0670 RCX: 00007f5b4efc202d
> > [    2.479226] RDX: 0000000000000000 RSI: 00007f5b4f13636b RDI: 0000000000000006
> > [    2.479227] RBP: 00007ffe16a04a40 R08: 0000000000000000 R09: 0000000000000000
> > [    2.491744] R10: 0000000000000006 R11: 0000000000000246 R12: 00007f5b4f13636b
> > [    2.491745] R13: 0000000000000000 R14: 0000000000020000 R15: 00005651bb4c0670
> > [    2.491748]  </TASK>
> > [    2.506091] Modules linked in: hid_mcp2221(+) ice(+) igc
> > [    2.519128]  sch_fq_codel tmp421 configfs
> > [    2.519132] CR2: 0000000000000000
> > [    2.528505] ---[ end trace 0000000000000000 ]---
> > [    2.566155] RIP: 0010:mcp_smbus_xfer+0x29/0x348 [hid_mcp2221]
> > [    2.587646] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 45 89 cd 41 54 45 89 c4 53 48 83 ec 08 48 8b 9f e8 00 00 00 89 75 d4 89 4d d0 <48> 8b 3b 48 8b 87 b8 1b 00 00 48 8b 40 20 48 85 c0 74 07 be 20 00
> > [    2.587648] RSP: 0018:ffffa6c4409ab748 EFLAGS: 00010296
> > [    2.598855] RAX: ffffffffc0509fc0 RBX: 0000000000000000 RCX: 0000000000000000
> > [    2.598856] RDX: 0000000000000000 RSI: 0000000000000048 RDI: ffff9957c69b5830
> > [    2.608406] RBP: ffffa6c4409ab778 R08: 0000000000000000 R09: 0000000000000000
> > [    2.608407] R10: ffff995b3fede000 R11: ffff995b3ff8e000 R12: 0000000000000000
> > [    2.608408] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > [    2.618830] FS:  00007f5b4ee65600(0000) GS:ffff995b301c0000(0000) knlGS:0000000000000000
> > [    2.618832] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    2.642332] CR2: 0000000000000000 CR3: 0000000108c9b002 CR4: 0000000000770ee0
> > [    2.642333] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [    2.642334] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [    2.642335] PKRU: 55555554
> > 
> 
> -- 
> ~Randy

