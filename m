Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3DFD7E64CD
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 08:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbjKIHyy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 02:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjKIHyx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 02:54:53 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98F72728
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 23:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699516491; x=1731052491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dRRDqeVkScDEL1dmC45t7pgui+PHFKft2w9/ONvXEdE=;
  b=ZDrrCrBNc68krxESArB9bUPMWOgPvGwFsSZ6Isiq3sWbiwcxYlKcT7ZM
   IWR7emfzAC48FpAZyRZ+kROBWy9IcQqKsaOb7Qef7yExcsHgLoePuPN4p
   DpAuWCLf9nWmMH2eIJmD0o0vDI+1pbppK5SOMtmRd+0xwnDgpdmjWXCND
   62BdsrORQXo8gWWhnOZ+0m54KFwht21xnSC+KBouYv86PGaqUwn4IM1Ln
   jujaruwpPWjdVVWNkF5Tyc2rA0Wddzz2NtrxNzx94Tm0bWSa9GkcE/yCo
   o4LeGcaWc8wEtw17YlazSA4AXXGVZfn5I4KorKMDejJubGE67wNOh97gs
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,288,1694728800"; 
   d="scan'208";a="33889327"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Nov 2023 08:54:48 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A75FB28007F;
        Thu,  9 Nov 2023 08:54:48 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Date:   Thu, 09 Nov 2023 08:54:51 +0100
Message-ID: <3597042.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231108233809.u3nvxlttmts6tj2m@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com> <20231108233809.u3nvxlttmts6tj2m@zenone.zhora.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

thanks for the feedback.

Am Donnerstag, 9. November 2023, 00:38:09 CET schrieb Andi Shyti:
> Hi Alexander,
>=20
> On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> >=20
> > Instead of repeatedly calling clk_get_rate for each transfer, register
> > a clock notifier to update the cached divider value each time the clock
> > rate actually changes.
> > There is also a lockdep splat if a I2C based clock provider needs to
> > access the i2c bus while in recalc_rate(). "prepare_lock" is about to
> > be locked recursively.
> >=20
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
>=20
> What's the exact fix here? Is it the lockdep warning? Is it
> actually causing a real deadlock?

We've seen actual deadlocks on our imx8qxp based hardware using a downstrea=
m=20
kernel, so we have implemented as similar fix [1]. This happened using=20
tlv320aic32x4 audio codec.
The backtrace is similar, a i2c based clock provider is trying t issue an i=
2c=20
transfer while adding the clock, thus 'prepare_lock' is already locked.
Lockdep raises an error both for downstream kernel as well as mainline, bot=
h=20
for tlv320aic32x4 or pcf85063.

[1] https://github.com/tq-systems/linux-tqmaxx/commit/
b0339ff83a979f2ea066012b9209ea7c54f2b4e7

> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v7:
> > * Use dev_err_probe
> > * Reworked/Shortened the commit message
> >=20
> >  It is not about saving CPU cycles, but to avoid locking the clk subsys=
tem
> >  upon each transfer.
> > =20
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 40 +++++++++++++++++++++++++++++-
> >  1 file changed, 39 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c index 678b30e90492a..3070e605fd8ff
> > 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -5,6 +5,7 @@
> >=20
> >   * Copyright 2016 Freescale Semiconductor, Inc.
> >   */
> >=20
> > +#include <linux/atomic.h>
> >=20
> >  #include <linux/clk.h>
> >  #include <linux/completion.h>
> >  #include <linux/delay.h>
> >=20
> > @@ -99,6 +100,8 @@ struct lpi2c_imx_struct {
> >=20
> >  	__u8			*rx_buf;
> >  	__u8			*tx_buf;
> >  	struct completion	complete;
> >=20
> > +	struct notifier_block	clk_change_nb;
> > +	atomic_t		rate_per;
> >=20
> >  	unsigned int		msglen;
> >  	unsigned int		delivered;
> >  	unsigned int		block_data;
> >=20
> > @@ -197,6 +200,20 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct
> > *lpi2c_imx)>=20
> >  	} while (1);
> > =20
> >  }
> >=20
> > +static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
> > +				   unsigned long action, void *data)
> > +{
> > +	struct clk_notifier_data *ndata =3D data;
> > +	struct lpi2c_imx_struct *lpi2c_imx =3D container_of(nb,
> > +							  struct=20
lpi2c_imx_struct,
> > +							 =20
clk_change_nb);
> > +
> > +	if (action & POST_RATE_CHANGE)
> > +		atomic_set(&lpi2c_imx->rate_per, ndata->new_rate);
> > +
> > +	return NOTIFY_OK;
> > +}
> > +
> >=20
> >  /* CLKLO =3D I2C_CLK_RATIO * CLKHI, SETHOLD =3D CLKHI, DATAVD =3D CLKH=
I/2 */
> >  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> >  {
> >=20
> > @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct
> > *lpi2c_imx)>=20
> >  	lpi2c_imx_set_mode(lpi2c_imx);
> >=20
> > -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > +	clk_rate =3D atomic_read(&lpi2c_imx->rate_per);
> >=20
> >  	if (!clk_rate)
> >  =09
> >  		return -EINVAL;
>=20
> Doesn't seem like EINVAL, defined as "Invalid argument", is the
> correct number here. As we are failing to read the clock rate, do
> you think EIO is better?

Well, this is already the current error code. In both the old and new code =
I=20
would consider this error case as 'no clock rate provided' rather than fail=
ing=20
to read. I would reject EIO as there is no IO transfer for retrieving the=20
clock rate.

> > @@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device
> > *pdev)>=20
> >  	if (ret)
> >  =09
> >  		return ret;
> >=20
> > +	lpi2c_imx->clk_change_nb.notifier_call =3D lpi2c_imx_clk_change_cb;
> > +	ret =3D devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
> > +					 &lpi2c_imx->clk_change_nb);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "can't register peripheral clock=20
notifier\n");
>=20
> can't we fall back to how things were instead of failing the
> probe? But I'm not sure it would remove the lockdep warning,
> though. I can live with it.

I don't see a reason why you would want to continue if=20
devm_clk_notifier_register() failed. It's either ENOMEM, EINVAL (if you pas=
s=20
NULL for clk or notifier block) or EEXIST if registered twice. So in realit=
y=20
only ENOMEM is possible, but then things went south already.

Best regards,
Alexander

> > +	/*
> > +	 * Lock the clock rate to avoid rate change between clk_get_rate()=20
and
> > +	 * atomic_set()
> > +	 */
> > +	ret =3D clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "can't lock I2C peripheral clock=20
rate\n");
> > +
> > +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx-
>clks[0].clk));
> > +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> > +	if (!atomic_read(&lpi2c_imx->rate_per))
> > +		return dev_err_probe(&pdev->dev, -EINVAL,
> > +				     "can't get I2C peripheral clock=20
rate\n");
> > +
>=20
> Not a bad patch, would be nice if all the above was provided by
> the library so that other drivers can use it.
>=20
> Andi
>=20
> >  	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> >  	pm_runtime_use_autosuspend(&pdev->dev);
> >  	pm_runtime_get_noresume(&pdev->dev);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


