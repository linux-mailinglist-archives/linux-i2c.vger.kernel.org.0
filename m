Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB54E6EC7A4
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 10:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjDXII7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 04:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjDXII6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 04:08:58 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A77110F5;
        Mon, 24 Apr 2023 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682323737; x=1713859737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p3wjA/hQJYR8MaFPebNd7S1hnAOnRnPI9Oq3vyiBOfE=;
  b=OrVGtsZUaKRiPDCflx3Ej8oLEajM9GJHUatGc2OcQLWTrbcSK776a9Tq
   O4whl/TMWnYzzHS9SMina4vHgSwx9W9+9jFp1nkU9hu1P7eWookqbMucU
   vCSQsQLze5rXG2VMCwx2DYc9fdIJO1GkHgiVenxZvz+PVc8Kp+y5UBiHa
   LylJJcmQwz3N9Jv8UpLqYHzhoG8kmcV3RJ8GAI3xl/IA+/ZvAAP4H8Ql2
   I18c5GTfVXNaWrYMOq+fPeKBRQj1bYdduk46hkTbinikwHeEcwiTH+8ta
   SA8qOTpZN7hwjYx3fABVrOI4pnadN7fk7TZCbhIkIeoeHJIkKqTXma5vR
   g==;
X-IronPort-AV: E=Sophos;i="5.99,222,1677538800"; 
   d="scan'208";a="30508122"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Apr 2023 10:08:54 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 24 Apr 2023 10:08:54 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 24 Apr 2023 10:08:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682323734; x=1713859734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p3wjA/hQJYR8MaFPebNd7S1hnAOnRnPI9Oq3vyiBOfE=;
  b=ErrNJqRKgHqA9fL/GH0LTY99ZEqiih62SKTLsX/nCOpFycYQ9O8x/wv/
   SCO/mSyd4oAKoBSoacLkZ86bgF0IgQDQwHwHqyNuHOnIEVyoF53A+16gO
   lVn5A//8TLX9WzJs3bqTbiHx+KL0VJ186eQAWO1qzfrEiVCWiSHOZB4lV
   EIbxuVRjqb+F7B0Jykg409ca7IDiNktqQy7iJRalxCpsBseZNZHruPvm9
   /xWCxpq4Ne99DpogHNQ8DoLfb1VMvDPjCthYeLv1n5G6KG95WxRsNu0ey
   0rCoEW8iQueryqR4R86o8RasrtnhMQ5bh9h/Iip9YpzPJZ3vA1Zc2ypEW
   A==;
X-IronPort-AV: E=Sophos;i="5.99,222,1677538800"; 
   d="scan'208";a="30508120"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Apr 2023 10:08:54 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4E73D280072;
        Mon, 24 Apr 2023 10:08:54 +0200 (CEST)
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
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Date:   Mon, 24 Apr 2023 10:08:51 +0200
Message-ID: <2679028.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
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

