Return-Path: <linux-i2c+bounces-1748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29213856886
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BCAD1C213D4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C59513398D;
	Thu, 15 Feb 2024 15:51:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51C132C04;
	Thu, 15 Feb 2024 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708012284; cv=none; b=cbvPegUikBirbeR2vbrD6LkH1VumJoUu4phbXpjoCBIbf4FuIqMeYyPXpMiOs4dfHTbf70A+MhlmBNfzU0bbEMvaisZ7uZggOLBBhWvF2b5mU7IgLP30GRbM2TKDeJFD7aT5kCu625Ar4hibyJmGCQndlgvliXfyRt/FrgcM29I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708012284; c=relaxed/simple;
	bh=yVKTAQEqhVLDFhjTI4RFrtCwasTL1xa0TV6A9KwOrUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQfIXICMsPU8G+3tAtoygW4ej6+rTd0uH1GTDhgGerXVRuZCdCRZMLLRP0e+WsHUVczxYObOD4GawHD2QIY5746E2YbX472NnUBg9apXVWI9AWkyPtIo4BI7EtFiKVzIp+T44DqnBbrVFJv5tQhfTnYkE1MUFUlVeCTPEgYmFvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13503042"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="13503042"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826428480"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="826428480"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:51:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rae10-00000004phE-0vqi;
	Thu, 15 Feb 2024 17:51:10 +0200
Date: Thu, 15 Feb 2024 17:51:09 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v3 18/18] PCI: j721e: add suspend and resume support
Message-ID: <Zc4y7Tj2K2pTQ4HY@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-18-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v3-18-5c2e4a3fac1f@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 15, 2024 at 04:18:03PM +0100, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Add suspend and resume support. Only the rc mode is supported.
> 
> During the suspend stage PERST# is asserted, then deasserted during the
> resume stage.

...

> +#include <linux/clk-provider.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -18,10 +19,13 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>

> +#include <linux/container_of.h>

Unordered.

...

> +	ret = j721e_pcie_ctrl_init(pcie);
> +	if (ret < 0) {
> +		dev_err(dev, "j721e_pcie_ctrl_init failed\n");

Is there any guarantee this won't spam logs?

> +		return ret;
> +	}

...

> +	/*
> +	 * This is not called explicitly in the probe, it is called by
> +	 * cdns_pcie_init_phy.

cdns_pcie_init_phy()

> +	 */
> +	ret = cdns_pcie_enable_phy(pcie->cdns_pcie);
> +	if (ret < 0) {
> +		dev_err(dev, "cdns_pcie_enable_phy failed\n");
> +		return -ENODEV;

A potential log spammer?

> +	}

> +	if (pcie->mode == PCI_MODE_RC) {
> +		struct cdns_pcie_rc *rc = cdns_pcie_to_rc(cdns_pcie);
> +
> +		ret = clk_prepare_enable(pcie->refclk);
> +		if (ret < 0) {
> +			dev_err(dev, "clk_prepare_enable failed\n");

Ditto.

> +			return -ENODEV;

Why is the error code shadowed?

> +		}

...

> +		if (pcie->reset_gpio) {
> +			usleep_range(100, 200);

fsleep()

> +			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> +		}

> +		ret = cdns_pcie_host_link_setup(rc);
> +		if (ret < 0) {
> +			clk_disable_unprepare(pcie->refclk);
> +			return ret;
> +		}
> +
> +		/*
> +		 * Reset internal status of BARs to force reinitialization in
> +		 * cdns_pcie_host_init().
> +		 */
> +		for (enum cdns_pcie_rp_bar bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
> +			rc->avail_ib_bar[bar] = true;
> +
> +		ret = cdns_pcie_host_init(rc);
> +		if (ret)

No clock disabling?

> +			return ret;
> +	}


-- 
With Best Regards,
Andy Shevchenko



