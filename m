Return-Path: <linux-i2c+bounces-1356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BB683096D
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 16:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3F3E1F24C39
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 15:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66109224C0;
	Wed, 17 Jan 2024 15:13:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1164222325
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705504408; cv=none; b=MsyGBqY5Eah5zSfQPcPqi/b05DTcRyXGH2eD7+k1Z6d65ziQA6IqyTBWwO7HKZa6gxkTjVUClcUGHvRxg3z3b81kJi68DvDghUSBV2R/IP9g9IsDlNA+PQ6BUFqJLvP/jFc4j6XaJ/3LCt/vovv3Osz8FiFv3M+aoiAMDfsKpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705504408; c=relaxed/simple;
	bh=DoPT2kPCKFf6axbElxOjPA7nhJzePbYJNHAQ65rX3aQ=;
	h=Received:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=jneaB+gvl8SAEwQKBEKjR8NTKNkP012C31B7XW1wePWLsCGBYF37yEEtPaS4Yclnx/ooEwdDfSUsqahsZwnENHBt0HeVG8YGhoZvOiBZDuT2gPjnLaXiHpvq68VczLcQ3dmpYmiw7nFqfJR9O/qKclLjld8/XUWHYUpFxBfc8P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ7b0-0000IN-Ew; Wed, 17 Jan 2024 16:12:50 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ7ay-000UW3-1a; Wed, 17 Jan 2024 16:12:48 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rQ7ax-000C5F-36;
	Wed, 17 Jan 2024 16:12:47 +0100
Message-ID: <cf6440c08b8b7382e6693e18cdd29325aaea9cc9.camel@pengutronix.de>
Subject: Re: [PATCH 11/14] phy: cadence-torrent: add suspend and resume
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, Haojian
 Zhuang <haojian.zhuang@linaro.org>,  Vignesh R <vigneshr@ti.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Tom
 Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,  Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com,  thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Date: Wed, 17 Jan 2024 16:12:47 +0100
In-Reply-To: <20240102-j7200-pcie-s2r-v1-11-84e55da52400@bootlin.com>
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
	 <20240102-j7200-pcie-s2r-v1-11-84e55da52400@bootlin.com>
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

Hi Thomas,

On Mo, 2024-01-15 at 17:14 +0100, Thomas Richard wrote:
> Add suspend and resume support.
> The alread_configured flag is cleared during suspend stage to force the
> phy initialization during the resume stage.
>=20
> Based on the work of Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>=20
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/phy/cadence/phy-cadence-torrent.c | 57 +++++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cade=
nce/phy-cadence-torrent.c
> index 70413fca5776..31b2594e5942 100644
> --- a/drivers/phy/cadence/phy-cadence-torrent.c
> +++ b/drivers/phy/cadence/phy-cadence-torrent.c
> @@ -3006,6 +3006,62 @@ static void cdns_torrent_phy_remove(struct platfor=
m_device *pdev)
[...]
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
> +		reset_control_put(cdns_phy->phys[i].lnk_rst);

What is this intended to do? I expect this to explode in _remove, where
the=C2=A0lnk_rst are put again. Should this be:

		reset_control_assert(cdns_phy->phys[i].lnk_rst);

?


regards
Philipp

