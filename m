Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B620D702817
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 11:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239531AbjEOJQZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 05:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjEOJP2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 05:15:28 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0D11BF4;
        Mon, 15 May 2023 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684141921; x=1715677921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRfzZDykwbFLD+Hj/vjIoBq8wo7f7lBUq0vpwnf2qys=;
  b=FcZLhR+61cYIJ58zuo9KOEIJBit8fsUyFivoP+OZxXASfBy+cqkWm7vi
   47DjCmcrDp4h0plEAF1ThGPDhPiSNgWjybcxBR5Jh3/SG6L32c2n0Zv1e
   hbkq9YOsPVu3nu6MLcYJRXoPNiOiPrashpHK9+oH4Zm5Qs9Wg/8/4MaXH
   7Vu3uQ3b2Ujgvop8/jO3xjHbFMUjWw5PQRg9aMc9ItKFcumC/1R8ayHVQ
   0ArsEkcLvfzZigm/WIPXyXFEhi9KLk//pxthpyzfQYZmHshDFsSMBBHnU
   06uih1eRf7QJgCYt4Cg+NvociOz2doDEkEa1nhqWUaZMZpqGa0Ylpftow
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677538800"; 
   d="scan'208";a="30902523"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 May 2023 11:11:58 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 15 May 2023 11:11:58 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 15 May 2023 11:11:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684141918; x=1715677918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRfzZDykwbFLD+Hj/vjIoBq8wo7f7lBUq0vpwnf2qys=;
  b=dcgm2zm4ud2AvkzsCvlxIoulcIQr8+aAZq5Rbf/ikKgwm0bTNSxzFueu
   duNCDu+Tr80b5ygUgcSiNADTGA5jIY7UU8K6UfY1cY+gD/9xAiz2tJ9pf
   8qm4KtkwGMaKUsOAIP8uRWBMKL9FrVdd73lCWhza0ecfObZF7bKBfYdwB
   75An1tPZzpjyIDnkWvn/1z1ZgBOEKShERApeoMQw2V73jAbxYpZXTqNT6
   z2ggt6/tmStqqZbvNFQJfRDbusifDjG6cHFrGK5HfUR87m8s/iFdLQ7Mu
   M1jFerOof6kw0TSVYbZlJGWvBkjAs0DFL9lUwKfza4yTnPGF6KUf5jAQ+
   g==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677538800"; 
   d="scan'208";a="30902522"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 May 2023 11:11:58 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DE602280056;
        Mon, 15 May 2023 11:11:57 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Date:   Mon, 15 May 2023 11:11:57 +0200
Message-ID: <1933234.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <9272339.EvYhyI6sBW@steina-w>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com> <9272339.EvYhyI6sBW@steina-w>
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

Hi,

