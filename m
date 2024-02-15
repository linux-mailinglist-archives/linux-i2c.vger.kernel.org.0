Return-Path: <linux-i2c+bounces-1743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F0D8567E3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E81A288254
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8556134CE0;
	Thu, 15 Feb 2024 15:33:44 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A36132C07;
	Thu, 15 Feb 2024 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708011224; cv=none; b=a8pT2GFHRE1lf8NTWvkUui5C//kHxvwrUdS+WVDfUeqBq75ALK1ttd2tZ0Ty0X2ub6PN48bU/PZkR0imM2ktD2MBqxz/yYw7G0veq2d+/4qZHom2Xc2eRHQbusPWaa2scLPSvrDer0bJBeHUq9qLGjqe8JUCBUxbstzra2kzLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708011224; c=relaxed/simple;
	bh=SxwsFb9cwiQ+hXGsatbtcT5oeuzbea3B5jrs8EcaAMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3MNVA7Vh7ROuT8o+VksITVgOGr0E58pX9eMmUJD9REchCBDEsaC+ryfGSuQl4ik1geq5b4xUE2kHnBLCp0WZjeXhLOpod00iMUoucXJwy2h7YfJKcC+WbWCZBJq1fkAwInQne9sFivrMJky1K0Wr6MGVtHl3OXWrKJ71fWsdLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2230191"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2230191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912181253"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="912181253"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:33:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1radjw-00000004pTJ-2xfL;
	Thu, 15 Feb 2024 17:33:32 +0200
Date: Thu, 15 Feb 2024 17:33:32 +0200
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
Subject: Re: [PATCH v3 07/18] phy: ti: phy-j721e-wiz: use dev_err_probe()
 instead of dev_err()
Message-ID: <Zc4uzCsKgx67xI3P@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-7-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v3-7-5c2e4a3fac1f@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 15, 2024 at 04:17:52PM +0100, Thomas Richard wrote:
> Use dev_err_probe() instead of dev_err() in wiz_clock_init() to simplify
> the code and standardize the error output.

...

>  		ret = wiz_clock_register(wiz);
>  		if (ret)
> -			dev_err(dev, "Failed to register wiz clocks\n");
> +			dev_err_probe(dev, ret, "Failed to register wiz clocks\n");
>  		return ret;

Maybe

		if (ret)
			return dev_err_probe(dev, ret, "Failed to register wiz clocks\n");

		return 0;

?

...

>  		if (!clk_node) {
> -			dev_err(dev, "Unable to get %s node\n", node_name);
>  			ret = -EINVAL;
> +			dev_err_probe(dev, ret, "Unable to get %s node\n", node_name);
>  			goto err;

			ret = dev_err_probe(..., -EINVAL, ...);

>  		}

-- 
With Best Regards,
Andy Shevchenko



