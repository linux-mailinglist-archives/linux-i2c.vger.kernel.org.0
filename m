Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBCF702CC7
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 14:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241052AbjEOMdF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 08:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241854AbjEOMc5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 08:32:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33481738;
        Mon, 15 May 2023 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684153974; x=1715689974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BimgiWQfq8D4nb52g0I+bPET0u1s3lv+JZqzQj6qIno=;
  b=gtIUYUqqMBhqgRa/qT0mxoWAUCE10LzeFcsL1O9e8KDgroLZ4wTHOMe2
   8hKCm2RCikVTn1dLKs/UqJNSTCIHWF+NJyPA6h996Ad/i6X2MUDRuzjwu
   5nER7HUQe2qMIJfLFtCJqZCZpQGaHmqwUKggj6VDi0w5yarSUA3zuGCbk
   BF/+DvMYQsYIswP750JTb4Va4TJT7stcVOk9Q7RqIU++NYB0RFesoXPqf
   TufWjEP5HFh9PjJB7KkHhGkdAIR41ULFqPqMwUCzg+NFBC1A6ac3F/qLb
   nxEpoZIFPqenG9/B3Z4p428YwMmdtQDbZHDO5HvjUUqPr6N/+dglbalt9
   A==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677538800"; 
   d="scan'208";a="30909061"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 May 2023 14:32:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 15 May 2023 14:32:51 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 15 May 2023 14:32:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684153971; x=1715689971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BimgiWQfq8D4nb52g0I+bPET0u1s3lv+JZqzQj6qIno=;
  b=Uhx9ZJoo+INu8QcwC7bxfF2thoA422wNNp9gkGEdNggx5jcIQhQa7ai2
   j62dkwlgsDgiRpSik9TVPnv/ntS44QlrS1yk1XPIISkNZvXNPO5vW0ESZ
   BdYStS0NDu2wnRq3ShHDOoCnQ/iy000cgT4mtKzjmG2T3wcD2duntID7q
   lU9/u0Zu2hC/SYW+W6SDa8GfYoGfVJMSCfMya9WZqUBEs0lwe5uymwagS
   vk1x0DTEMONOZIxCh0BiFMPs1vJKWZ7938Eb5SYlkhi5PXH+R5pJXdIez
   c1Uf4TZe5/Bfy60I++k1gRVsjllM+uT3SazYcW0gBqJF50PLCUtJ5kZ2q
   w==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677538800"; 
   d="scan'208";a="30909060"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 May 2023 14:32:50 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AA5D4280056;
        Mon, 15 May 2023 14:32:50 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc:     "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Date:   Mon, 15 May 2023 14:32:50 +0200
Message-ID: <8299946.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e60c6055ad3902031e3bb632b7503ff68a9c215d.camel@siemens.com>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com> <1933234.tdWV9SEqCh@steina-w> <e60c6055ad3902031e3bb632b7503ff68a9c215d.camel@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