Am Freitag, 21. April 2023, 15:48:59 CEST schrieb Alexander Stein:
> Hi,
>=20
> sorry for the delay.
>=20
> Am Freitag, 10. M=E4rz 2023, 14:08:15 CEST schrieb A. Sverdlin:
> > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> >=20
> > One of the reasons to do it is to save some CPU cycles on cpu_freq_get()
> > under mutex. The second reason if the (false-positive) lockdep splat
> > caused
> > by the recursive feature of the "prepare_lock" (one clock instance is I=
2C
> > peripheral clock and another is pcf85063 RTC as clock provider):
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > WARNING: possible circular locking dependency detected
> > 5.15.71+... #1 Tainted: G           O
> > ------------------------------------------------------
> > fs-value/2332 is trying to acquire lock:
> > ffff8000096cae08 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock
> >=20
> > but task is already holding lock:
> > ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at:
> > i2c_adapter_lock_bus
> >=20
> > which lock already depends on the new lock.
> >=20
> > the existing dependency chain (in reverse order) is:
> >=20
> > -> #2 (i2c_register_adapter){+.+.}-{3:3}:
> >        lock_acquire
> >        rt_mutex_lock_nested
> >        i2c_adapter_lock_bus
> >        i2c_transfer
> >        regmap_i2c_read
> >        _regmap_raw_read
> >        _regmap_bus_read
> >        _regmap_read
> >        regmap_read
> >        pcf85063_probe
> >        i2c_device_probe
> >        really_probe
> >        __driver_probe_device
> >        driver_probe_device
> >        __device_attach_driver
> >        bus_for_each_drv
> >        __device_attach
> >        device_initial_probe
> >        bus_probe_device
> >        device_add
> >        device_register
> >        i2c_new_client_device
> >        of_i2c_register_devices
> >        i2c_register_adapter
> >        __i2c_add_numbered_adapter
> >        i2c_add_adapter
> >        lpi2c_imx_probe
> >        platform_probe
> >        really_probe
> >        __driver_probe_device
> >        driver_probe_device
> >        __device_attach_driver
> >        bus_for_each_drv
> >        __device_attach
> >        device_initial_probe
> >        bus_probe_device
> >        deferred_probe_work_func
> >        process_one_work
> >        worker_thread
> >        kthread
> >        ret_from_fork
> >=20
> > -> #1 (rtc_pcf85063:560:(&config->regmap)->lock){+.+.}-{3:3}:
> >        lock_acquire
> >        __mutex_lock
> >        mutex_lock_nested
> >        regmap_lock_mutex
> >        regmap_read
> >        pcf85063_clkout_recalc_rate
> >        __clk_register
> >        devm_clk_register
> >        pcf85063_probe
> >        i2c_device_probe
> >        really_probe
> >        __driver_probe_device
> >        driver_probe_device
> >        __device_attach_driver
> >        bus_for_each_drv
> >        __device_attach
> >        device_initial_probe
> >        bus_probe_device
> >        device_add
> >        device_register
> >        i2c_new_client_device
> >        of_i2c_register_devices
> >        i2c_register_adapter
> >        __i2c_add_numbered_adapter
> >        i2c_add_adapter
> >        lpi2c_imx_probe
> >        platform_probe
> >        really_probe
> >        __driver_probe_device
> >        driver_probe_device
> >        __device_attach_driver
> >        bus_for_each_drv
> >        __device_attach
> >        device_initial_probe
> >        bus_probe_device
> >        deferred_probe_work_func
> >        process_one_work
> >        worker_thread
> >        kthread
> >        ret_from_fork
> >=20
> > -> #0 (prepare_lock){+.+.}-{3:3}:
> >        __lock_acquire
> >        lock_acquire.part.0
> >        lock_acquire
> >        __mutex_lock
> >        mutex_lock_nested
> >        clk_prepare_lock
> >        clk_get_rate
> >        lpi2c_imx_xfer
> >        __i2c_transfer
> >        i2c_transfer
> >        regmap_i2c_read
> >        _regmap_raw_read
> >        regmap_raw_read
> >        regmap_bulk_read
> >        at24_read
> >        nvmem_reg_read
> >        bin_attr_nvmem_read
> >        sysfs_kf_bin_read
> >        kernfs_fop_read_iter
> >        new_sync_read
> >        vfs_read
> >        ksys_read
> >        __arm64_sys_read
> >        invoke_syscall
> >        ...
> >=20
> > other info that might help us debug this:
> >=20
> > Chain exists of:
> >   prepare_lock --> rtc_pcf85063:560:(&config->regmap)->lock -->
> >=20
> > i2c_register_adapter
> >=20
> >  Possible unsafe locking scenario:
> >        CPU0                    CPU1
> >        ----                    ----
> >  =20
> >   lock(i2c_register_adapter);
> >=20
> > lock(rtc_pcf85063:560:(&config->regmap)->lock);
> > lock(i2c_register_adapter);
> >=20
> >   lock(prepare_lock);
> > =20
> >  *** DEADLOCK ***
> >=20
> > 4 locks held by .../2332:
> >  #0: ffff0000146eb288 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_read_iter
> >  #1: ffff000010fe4400 (kn->active#72){.+.+}-{0:0}, at:
> >  kernfs_fop_read_iter
> >  #2: ffff0000110168e8 (&at24->lock){+.+.}-{3:3}, at: at24_read
> >=20
> >  #3: ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at:
> > i2c_adapter_lock_bus
> >=20
> > stack backtrace:
> > CPU: 1 PID: 2332 Comm: ... Tainted: G           O      5.15.71+... #1
> > Hardware name: ... (DT)
> >=20
> > Call trace:
> >  dump_backtrace
> >  show_stack
> >  dump_stack_lvl
> >  dump_stack
> >  print_circular_bug
> >  check_noncircular
> >  __lock_acquire
> >  lock_acquire.part.0
> >  lock_acquire
> >  __mutex_lock
> >  mutex_lock_nested
> >  clk_prepare_lock
> >  clk_get_rate
> >  lpi2c_imx_xfer
> >  __i2c_transfer
> >  i2c_transfer
> >  regmap_i2c_read
> >  _regmap_raw_read
> >  regmap_raw_read
> >  regmap_bulk_read
> >  at24_read
> >  nvmem_reg_read
> >  bin_attr_nvmem_read
> >  sysfs_kf_bin_read
> >  kernfs_fop_read_iter
> >  new_sync_read
> >  vfs_read
> >  ksys_read
> >  __arm64_sys_read
> >  invoke_syscall
> >  ...
> >=20
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > ---
> >=20
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 33 +++++++++++++++++++++++++++---
> >  1 file changed, 30 insertions(+), 3 deletions(-)
> >=20
> > Changelog:
> > v3: fixed build error reported by kernel test robot <lkp@intel.com>
> >=20
> > https://lore.kernel.org/oe-kbuild-all/202303102010.pAv56wKs-lkp@intel.c=
om/
> > v2: added clk_notifier as Alexander suggested
> >=20
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c index 188f2a36d2fd6..5f1d1d4e018bd
> > 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -100,6 +100,8 @@ struct lpi2c_imx_struct {
> >=20
> >  	__u8			*rx_buf;
> >  	__u8			*tx_buf;
> >  	struct completion	complete;
> >=20
> > +	struct notifier_block	clk_change_nb;
> > +	unsigned int		rate_per;
> >=20
> >  	unsigned int		msglen;
> >  	unsigned int		delivered;
> >  	unsigned int		block_data;
> >=20
> > @@ -198,24 +200,37 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct
> > *lpi2c_imx) } while (1);
> >=20
> >  }
> >=20
> > +static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
> > +				   unsigned long action, void *data)
> > +{
> > +	struct clk_notifier_data *ndata =3D data;
> > +	struct lpi2c_imx_struct *lpi2c_imx =3D container_of(nb,
> > +							  struct
>=20
> lpi2c_imx_struct,
>=20
> > +
>=20
> clk_change_nb);
>=20
> > +
> > +	if (action & POST_RATE_CHANGE)
> > +		lpi2c_imx->rate_per =3D ndata->new_rate;
> > +
> > +	return NOTIFY_OK;
> > +}
> > +
> >=20
> >  /* CLKLO =3D I2C_CLK_RATIO * CLKHI, SETHOLD =3D CLKHI, DATAVD =3D CLKH=
I/2 */
> >  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> >  {
> > =20
> >  	u8 prescale, filt, sethold, clkhi, clklo, datavd;
> >=20
> > -	unsigned int clk_rate, clk_cycle;
> > +	unsigned int clk_cycle;
> >=20
> >  	enum lpi2c_imx_pincfg pincfg;
> >  	unsigned int temp;
> >  =09
> >  	lpi2c_imx_set_mode(lpi2c_imx);
> >=20
> > -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> >=20
> >  	if (lpi2c_imx->mode =3D=3D HS || lpi2c_imx->mode =3D=3D ULTRA_FAST)
> >  =09
> >  		filt =3D 0;
> >  =09
> >  	else
> >  =09
> >  		filt =3D 2;
> >  =09
> >  	for (prescale =3D 0; prescale <=3D 7; prescale++) {
> >=20
> > -		clk_cycle =3D clk_rate / ((1 << prescale) * lpi2c_imx-
> >
> >bitrate)
> >
> > +		clk_cycle =3D lpi2c_imx->rate_per / ((1 << prescale) *
>=20
> lpi2c_imx->bitrate)
>=20
> >  			    - 3 - (filt >> 1);
> >  	=09
> >  		clkhi =3D (clk_cycle + I2C_CLK_RATIO) / (I2C_CLK_RATIO + 1);
> >  		clklo =3D clk_cycle - clkhi;
> >=20
> > @@ -588,6 +603,18 @@ static int lpi2c_imx_probe(struct platform_device
> > *pdev) if (ret)
> >=20
> >  		return ret;
> >=20
> > +	lpi2c_imx->clk_change_nb.notifier_call =3D lpi2c_imx_clk_change_cb;
> > +	ret =3D devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> > +					 &lpi2c_imx->clk_change_nb);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "can't register peripheral clock
>=20
> notifier\n");
>=20
> > +	lpi2c_imx->rate_per =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > +	if (!lpi2c_imx->rate_per) {
> > +		dev_err(&pdev->dev, "can't get I2C peripheral clock
>=20
> rate\n");
>=20
> > +		return -EINVAL;
> > +	}
> > +
>=20
> I would switch the order of the calls to devm_clk_notifier_register() and
> clk_get_rate(). AFAICS this looks like a possible lost update. The notifi=
er
> might change rate_per before the (old) value from clk_get_rate is actually
> assigned.
>=20
> With this change you fix the following call chain (from a kernel log)
>=20
> [    4.562396]        clk_prepare_lock+0x48/0x9c
> [    4.566740]        clk_get_rate+0x1c/0x74
> [    4.570736]        lpi2c_imx_config+0x4c/0x190
> [    4.575167]        lpi2c_imx_master_enable+0x54/0x128
> [    4.580205]        lpi2c_imx_xfer+0x2c/0x3c8
>=20
> Unfortuantely this was just hiding another call path from lpi2c_imx_xfer =
to
> clk_bulk_prepare. Here is my kernel log:
>=20
> [   22.264508] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   22.270697] WARNING: possible circular locking dependency detected
> [   22.276893] 6.3.0-rc7-next-20230420+ #6 Not tainted
> [   22.281782] ------------------------------------------------------
> [   22.287968] kworker/2:3/93 is trying to acquire lock:
> [   22.293034] ffff800009d38bf8 (prepare_lock){+.+.}-{3:3}, at:
> clk_prepare_lock+0x48/0x9c
> [   22.301095]
> [   22.301095] but task is already holding lock:
> [   22.306942] ffff0000039ab100 (i2c_register_adapter){+.+.}-{3:3}, at:
> i2c_adapter_lock_bus+0x20/0x2c
> [   22.316046]
> [   22.316046] which lock already depends on the new lock.
> [   22.316046]
> [   22.324238]
> [   22.324238] the existing dependency chain (in reverse order) is:
> [   22.331727]
> [   22.331727] -> #2 (i2c_register_adapter){+.+.}-{3:3}:
> [   22.338295]        __lock_acquire+0x370/0x6e8
> [   22.342674]        lock_acquire.part.0+0xcc/0x208
> [   22.347399]        lock_acquire+0x94/0x14c
> [   22.351509]        rt_mutex_lock_nested+0x5c/0x98
> [   22.356235]        i2c_adapter_lock_bus+0x20/0x2c
> [   22.360961]        i2c_transfer+0x80/0x114
> [   22.365069]        regmap_i2c_read+0x5c/0xa0
> [   22.369362]        _regmap_raw_read+0x110/0x2dc
> [   22.373905]        _regmap_bus_read+0x40/0x74
> [   22.378274]        _regmap_read+0x74/0x248
> [   22.382393]        regmap_read+0x48/0x70
> [   22.386337]        pcf85063_probe+0xf0/0x4f4
> [   22.390640]        i2c_device_probe+0x100/0x2d4
> [   22.395206]        call_driver_probe+0x28/0x15c
> [   22.399750]        really_probe+0x180/0x320
> [   22.403946]        __driver_probe_device+0x84/0x144
> [   22.408837]        driver_probe_device+0x38/0x150
> [   22.413554]        __device_attach_driver+0xcc/0x194
> [   22.418532]        bus_for_each_drv+0x80/0xdc
> [   22.422910]        __device_attach+0xa8/0x1f8
> [   22.426545] systemd-journald[128]: Oldest entry in /var/log/journal/
> e4579cc7db6747028247b9b859e132d6/system.joural is older than the configur=
ed
> file retention duration (1month), suggesting rotation.
> [   22.427278]        device_initial_probe+0x10/0x18
> [   22.427290]        bus_probe_device+0xa4/0xa8
> [   22.427299]        device_add+0x3b0/0x508
> [   22.427311]        device_register+0x1c/0x28
> [   22.427323]        i2c_new_client_device+0x1c8/0x2bc
> [   22.427333]        of_i2c_register_device+0xb4/0xdc
> [   22.427344]        of_i2c_register_devices+0x80/0x154
> [   22.456329] systemd-journald[128]: /var/log/journal/
> e4579cc7db6747028247b9b859e132d6/system.journal: Journal heaer limits
> reached or header out-of-date, rotating.
> [   22.458176]        i2c_register_adapter+0x184/0x4c8
> [   22.458202]        __i2c_add_numbered_adapter+0x5c/0xa4
> [   22.502097]        i2c_add_adapter+0xa0/0xcc
> [   22.502122]        lpi2c_imx_probe+0x23c/0x350
> [   22.502135]        platform_probe+0x64/0xfc
> [   22.502146]        call_driver_probe+0x28/0x15c
> [   22.502155]        really_probe+0x180/0x320
> [   22.502164]        __driver_probe_device+0x84/0x144
> [   22.502173]        driver_probe_device+0x38/0x150
> [   22.502182]        __device_attach_driver+0xcc/0x194
> [   22.502191]        bus_for_each_drv+0x80/0xdc
> [   22.502204]        __device_attach+0xa8/0x1f8
> [   22.502212]        device_initial_probe+0x10/0x18
> [   22.502222]        bus_probe_device+0xa4/0xa8
> [   22.502230]        deferred_probe_work_func+0xa0/0xf0
> [   22.502239]        process_one_work+0x284/0x5b0
> [   22.502252]        worker_thread+0x68/0x39c
> [   22.502263]        kthread+0x104/0x108
> [   22.502274]        ret_from_fork+0x10/0x20
> [   22.502286]
> [   22.502286] -> #1 (rtc_pcf85063:594:(&config->regmap)->lock){+.+.}-{3:=
3}:
> [   22.502310]        __lock_acquire+0x370/0x6e8
> [   22.502322]        lock_acquire.part.0+0xcc/0x208
> [   22.502332]        lock_acquire+0x94/0x14c
> [   22.502341]        __mutex_lock+0x9c/0x838
> [   22.502353]        mutex_lock_nested+0x20/0x28
> [   22.502364]        regmap_lock_mutex+0x10/0x18
> [   22.502377]        regmap_read+0x38/0x70
> [   22.502389]        pcf85063_clkout_recalc_rate+0x2c/0x78
> [   22.502403]        __clk_core_init+0x46c/0x4e0
> [   22.502417]        __clk_register+0x160/0x23c
> [   22.502429]        devm_clk_register+0x58/0xb4
> [   22.502441]        pcf85063_probe+0x238/0x4f4
> [   22.502451]        i2c_device_probe+0x100/0x2d4
> [   22.502465]        call_driver_probe+0x28/0x15c
> [   22.502473]        really_probe+0x180/0x320
> [   22.502482]        __driver_probe_device+0x84/0x144
> [   22.502491]        driver_probe_device+0x38/0x150
> [   22.502500]        __device_attach_driver+0xcc/0x194
> [   22.502509]        bus_for_each_drv+0x80/0xdc
> [   22.502521]        __device_attach+0xa8/0x1f8
> [   22.502530]        device_initial_probe+0x10/0x18
> [   22.502539]        bus_probe_device+0xa4/0xa8
> [   22.502548]        device_add+0x3b0/0x508
> [   22.502559]        device_register+0x1c/0x28
> [   22.502570]        i2c_new_client_device+0x1c8/0x2bc
> [   22.502580]        of_i2c_register_device+0xb4/0xdc
> [  OK  ] Started Network Time Synchronization[   22.502589]
> of_i2c_register_devices+0x80/0x154
> .[   22.502599]        i2c_register_adapter+0x184/0x4c8
>=20
> [   22.502607]        __i2c_add_numbered_adapter+0x5c/0xa4
> [   22.502616]        i2c_add_adapter+0xa0/0xcc
> [   22.502624]        lpi2c_imx_probe+0x23c/0x350
> [   22.502636]        platform_probe+0x64/0xfc
> [   22.502646]        call_driver_probe+0x28/0x15c
> [   22.502655]        really_probe+0x180/0x320
> [   22.502663]        __driver_probe_device+0x84/0x144
> [   22.502672]        driver_probe_device+0x38/0x150
> [   22.502681]        __device_attach_driver+0xcc/0x194
> [   22.502690]        bus_for_each_drv+0x80/0xdc
> [   22.502702]        __device_attach+0xa8/0x1f8
> [   22.502711]        device_initial_probe+0x10/0x18
> [   22.502720]        bus_probe_device+0xa4/0xa8
> [   22.502729]        deferred_probe_work_func+0xa0/0xf0
> [   22.502738]        process_one_work+0x284/0x5b0
> [   22.502749]        worker_thread+0x68/0x39c
> [   22.502760]        kthread+0x104/0x108
> [   22.502770]        ret_from_fork+0x10/0x20
> [   22.502779]
> [   22.502779] -> #0 (prepare_lock){+.+.}-{3:3}:
> [   22.502799]        check_prev_add+0xb0/0xc80
> [   22.502809]        validate_chain+0x444/0x510
> [   22.502818]        __lock_acquire+0x370/0x6e8
> [   22.502827]        lock_acquire.part.0+0xcc/0x208
> [   22.502837]        lock_acquire+0x94/0x14c
> [   22.502846]        __mutex_lock+0x9c/0x838
> [   22.502857]        mutex_lock_nested+0x20/0x28
> [   22.502867]        clk_prepare_lock+0x48/0x9c
> [   22.502878]        clk_prepare+0x1c/0x3c
> [   22.502890]        clk_bulk_prepare+0x48/0xcc
> [   22.502899]        lpi2c_runtime_resume+0x30/0x84
> [   22.502910]        pm_generic_runtime_resume+0x28/0x3c
> [   22.502923]        __genpd_runtime_resume+0x2c/0xa0
> [   22.502935]        genpd_runtime_resume+0xbc/0x308
> [   22.502944]        __rpm_callback+0x44/0x19c
> [   22.502953]        rpm_callback+0x64/0x70
> [   22.502962]        rpm_resume+0x438/0x6d8
> [   22.502970]        __pm_runtime_resume+0x54/0xb0
> [   22.502978]        lpi2c_imx_master_enable+0x24/0x128
> [   22.502989]        lpi2c_imx_xfer+0x2c/0x3c8
> [   22.502999]        __i2c_transfer+0xe4/0x5a0
> [   22.503008]        i2c_transfer+0x90/0x114
> [   22.503016]        i2c_transfer_buffer_flags+0x58/0x84
> [   22.503025]        regmap_i2c_write+0x1c/0x4c
> [   22.503035]        _regmap_raw_write_impl+0x7dc/0x944
> [   22.503044]        _regmap_bus_raw_write+0x5c/0x74
> [   22.503052]        _regmap_write+0x64/0x238
> [   22.503060]        _regmap_update_bits+0x100/0x11c
> [   22.503069]        regmap_update_bits_base+0x60/0x90
> [   22.503077]        pca953x_gpio_set_value+0x74/0x90
> [   22.503088]        gpiod_set_raw_value_commit+0x6c/0x7c
> [   22.503098]        gpiod_set_value_nocheck+0x68/0x70
> [   22.503107]        gpiod_set_value_cansleep+0x3c/0xa8
> [   22.503116]        gpio_led_set_blocking+0x54/0x7c
> [   22.503128]        set_brightness_delayed+0x90/0xd8
> [   22.503138]        process_one_work+0x284/0x5b0
> [   22.503149]        worker_thread+0x68/0x39c
> [   22.503160]        kthread+0x104/0x108
> [   22.503169]        ret_from_fork+0x10/0x20
> [   22.503179]
> [   22.503179] other info that might help us debug this:
> [   22.503179]
> [   22.503183] Chain exists of:
> [   22.503183]   prepare_lock --> rtc_pcf85063:594:(&config->regmap)->lock
> --> i2c_register_adapter
> [   22.503183]
> [   22.503207]  Possible unsafe locking scenario:
> [   22.503207]
> [   22.503210]        CPU0                    CPU1
> [   22.503213]        ----                    ----
> [   22.503216]   lock(i2c_register_adapter);
> [   22.503225]                              =20
> lock(rtc_pcf85063:594:(&config-
> >regmap)->lock);
>=20
> [   22.503235]                                lock(i2c_register_adapter);
> [   22.503244]   lock(prepare_lock);
> [   22.503253]
> [   22.503253]  *** DEADLOCK ***
>=20
> Now lpi2c_runtime_resume will call into clk_prepare() which also calls
> clk_prepare_lock() (identical to clk_get_rate).
>=20
> Best regards,
> Alexader
>=20
> >  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> >  	pm_runtime_use_autosuspend(&pdev->dev);
> >  	pm_runtime_get_noresume(&pdev->dev);

With commit fa39065833db ("i2c: imx-lpi2c: avoid taking clk_prepare mutex i=
n=20
PM callbacks") in place, the additional deadlock warning regarding runtime=
=20
resume is gone.
So only the ordering issue needs to be addressed.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


