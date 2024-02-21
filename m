Return-Path: <linux-i2c+bounces-1892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82485D8CF
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 14:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B5E21C22EBA
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966FC69973;
	Wed, 21 Feb 2024 13:10:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF246996B
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708521013; cv=none; b=lpZxKtotNfyMBIl26kLZs6Fu0RUy7gxkMpurwY8i4EqqWiUaLGvy1aK2jSLg5V6fxw2M+YnIL7T1HzrFA7ncTr6YPdZRfdFIytk7+ccGRt2pKvFVEVt1NbwE6laCAwaBWv9nM7qizTYJqxnyBPoI53Wtp9dCwmaH/rFlS2rYpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708521013; c=relaxed/simple;
	bh=5czaxbYDvAGFXbLHNaxY2xPuNAJRQ9JTACWJjrB2Axc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sLLA+finOi8EfNdHEIVG57qYKXrgS5IXoNNSOIZmSi+QheF++8Sik8382YsPjfZE15D4jHidaV4QoiQJRmxjtfUBeKJqDY1o7rPl2eiSFpvfAY7AzlVSRowc0P8V0Bw/JXp4YGIYSWm5wpFmlL3t5VjWMKtkMb71weuYSVpYW3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmM7-0000Ni-FO; Wed, 21 Feb 2024 14:09:47 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmM5-00235h-KR; Wed, 21 Feb 2024 14:09:45 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmM5-0008RC-1k;
	Wed, 21 Feb 2024 14:09:45 +0100
Message-ID: <c105bfa8567f9e76731f2b018f4ca3176357204d.camel@pengutronix.de>
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
Date: Wed, 21 Feb 2024 14:09:45 +0100
In-Reply-To: <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
	 <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
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

On Do, 2024-02-15 at 16:17 +0100, Thomas Richard wrote:
> Add suspend and resume support.
>=20
> The already_configured flag is cleared during the suspend stage to force
> the PHY initialization during the resume stage.
>=20
> Based on the work of Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>=20
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/phy/cadence/phy-cadence-torrent.c | 54 +++++++++++++++++++++++++=
++++++
>  1 file changed, 54 insertions(+)
>=20
> diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cade=
nce/phy-cadence-torrent.c
> index 52cadca4c07b..f8945a11e7ca 100644
> --- a/drivers/phy/cadence/phy-cadence-torrent.c
> +++ b/drivers/phy/cadence/phy-cadence-torrent.c
> @@ -3005,6 +3005,59 @@ static void cdns_torrent_phy_remove(struct platfor=
m_device *pdev)
>  	cdns_torrent_clk_cleanup(cdns_phy);
>  }
> =20
> +static int cdns_torrent_phy_suspend_noirq(struct device *dev)
> +{
> +	struct cdns_torrent_phy *cdns_phy =3D dev_get_drvdata(dev);
> +	int i;
> +
> +	reset_control_assert(cdns_phy->phy_rst);
> +	reset_control_assert(cdns_phy->apb_rst);
> +	for (i =3D 0; i < cdns_phy->nsubnodes; i++)
> +		reset_control_assert(cdns_phy->phys[i].lnk_rst);
> +
> +	if (cdns_phy->already_configured)
> +		cdns_phy->already_configured =3D 0;
> +	else
> +		clk_disable_unprepare(cdns_phy->clk);
> +
> +	return 0;
> +}
> +
> +static int cdns_torrent_phy_resume_noirq(struct device *dev)
> +{
> +	struct cdns_torrent_phy *cdns_phy =3D dev_get_drvdata(dev);
> +	int node =3D cdns_phy->nsubnodes;
> +	int ret, i;
> +
> +	ret =3D cdns_torrent_clk(cdns_phy);
> +	if (ret)
> +		goto clk_cleanup;
> +
> +	/* Enable APB */
> +	reset_control_deassert(cdns_phy->apb_rst);
> +
> +	if (cdns_phy->nsubnodes > 1) {
> +		ret =3D cdns_torrent_phy_configure_multilink(cdns_phy);
> +		if (ret)
> +			goto put_lnk_rst;
> +	}
> +
> +	return 0;
> +
> +put_lnk_rst:
> +	for (i =3D 0; i < node; i++)
> +		reset_control_assert(cdns_phy->phys[i].lnk_rst);

The same cleanup is found in probe. Would it be cleaner to move this
into cdns_torrent_phy_configure_multilink() instead of duplicating it
here?

> +	reset_control_assert(cdns_phy->apb_rst);
> +	clk_disable_unprepare(cdns_phy->clk);
> +clk_cleanup:
> +	cdns_torrent_clk_cleanup(cdns_phy);

This calls of_clk_del_provider(), seems misplaced here.

regards
Philipp


