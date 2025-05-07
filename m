Return-Path: <linux-i2c+bounces-10877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17DAAE456
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 17:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E0C152154E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9392628A70D;
	Wed,  7 May 2025 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yy44zIO9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8361FDA61;
	Wed,  7 May 2025 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630950; cv=none; b=Tz2+7UTDWpPkfMG/2V42hWhkwjPExzU2316FSbP1/hZeJu0a5NWUuli9zgetclUP4tTUAnWhD8PzYwzmvSroNUm6JDXvjbkcBS/aHoqfl4MrPN7pAMn0PsseLqWm/yeKrgv1Qa9KkBIAeGt6abzRaf52wwiGCXY6ruwbeTnLfmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630950; c=relaxed/simple;
	bh=yO+CLLJleqQCOJ1P7Cw9+o2RW0jsGz/mD7j9rcWCyFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erYOFfOwJLpeg7FTnqWPECC9AJwDqdCRYOmCCW7hBeCQxQH8J+edYGm2+NQPo8qkSQBFIZEXWaB2B6+qJWhwnDwRM41NTmoB2y3gypKkPf0hXtsJ9YTO+5q/eNWS9TMjGEQkvv1Lo5lQ7SRI2Nbg2/v7NtUT8Mg5gWeKcdBu+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yy44zIO9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630949; x=1778166949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yO+CLLJleqQCOJ1P7Cw9+o2RW0jsGz/mD7j9rcWCyFk=;
  b=Yy44zIO9S8es7yCDyOqM/+Bmx2BiBh12nDbqIb322z+UvoZMnQk0Ifcx
   LH/HvLGt8VzdfLnnCoqPIb3+qRlGR0FM3nw/Ski5f7aXWLR7OhMmpZa28
   FqtKkwOckmSWKXK+tO/+j5tHoA32iSJuVO43Q67UhSVLNCunj4ZS31U8A
   c8GsWCWUCceNjYyguH+Fi+GsdG54u3Ls3RF4Lj2H2n+ldMArYk8u/wKxk
   +DRph4ibvsJy5fKTa/1PjtwJGr8TI14eoS/cEuiZe5t8xc1wVyQh006VO
   e0EUQEhy7Qb1TUs4bTWTotfZ4jVoCr8I7bEzGQV+mdrs9kZM4G+a1YW43
   Q==;
X-CSE-ConnectionGUID: mG/VuD5BThS7DPpV4/tNQw==
X-CSE-MsgGUID: tUMIjCwfSaqpZZ5qtc3QoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48480563"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48480563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:15:47 -0700
X-CSE-ConnectionGUID: OcLle1K7QPmnpTiiYJJHXQ==
X-CSE-MsgGUID: jQAKSpd0R9iEv0m2vr7j7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135906012"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:15:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgUg-00000003lXp-2GW9;
	Wed, 07 May 2025 18:15:34 +0300
Date: Wed, 7 May 2025 18:15:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 04/26] driver core: Avoid warning when removing a
 device while its supplier is unbinding
Message-ID: <aBt5FvZ95S1Y_Mba@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-5-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:46AM +0200, Herve Codina wrote:
> During driver removal, the following warning can appear:
>    WARNING: CPU: 1 PID: 139 at drivers/base/core.c:1497 __device_links_no_driver+0xcc/0xfc
>    ...
>    Call trace:
>      __device_links_no_driver+0xcc/0xfc (P)
>      device_links_driver_cleanup+0xa8/0xf0
>      device_release_driver_internal+0x208/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      device_links_unbind_consumers+0xe0/0x108
>      device_release_driver_internal+0xec/0x23c
>      driver_detach+0xa0/0x12c
>      bus_remove_driver+0x6c/0xbc
>      driver_unregister+0x30/0x60
>      pci_unregister_driver+0x20/0x9c
>      lan966x_pci_driver_exit+0x18/0xa90 [lan966x_pci]
> 
> This warning is triggered when a consumer is removed because the links
> status of its supplier is not DL_DEV_DRIVER_BOUND and the link flag
> DL_FLAG_SYNC_STATE_ONLY is not set.
> 
> The topology in terms of consumers/suppliers used was the following
> (consumer ---> supplier):
> 
>       i2c -----------> OIC ----> PCI device
>        |                ^
>        |                |
>        +---> pinctrl ---+
> 
> When the PCI device is removed, the OIC (interrupt controller) has to be
> removed. In order to remove the OIC, pinctrl and i2c need to be removed
> and to remove pinctrl, i2c need to be removed. The removal order is:
>   1) i2c
>   2) pinctrl
>   3) OIC
>   4) PCI device
> 
> In details, the removal sequence is the following (with 0000:01:00.0 the
> PCI device):
>   driver_detach: call device_release_driver_internal(0000:01:00.0)...
>     device_links_busy(0000:01:00.0):
>       links->status = DL_DEV_UNBINDING
>     device_links_unbind_consumers(0000:01:00.0):
>       0000:01:00.0--oic link->status = DL_STATE_SUPPLIER_UNBIND
>       call device_release_driver_internal(oic)...
>         device_links_busy(oic):
>           links->status = DL_DEV_UNBINDING
>         device_links_unbind_consumers(oic):
>           oic--pinctrl link->status = DL_STATE_SUPPLIER_UNBIND
>           call device_release_driver_internal(pinctrl)...
>             device_links_busy(pinctrl):
>               links->status = DL_DEV_UNBINDING
>             device_links_unbind_consumers(pinctrl):
>               pinctrl--i2c link->status = DL_STATE_SUPPLIER_UNBIND
>               call device_release_driver_internal(i2c)...
>                 device_links_busy(i2c): links->status = DL_DEV_UNBINDING
>                 __device_links_no_driver(i2c)...
>                   pinctrl--i2c link->status is DL_STATE_SUPPLIER_UNBIND
>                   oic--i2c link->status is DL_STATE_ACTIVE
>                   oic--i2c link->supplier->links.status is DL_DEV_UNBINDING
> 
> The warning is triggered by the i2c removal because the OIC (supplier)
> links status is not DL_DEV_DRIVER_BOUND. Its links status is indeed set
> to DL_DEV_UNBINDING.
> 
> It is perfectly legit to have the links status set to DL_DEV_UNBINDING
> in that case. Indeed we had started to unbind the OIC which triggered
> the consumer unbinding and didn't finish yet when the i2c is unbound.
> 
> Avoid the warning when the supplier links status is set to
> DL_DEV_UNBINDING and thus support this removal sequence without any
> warnings.

...

>  		if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
>  			WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
>  		} else {
> -			WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
> +			if (link->supplier->links.status != DL_DEV_UNBINDING)
> +				WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));

Why not

			WARN_ON(link->supplier->links.status != DL_DEV_UNBINDING &&
			        !(link->flags & DL_FLAG_SYNC_STATE_ONLY));

>  			WRITE_ONCE(link->status, DL_STATE_DORMANT);
>  		}

-- 
With Best Regards,
Andy Shevchenko



