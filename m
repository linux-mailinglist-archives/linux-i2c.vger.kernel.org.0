Return-Path: <linux-i2c+bounces-10216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21272A80EAF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FBCD880C5C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53B92253B2;
	Tue,  8 Apr 2025 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFfANUxk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7CB1DF267;
	Tue,  8 Apr 2025 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122910; cv=none; b=X946cL5Nd6m7uX3JUCYJdCPYdtQrwhod6AY7SYwVy+Q+mofOxZe/76nt0/JksGL2qVPUwfM+5E+W5fbXByhhUy8qe7eO5do9WdmkF3mGI/MaQSvuGZC+LzJmbn3DP2MTz2uiyU4M0kSn22fN4M7v5mBmlWBfPcjYHG0bhR8+kiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122910; c=relaxed/simple;
	bh=D/18wlxlU1B/qYk8djU+F/aya0mKw/WZV9bFlV1sC2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4lOxaSSZtmMaR+zwiN4iWfwc0vF8b7OUYGAoBFFxdjHNU6lJ3XmRJDw5Ct52GlBv6TJNJqmDwKOJLoKWEQtkYSAQ4rSdmgSrRTrHRj3kUR6vizIdeRke5CYGe9ngLAelVROON3/CdgtF+UCOtE9GTMwd1QTKl6r5ZM+w89wk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFfANUxk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122909; x=1775658909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=D/18wlxlU1B/qYk8djU+F/aya0mKw/WZV9bFlV1sC2g=;
  b=aFfANUxkuDaqekIGLQfunBrtSVwmvYqO8jmxvlUxtgNhQ48zUEhyXI4J
   NV3Io/V/sHE6EgCPHUfuHiIfpK/rQKm9VV3MwGA+DTSo6cx4jRxlcOtLA
   DRKQaplvg9nrZShpzgdafcUn6+sBDqOFfEhn00NvPJ+xxi1lTx19gEz3z
   AY3W3F2hkAj/0lvrSDeaQntJs8tKg21DOrizaRsg8edhZvXM3k0y1q8cp
   cowQdujOPIVgIBZSVxcnrVvTu8g6umto/xTIWspQNTqQygnb3fNHu+KAM
   +8Wws7kscLhlFSolddrqIXXyybvJ2pydIq4ntSv7dCqP64zcSdfRsJIUl
   g==;
X-CSE-ConnectionGUID: WuZXgfSLQKSOKDQo2NqTiQ==
X-CSE-MsgGUID: IZste+CcQVeg3/IUqYlmug==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56928749"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56928749"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:35:08 -0700
X-CSE-ConnectionGUID: g/7RqbvqSSWX44qJ468Qmg==
X-CSE-MsgGUID: VxgsdQCfS0C/Kcx96bBDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128020784"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:34:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2A2Q-0000000AQj9-2ym4;
	Tue, 08 Apr 2025 17:34:54 +0300
Date: Tue, 8 Apr 2025 17:34:54 +0300
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
Message-ID: <Z_U0DkSemHK0lrJW@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-12-herve.codina@bootlin.com>
 <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
 <20250408154925.5653d506@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408154925.5653d506@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 03:49:25PM +0200, Herve Codina wrote:
> On Mon, 7 Apr 2025 18:36:28 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:

...

> > This is incorrect, they never had ACPI to begin with. Also there is third
> > platform that are using DT on x86 core — SpreadTrum based phones.
> 
> I will rework the commit log to avoid 'mixing ACPI and device-tree'
> 
> For "SpreadTrum based phones", do you have an idea about the Kconfig symbol
> I could use to filter our this x86 systems?

Hmm... good question. I don't think it was anything. The Airmont core just
works and doesn't require anything special to be set. And platform is x86 with
the devices that are established on ARM, so nothing special in device tree
either, I suppose. Basically any x86 platform with OF should be excluded,
rather think of what should be included. But I see that as opposite
requirements to the same function. I have no idea how to solve this. Perhaps
find that SpreadTrum Intel Atom-based device? Would be really hard, I believe.
Especially if we want to install a custom kernel there...

> Anything I find upstream related to SpreadTrum seems base on ARM cpus.
> I probably miss something.

There were two SoCs that were Intel Atom based [1]. And some patches [2] to x86
DT code were made to support those cases.

> > And not sure about AMD stuff (Geode?).
> 
> Same here, if some AMD devices need to be filtered out, is there a specific
> Kconfig symbol I can use ?

This is question to AMD people. I have no clue.

[1]: https://www.anandtech.com/show/11196/mwc-2017-spreadtrum-launches-8core-intel-airmontbased-soc-with-cat-7-lte-for-smartphones

[2]: 4e07db9c8db8 ("x86/devicetree: Use CPU description from Device Tree")
and co. `git log --no-merges 4e07db9c8db8 -- arch/x86/kernel/devicetree.c

-- 
With Best Regards,
Andy Shevchenko



