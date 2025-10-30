Return-Path: <linux-i2c+bounces-13908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6CAC20E5F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 16:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5F284E3418
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E16363B85;
	Thu, 30 Oct 2025 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FA88wTSO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D13208;
	Thu, 30 Oct 2025 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837809; cv=none; b=msH1U8Wiv43KG00Vlox/h8wdYLuoyBZ0g4jSEbVEKdf/oir0sVf6hHgXNd9M7c2kn1tG0sMx7oH8FoYZrw6ljF9R1WenDEtms1qXLIwMHg+zh9WTjyepD6Y2uNdPkvhJtkXfD2hCmA45lv00jnC4YONaaNxHLzrlMAbV0WS+kAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837809; c=relaxed/simple;
	bh=DeegVoD/FpDij0JSaJoj94TY1CnINwyeRhD2sowD2hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k58NVCGFyXDVYu5QuoBciH7Ee0wQ1kdG5tD6QZ+FFiEGiaR4SjHeNJ4EpRl03jWvgIzp2cwfoJxYWWCJ+AywEVzBXsnpLtoZbMS8asZyfstI6u9WDs3Hhcip6gQqXiCTmOhP9uAKVPHLTd2fmSCjvICvJ7cRitAcg29Bt7Z+vko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FA88wTSO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6FDC4CEFF;
	Thu, 30 Oct 2025 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761837809;
	bh=DeegVoD/FpDij0JSaJoj94TY1CnINwyeRhD2sowD2hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA88wTSOrmHFd7V1HulHrQjr6P3mVPZ7KY4wbyBFaC5Dsk5ivyms3bifB3pOi9rIS
	 gpKLD607l/e92oCqdYMmcKT8rQQKkIlwuB63YBXi9fLchTTT8GMo0h/rcSM/1DmRI+
	 d2mLYU7KBwbnmnCxAsP5ZA0HjE1VXoMpIQ0/QtIDO6QZb0GP1hiOxiOGKoqnfgL1CW
	 Ribgl8/BtOC04OBJ+7wBHSIwZFWxHZk2sMvoWne2PbU+3xoNfSmRuvaGcpeEeZGGGB
	 7k4WQxwIVOTVVQb6tGuJfqRcCtJ7/15gA70oDA/D5eB+c4LlmyQ0feVtknRcYafCZJ
	 GIS6Cw4DP8+ug==
Date: Thu, 30 Oct 2025 16:23:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>, 
	Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	David Rhodes <david.rhodes@cirrus.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 18/29] i2c: mux: Create missing devlink between mux
 and adapter physical device
Message-ID: <6tgbavtf2dqc44ebfighrs5chzx4j4zdmjk77fmulwqbhrex2b@lou7ekbsjekr>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-19-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015071420.1173068-19-herve.codina@bootlin.com>

Hi Herve,

...

> When an i2c mux is involved in an i2c path, the struct dev topology is
> the following:

supernitpick: I'd leave blank line here.

>     +----------------+                +-------------------+
>     | i2c controller |                |      i2c mux      |
>     |     device     |                |      device       |
>     |       ^        |                |                   |
>     |       |        |                |                   |
>     |  dev's parent  |                |                   |
>     |       |        |                |                   |
>     |   i2c adapter  |                | i2c adapter chanX |
>     |     device  <---- dev's parent ------  device       |
>     |   (no driver)  |                |    (no driver)    |
>     +----------------+                +-------------------+
> 

...

> No relationship exists between the i2c mux device itself and the i2c
> controller device (physical device) in order to have the i2c mux device
> calling i2c_del_adapter() to remove its downtream adapters and so,

/downtream/downstream/

> release references taken to the upstream adapter.

...

> +	/*
> +	 * There is no relationship set between the mux device and the physical
> +	 * device handling the parent adapter. Create this missing relationship
> +	 * in order to remove the i2c mux device (consumer) and so the dowstream
> +	 * channel adapters before removing the physical device (supplier) which
> +	 * handles the i2c mux upstream adapter.
> +	 */
> +	parent_physdev = i2c_get_adapter_physdev(parent);
> +	if (!parent_physdev) {
> +		dev_err(muxc->dev, "failed to get the parent physical device\n");
> +		ret = -EINVAL;

-ENODEV?

> +		goto err_free_priv;
> +	}
> +	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);

Not to call twice put_device, I would add it once here and then
check for !dl.

> +	if (!dl) {
> +		dev_err(muxc->dev, "failed to create device link to %s\n",
> +			dev_name(parent_physdev));
> +		put_device(parent_physdev);
> +		ret = -EINVAL;

same here, should this be -ENODEV?

Andi

> +		goto err_free_priv;
> +	}
> +	put_device(parent_physdev);
> +
>  	if (force_nr) {
>  		priv->adap.nr = force_nr;
>  		ret = i2c_add_numbered_adapter(&priv->adap);
> -- 
> 2.51.0
> 

