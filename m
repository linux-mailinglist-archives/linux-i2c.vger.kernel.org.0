Return-Path: <linux-i2c+bounces-10494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B40A94430
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 17:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6CEF8E07F2
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 15:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893611DE89C;
	Sat, 19 Apr 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqy9yxI0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCB72D613;
	Sat, 19 Apr 2025 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745076646; cv=none; b=WZMdtSjrXxXjbG9omWsJNp5GH8guhQDe0Pl3oLmFnTmzdcNlLagtKsbPSAHsSFOMsRhKbYSCTDCjst3KHujoXGj7uydlVaNqR5kwyjKUwf1tv+DJ1Gw6WcMNdENlHK8ZplugqQMBC5RDOJ726toijEb8shHN/y6IXGitu/KEzFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745076646; c=relaxed/simple;
	bh=EJY6VnbO/oorT+t/r51LBHIJCvd7pfE+OXcRXcdWp/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ti17lqHbCON2jdLEZmzsy2kys466Bas8u5XvAfHoiBAlqukOGGy9Z8KTyaRseiSaL4WwKXbS06GNfNFV+NcEaUhk3r3TnsFJBOrO49tzDv9WJcykqKJZTq488p3U8dgZBmIX4YK8zoY4l+uuM3u29XvQaa1vaX1sHiCTtnRljuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqy9yxI0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745076645; x=1776612645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EJY6VnbO/oorT+t/r51LBHIJCvd7pfE+OXcRXcdWp/Y=;
  b=kqy9yxI0ZfoOWs1glYcuiUfAd8IeLhIOjzDKlyVWWtXmPI8Z9C3j6jdY
   xg8nQpw9MkLbdPvL8dbzKq056ND84nxA0H+5Qujl7xO/ooR7uS2K/OOds
   xAl+EoI3kw/L4UDV6+XO/MuBhtCt9LcHiEcCONqz+TvmGRdhQYERB0RHg
   M/V4SXIwfEoEHO4b5XXwlXMh8dS4RWo6KnvzNsRFPiB2mIY3wGRL4f0VB
   xW/6CqPb+7xI7w6rSL8+LulS6lJ4oL0UqgRQRwtzfgvZKF+8945e8fvif
   qumRL0jDAoG5D4fndeSpAOK3l/R9fwoLOz1iZID/agGds9sJy/s0ohkO4
   A==;
X-CSE-ConnectionGUID: OO56U8EaR3y71mlFyqiocg==
X-CSE-MsgGUID: 2P+9OFUcSfyqAHX5Eluckg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46806652"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46806652"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:30:44 -0700
X-CSE-ConnectionGUID: CuoieLxUT1K3ksC/Kut48Q==
X-CSE-MsgGUID: ZSJTu6nsQF+IEiTNRnHGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="154517506"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:30:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u6A9I-0000000DqsB-0AwJ;
	Sat, 19 Apr 2025 18:30:32 +0300
Date: Sat, 19 Apr 2025 18:30:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 11/16] of: property: Allow fw_devlink device-tree support
 for x86
Message-ID: <aAPBl7qdbUizMQko@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-12-herve.codina@bootlin.com>
 <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
 <20250408154925.5653d506@bootlin.com>
 <Z_U0DkSemHK0lrJW@smile.fi.intel.com>
 <20250418151036.719f982b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418151036.719f982b@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 18, 2025 at 03:10:36PM +0200, Herve Codina wrote:
> On Tue, 8 Apr 2025 17:34:54 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 08, 2025 at 03:49:25PM +0200, Herve Codina wrote:
> > > On Mon, 7 Apr 2025 18:36:28 +0300
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > > On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:  

...

> > > > This is incorrect, they never had ACPI to begin with. Also there is third
> > > > platform that are using DT on x86 core — SpreadTrum based phones.  
> > > 
> > > I will rework the commit log to avoid 'mixing ACPI and device-tree'
> > > 
> > > For "SpreadTrum based phones", do you have an idea about the Kconfig symbol
> > > I could use to filter our this x86 systems?  
> > 
> > Hmm... good question. I don't think it was anything. The Airmont core just
> > works and doesn't require anything special to be set. And platform is x86 with
> > the devices that are established on ARM, so nothing special in device tree
> > either, I suppose. Basically any x86 platform with OF should be excluded,
> > rather think of what should be included. But I see that as opposite
> > requirements to the same function. I have no idea how to solve this. Perhaps
> > find that SpreadTrum Intel Atom-based device? Would be really hard, I believe.
> > Especially if we want to install a custom kernel there...
> > 
> > > Anything I find upstream related to SpreadTrum seems base on ARM cpus.
> > > I probably miss something.  
> > 
> > There were two SoCs that were Intel Atom based [1]. And some patches [2] to x86
> > DT code were made to support those cases.
> > 
> > > > And not sure about AMD stuff (Geode?).  
> > > 
> > > Same here, if some AMD devices need to be filtered out, is there a specific
> > > Kconfig symbol I can use ?  
> > 
> > This is question to AMD people. I have no clue.
> > 
> > [1]: https://www.anandtech.com/show/11196/mwc-2017-spreadtrum-launches-8core-intel-airmontbased-soc-with-cat-7-lte-for-smartphones
> > 
> > [2]: 4e07db9c8db8 ("x86/devicetree: Use CPU description from Device Tree")
> > and co. `git log --no-merges 4e07db9c8db8 -- arch/x86/kernel/devicetree.c
> 
> I have tried to find a solution for this topic.
> 
> Indeed, this patch enables fw_devlink based on device-tree on all x86
> platform except OLPC and CE4100.
> 
> You have mentioned some other x86 based system that could have issues with
> fw_devlink and it seems to be hard to have a complete list of systems for
> which we should not enable fw_devlink (potential issues and so regression
> against current kernel behavior).
> 
> As you also proposed, we can thing on the opposite direction and enable
> fw_devlink on x86 systems that need it.
> 
> We need it because we need the device-tree description over PCI device feature
> (CONFIG_PCI_DYNAMIC_OF_NODES) on x86 in order to support the LAN966x use case.
> 
> What do you think about the following condition?
> 
> 	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))
>  		return 0; /* Not enabled */
> 
> CONFIG_PCI_DYNAMIC_OF_NODES has already to set explicitly by the user.
> 
> Do you think it makes sense and could be a good alternative instead of
> filtering out a list of x86 systems ?

At least this won't break old platforms that won't set that configuration
option. Ideally, of course, it would be nice to have some kind of detection
at run-time...

-- 
With Best Regards,
Andy Shevchenko



