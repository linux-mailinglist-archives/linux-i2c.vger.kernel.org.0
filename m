Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2219746A2C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jul 2023 08:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjGDG60 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jul 2023 02:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGDG60 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jul 2023 02:58:26 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB66BE;
        Mon,  3 Jul 2023 23:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688453904; x=1719989904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3mKvlJpyqrm8KLFesfDVIKrJmLCF5r0paQZpEMj5YGA=;
  b=TDk3DRNqfRN4vl1ODwplnuphPRNg8/4l+Cm7s1pMh5qHTM1Qhzx1aEd9
   N8QALmjprDsY/ilx6cwV4aP+QcCncW750MmElNJuvPE9krb97/9WGIZVp
   baJ0n4RwMpnp5zA87LiOgQBBg2XpdxP9oix1TgwDOKoAzGYoBcurVu3Yc
   sGlZ8nlJQ5fZ+GBhtbYzpNHePuM6pxiaGAnLaHPKK1IyZSi8xzdH3/rP8
   tJmQ18wtzv6WKhWsS4NMazQXO1ePnNkOtm1UbdiaFMMhSSFUhIwQ39YYV
   1Fe8WtFepOfZSmZiZtPrkSos0ct1k6mRa2CfqLumTTUr+5VbL0+QAeuWa
   g==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; 
   d="scan'208";a="31737652"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Jul 2023 08:58:21 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 33BCB280087;
        Tue,  4 Jul 2023 08:58:21 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     NXP Linux Team <linux-imx@nxp.com>,
        "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc:     Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] i2c: lpi2c: cache peripheral clock rate