Am Freitag, 10. M=E4rz 2023, 14:08:15 CEST schrieb A. Sverdlin:
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
> fs-value/2332 is trying to acquire lock:
> ffff8000096cae08 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock
>=20
> but task is already holding lock:
> ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at:
> i2c_adapter_lock_bus
>=20
> which lock already depends on the new lock.
>=20
> the existing dependency chain (in reverse order) is:
>=20
> -> #2 (i2c_register_adapter){+.+.}-{3:3}:
>        lock_acquire
>        rt_mutex_lock_nested
>        i2c_adapter_lock_bus
>        i2c_transfer
>        regmap_i2c_read
>        _regmap_raw_read
>        _regmap_bus_read
>        _regmap_read
>        regmap_read
>        pcf85063_probe
>        i2c_device_probe
>        really_probe
>        __driver_probe_device
>        driver_probe_device
>        __device_attach_driver
>        bus_for_each_drv
>        __device_attach
>        device_initial_probe
>        bus_probe_device
>        device_add
>        device_register
>        i2c_new_client_device
>        of_i2c_register_devices
>        i2c_register_adapter
>        __i2c_add_numbered_adapter
>        i2c_add_adapter
>        lpi2c_imx_probe
>        platform_probe
>        really_probe
>        __driver_probe_device
>        driver_probe_device
>        __device_attach_driver
>        bus_for_each_drv
>        __device_attach
>        device_initial_probe
>        bus_probe_device
>        deferred_probe_work_func
>        process_one_work
>        worker_thread
>        kthread
>        ret_from_fork
>=20
> -> #1 (rtc_pcf85063:560:(&config->regmap)->lock){+.+.}-{3:3}:
>        lock_acquire
>        __mutex_lock
>        mutex_lock_nested
>        regmap_lock_mutex
>        regmap_read
>        pcf85063_clkout_recalc_rate
>        __clk_register
>        devm_clk_register
>        pcf85063_probe
>        i2c_device_probe
>        really_probe
>        __driver_probe_device
>        driver_probe_device
>        __device_attach_driver
>        bus_for_each_drv
>        __device_attach
>        device_initial_probe
>        bus_probe_device
>        device_add
>        device_register
>        i2c_new_client_device
>        of_i2c_register_devices
>        i2c_register_adapter
>        __i2c_add_numbered_adapter
>        i2c_add_adapter
>        lpi2c_imx_probe
>        platform_probe
>        really_probe
>        __driver_probe_device
>        driver_probe_device
>        __device_attach_driver
>        bus_for_each_drv
>        __device_attach
>        device_initial_probe
>        bus_probe_device
>        deferred_probe_work_func
>        process_one_work
>        worker_thread
>        kthread
>        ret_from_fork
>=20
> -> #0 (prepare_lock){+.+.}-{3:3}:
>        __lock_acquire
>        lock_acquire.part.0
>        lock_acquire
>        __mutex_lock
>        mutex_lock_nested
>        clk_prepare_lock
>        clk_get_rate
>        lpi2c_imx_xfer
>        __i2c_transfer
>        i2c_transfer
>        regmap_i2c_read
>        _regmap_raw_read
>        regmap_raw_read
>        regmap_bulk_read
>        at24_read
>        nvmem_reg_read
>        bin_attr_nvmem_read
>        sysfs_kf_bin_read
>        kernfs_fop_read_iter
>        new_sync_read
>        vfs_read
>        ksys_read
>        __arm64_sys_read
>        invoke_syscall
>        ...
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
>  #0: ffff0000146eb288 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_read_iter
>  #1: ffff000010fe4400 (kn->active#72){.+.+}-{0:0}, at: kernfs_fop_read_it=
er
>  #2: ffff0000110168e8 (&at24->lock){+.+.}-{3:3}, at: at24_read
>  #3: ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at:
> i2c_adapter_lock_bus
>=20
> stack backtrace:
> CPU: 1 PID: 2332 Comm: ... Tainted: G           O      5.15.71+... #1
> Hardware name: ... (DT)
> Call trace:
>  dump_backtrace
>  show_stack
>  dump_stack_lvl
>  dump_stack
>  print_circular_bug
>  check_noncircular
>  __lock_acquire
>  lock_acquire.part.0
>  lock_acquire
>  __mutex_lock
>  mutex_lock_nested
>  clk_prepare_lock
>  clk_get_rate
>  lpi2c_imx_xfer
>  __i2c_transfer
>  i2c_transfer
>  regmap_i2c_read
>  _regmap_raw_read
>  regmap_raw_read
>  regmap_bulk_read
>  at24_read
>  nvmem_reg_read
>  bin_attr_nvmem_read
>  sysfs_kf_bin_read
>  kernfs_fop_read_iter
>  new_sync_read
>  vfs_read
>  ksys_read
>  __arm64_sys_read
>  invoke_syscall
>  ...
>=20
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Note: [1] needs to be applied as well in order to get rid of all the lockde=
p=20
errors.

[1] https://lore.kernel.org/linux-i2c/20230424080627.20564-1-alexander.stei=
n@ew.tq-group.com/T/#u

> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 33 +++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> Changelog:
> v3: fixed build error reported by kernel test robot <lkp@intel.com>
>   =20
> https://lore.kernel.org/oe-kbuild-all/202303102010.pAv56wKs-lkp@intel.com/
> v2: added clk_notifier as Alexander suggested
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> b/drivers/i2c/busses/i2c-imx-lpi2c.c index 188f2a36d2fd6..5f1d1d4e018bd
> 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -100,6 +100,8 @@ struct lpi2c_imx_struct {
>  	__u8			*rx_buf;
>  	__u8			*tx_buf;
>  	struct completion	complete;
> +	struct notifier_block	clk_change_nb;
> +	unsigned int		rate_per;
>  	unsigned int		msglen;
>  	unsigned int		delivered;
>  	unsigned int		block_data;
> @@ -198,24 +200,37 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct
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
> +		lpi2c_imx->rate_per =3D ndata->new_rate;
> +
> +	return NOTIFY_OK;
> +}
> +
>  /* CLKLO =3D I2C_CLK_RATIO * CLKHI, SETHOLD =3D CLKHI, DATAVD =3D CLKHI/=
2 */
>  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  {
>  	u8 prescale, filt, sethold, clkhi, clklo, datavd;
> -	unsigned int clk_rate, clk_cycle;
> +	unsigned int clk_cycle;
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
> +		clk_cycle =3D lpi2c_imx->rate_per / ((1 << prescale) *=20
lpi2c_imx->bitrate)
>  			    - 3 - (filt >> 1);
>  		clkhi =3D (clk_cycle + I2C_CLK_RATIO) / (I2C_CLK_RATIO + 1);
>  		clklo =3D clk_cycle - clkhi;
> @@ -588,6 +603,18 @@ static int lpi2c_imx_probe(struct platform_device
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
> +	lpi2c_imx->rate_per =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> +	if (!lpi2c_imx->rate_per) {
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


