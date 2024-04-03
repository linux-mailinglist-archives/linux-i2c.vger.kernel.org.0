Return-Path: <linux-i2c+bounces-2751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600188970DA
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 15:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B142B27469
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 13:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFCD149E1D;
	Wed,  3 Apr 2024 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIll3WjV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C87514882E;
	Wed,  3 Apr 2024 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150664; cv=none; b=chwYPU+hXlMJ4TLUjLn3P1get4Bzvpfcti407jyJnBz4UUE8Q3EISk59TBVv5E1+xV7RRJ7F/G8DSIEmjQO5nGnB+uI8D81oZQbyJm9+FASzIC5PoG98qA7x58hwW+NWSpgXWMdLu/wyEcfXNQj6ZZapYlRuoxBndbjlDo07m7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150664; c=relaxed/simple;
	bh=I5RGyzMLJIXNupLdtHjUd2yPu3cEeEw2E/J4C1xPUx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkMBfmCGwMHrdR6zQu7Z0m4jpuBtcZMfXhvGbJyvE+Xde1y0LGudgrG093xF9qVwS1aRa1FsX8hncMyOXaIM5ssGO53qzcdulWUVSSfzgJJL45MOVhWNb5ouFpo+71Eu8sDj3oyzeVdwMucXfWxreoWAutcAb8goc7tviayO41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIll3WjV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712150663; x=1743686663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I5RGyzMLJIXNupLdtHjUd2yPu3cEeEw2E/J4C1xPUx4=;
  b=BIll3WjVgpfFcHVp7T9Pi6xrWhp5lxBR8uSu6h9l1Zf+/EKXP1GhBi7y
   /ITTAEuYW5XNM+sj8o6F7ESKvSRpz6wzwrDRcexfi54slNjU31xEiNKfv
   qAwmi/Ifd2yYoY1xEeQcGP4sgbbKml1fkkJP3rWMviVglP9Jp7oUftMB0
   sivPUciTWnPh6ICRjv0kcTPm7RKnrL6w9LeDfOGZwxNXYiyxoyw6oe6Ps
   JdwEoJvpTNGi7qKEtbxi8CUhjhvcU4o/7pFN6b5f5+NOt/YNWD5mxmuLt
   kxvFO9/pSbLSO3xpbWYdDHBft4HuIdCIaiYLaJTTqy2UGLk2YyDXuZXMY
   Q==;
X-CSE-ConnectionGUID: fkEU17qARrOH0xT/nf4HTA==
X-CSE-MsgGUID: l9ixA4vZT+azb+QJ8XDI2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7243739"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7243739"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 06:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="915183381"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="915183381"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 06:23:53 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rs0aj-0000000180g-2o4w;
	Wed, 03 Apr 2024 16:23:49 +0300
Date: Wed, 3 Apr 2024 16:23:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <minyard@acm.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
	Jason Gunthorpe <jgg@ziepe.ca>, Tom Rix <trix@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Message-ID: <Zg1YZVtM3CZWDYq1@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
 <Zg0hxMZGlwfXV2RA@smile.fi.intel.com>
 <Zg1P9fpdwPot3Dxj@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg1P9fpdwPot3Dxj@mail.minyard.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 03, 2024 at 07:47:49AM -0500, Corey Minyard wrote:
> On Wed, Apr 03, 2024 at 12:30:44PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 03, 2024 at 10:06:51AM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>

...

> > > I considered splitting up the large patch into per subsystem patches, but since
> > > it's really just the same thing everywhere it feels better to do it all at once.
> > 
> > Can we split to three groups:
> > - Dropping ACPI_PTR()
> > - Dropping of_match_ptr() (which I won't review in depth, for example)
> > - Dropping both
> > ?
> 
> Why?

Easy to review ACPI parts independently on the rest. I think I explained that
in above. Besides that some patches might require additional work (don't remember
if it is the case for _this_ patch).

-- 
With Best Regards,
Andy Shevchenko



