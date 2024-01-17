Return-Path: <linux-i2c+bounces-1347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AD9830056
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 08:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAF82846B0
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 07:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF248C06;
	Wed, 17 Jan 2024 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Vtoo4+yu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B348BFC;
	Wed, 17 Jan 2024 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705474951; cv=none; b=DJOifI32R7RXBgjsf+EJHthR/fFZfxLXoYyE4OUi5j8rvbFr3NABUK/iIRqKSUk+gIIHmH7+CN+In0ge/sscn+llIbCJDOe4gGLqXrEBkxC4giqbokEjoo1Ow6OPiobALT6BcyMJcnhY0yyrmV0vI+vSBcTy/l3CXL2KYxAklT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705474951; c=relaxed/simple;
	bh=+dM7HI1jh3P9t3ioHNK2rqVu7GjhetbUqmNQDuxjB+w=;
	h=DKIM-Signature:X-IronPort-AV:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type; b=H9Vv8wcW7NpXz61OKYWrXrH4S6sC9v75WeOTTuVGavchq8JKT7c8Kz9lu9zIKASKvJwqJEiP4k/ZmrWKDiJwyyreZMLLG4EK1RQysMXOpZW2EWZhuXO/r36bjO5/1cMqKCamH+/r4CssmnhslcmIjvweYF9l7eB7wmewlfzUm+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Vtoo4+yu; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705474948; x=1737010948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNLqTvGPmd1Ui6gPLR4huN4NYNmbZkrcJXe+IiUdCmQ=;
  b=Vtoo4+yucLRZmk8XlN8oRF+8DjesBZz4yHQ/LOv6X+pDQJkvkxaue8yg
   +/HWEe785SPYmbeNtpIG0wsZlLtb23HxlTYc3EArgiuNASpQ3KFo0iuUL
   FfO9IkcBac/o40OATqc4ag/RQZQahl7L+JbXorKtgZc+f7kGFgo2VrZcZ
   +CzaGDjPOuE7e749ULhyTIjfjYzLY7MLgltAHpvZF8O6AuTaqB0SlVk4o
   gT0hoN0w15Sa7bABCoTb0C/qlHI76URqMHToCiGhQ5IrC+foHrR0XrsPZ
   ViujsBtOg7UY7fnVM5F4PvbsqZMcqcmE5ukKnBOL879a7VyGHqVs7rh9b
   w==;
X-IronPort-AV: E=Sophos;i="6.05,200,1701126000"; 
   d="scan'208";a="34929989"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Jan 2024 08:02:20 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0A1A2280075;
	Wed, 17 Jan 2024 08:02:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, linux-i2c@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 1/1] i2c: lpi2c: use clk notifier for rate changes
Date: Wed, 17 Jan 2024 08:02:19 +0100
Message-ID: <4540211.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <zac3ukluinnmybdmmkwqbq3zjlha4f5pri4zhxrfg2vfshr7ez@nc25m4uxmroc>
References: <20240110120556.519800-1-alexander.stein@ew.tq-group.com> <zac3ukluinnmybdmmkwqbq3zjlha4f5pri4zhxrfg2vfshr7ez@nc25m4uxmroc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello Uwe,

Am Donnerstag, 11. Januar 2024, 09:51:30 CET schrieb Uwe Kleine-K=F6nig:
> Hello,
>=20
> On Wed, Jan 10, 2024 at 01:05:56PM +0100, Alexander Stein wrote:
> > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> >=20
> > Instead of repeatedly calling clk_get_rate for each transfer, register
> > a clock notifier to update the cached divider value each time the clock
> > rate actually changes.
> > A deadlock has been observed while adding tlv320aic32x4 audio codec to
> > the system. When this clock provider adds its clock, the clk mutex is
> > locked already, it needs to access i2c, which in return needs the mutex
> > for clk_get_rate as well.
> >=20
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v8:
> > * Improved commit message describing an actual observed deadlock
> >=20
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
> >=20
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
> If the clkrate isn't expected to actually change, you can just delay the
> call to clk_rate_exclusive_put() until driver unbind time and not
> register a notifier at all. The result would be more lightweight, you
> wouldn't even need an atomic variable for .rate_per.

On imx93 I don't expect the parent clock rate to change, as each lpi2c=20
peripheral has its own dedicated root clock.
On imx8qxp and imx8qm lpi2c has it's own "clock tree", but these clocks are=
=20
managed by the system controller.
Now idea about imx95 as this one apparently uses SCMI based clock driver.
No idea about imx7ulp, imx8ulp and imx8dxl.

Best regards,
Alexander

> https://lore.kernel.org/all/20240104225512.1124519-2-u.kleine-koenig@peng=
utr
> onix.de/ might be beneficial for that.
>=20
> Having said that, improving the locking in the clk framework to not
> trigger this deadlock would be nice.
>=20
> Best regards
> Uwe


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



