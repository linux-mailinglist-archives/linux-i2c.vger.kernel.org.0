Return-Path: <linux-i2c+bounces-1837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B5858028
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 16:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BC78B21482
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 15:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C2E12F394;
	Fri, 16 Feb 2024 15:07:33 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0E012F366;
	Fri, 16 Feb 2024 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708096053; cv=none; b=SIToOHlHtjnF3WwgtRijlvjC8DRi2m1qchaGPTfU17pHthwB+RWAyT5VJIqxsl2zebt85hEYKDhi7ddtjsr57Nw7UGqUEfYVTRsPngIPuEC/lTw6gj358w014i5x2wn5oNL9p9UK0SlbCJJHdMfUQnpxnvtVjCgqzkTEVh8+Tp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708096053; c=relaxed/simple;
	bh=afxfh6Udan7X9UVtsXUWbV+duYB3ZPpHl+4StRTyH8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za7SV0uEHmWMEQOIt5M/H2xjsrOFL2tat36VlCqWhYa67NZT/89+fWzmuu0qeteBJpeIa+X0R2oSVw2Ikhd7CYaDYVqU2uPQ45QAGjNIEr/zakX2ffZkJKO8aoOYDULU/7dTUoPiYzc1lF/6S1XUtwk+FSLXY86ujna5GxUirA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2338131"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2338131"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 07:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912374280"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912374280"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 07:07:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1razo9-000000054rn-1ock;
	Fri, 16 Feb 2024 17:07:21 +0200
Date: Fri, 16 Feb 2024 17:07:21 +0200
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
Subject: Re: [PATCH v3 05/18] mux: add mux_chip_resume() function
Message-ID: <Zc96Ke_iG_bHIvkP@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-5-5c2e4a3fac1f@bootlin.com>
 <Zc4t82V9czlEqamL@smile.fi.intel.com>
 <f1d2c9b0-238d-4b09-8212-62e00a2192b2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1d2c9b0-238d-4b09-8212-62e00a2192b2@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 16, 2024 at 08:52:17AM +0100, Thomas Richard wrote:
> On 2/15/24 16:29, Andy Shevchenko wrote:
> > On Thu, Feb 15, 2024 at 04:17:50PM +0100, Thomas Richard wrote:

...

> >> +int mux_chip_resume(struct mux_chip *mux_chip)
> >> +{
> >> +	int global_ret = 0;
> >> +	int ret, i;
> >> +
> >> +	for (i = 0; i < mux_chip->controllers; ++i) {
> >> +		struct mux_control *mux = &mux_chip->mux[i];
> >> +
> >> +		if (mux->cached_state == MUX_CACHE_UNKNOWN)
> >> +			continue;
> >> +
> >> +		ret = mux_control_set(mux, mux->cached_state);
> >> +		if (ret < 0) {
> >> +			dev_err(&mux_chip->dev, "unable to restore state\n");
> >> +			if (!global_ret)
> >> +				global_ret = ret;
> > 
> > Hmm... This will record the first error and continue.
> 
> In the v2 we talked about this with Peter Rosin.
> 
> In fact, in the v1 (mux_chip_resume() didn't exists yet, everything was
> done in the mmio driver) I had the same behavior: try to restore all
> muxes and in case of error restore the first one.
> 
> I don't know what is the right solution. I just restored the behavior I
> had in v1.

Okay, I believe you know what you are doing, folks. But to me this approach
sounds at bare minimum "unusual". Because the failures here are not fatal
and recording the first one may or may not make sense and it's so fragile
as it completely implementation-dependent.

> >> +		}
> >> +	}
> >> +	return global_ret;
> > 
> > So here, we actually will get stale data in case there are > 1 failures.
> 
> Yes, indeed. But we will have an error message for each failure.

Which is also problematic. PM calls may easily spam the logs and outshadow
really important messages (like oopses).

-- 
With Best Regards,
Andy Shevchenko



