Return-Path: <linux-i2c+bounces-1895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8385DCE8
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 14:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E46F283E73
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B4A79DAE;
	Wed, 21 Feb 2024 13:59:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE17D417
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523953; cv=none; b=IYeHXidONfI8KqyvLcgKv931FiOTrXM6dqt/fja0sYCUZLLdoQJnWusE2AJAqM91B5kaFS8op/nf/yQpz8NUZ5MhJOypsqlaJ6G4WuTLUdaTFTH9fQOQKiOxwb5cfrPscm6y8/T29HFJO6cDexYfEIjz3jhg1r7FEbemEbTKxtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523953; c=relaxed/simple;
	bh=SPoiOVe9t7+lJy32KOx/8m4/OcgmeATJO9xiMhnNQl8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rVsyPRuSAmwhn69oxgfgt2DGk5AopeQdAMD7Im+2vdwEwHYSxazjjXWyMwW+mu48o1Z0vy7jUv944NqG1TCvOu2l9lu+1iz93oGe3FXOyZ4oVxWmasK1gDHkqurSm6InC9fK8T22FpkjHiR5yheZuBZ/wEf43wblnbL6HwxK5fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcn7W-0000Lo-VY; Wed, 21 Feb 2024 14:58:46 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcn7U-0023E5-1L; Wed, 21 Feb 2024 14:58:44 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcn7T-000AN8-35;
	Wed, 21 Feb 2024 14:58:43 +0100
Message-ID: <338419fd10ffcc62b135d924f766d66af8186346.camel@pengutronix.de>
Subject: Re: [PATCH v3 14/18] phy: cadence-torrent: add suspend and resume
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, Haojian
 Zhuang <haojian.zhuang@linaro.org>,  Vignesh R <vigneshr@ti.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com,  thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Date: Wed, 21 Feb 2024 14:58:43 +0100
In-Reply-To: <113b7f2e-1313-4ebf-a403-e5fcae8f01ca@bootlin.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
	 <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
	 <c105bfa8567f9e76731f2b018f4ca3176357204d.camel@pengutronix.de>
	 <113b7f2e-1313-4ebf-a403-e5fcae8f01ca@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Mi, 2024-02-21 at 14:41 +0100, Thomas Richard wrote:
> On 2/21/24 14:09, Philipp Zabel wrote:
> > On Do, 2024-02-15 at 16:17 +0100, Thomas Richard wrote:
> > > Add suspend and resume support.
> > >=20
> > > The already_configured flag is cleared during the suspend stage to fo=
rce
> > > the PHY initialization during the resume stage.
> > >=20
> > > Based on the work of Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > >=20
> > > Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> > > ---
> > >  drivers/phy/cadence/phy-cadence-torrent.c | 54 +++++++++++++++++++++=
++++++++++
> > >  1 file changed, 54 insertions(+)
> > >=20
> > > diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/=
cadence/phy-cadence-torrent.c
> > > index 52cadca4c07b..f8945a11e7ca 100644
> > > --- a/drivers/phy/cadence/phy-cadence-torrent.c
> > > +++ b/drivers/phy/cadence/phy-cadence-torrent.c
> > > @@ -3005,6 +3005,59 @@ static void cdns_torrent_phy_remove(struct pla=
tform_device *pdev)
> > >  	cdns_torrent_clk_cleanup(cdns_phy);
> > >  }
> > > =20
> > > +static int cdns_torrent_phy_suspend_noirq(struct device *dev)
> > > +{
> > > +	struct cdns_torrent_phy *cdns_phy =3D dev_get_drvdata(dev);
> > > +	int i;
> > > +
> > > +	reset_control_assert(cdns_phy->phy_rst);
> > > +	reset_control_assert(cdns_phy->apb_rst);
> > > +	for (i =3D 0; i < cdns_phy->nsubnodes; i++)
> > > +		reset_control_assert(cdns_phy->phys[i].lnk_rst);
> > > +
> > > +	if (cdns_phy->already_configured)
> > > +		cdns_phy->already_configured =3D 0;
> > > +	else
> > > +		clk_disable_unprepare(cdns_phy->clk);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int cdns_torrent_phy_resume_noirq(struct device *dev)
> > > +{
> > > +	struct cdns_torrent_phy *cdns_phy =3D dev_get_drvdata(dev);
> > > +	int node =3D cdns_phy->nsubnodes;
> > > +	int ret, i;
> > > +
> > > +	ret =3D cdns_torrent_clk(cdns_phy);
> > > +	if (ret)
> > > +		goto clk_cleanup;
> > > +
> > > +	/* Enable APB */
> > > +	reset_control_deassert(cdns_phy->apb_rst);
> > > +
> > > +	if (cdns_phy->nsubnodes > 1) {
> > > +		ret =3D cdns_torrent_phy_configure_multilink(cdns_phy);
> > > +		if (ret)
> > > +			goto put_lnk_rst;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +put_lnk_rst:
> > > +	for (i =3D 0; i < node; i++)
> > > +		reset_control_assert(cdns_phy->phys[i].lnk_rst);
> >=20
> > The same cleanup is found in probe. Would it be cleaner to move this
> > into cdns_torrent_phy_configure_multilink() instead of duplicating it
> > here?
>=20
> Hello Philipp,
>=20
> Yes I could, but from my point of view, it would not be cleaner.
> This cleanup is called from many places in the probe:
> -
> https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/phy/cadence/phy-=
cadence-torrent.c#L2948
> -
> https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/phy/cadence/phy-=
cadence-torrent.c#L2954
> -
> https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/phy/cadence/phy-=
cadence-torrent.c#L2960
>
> If I add this cleanup in cdns_torrent_phy_configure_multilink(), yes I
> could remove it from cdns_torrent_phy_resume_noirq(), but I should keep
> it in the probe. And I should modify the probe to jump to clk_cleanup if
> cdns_torrent_phy_configure_multilink() fails.

I see it now. If it can't be consolidated, it's not useful to move it
around.

>=20
regards
Philipp

