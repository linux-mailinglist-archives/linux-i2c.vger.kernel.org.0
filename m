Return-Path: <linux-i2c+bounces-10903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A611FAB02CF
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 20:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE92B502DEC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 18:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B840A2882B1;
	Thu,  8 May 2025 18:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbVWD+89"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6495286895;
	Thu,  8 May 2025 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729107; cv=none; b=TnPYu+YOcxo06yT/IAFtC9EXZq6evey0QyHG6ZqyzgOHUizT/fSMpFgtwR2fWvNedyFiHlld8gvwrFL307VuQrxsaC+Sb07BM52IbXl0xZ0gSRyu0aSTISxzKk1zXr3bY6LhuC/aXG8za3D07lKDuOaKPBv0et9cZgPApIzkKcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729107; c=relaxed/simple;
	bh=lmW0Dg0L5hEpYSQrGyyAU2RGWEg1vYLosLy8p05Df9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Myb0yBbGBrUJy8k5vDNVBHFqWgtqn5UWrIU/q/MZMXs7o4jzTIXtNQEDjx++fLEBG2NjylVxHo5pcDvnHtd2bMfXzrsG1ot5+uwyP/D1RLYx7I0H6h8NJ89+6qUTayzMo+tFwPV1ZXiur5D4UI7qb0NVwQ2uVJ7b0QJkiPdPvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbVWD+89; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746729106; x=1778265106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lmW0Dg0L5hEpYSQrGyyAU2RGWEg1vYLosLy8p05Df9E=;
  b=kbVWD+89TsaU5YN6EeJnLmwbUupdjkow/0bxOu/0lZXHnNbx6RQsEAMP
   PcB1Zk0B1fIc/OI47O5I+ZtgGe1dyM0dEDCU7FGYnjuKtU7oA9vylHufi
   JMBOd3EUX3y4iUck3Zf8aQsb/OG9QKrX9ZhC6KvWq++apEz9Jwd4KhI77
   6bK12Q/shFFXesKqSqD6xhnzmIWe0RdQ3Q89vomA1Ep0uVEUqL7BHcxrO
   ebXWClVt9Xa/z/hYRYwIjX5wHoWZWufgBwzMiniBk7g0Egm+rl9k2tjkj
   qyEZoZJq9V7VxQ+r4uCDtl87wvsl5sGRQYQnWIsaq4MAOASvSbIiSHf31
   g==;
X-CSE-ConnectionGUID: GRsompNIStSFtz5SCJkYfA==
X-CSE-MsgGUID: igImZrYDQXyD8wHkfRtOIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52185445"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="52185445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:31:45 -0700
X-CSE-ConnectionGUID: XR1rcrq6RLiCNe1U0w4udg==
X-CSE-MsgGUID: lI5CdtKsTd+NqPODxBCj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136774458"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:31:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD61r-00000004C9z-45LZ;
	Thu, 08 May 2025 21:31:31 +0300
Date: Thu, 8 May 2025 21:31:31 +0300
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
Subject: Re: [PATCH v2 12/26] PCI: of: Set fwnode device of newly created PCI
 device nodes
Message-ID: <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-13-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-13-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:54AM +0200, Herve Codina wrote:
> Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> node are created and filled based on PCI core information but the
> fwnode device field is not set.
> 
> When later an overlay is applied, this consuses fw_devlink. Indeed,

consuses?

> without any device attached to the node, fw_devlink considers that this
> node will never become a device. When this node is pointed as a
> supplier, devlink looks at its ancestors in order to find a node with a
> device that could be used as the supplier.
> 
> In the PCI use case, this leads to links that wrongly use the PCI root
> bridge device as the supplier instead of the expected PCI device.
> 
> Setting the fwnode device to the device of the PCI device allows devlink
> to use this device as a supplier and so, correct links are created.

-- 
With Best Regards,
Andy Shevchenko



