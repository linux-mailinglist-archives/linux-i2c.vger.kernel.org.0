Return-Path: <linux-i2c+bounces-1371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C14C8318C1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 12:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5EC71F20F54
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 11:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB8F24200;
	Thu, 18 Jan 2024 11:54:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4D21A12
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jan 2024 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705578840; cv=none; b=qZRyTL9/lW8/cI92Do6WT2ni5F5scOvGWPUrDCFazFTrGyjFkUlr0sqMlqbh4tLvufqhZEuHowqHtF0HWuU08pLTY1g+8h+NUbR2UtWB+RnIcu37+j7dp6sJ8WfU3rAgBKGHQHHklXPKEOCIpilnIHvteYSFFH2w+euVFliRbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705578840; c=relaxed/simple;
	bh=WnXJ4F5cU3lATwyKv2kVV2jXZJEk/S6Hp3Fpn57EDOU=;
	h=Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=ZRhuFN9znsDS7u8pD2kicYl03p8kCj4rj8CkBpKwTrl5Hbi4VltVSRPmHxXXEV33EIO1rh91TJPMuHvrmfSybmIK5NN57TiLMllE6OrRl2pF6JICeZwvRpXCT4ZkOWELLw2j44gsR7try585c6LE5EVX5fTUjSJIhs98ei4gIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQQxv-00040R-6u; Thu, 18 Jan 2024 12:53:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQQxu-000g8j-Cq; Thu, 18 Jan 2024 12:53:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQQxu-002Mld-0z;
	Thu, 18 Jan 2024 12:53:46 +0100
Date: Thu, 18 Jan 2024 12:53:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: lpi2c: Avoid calling clk_get_rate during
 transfer
Message-ID: <cmqqlj2l7m5laajc6lspjkvu2mo3jvmpqvw7xrmaylxdvbibap@twgrny5c3lzd>
References: <20240118074332.3633533-1-alexander.stein@ew.tq-group.com>
 <ugdaycvznwcnlbwsgkakzkhnqrhwqloqablsmavngo5sgsalml@cfywhcglkctj>
 <1976139.usQuhbGJ8B@steina-w>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="merzahweotsema5j"
Content-Disposition: inline
In-Reply-To: <1976139.usQuhbGJ8B@steina-w>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--merzahweotsema5j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 12:26:39PM +0100, Alexander Stein wrote:
> Hi Uwe,
>=20
> Am Donnerstag, 18. Januar 2024, 11:22:35 CET schrieb Uwe Kleine-K=F6nig:
> > On Thu, Jan 18, 2024 at 08:43:32AM +0100, Alexander Stein wrote:
> > > Instead of repeatedly calling clk_get_rate for each transfer, lock
> > > the clock rate and cache the value.
> > > A deadlock has been observed while adding tlv320aic32x4 audio codec to
> > > the system. When this clock provider adds its clock, the clk mutex is
> > > locked already, it needs to access i2c, which in return needs the mut=
ex
> > > for clk_get_rate as well.
> > >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > This is an alternative, lightweight approach replacing the patch [1] =
and
> > > depends on [2].
> > > The issue to address is still removing the call to clk_get_rate() dur=
ing
> > > each transfer, which might reuslt in a deadlock. lockdep also complai=
ns
> > > about this call chain.
> > >=20
> > > Instead of adding a clock notifier, lock the peripheral clock rate and
> > > cache the peripheral clock rate.
> > > Currently LPI2C is available in the following SoC:
> > > * i.MX7ULP
> > > * i.MX8ULP
> > > * i.MX8DXL
> > > * i.MX8X
> > > * i.MX8
> > > * i.MX93
> > >=20
> > > Additionally I expect both i.MX91 and i.MX95 to also use this driver.
> > >=20
> > > This patch assumes the parent clock rate never changes. This is appar=
ently
> > > true for i.MX93 as each I2C has it's own lpi2c*_root clock. On i.MX8 =
and
> > > i.MX8X clocks are managed by SCU with it's own dedicated firmware. I
> > > can't say if the clock never changes though. I have no idea about the
> > > other SoC.
> > >=20
> > > Best regards,
> > > Alexander
> > >=20
> > > [1]
> > > https://lore.kernel.org/all/20240110120556.519800-1-alexander.stein@e=
w.tq
> > > -group.com/ [2]
> > > https://lore.kernel.org/all/20240104225512.1124519-2-u.kleine-koenig@=
peng
> > > utronix.de/>=20
> > >  drivers/i2c/busses/i2c-imx-lpi2c.c | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > b/drivers/i2c/busses/i2c-imx-lpi2c.c index 678b30e90492a..6cbcb27a3b2=
80
> > > 100644
> > > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > > @@ -99,6 +99,7 @@ struct lpi2c_imx_struct {
> > >=20
> > >  	__u8			*rx_buf;
> > >  	__u8			*tx_buf;
> > >  	struct completion	complete;
> > >=20
> > > +	unsigned long		rate_per;
> > >=20
> > >  	unsigned int		msglen;
> > >  	unsigned int		delivered;
> > >  	unsigned int		block_data;
> > >=20
> > > @@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_stru=
ct
> > > *lpi2c_imx)>=20
> > >  	lpi2c_imx_set_mode(lpi2c_imx);
> > >=20
> > > -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > > +	clk_rate =3D lpi2c_imx->rate_per;
> > >=20
> > >  	if (!clk_rate)
> > >  =09
> > >  		return -EINVAL;
> >=20
> > After the things you did in lpi2c_imx_probe() you can assume that
> > clk_rate is not zero, so you could drop the if here.
>=20
> As in some cases the clock is not setup by Linux, but externally, I'd rat=
her=20
> keep that check to ensure it's enabled.

Just to be sure we both understand this in the same way:

In .probe() you do:

	lpi2c_imx->rate_per =3D clk_get_rate(lpi2c_imx->clks[0].clk);
	if (!lpi2c_imx->rate_per)
		return dev_err_probe(&pdev->dev, -EINVAL, ...);

so irrespective of how the clock is setup, I would expect that
lpi2c_imx->rate_per will never be zero in lpi2c_imx_config().

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--merzahweotsema5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWpEUkACgkQj4D7WH0S
/k5iQAf9Em4ffmB8j2S6z43DywB2cmSqKW7kJ1FWaYexUqvv7ZlJaUzqP5YdY113
goE9tQFQM4fbNd4+beYbeGPIeQrVqlIF/QquQePHonUykjG8zsH2eZfoDK4RqHbN
Am+OVoTqKJlPbyQq043vNPLtB0obCCBshkF+Ag57MyX7DvPXDxIls012yHOY10Tr
vWhBFD4/SVFGS9dzVGqgLUoOmQH1xKXpHkfsNl7+XulmXPDa1RymIr12VmQg+2H/
LqnBlUgAlRSZLLMHkAlVJidsGWEupqUGKr7hieEzMo3TC1Ojm34mOodTEbX/YICi
reAj0/BSrQo0CRfRrWN5tZeAHiTH7g==
=dLGp
-----END PGP SIGNATURE-----

--merzahweotsema5j--