Date:   Tue, 04 Jul 2023 08:58:20 +0200
Message-ID: <12242804.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230628115824.3470880-1-alexander.sverdlin@siemens.com>
References: <20230628115824.3470880-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mittwoch, 28. Juni 2023, 13:58:22 CEST schrieb A. Sverdlin:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> One of the reasons to do it is to save some CPU cycles on cpu_freq_get()
> under mutex. The second reason if the (false-positive) lockdep splat caus=
ed
> by the recursive feature of the "prepare_lock" (one clock instance is I2C
> peripheral clock and another is pcf85063 RTC as clock provider):
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> 5.15.71+... #1 Tainted: G           O
> ------------------------------------------------------
> .../2332 is trying to acquire lock:
> ffff8000096cae08 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x50/0x=
b0
>=20
> but task is already holding lock:
> ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at:
> i2c_adapter_lock_bus+0x2c/0x3c
>=20
> which lock already depends on the new lock.
>=20
> the existing dependency chain (in reverse order) is:
>=20
> -> #2 (i2c_register_adapter){+.+.}-{3:3}:
>        lock_acquire+0x68/0x8c
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
>        lpi2c_imx_probe+0x354/0x5e0
>        platform_probe+0x70/0xec
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        deferred_probe_work_func+0xa0/0xfc
>        process_one_work+0x2ac/0x6f4
>        worker_thread+0x7c/0x47c
>        kthread+0x150/0x16c
>        ret_from_fork+0x10/0x20
>=20
> -> #1 (rtc_pcf85063:560:(&config->regmap)->lock){+.+.}-{3:3}:
>        lock_acquire+0x68/0x8c
>        __mutex_lock+0x9c/0x4d0
>        mutex_lock_nested+0x48/0x5c
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
>        lpi2c_imx_probe+0x354/0x5e0
>        platform_probe+0x70/0xec
>        really_probe+0xc4/0x470
>        __driver_probe_device+0x11c/0x190
>        driver_probe_device+0x48/0x110
>        __device_attach_driver+0xc4/0x160
>        bus_for_each_drv+0x80/0xe0
>        __device_attach+0xb0/0x1f0
>        device_initial_probe+0x1c/0x2c
>        bus_probe_device+0xa4/0xb0
>        deferred_probe_work_func+0xa0/0xfc
>        process_one_work+0x2ac/0x6f4
>        worker_thread+0x7c/0x47c
>        kthread+0x150/0x16c
>        ret_from_fork+0x10/0x20
>=20
> -> #0 (prepare_lock){+.+.}-{3:3}:
>        __lock_acquire+0x1298/0x20d0
>        lock_acquire.part.0+0xf0/0x250
>        lock_acquire+0x68/0x8c
>        __mutex_lock+0x9c/0x4d0
>        mutex_lock_nested+0x48/0x5c
>        clk_prepare_lock+0x50/0xb0
>        clk_get_rate+0x28/0x80
>        lpi2c_imx_xfer+0xb0/0xa9c
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
>   prepare_lock --> rtc_pcf85063:560:(&config->regmap)->lock -->
> i2c_register_adapter
>=20
>  Possible unsafe locking scenario:
>=20
>        CPU0                    CPU1
>        ----                    ----
>   lock(i2c_register_adapter);
>                              =20
> lock(rtc_pcf85063:560:(&config->regmap)->lock); lock(i2c_register_adapter=
);
>   lock(prepare_lock);
>=20
>  *** DEADLOCK ***
>=20
> 4 locks held by .../2332:
>  #0: ffff0000146eb288 (&of->mutex){+.+.}-{3:3}, at:
> kernfs_fop_read_iter+0x74/0x1d0 #1: ffff000010fe4400
> (kn->active#72){.+.+}-{0:0}, at: kernfs_fop_read_iter+0x7c/0x1d0 #2:
> ffff0000110168e8 (&at24->lock){+.+.}-{3:3}, at: at24_read+0x8c/0x2c4 #3:
> ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at:
> i2c_adapter_lock_bus+0x2c/0x3c
>=20
> stack backtrace:
> CPU: 1 PID: 2332 Comm: ... Tainted: G           O      5.15.71+... #1
> Hardware name: ... (DT)
> Call trace:
>  dump_backtrace+0x0/0x1d4
>  show_stack+0x20/0x2c
>  dump_stack_lvl+0x8c/0xb8
>  dump_stack+0x18/0x34
>  print_circular_bug+0x1f8/0x200
>  check_noncircular+0x130/0x144
>  __lock_acquire+0x1298/0x20d0
>  lock_acquire.part.0+0xf0/0x250
>  lock_acquire+0x68/0x8c
>  __mutex_lock+0x9c/0x4d0
>  mutex_lock_nested+0x48/0x5c
>  clk_prepare_lock+0x50/0xb0
>  clk_get_rate+0x28/0x80
>  lpi2c_imx_xfer+0xb0/0xa9c
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
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v5: rebased onto Wolfram's i2c/for-next
> v4: switched to atomic_t
>     included clk_rate_exclusive_get()/clk_rate_exclusive_put()
> v3: fixed build error reported by kernel test robot <lkp@intel.com>

The rebase still works as intended.

Thanks and best regards,
alexander

> https://lore.kernel.org/oe-kbuild-all/202303102010.pAv56wKs-lkp@intel.com/
> v2: added clk_notifier as Alexander suggested
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 47 +++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> b/drivers/i2c/busses/i2c-imx-lpi2c.c index c3287c887c6f..02d376096707
> 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -5,6 +5,7 @@
>   * Copyright 2016 Freescale Semiconductor, Inc.
>   */
>=20
> +#include <linux/atomic.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> @@ -100,6 +101,8 @@ struct lpi2c_imx_struct {
>  	__u8			*rx_buf;
>  	__u8			*tx_buf;
>  	struct completion	complete;
> +	struct notifier_block	clk_change_nb;
> +	atomic_t		rate_per;
>  	unsigned int		msglen;
>  	unsigned int		delivered;
>  	unsigned int		block_data;
> @@ -198,25 +201,39 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct
> *lpi2c_imx) } while (1);
>  }
>=20
> +static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct clk_notifier_data *ndata =3D data;
> +	struct lpi2c_imx_struct *lpi2c_imx =3D container_of(nb,
> +							  struct=20
lpi2c_imx_struct,
> +							 =20
clk_change_nb);
> +
> +	if (action & POST_RATE_CHANGE)
> +		atomic_set(&lpi2c_imx->rate_per, ndata->new_rate);
> +
> +	return NOTIFY_OK;
> +}
> +
>  /* CLKLO =3D I2C_CLK_RATIO * CLKHI, SETHOLD =3D CLKHI, DATAVD =3D CLKHI/=
2 */
>  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  {
>  	u8 prescale, filt, sethold, datavd;
> -	unsigned int clk_rate, clk_cycle, clkhi, clklo;
> +	unsigned int clk_cycle, clkhi, clklo;
>  	enum lpi2c_imx_pincfg pincfg;
>  	unsigned int temp;
>=20
>  	lpi2c_imx_set_mode(lpi2c_imx);
>=20
> -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
>  	if (lpi2c_imx->mode =3D=3D HS || lpi2c_imx->mode =3D=3D ULTRA_FAST)
>  		filt =3D 0;
>  	else
>  		filt =3D 2;
>=20
>  	for (prescale =3D 0; prescale <=3D 7; prescale++) {
> -		clk_cycle =3D clk_rate / ((1 << prescale) * lpi2c_imx-
>bitrate)
> -			    - 3 - (filt >> 1);
> +		clk_cycle =3D atomic_read(&lpi2c_imx->rate_per) /
> +			    ((1 << prescale) * lpi2c_imx->bitrate) - 3 -
> +			    (filt >> 1);
>  		clkhi =3D DIV_ROUND_UP(clk_cycle, I2C_CLK_RATIO + 1);
>  		clklo =3D clk_cycle - clkhi;
>  		if (clklo < 64)
> @@ -594,6 +611,28 @@ static int lpi2c_imx_probe(struct platform_device
> *pdev) if (ret)
>  		return ret;
>=20
> +	lpi2c_imx->clk_change_nb.notifier_call =3D lpi2c_imx_clk_change_cb;
> +	ret =3D devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> +					 &lpi2c_imx->clk_change_nb);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "can't register peripheral clock=20
notifier\n");
> +	/*
> +	 * Lock the clock rate to avoid rate change between clk_get_rate()=20
and
> +	 * atomic_set()
> +	 */
> +	ret =3D clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't lock I2C peripheral clock=20
rate\n");
> +		return ret;
> +	}
> +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx-
>clks[0].clk));
> +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> +	if (!atomic_read(&lpi2c_imx->rate_per)) {
> +		dev_err(&pdev->dev, "can't get I2C peripheral clock=20
rate\n");
> +		return -EINVAL;
> +	}
> +
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


