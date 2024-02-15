Return-Path: <linux-i2c+bounces-1747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93A856873
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B37E1C23A56
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7031350C1;
	Thu, 15 Feb 2024 15:47:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4E133402;
	Thu, 15 Feb 2024 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708012028; cv=none; b=jjNvbcEQ63KC/CXwDVmO1rjFkMXt2AVX2wqWDw3XOsrR4n5rZL6W/iA54TJHBETwAY4+k/GFu8+XHiXWLlWuyustUWu7anHITfdKWgZg9SvLmT6sCp/UKeVV8ALL0Eaye0S12SkiFB/960AmC1BlwzJ16luOnsec7jBHY4vt03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708012028; c=relaxed/simple;
	bh=XWYJG5Tf/Q4RsxmobkQux3I/woLExuXhhNd/jEQypoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYOYiyt23ksMzbLUi1A6CZnCh7+u5Ue6wEQVMBawLrxHOCFTLyVBccxNNY0n9DdwXvdw0K1YTsz2u4L4IBgnqH8SB7PG/qIGAFME1Vc8mrkLX4pCQOxEGPVSYKBcgtKcEal6a2ByfABVo3Webx0hrtX6HvrpBZO/xcyFK2142z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2231951"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2231951"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912182655"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="912182655"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:46:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1radwt-00000004pdr-0xYK;
	Thu, 15 Feb 2024 17:46:55 +0200
Date: Thu, 15 Feb 2024 17:46:54 +0200
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
Subject: Re: [PATCH v3 14/18] phy: cadence-torrent: add suspend and resume
 support
Message-ID: <Zc4x7kvFfBI2sb_E@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 15, 2024 at 04:17:59PM +0100, Thomas Richard wrote:
> Add suspend and resume support.
> 
> The already_configured flag is cleared during the suspend stage to force
> the PHY initialization during the resume stage.

> Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>

SoB/Co-developed-by ?

...

> +static int cdns_torrent_phy_suspend_noirq(struct device *dev)
> +{
> +	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
> +	int i;

Why signed?

> +	reset_control_assert(cdns_phy->phy_rst);
> +	reset_control_assert(cdns_phy->apb_rst);
> +	for (i = 0; i < cdns_phy->nsubnodes; i++)
> +		reset_control_assert(cdns_phy->phys[i].lnk_rst);
> +
> +	if (cdns_phy->already_configured)
> +		cdns_phy->already_configured = 0;
> +	else
> +		clk_disable_unprepare(cdns_phy->clk);
> +
> +	return 0;
> +}
> +
> +static int cdns_torrent_phy_resume_noirq(struct device *dev)
> +{
> +	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
> +	int node = cdns_phy->nsubnodes;
> +	int ret, i;

Ditto.

> +	ret = cdns_torrent_clk(cdns_phy);
> +	if (ret)
> +		goto clk_cleanup;
> +
> +	/* Enable APB */
> +	reset_control_deassert(cdns_phy->apb_rst);
> +
> +	if (cdns_phy->nsubnodes > 1) {
> +		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
> +		if (ret)
> +			goto put_lnk_rst;
> +	}
> +
> +	return 0;
> +
> +put_lnk_rst:
> +	for (i = 0; i < node; i++)
> +		reset_control_assert(cdns_phy->phys[i].lnk_rst);
> +	reset_control_assert(cdns_phy->apb_rst);
> +	clk_disable_unprepare(cdns_phy->clk);
> +clk_cleanup:
> +	cdns_torrent_clk_cleanup(cdns_phy);
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko



