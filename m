Return-Path: <linux-i2c+bounces-1836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10085800C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 16:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4F6C28275D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 15:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F4312F38F;
	Fri, 16 Feb 2024 15:03:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592A612C804;
	Fri, 16 Feb 2024 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095830; cv=none; b=mbPn4+vRaw3O+bIb4a3nypsuYAzAgdRewUS40l6L0/dzkZnUbiO8BEIeu7sKCzezuqpRcKSIvvG/Ac5H5MOPow1haoFpymzsa0gMXJkwpphMSAPo1FZqQhK+ltbJ8kaK84pvvFXqVuYR4ftkFHPRZTNLWRrF61BX5NvK5Nxo5IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095830; c=relaxed/simple;
	bh=RgHw/+iDCLN4Sq5edIix0ZU/8P/azdKYkrO41Y2oW4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok0VF0aYiKKxGrSIuDRb7tufVS1imlX7W/MC65AtUzwYEM+pkI+GQwJ/L97GRtXBwMIp6NfTD87P7yCDjTUBpgHCFbczUnGuaGCj2ecns+p/l1n2brhjjSrwntbafSDHjxK6v8pErAqZBesdgz/JoVjevBaZogT+iwKGrWbGGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2337586"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2337586"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 07:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912373712"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912373712"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 07:03:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1razkY-000000054p0-1409;
	Fri, 16 Feb 2024 17:03:38 +0200
Date: Fri, 16 Feb 2024 17:03:37 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
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
Subject: Re: [PATCH v3 08/18] phy: ti: phy-j721e-wiz: split wiz_clock_init()
 function
Message-ID: <Zc95SWxtfSQs0a0-@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-8-5c2e4a3fac1f@bootlin.com>
 <Zc4xJtLl3zo_YrBC@smile.fi.intel.com>
 <Zc76d4B4hjTC3xum@matsya>
 <14429802-b4d8-4a3e-88ea-a9fc55d2251c@ti.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14429802-b4d8-4a3e-88ea-a9fc55d2251c@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 16, 2024 at 02:34:39PM +0530, Siddharth Vadapalli wrote:
> On 24/02/16 11:32AM, Vinod Koul wrote:
> > On 15-02-24, 17:43, Andy Shevchenko wrote:
> > > On Thu, Feb 15, 2024 at 04:17:53PM +0100, Thomas Richard wrote:

...

> > > (Side note, as this can be done later)
> > > 
> > > >  	if (rate >= 100000000)
> > > 
> > > > +		if (rate >= 100000000)
> > > 
> > > > +	if (rate >= 100000000)
> > > 
> > > I would make local definition and use it, we may get the global one as there
> > > are users.
> > > 
> > > #define HZ_PER_GHZ	1000000000UL
> > 
> > Better to define as:
> > #define HZ_PER_GHZ 1 * GIGA
> 
> The variable "rate" is being compared against 100 MHz and not 1 GHz.

Extremely good point why constant definitions are better (to avoid missing
or extra 0, etc)!

> The driver already has the following macros defined:
> #define REF_CLK_19_2MHZ         19200000
> #define REF_CLK_25MHZ           25000000
> #define REF_CLK_100MHZ          100000000
> #define REF_CLK_156_25MHZ       156250000
> 
> So would it be acceptable to change it to:
> 	if (rate >= REF_CLK_100MHZ)
> instead?

Sounds like a good idea to me.

-- 
With Best Regards,
Andy Shevchenko



