Return-Path: <linux-i2c+bounces-1835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7115857FD5
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 15:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ECFA1C2273F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C70612F36A;
	Fri, 16 Feb 2024 14:56:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D312EBE2;
	Fri, 16 Feb 2024 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095394; cv=none; b=BTN3RffHfCrQ2EGSUjnklWFc2YGKNFJQPij/TeGSF2FXmJhNcSRi7hEZMkTaeLH1tNV5d7jbHqIBDMz1MKoV/igfYNrBcQJzmvfpPH688xVtA2UaDd2+GhZ10zaHDJYBVLQzyWhDovlNEMdWnRXHFgcfrCBbYfpEhr9vEnw4djY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095394; c=relaxed/simple;
	bh=uU5ex5sFczwr9eLJc4HYmer9AHvonlJknY9TibazMSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUEe5ST1VJg4fNKoBAp9hW+UNHz6mh/ILDm8ly25s8QtbesQpdUlMCPUMKRE9TQdORJWzRPu7FJbrC1UAAHSejuCG4CEUiYJ08FU5mygOulagfHLmJGQDI3r78tULoz7Sj5N8INlKwLgxP1xNFiib4C7am9YRlk01clEeElTsHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2336760"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2336760"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 06:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912372670"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912372670"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 06:56:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1razdW-000000054ij-1AX9;
	Fri, 16 Feb 2024 16:56:22 +0200
Date: Fri, 16 Feb 2024 16:56:22 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
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
Message-ID: <Zc93lnpGK8PGKbb-@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-8-5c2e4a3fac1f@bootlin.com>
 <Zc4xJtLl3zo_YrBC@smile.fi.intel.com>
 <Zc76d4B4hjTC3xum@matsya>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zc76d4B4hjTC3xum@matsya>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 16, 2024 at 11:32:31AM +0530, Vinod Koul wrote:
> On 15-02-24, 17:43, Andy Shevchenko wrote:
> > On Thu, Feb 15, 2024 at 04:17:53PM +0100, Thomas Richard wrote:

...

> > (Side note, as this can be done later)
> > 
> > >  	if (rate >= 100000000)
> > 
> > > +		if (rate >= 100000000)
> > 
> > > +	if (rate >= 100000000)
> > 
> > I would make local definition and use it, we may get the global one as there
> > are users.
> > 
> > #define HZ_PER_GHZ	1000000000UL
> 
> Better to define as:
> #define HZ_PER_GHZ 1 * GIGA

(with parentheses)

Maybe here, but when it appears in units.h it will be defined as I wrote
to be aligned with the rest of definitions.

-- 
With Best Regards,
Andy Shevchenko



