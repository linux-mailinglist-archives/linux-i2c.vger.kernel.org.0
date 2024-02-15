Return-Path: <linux-i2c+bounces-1749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A567856913
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD2F91C21950
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3527513474D;
	Thu, 15 Feb 2024 16:05:15 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7628A129A9D;
	Thu, 15 Feb 2024 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708013115; cv=none; b=mIYaimpWEX9LkwiJN9k6qpmvwGHAv45J9ihnO+m6z7CDakfK49/Vf2V3RWjcE4JrOFMEKQ2/Qkiod7WQFtQ+L4pSUBRaDaGl3TymS5mWFeRVbZ2N2mbTGtLZ3GrGuNLBLmbg2cYm7fBxUI2X5JZKgyeh+UOmO4nJLG7LsrVaPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708013115; c=relaxed/simple;
	bh=HyvS+k8X59AuZUHlUgEzyqcX7h3epessADbli2UvsfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0alAVGmI2/0bXf9jQgw8TOjIADq22xsP0Fshlm+cd32q62bLR8taeNSLYdDR+CMWiWij8fFwNzZ3YagwfHaMbiaKEH6Tb3h1liG4FV1azd16SOmUMgZMCE76uabi0/hlRcUChTxY9Vn3W+M5VRrHoKPHlyV9cMcmX6RnkC2aAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2222938"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2222938"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:04:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912185118"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="912185118"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:04:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1raeE9-00000004prW-0Y4C;
	Thu, 15 Feb 2024 18:04:45 +0200
Date: Thu, 15 Feb 2024 18:04:44 +0200
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
Subject: Re: [PATCH v3 17/18] PCI: j721e: add reset GPIO to struct j721e_pcie
Message-ID: <Zc42HIibtoXqLyEA@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-17-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v3-17-5c2e4a3fac1f@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 15, 2024 at 04:18:02PM +0100, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Add reset GPIO to struct j721e_pcie, so it can be used at suspend and
> resume stages.

...

>  	case PCI_MODE_RC:
> -		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> -		if (IS_ERR(gpiod)) {
> -			ret = PTR_ERR(gpiod);
> +		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +		if (IS_ERR(pcie->reset_gpio)) {
> +			ret = PTR_ERR(pcie->reset_gpio);
>  			if (ret != -EPROBE_DEFER)
>  				dev_err(dev, "Failed to get reset GPIO\n");
>  			goto err_get_sync;
> @@ -504,9 +504,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  		 * mode is selected while enabling the PHY. So deassert PERST#
>  		 * after 100 us.
>  		 */
> -		if (gpiod) {
> +		if (pcie->reset_gpio) {
>  			usleep_range(100, 200);
> -			gpiod_set_value_cansleep(gpiod, 1);
> +			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
>  		}

Instead of all this, just add one line assignment. Moreover, before or after
this patch refactor the code to use ret = dev_err_probe(...); pattern that
eliminates those deferral probe checks.


-- 
With Best Regards,
Andy Shevchenko



