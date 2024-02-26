Return-Path: <linux-i2c+bounces-2010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB5867F65
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 019D9B28AF7
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86AE12EBC4;
	Mon, 26 Feb 2024 17:54:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CD312DD9B;
	Mon, 26 Feb 2024 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708970078; cv=none; b=Yluh8NruwL0MYOm/Mx9D3W5A9asP2TQHc2zO8s7FM6D11FgFc0pB4/iotIQbCyLTgeQrKQvH6SQfTCkPtuadNJzGXtkNVbMCZGIYB9Psi/5JG37kA6KIV6wTOwhsuop7I5u9T5OPpgmVfiOZrjkmSYNq8k3yS+mEq6Dc0aeK0cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708970078; c=relaxed/simple;
	bh=ylbxFPhWREE5b8LumNw/hq2qG5GUReQpVkNeHvtaK6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nvw+HNwFKzUzqyUgdTp0t1VMpLBd+xpSNEQCcElVXVLSrpiGzmELamk8UJpIZNmliPM7jT7yeE+jCFS0GBzniaYQ5yLRRDi3V6kQ/kWYqm/88cOgM6k6nn17mXI6u1CYgKVHsF09fkFJDVyJkwTCG5w9+DAqnx2e++S7/9cIsNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3145543"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3145543"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 09:54:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="913883428"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="913883428"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 09:54:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1refBK-00000007kiq-1TFM;
	Mon, 26 Feb 2024 19:54:26 +0200
Date: Mon, 26 Feb 2024 19:54:25 +0200
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
Message-ID: <ZdzQUX14SCrK95q2@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-17-5c2e4a3fac1f@bootlin.com>
 <Zc42HIibtoXqLyEA@smile.fi.intel.com>
 <e24c77e6-5fcd-42f0-b93c-b4e6ce17e75a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e24c77e6-5fcd-42f0-b93c-b4e6ce17e75a@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 26, 2024 at 06:05:16PM +0100, Thomas Richard wrote:
> On 2/15/24 17:04, Andy Shevchenko wrote:
> > On Thu, Feb 15, 2024 at 04:18:02PM +0100, Thomas Richard wrote:
> >> From: Théo Lebrun <theo.lebrun@bootlin.com>

...

> >>  	case PCI_MODE_RC:
> >> -		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> >> -		if (IS_ERR(gpiod)) {
> >> -			ret = PTR_ERR(gpiod);
> >> +		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> >> +		if (IS_ERR(pcie->reset_gpio)) {
> >> +			ret = PTR_ERR(pcie->reset_gpio);
> >>  			if (ret != -EPROBE_DEFER)
> >>  				dev_err(dev, "Failed to get reset GPIO\n");
> >>  			goto err_get_sync;
> >> @@ -504,9 +504,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
> >>  		 * mode is selected while enabling the PHY. So deassert PERST#
> >>  		 * after 100 us.
> >>  		 */
> >> -		if (gpiod) {
> >> +		if (pcie->reset_gpio) {
> >>  			usleep_range(100, 200);
> >> -			gpiod_set_value_cansleep(gpiod, 1);
> >> +			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> >>  		}
> > 
> > Instead of all this, just add one line assignment. Moreover, before or after
> > this patch refactor the code to use ret = dev_err_probe(...); pattern that
> > eliminates those deferral probe checks.
> 
> Hi Andy,
> 
> I'm not sure what you exactly want when you write "just add one line
> assignment".

		pcie->reset_gpio = gpiod;

That's it. No additional code changes are needed (WRT the above context,
of course you want to have a new structure member).

-- 
With Best Regards,
Andy Shevchenko



