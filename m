Return-Path: <linux-i2c+bounces-5766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 532CF95D336
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 18:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8686C1C238A9
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3A318A6DA;
	Fri, 23 Aug 2024 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEdeqrfc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E518893B;
	Fri, 23 Aug 2024 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430339; cv=none; b=RCxikXk1Lh1cPMacAs1EPCXoAv5LuiapNrQAm0s0VuU0V49xJMoIWcKFsf1aC41lhr7ArKglV1qNZesVCswE6mH5BlnR8kOrifNSeIA4gkb2ckP+xKkOfgIGS+FHVIH6XqQxL9oxIS/f2sPCCGAOXXZTevnOY/RHgqSscX8RWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430339; c=relaxed/simple;
	bh=3XMbUYBDHmzNIbQnFO5jFhgJPAAWpbvUV37uWE91XYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEHFTFhi/IzQIcu+mjVhUbOAx2quy7QIorhicO1D1K4JEt7aHyBfxsbvQMcX7fMQMceKJQBNc3QfH+0f0Jwlyqbiv/tfLjgEYkXDLbn8uI4UeoAwNRxiZZGOhGXgpLWaqZnABCy2LB2WBQ/egdi0a0tNkUvIBuG8PTZmiZq6CjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEdeqrfc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724430337; x=1755966337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XMbUYBDHmzNIbQnFO5jFhgJPAAWpbvUV37uWE91XYY=;
  b=TEdeqrfcbxLx99L9+0cq0VBP1FYsYkQCqyGgpEXXB7NgjLpHZmGEZM1o
   NQx9TreuB4uzCjjmgwPmZd4TZ4zYq1JJJPbtCS5UWIAgG4VmaQp80lwTX
   UDzzfk3z7DoOLXf17bp1gbFtAz7ALyzMi4oenXbDOjNewuDt53YSbDZ/5
   4UFEQqQ+4RWJSm+o6hc4Rl+j1HvjrGFwfdj7wqu2RbK/LNo/o3iTeK4jz
   ZMGCGPBnYcSyUWhURFT+PZt683e2Pv2B48DjJsthobbO70wbeYaEPWx2Y
   rBIcRHHhvf0+OXYffMtR54DlUuEWXdoL821XPp1c553YjUVva109/sXfB
   Q==;
X-CSE-ConnectionGUID: FycDOadURlWiMUKGNasRwQ==
X-CSE-MsgGUID: vMUjcWdUSKKm9UBG/bpKOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22504147"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22504147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:25:35 -0700
X-CSE-ConnectionGUID: TyAhmqenSA+fGrOHJsVz6g==
X-CSE-MsgGUID: lexLTyUnSgSoAmUAGKiMPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61694525"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:25:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1shX5I-00000000r8v-11Le;
	Fri, 23 Aug 2024 19:24:20 +0300
Date: Fri, 23 Aug 2024 19:24:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 0/9] AT24 EEPROM MTD Support
Message-ID: <Zsi3s9XithGEROwX@smile.fi.intel.com>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> This series adds the intial support to handle EEPROMs via the MTD layer
> as well. This allow the user-space to have separate paritions since
> EEPROMs can become quite large nowadays.
> 
> With this patchset applied EEPROMs can be accessed via:
>   - legacy 'eeprom' device
>   - nvmem device
>   - mtd device(s)
> 
> The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> 
> Note: I'm not familiar with Kconfig symbol migration so I don't know if
> the last patch is required at the moment. Please be notified that the
> list of recipients is quite large due to the defconfig changes.

FWIW, I think that MTD is *not* the place for EEPROMs.

Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
historical reasons and absence an umbrella subsystem for them), but it's not
the reason to hack them into something which is not quite suitable.

If NVMEM needs to be updated and may cover these cases after all (and do not
forget about *small* size EEPROMs that most likely appear on the devices with
limited amount of resources!) in a reasonable size and performance, why not?

-- 
With Best Regards,
Andy Shevchenko



