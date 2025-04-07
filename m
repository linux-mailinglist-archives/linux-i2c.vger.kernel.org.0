Return-Path: <linux-i2c+bounces-10175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0AA7E4DF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59AF216CCDA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767361FF5E3;
	Mon,  7 Apr 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8CzBLsT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826591FBEB3;
	Mon,  7 Apr 2025 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039829; cv=none; b=YpWcqMX4hgh8GMc0l7gXsIUhLZBi/60X99HW8YlD5iezo8oZbCLAcIqnL7LjG8ZUEhp29JgaYYRt60MloqlRLsLgtk0t/HbMOq1Sdga+ld8oEKpeUUowDnI1vh+H7AwqQ/DFSfnvPHQRy6m4AGJ1Cq0OBQ3a9bjrI+bYBedAM00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039829; c=relaxed/simple;
	bh=g0yyqdpKhTJeG+BAd0Yg/gUdc7l4ULmzVrzx9Rpmr6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBxalocNEFs7gTvKfVEtz4QbVkAyytoX30xhNsIWFJaZig1tJw1Y80yXfy1rF3nzpc0qRXpbaovopL0cNeJTow+ZrzQfRDQIry2fB/Pe/ytXLROlgRseEKOHPgATVjG1YSv0cYl9zYH7irAf85uSo4w54qetb++Ln+YmFyr1To8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8CzBLsT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039827; x=1775575827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g0yyqdpKhTJeG+BAd0Yg/gUdc7l4ULmzVrzx9Rpmr6U=;
  b=m8CzBLsTptY3Xf6g3XGx7Ym50hFjohPW/qs+GBGQ6LppT0LzwxgHXsF3
   b0RlRYiFnDC69Xo5CEYZNaKCkyoRN2N+6Gvdv+SEzmGn3jUkdORwPheSW
   W45YupKX0EaGQIamqCggIelu14V1pNYZWcNQavmy/uwfbkz+rwy+9xVJL
   z+cp9ChupGNaBLWvhp3iDkRHy/kWSbReTKXr8Fl7sVhufSFgnQly11azp
   FVR3MKMEqMSNWG5j5/1QRBvzy3skwEOedskXRt9kymYNaHmesK7E6h8rr
   5HyiXcZGDJYYYI8eB06pfXDtTezsXuHiiyxuC6gTcGeTBArKJ1iGRZe/K
   w==;
X-CSE-ConnectionGUID: 7Y0wuLzKRNCsdabDtOZTmA==
X-CSE-MsgGUID: v3+w/jUsRFWofwKutn407g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62980181"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62980181"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:30:26 -0700
X-CSE-ConnectionGUID: GDqsXhTrRFKRa8fqJC2lKA==
X-CSE-MsgGUID: vQcAL9GpSRixUUMsO+9hag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158982543"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:30:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oQP-0000000A6tV-2nff;
	Mon, 07 Apr 2025 18:30:13 +0300
Date: Mon, 7 Apr 2025 18:30:13 +0300
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
Subject: Re: [PATCH 06/16] PCI: of: Set fwnode.dev of newly created PCI
 device nodes
Message-ID: <Z_PvhVkdhubA9jAe@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-7-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:35PM +0200, Herve Codina wrote:
> Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> node are created and filled based on PCI core information but the
> fwnode.dev field is not set.
> 
> When later an overlay is applied, this consuses fw_devlink. Indeed,
> without any device attached to the node, fw_devlink considers that this
> node will never become a device. When this node is pointed as a
> supplier, devlink looks at its ancestors in order to find a node with a
> device that could be used as the supplier.
> 
> In the PCI use case, this leads to links that wrongly use the PCI root
> bridge device as the supplier instead of the expected PCI device.
> 
> Setting fwnode.dev to the dev of the PCI device allows devlink to use
> this device as a supplier and so, correct links are created.

...

> +	/*
> +	 * Set the fwnode.dev in order to have fw_devlink creating links
> +	 * pointing to this PCI device instead of walking up to the PCI host
> +	 * bridge.
> +	 */
> +	np->fwnode.dev = &pdev->dev;

This is too invasive. I suppose here should be a helper for this kind of
operation. If not, create one.

	fw_devlink_set_device(...);


or alike.

-- 
With Best Regards,
Andy Shevchenko



