Return-Path: <linux-i2c+bounces-1893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EABB85D906
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 14:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A497B22B55
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300E069D3F;
	Wed, 21 Feb 2024 13:13:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6497353816;
	Wed, 21 Feb 2024 13:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708521217; cv=none; b=L9OqUmxKy1l4nWhWKNdJvzXwNReFRGJaYn/DHM5LC67F6PvyccA5bjRWtyD0uJFRCGwfsGp6+5gpcXXsDgnW7jppE7xHt82lrRNDO4sojGvjIO3EtSqtTypkj62FFcZoOyZPN8mHMyEfprsNE8UCwiQfHTchuxvdiV2cW0fpccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708521217; c=relaxed/simple;
	bh=2GVfeT/gobu3+8GT9oAkEUuXnH2POQPwjFLVQB0cX34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbeYzO3tM9zqEWHU/1bsFCE0GOQyeVr0NnFtYFNNIPUSV5QAC5qwFvZ4fKfGVrtN7mV9zOvRAR3X/X0KoEcqGGOzVTnAiOEpKWKsWIwGwyim+PJlz7DXBhh4VUbE8pXrbrxFzJGo6zG4lLs8wOSKA/ZN6+tzc363RC3umgeRey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6454518"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6454518"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913302142"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="913302142"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:13:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rcmPY-00000006M4t-3IcO;
	Wed, 21 Feb 2024 15:13:20 +0200
Date: Wed, 21 Feb 2024 15:13:20 +0200
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
Subject: Re: [PATCH v3 02/18] pinctrl: pinctrl-single: remove dead code in
 suspend() and resume() callbacks
Message-ID: <ZdX28EJ9LtDWfVmH@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-2-5c2e4a3fac1f@bootlin.com>
 <Zc4tedAhqYX3bQcw@smile.fi.intel.com>
 <78add459-a96a-46c6-83ff-e2657d4d3db4@bootlin.com>
 <Zc96dSff5Y-dufrJ@smile.fi.intel.com>
 <a2c3c5b9-79a3-4793-892c-b1ab79b71c7d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2c3c5b9-79a3-4793-892c-b1ab79b71c7d@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 21, 2024 at 12:01:43PM +0100, Thomas Richard wrote:
> On 2/16/24 16:08, Andy Shevchenko wrote:
> > On Fri, Feb 16, 2024 at 08:59:47AM +0100, Thomas Richard wrote:
> >> On 2/15/24 16:27, Andy Shevchenko wrote:
> >>> On Thu, Feb 15, 2024 at 04:17:47PM +0100, Thomas Richard wrote:
> >>>> No need to check the pointer returned by platform_get_drvdata(), as
> >>>> platform_set_drvdata() is called during the probe.
> >>>
> >>> This patch should go _after_ the next one, otherwise the commit message doesn't
> >>> tell full story and the code change bring a potential regression.
> >>
> >> Hello Andy,
> >>
> >> I'm ok to move this patch after the next one.
> >> But for my understanding, could you explain me why changing the order is
> >> important in this case ?
> > 
> > Old PM calls obviously can be called in different circumstances and these
> > checks are important.
> > 
> > Just squash these two patches to avoid additional churn and we are done.
> 
> You mean invert the order instead of squash.

Either would work, but see how much churn in terms of changing just changed
lines it adds.

-- 
With Best Regards,
Andy Shevchenko



