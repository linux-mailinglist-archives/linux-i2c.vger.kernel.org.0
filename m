Return-Path: <linux-i2c+bounces-3134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395B8B1DBB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAC761F23890
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216AC84D25;
	Thu, 25 Apr 2024 09:20:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE4184DFC;
	Thu, 25 Apr 2024 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714036827; cv=none; b=t0x4VXSQyStnKvXn8E/rt+VvvhjwXcgpO7QxxAnA9xqQn4JoTVAlrQi55prvXmciPf5sv9j+48oJ6NkrWuEGSoFtty/boTkd/LmQUDUKqBBTvp//hM7qoEKjThJ15QBDSFH2ApAW4ECIJIgZN++6TXa0dnze3bJjkENZUBZsnzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714036827; c=relaxed/simple;
	bh=b5xHrUaTH8w38xvavMQn5oxGZmYM/ryuyekrAQ4JJJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2vjJ9rZPgcQSr2r+OzX2SBdL7KrYm9niJwT/c0mtKDlS2e/3Cp1rzCH9oTS0WqZNB3EZ2BUJiq0HsT1VSnQnAzfEgQKEnyVILS1DnGtdaTkLF0maZtQ2iyPfrozixFnqN1w7hsOctb469jbmm3s46PWlUq5+/2aSDVuXe7JiJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: 4OGhaSXxQxSJx/b/Bw4dSw==
X-CSE-MsgGUID: ZyOa2snTQiOCkGECz5W/rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32201143"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="32201143"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:20:25 -0700
X-CSE-ConnectionGUID: 7jK+zlw0SRCZVKs9+SRg7A==
X-CSE-MsgGUID: BkXce46QTKCVC1YFPVtR8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25099980"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:20:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rzvH7-00000000wZV-32jl;
	Thu, 25 Apr 2024 12:20:17 +0300
Date: Thu, 25 Apr 2024 12:20:17 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH 1/4] i2c: designware: Create shared header hosting driver
 name
Message-ID: <ZiogUS3yN5lXT-GH@smile.fi.intel.com>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-2-florian.fainelli@broadcom.com>
 <ZihLSKe_BHxasBql@surfacebook.localdomain>
 <59b7ba5a-14a8-497e-8cf8-53bdf4e8cb8e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b7ba5a-14a8-497e-8cf8-53bdf4e8cb8e@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 25, 2024 at 11:33:02AM +0300, Jarkko Nikula wrote:
> On 4/24/24 2:59 AM, Andy Shevchenko wrote:
> > Tue, Apr 23, 2024 at 04:36:19PM -0700, Florian Fainelli kirjoitti:
> > > We have a number of drivers that reference the string "i2c_designware"
> > > yet this is copied all over the places with opportunities for this
> > > string being mis-used. Create a shared header that defines this as a
> > > constant that other drivers can reference.

...

> > >   #include <linux/i2c.h>
> > > +#include <linux/i2c-designware.h>
> > 
> > Can it be hidden in the subfolder?

...

> > > -#define DRIVER_NAME "i2c-designware-pci"
> > > +#define DRIVER_NAME I2C_DESIGNWARE_NAME "-pci"
> > 
> > Oh, this makes all the things hard to read.
> > 
> > >   /* Work with hotplug and coldplug */
> > > -MODULE_ALIAS("i2c_designware-pci");
> > > +MODULE_ALIAS(DRIVER_NAME);
> > 
> > I believe we shouldn't use MODULE_ALIAS() without real justification.
> > 
> I think MODULE_ALIAS() is even needless here since this device is not added
> from another driver but loaded only for known PCI IDs in device table.

The patch that removes it got reverted :-( and then removed completely from PR.

-- 
With Best Regards,
Andy Shevchenko



