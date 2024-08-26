Return-Path: <linux-i2c+bounces-5793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A095EE81
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 12:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52AB61C21B78
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 10:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D721149E1A;
	Mon, 26 Aug 2024 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyHu+hNH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37654148308;
	Mon, 26 Aug 2024 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668396; cv=none; b=M97zUe9efpUNmSSksoLLtOGw64ZXR7sLvD4NklnFBtpzkvTks9MpZnHW2VZy4+Ayed5AZ9NIvgcW3OGhh8Bcj4g+1aHFZUlzPS36djEYnVJkA+6zVPsdS3FOwT/pahs8RaS98M5KPVFj/x3U8PSghmP7m7XQLMC0HAV0ELS0jR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668396; c=relaxed/simple;
	bh=8gNhFuofD5zWGUNIriljHUVsJipVG7nNNSIviq4tVXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bu9BAjxqv+ucokLeQhN3G6o+AmiFfk3Qk3N22R7c0KEL1XtqjIg8H4sI95x9N8EsrE/1nK08rvOK0Bh9I7ep+0f6w/pAgam3MXZPfWFzOLzTtIMdAvCg6B0/qKFtG6xE5Sy11+iXxJoQ0gPI8zoSPpYDeYGu+R/JgVCOKmzUyEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyHu+hNH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724668394; x=1756204394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gNhFuofD5zWGUNIriljHUVsJipVG7nNNSIviq4tVXY=;
  b=OyHu+hNHw9+5OV1xZjLPFfAb6+6Yd0xZhsMKR/kFf61vletunwMrq98F
   Fiepbfs94mc2Py9gV38ovWk3X1i+uW+ic68WfHp+mYPkuN8aI/zFalgkD
   MGfzj02wiSEF+IPgOm9VrJjc6a3KMLaQLun1yUVCwpqvwEchpSOwNOOxR
   MyBz8TTB/5Y93fmDc8Ca4nsBOntQFoMEp6d+1om1iqZoQFlwK39PR//nv
   g81MlQka/NbyDgueFQ9Jz4do+zMpVLG1nRAciKXXWmBtKbt7zhjOzTKPV
   IbExW+j+n/BcNrny3fDVjKb77kYkw2TXv0HMzHJFFsk/ykFMEiB5lHhY/
   Q==;
X-CSE-ConnectionGUID: 4eDuZXdBQtesVwREn+chNg==
X-CSE-MsgGUID: qLTIKzznSEa5mGHifYTwmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="13208710"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="13208710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:33:13 -0700
X-CSE-ConnectionGUID: i7pAAaNJSrSUyr5xtjco/A==
X-CSE-MsgGUID: cTuMYcAhT2+25aitr3/fAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62517541"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:33:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1siX1d-00000001pi8-1NQC;
	Mon, 26 Aug 2024 13:32:41 +0300
Date: Mon, 26 Aug 2024 13:32:26 +0300
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
Message-ID: <ZsxZuvY9MLyjog-y@smile.fi.intel.com>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <Zsi3s9XithGEROwX@smile.fi.intel.com>
 <20240826075110.u3cxc6dootou72eq@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826075110.u3cxc6dootou72eq@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 09:51:10AM +0200, Marco Felsch wrote:
> On 24-08-23, Andy Shevchenko wrote:
> > On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> > > This series adds the intial support to handle EEPROMs via the MTD layer
> > > as well. This allow the user-space to have separate paritions since
> > > EEPROMs can become quite large nowadays.
> > > 
> > > With this patchset applied EEPROMs can be accessed via:
> > >   - legacy 'eeprom' device
> > >   - nvmem device
> > >   - mtd device(s)
> > > 
> > > The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> > > to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> > > 
> > > Note: I'm not familiar with Kconfig symbol migration so I don't know if
> > > the last patch is required at the moment. Please be notified that the
> > > list of recipients is quite large due to the defconfig changes.
> > 
> > FWIW, I think that MTD is *not* the place for EEPROMs.
> > 
> > Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
> > historical reasons and absence an umbrella subsystem for them), but it's not
> > the reason to hack them into something which is not quite suitable.
> 
> Thank you for you input. There are two things to mention:
>  1st) I send a RFC patch and asked for feedback and all I got was: looks
>       okay, please send a proper patch [1] which I did.

I was on a long vacation, I haven't had time or even wishes to look at the
patches or patch series. Sorry for that.

Second point, RFC means "request for comments", here is mine. It's up to the
maintainers and you on how to proceed it.

>  2nd) I don't see the hacky part in this patchset.

I haven't talked about patchset, I have talked about architectural / design
point of view. I read the discussion and to me it seems like it solves the
issue with a quite big hammer. If you can prove that on embedded systems with
limited resources it is not a problem, just mention that in the cover letter.

> Anyway the customer doesn't need the nvmem-partitions anymore and
> therefore this patchset can be seen as obsolote.
> 
> [1] https://lore.kernel.org/lkml/20231201144441.imk7rrjnv2dugo7p@pengutronix.de/T/#m1e0e5778448971b50a883f62bd95622f6422b9a2
> 
> > If NVMEM needs to be updated and may cover these cases after all (and do not
> > forget about *small* size EEPROMs that most likely appear on the devices with
> > limited amount of resources!) in a reasonable size and performance, why not?

-- 
With Best Regards,
Andy Shevchenko