Am Montag, 15. Mai 2023, 14:04:10 CEST schrieb Sverdlin, Alexander:
> Hello Alexander!
>=20
> On Mon, 2023-05-15 at 11:11 +0200, Alexander Stein wrote:
>=20
> > > [   22.503179] other info that might help us debug this:
> > > [   22.503179]
> > > [   22.503183] Chain exists of:
> > > [   22.503183]   prepare_lock --> rtc_pcf85063:594:(&config-
> > >=20
> > > >regmap)->lock
> > >=20
> > > --> i2c_register_adapter
> > > [   22.503183]
> > > [   22.503207]  Possible unsafe locking scenario:
> > > [   22.503207]
> > > [   22.503210]        CPU0                    CPU1
> > > [   22.503213]        ----                    ----
> > > [   22.503216]   lock(i2c_register_adapter);
> > > [   22.503225]                              =20
> > > lock(rtc_pcf85063:594:(&config-
> > >=20
> > > > regmap)->lock);
> > >=20
> > >=20
> > > [   22.503235]                              =20
> > > lock(i2c_register_adapter);
> > > [   22.503244]   lock(prepare_lock);
> > > [   22.503253]
> > > [   22.503253]  *** DEADLOCK ***
> > >=20
> > > Now lpi2c_runtime_resume will call into clk_prepare() which also
> > > calls
> > > clk_prepare_lock() (identical to clk_get_rate).
> > >=20
> > > Best regards,
> > > Alexader
> > >=20
> > >=20
> > > >         pm_runtime_set_autosuspend_delay(&pdev->dev,
> > > > I2C_PM_TIMEOUT);
> > > >         pm_runtime_use_autosuspend(&pdev->dev);
> > > >         pm_runtime_get_noresume(&pdev->dev);
> >=20
> >=20
> > With commit fa39065833db ("i2c: imx-lpi2c: avoid taking clk_prepare
> > mutex in=20
> > PM callbacks") in place, the additional deadlock warning regarding
> > runtime=20
> > resume is gone.
> > So only the ordering issue needs to be addressed.
>=20
>=20
> Unfortunately with both your (backported) and my patches applied I've
> got a 3rd warning:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> 5.15.71+git8e43aee #1 Tainted: G           O    =20
> ------------------------------------------------------
> xxxxxxx/2238 is trying to acquire lock:
> ffff0000040bda40 (&desc->request_mutex){+.+.}-{3:3}, at:
> __setup_irq+0xbc/0x8bc
>=20
> but task is already holding lock:
> ffff000010ef1100 (i2c_register_adapter){+.+.}-{3:3}, at:
> i2c_adapter_lock_bus+0x2c/0x3c
>=20
> which lock already depends on the new lock.
>=20
>=20
> the existing dependency chain (in reverse order) is:
>=20
> -> #5 (i2c_register_adapter){+.+.}-{3:3}:
>        lock_acquire+0x68/0x84
>        rt_mutex_lock_nested+0x88/0xe0
>        i2c_adapter_lock_bus+0x2c/0x3c
>        i2c_transfer+0x58/0x130
>        regmap_i2c_read+0x64/0xb0
>        _regmap_raw_read+0x114/0x440
>        _regmap_bus_read+0x4c/0x84
>        _regmap_read+0x6c/0x270
>        regmap_read+0x54/0x80
>        pcf85063_probe+0xec/0x4cc
>        i2c_device_probe+0x10c/0x350
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        device_add+0x398/0x8ac
>        device_register+0x28/0x40
>        i2c_new_client_device+0x144/0x290
>        of_i2c_register_devices+0x18c/0x230
>        i2c_register_adapter+0x1dc/0x6b0
>        __i2c_add_numbered_adapter+0x68/0xbc
>        i2c_add_adapter+0xb0/0xe0
>        lpi2c_imx_probe+0x3a4/0x670
>        platform_probe+0x70/0xec
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        deferred_probe_work_func+0xb8/0x110
>        process_one_work+0x27c/0x6c4
>        worker_thread+0x7c/0x450
>        kthread+0x168/0x17c
>        ret_from_fork+0x10/0x20
>=20
> -> #4 (rtc_pcf85063:560:(&config->regmap)->lock){+.+.}-{3:3}:
>        lock_acquire+0x68/0x84
>        __mutex_lock+0xa8/0x4d0
>        mutex_lock_nested+0x48/0x54
>        regmap_lock_mutex+0x1c/0x30
>        regmap_read+0x44/0x80
>        pcf85063_clkout_recalc_rate+0x34/0x80
>        __clk_register+0x520/0x880
>        devm_clk_register+0x64/0xc4
>        pcf85063_probe+0x24c/0x4cc
>        i2c_device_probe+0x10c/0x350
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        device_add+0x398/0x8ac
>        device_register+0x28/0x40
>        i2c_new_client_device+0x144/0x290
>        of_i2c_register_devices+0x18c/0x230
>        i2c_register_adapter+0x1dc/0x6b0
>        __i2c_add_numbered_adapter+0x68/0xbc
>        i2c_add_adapter+0xb0/0xe0
>        lpi2c_imx_probe+0x3a4/0x670
>        platform_probe+0x70/0xec
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        deferred_probe_work_func+0xb8/0x110
>        process_one_work+0x27c/0x6c4
>        worker_thread+0x7c/0x450
>        kthread+0x168/0x17c
>        ret_from_fork+0x10/0x20
>=20
> -> #3 (prepare_lock){+.+.}-{3:3}:
>        lock_acquire+0x68/0x84
>        __mutex_lock+0xa8/0x4d0
>        mutex_lock_nested+0x48/0x54
>        clk_prepare_lock+0x50/0xb0
>        clk_prepare+0x28/0x50
>        fec_runtime_resume+0x3c/0xe0
>        pm_generic_runtime_resume+0x34/0x50
>        __genpd_runtime_resume+0x38/0x90
>        genpd_runtime_resume+0xa0/0x304
>        __rpm_callback+0x50/0x1b0
>        rpm_callback+0x40/0x80
>        rpm_resume+0x448/0x6e0
>        __pm_runtime_resume+0x50/0xc0
>        fec_enet_mdio_read+0x48/0x190
>        __mdiobus_read+0x48/0xb0
>        mdiobus_read_nested+0x48/0x70
>        mv88e6xxx_smi_dual_direct_read+0x2c/0x50
>        mv88e6xxx_read+0x64/0xf0
>        mv88e6xxx_g1_read+0x28/0x34
>        mv88e6xxx_g1_irq_thread_work+0x50/0x17c
>        mv88e6xxx_irq_poll+0x28/0x50
>        kthread_worker_fn+0x100/0x480
>        kthread+0x168/0x17c
>        ret_from_fork+0x10/0x20
>=20
> -> #2 (&bus->mdio_lock/2){+.+.}-{3:3}:
>        lock_acquire+0x68/0x84
>        __mutex_lock+0xa8/0x4d0
>        mutex_lock_nested+0x48/0x54
>        mdiobus_read_nested+0x38/0x70
>        mv88e6xxx_smi_dual_direct_read+0x2c/0x50
>        mv88e6xxx_read+0x64/0xf0
>        mv88e6xxx_port_read+0x24/0x30
>        mv88e6xxx_probe+0x250/0x7f0
>        mdio_probe+0x3c/0x80
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        deferred_probe_work_func+0xb8/0x110
>        process_one_work+0x27c/0x6c4
>        worker_thread+0x7c/0x450
>        kthread+0x168/0x17c
>        ret_from_fork+0x10/0x20
>=20
> -> #1 (&chip->reg_lock){+.+.}-{3:3}:
>        lock_acquire+0x68/0x84
>        __mutex_lock+0xa8/0x4d0
>        mutex_lock_nested+0x48/0x54
>        mv88e6xxx_g1_irq_bus_lock+0x24/0x30
>        __setup_irq+0x6e0/0x8bc
>        request_threaded_irq+0xf4/0x1b4
>        mv88e6xxx_g2_irq_setup+0x1f0/0x2b4
>        mv88e6xxx_probe+0x480/0x7f0
>        mdio_probe+0x3c/0x80
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        deferred_probe_work_func+0xb8/0x110
>        process_one_work+0x27c/0x6c4
>        worker_thread+0x7c/0x450
>        kthread+0x168/0x17c
>        ret_from_fork+0x10/0x20
>=20
> -> #0 (&desc->request_mutex){+.+.}-{3:3}:
>        __lock_acquire+0x12a4/0x20a0
>        lock_acquire.part.0+0xe0/0x230
>        lock_acquire+0x68/0x84
>        __mutex_lock+0xa8/0x4d0
>        mutex_lock_nested+0x48/0x54
>        __setup_irq+0xbc/0x8bc
>        request_threaded_irq+0xf4/0x1b4
>        devm_request_threaded_irq+0x88/0x104
>        lpi2c_runtime_resume+0x70/0xe4

This looks like the NXP downstream kernel, requesting the IRQ from within=20
runtime resume.

>        pm_generic_runtime_resume+0x34/0x50
>        __genpd_runtime_resume+0x38/0x90
>        genpd_runtime_resume+0xa0/0x304
>        __rpm_callback+0x50/0x1b0
>        rpm_callback+0x74/0x80
>        rpm_resume+0x448/0x6e0
>        __pm_runtime_resume+0x50/0xc0
>        lpi2c_imx_xfer+0x60/0xa5c
>        __i2c_transfer+0x174/0xa80
>        i2c_transfer+0x68/0x130
>        regmap_i2c_read+0x64/0xb0
>        _regmap_raw_read+0x114/0x440
>        regmap_raw_read+0x19c/0x28c
>        regmap_bulk_read+0x1b8/0x244
>        at24_read+0x14c/0x2c4
>        nvmem_reg_read+0x2c/0x54
>        bin_attr_nvmem_read+0x8c/0xbc
>        sysfs_kf_bin_read+0x74/0x94
>        kernfs_fop_read_iter+0xb0/0x1d0
>        new_sync_read+0xf0/0x184
>        vfs_read+0x154/0x1f0
>        ksys_read+0x70/0x100
>        __arm64_sys_read+0x24/0x30
>        invoke_syscall+0x50/0x120
>        el0_svc_common.constprop.0+0x68/0x124
>        do_el0_svc+0x30/0x9c
>        el0_svc+0x54/0x110
>        el0t_64_sync_handler+0xa4/0x130
>        el0t_64_sync+0x1a0/0x1a4
>=20
> other info that might help us debug this:
>=20
> Chain exists of:
>   &desc->request_mutex --> rtc_pcf85063:560:(&config->regmap)->lock -->
> i2c_register_adapter
>=20
>  Possible unsafe locking scenario:
>=20
>        CPU0                    CPU1
>        ----                    ----
>   lock(i2c_register_adapter);
>                                lock(rtc_pcf85063:560:(&config->regmap)-
>=20
> >lock);
>=20
>                                lock(i2c_register_adapter);
>   lock(&desc->request_mutex);
>=20
>  *** DEADLOCK ***
>=20
> 4 locks held by xxxxxxx/2238:
>  #0: ffff000015a64488 (&of->mutex){+.+.}-{3:3}, at:
> kernfs_fop_read_iter+0x74/0x1d0
>  #1: ffff0000119e2400 (kn->active#58){.+.+}-{0:0}, at:
> kernfs_fop_read_iter+0x7c/0x1d0
>  #2: ffff0000119a26e8 (&at24->lock){+.+.}-{3:3}, at:
> at24_read+0x8c/0x2c4
>  #3: ffff000010ef1100 (i2c_register_adapter){+.+.}-{3:3}, at:
> i2c_adapter_lock_bus+0x2c/0x3c
>=20
> stack backtrace:
> CPU: 1 PID: 2238 Comm: xxxxxxx Tainted: G           O    =20
> 5.15.71+git8e43aee #1
> Hardware name: Siemens PXC5.E24 (DT)
> Call trace:
>  dump_backtrace+0x0/0x1d4
>  show_stack+0x20/0x2c
>  dump_stack_lvl+0x8c/0xb8
>  dump_stack+0x18/0x34
>  print_circular_bug+0x1f8/0x200
>  check_noncircular+0x130/0x144
>  __lock_acquire+0x12a4/0x20a0
>  lock_acquire.part.0+0xe0/0x230
>  lock_acquire+0x68/0x84
>  __mutex_lock+0xa8/0x4d0
>  mutex_lock_nested+0x48/0x54
>  __setup_irq+0xbc/0x8bc
>  request_threaded_irq+0xf4/0x1b4
>  devm_request_threaded_irq+0x88/0x104
>  lpi2c_runtime_resume+0x70/0xe4

It seems your (possible) deadlock is triggered along devm_request_irq() dur=
ing=20
resume.
As mainline just enables the clocks, there is nothing we can do here. Your=
=20
patch still is sensible, can you send a new version with the review address=
ed?=20
Thanks.

Best regards,
Alexander

>  pm_generic_runtime_resume+0x34/0x50
>  __genpd_runtime_resume+0x38/0x90
>  genpd_runtime_resume+0xa0/0x304
>  __rpm_callback+0x50/0x1b0
>  rpm_callback+0x74/0x80
>  rpm_resume+0x448/0x6e0
>  __pm_runtime_resume+0x50/0xc0
>  lpi2c_imx_xfer+0x60/0xa5c
>  __i2c_transfer+0x174/0xa80
>  i2c_transfer+0x68/0x130
>  regmap_i2c_read+0x64/0xb0
>  _regmap_raw_read+0x114/0x440
>  regmap_raw_read+0x19c/0x28c
>  regmap_bulk_read+0x1b8/0x244
>  at24_read+0x14c/0x2c4
>  nvmem_reg_read+0x2c/0x54
>  bin_attr_nvmem_read+0x8c/0xbc
>  sysfs_kf_bin_read+0x74/0x94
>  kernfs_fop_read_iter+0xb0/0x1d0
>  new_sync_read+0xf0/0x184
>  vfs_read+0x154/0x1f0
>  ksys_read+0x70/0x100
>  __arm64_sys_read+0x24/0x30
>  invoke_syscall+0x50/0x120
>  el0_svc_common.constprop.0+0x68/0x124
>  do_el0_svc+0x30/0x9c
>  el0_svc+0x54/0x110
>  el0t_64_sync_handler+0xa4/0x130
>  el0t_64_sync+0x1a0/0x1a4
>=20
> So this doesn't look like an end of the story yet, unfortunately.
>=20
> --=20
> Alexander Sverdlin
> Siemens AG
> www.siemens.com


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


