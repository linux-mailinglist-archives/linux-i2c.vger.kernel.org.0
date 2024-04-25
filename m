Return-Path: <linux-i2c+bounces-3136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5468B1E30
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E311F21F65
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E45284DEA;
	Thu, 25 Apr 2024 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGbQx4yH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA084D12;
	Thu, 25 Apr 2024 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714037970; cv=none; b=I3W/F4UlM6mYOOJvzAvV2zkOXTnZpTgc0Nq8KMBjAH6PuSgehQP0Sab+/xVXb5IrZBRXkLcD8XM4+PiC60ObjaKOT3QAUptaGR0xTBe3PSXb0pkWmJvk62jG2s7UF7CxSK+3gwvOFgqcbON+rYta9SDKNedFEbDJzEoYmSUjjjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714037970; c=relaxed/simple;
	bh=Qb3feMqyrxMO7slwFnpw9BneoXU35QtdGm80mHnaeT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN3+dCgkeyW6tWmccWoPr1eTZl/1pkRKS8LCZfd6T5GGQ4psqYDGIy9tg82HxOi1qzkZfSf3B/G9/BlDxya+2hOO//2qAavgu9arWC2nQeUBZFZwPZpK+63bP/BNc9g644F+I7/ixGDFGB7uUDdi4rw1bJxtSnCkDB+ARrxlzho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGbQx4yH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714037969; x=1745573969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qb3feMqyrxMO7slwFnpw9BneoXU35QtdGm80mHnaeT8=;
  b=nGbQx4yHWf728dfvjY9Ll+MahJu3nfbPFaZczFEPvfPS8MECseFJK0BG
   8yiV57LheItUfaJexCpyBwi+Yap7lVBrhMLFT/XVpNuoMVDQx4FRDHPj8
   2rrjPBcVqPZYIPgfkTWTZnFKNRV8TbBhnOs/KDhGZKspS1Ub47FWyLxOj
   /4d/hzv3cKwzI+ZmP0Pn4QGow1YPpC4hVA0huLNzX7wcAJe37lmJmGTY2
   TCQWrtkFz/9kbmCnFzLSzSpM1G73bkQd8F6ATckMqiqVthKOATH/QBwUe
   bw+1D2/OjKx4GhAkAfHTEVJ01Xa7+Yqtc0960H5M/Ioib6Y7txSYGinUl
   w==;
X-CSE-ConnectionGUID: m3zWgUqgQfKQ9Pz5cJmz6Q==
X-CSE-MsgGUID: YM19h1GIR7mdOjBrBT0FoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13496808"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="13496808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:39:28 -0700
X-CSE-ConnectionGUID: OgANpoOISYC+ySNvnDapjA==
X-CSE-MsgGUID: Q2oq5WXaRAq/QuxnGkZeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="29474489"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:39:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzvZY-00000000wyF-2W3w;
	Thu, 25 Apr 2024 12:39:20 +0300
Date: Thu, 25 Apr 2024 12:39:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] i2c: designware: Create shared header hosting
 driver name
Message-ID: <ZiokyEXqMTAs_M7M@smile.fi.intel.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
 <20240425002642.2053657-2-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425002642.2053657-2-florian.fainelli@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 24, 2024 at 05:26:39PM -0700, Florian Fainelli wrote:
> We have a number of drivers that reference the string "i2c_designware"
> towards two goals:
> 
> - ensure their device gets bound to the i2c_designware platform_driver
> - create a clock lookup reference that matches the i2c_designware
>   instance number for the i2c-designware-platdrv.c driver to be able to
>   lookup the input reference clock
> 
> Since this string is copied in a bunch of different places and since it
> is possible to get this named wrong (see [1] and [2]) with unintended
> consequences, create a header file that hosts that define for other
> drivers to use and all agree on the correct name to use.

> [1]:
> https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/
> [2]:
> https://lore.kernel.org/all/20240422084109.3201-2-duanqiangwen@net-swift.com/

Make them tags.

Link: URL#1 [1]
Link: URL#2 [2]

> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -19,6 +19,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>

> +#include <linux/platform_data/i2c-designware.h>

Please, make it a separate group after linux/* and before "xxx" below.

>  #include <linux/pm_runtime.h>
>  #include <linux/power_supply.h>
>  #include <linux/sched.h>

...

>  module_pci_driver(dw_i2c_driver);
>  
>  /* Work with hotplug and coldplug */
> -MODULE_ALIAS("i2c_designware-pci");
> +MODULE_ALIAS(I2C_DESIGNWARE_NAME "-pci");

As Jarkko said, please get rid of this.
You may take my patch from here:
https://lore.kernel.org/linux-i2c/20231207141653.2785124-9-andriy.shevchenko@linux.intel.com/
and incorporate in this series.

...

>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/i2c-designware.h>

As per above.

>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>

...

>  /* Work with hotplug and coldplug */
> -MODULE_ALIAS("platform:i2c_designware");
> +MODULE_ALIAS("platform:" I2C_DESIGNWARE_NAME);

See above.

...

> +/* This is the i2c-designware-platdrv.c platform driver name. This name is used
> + * to bind the device to the driver, as well as by the driver itself to request
> + * the input reference clock
> + */

/*
 * Use correct multi-line comment style. This
 * is not the net subsystem, we use traditional style.
 */

-- 
With Best Regards,
Andy Shevchenko



