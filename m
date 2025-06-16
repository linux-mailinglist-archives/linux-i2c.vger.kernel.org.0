Return-Path: <linux-i2c+bounces-11494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C1ADAED7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 13:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDA301891880
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 11:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F972E3395;
	Mon, 16 Jun 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQl8sq20"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8A9261570;
	Mon, 16 Jun 2025 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073996; cv=none; b=ibChp1Wi552RK6SW+gRANTPChdYhZukJP+0if5GiIhxvdRAnd2/aC5wK5P2fipHEOtKlC7HDEpnnkVZXyY3tpclHbPqxHze9tCMR0tfIVSvcNiUx9WzCc84UwUsFwmFIZj4LClpz1IrKvlyZFDOLeoCVTyl45wZ2zq5FvVZo+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073996; c=relaxed/simple;
	bh=Ma9+AWd3cIZf5Lwt4Vp92HukPMmMYh/Kb6RRViodh+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0jFfKyL1/FVIxCM72vv+Mw1iSf+QND0voDVN/EscOD/gfIb7slNCjDM6wJ+OrfOPEpX8bKlAmyqLDQJYKrEQBvWWauoRybXsF3XkZZGbmKdzE5g/TkLHzTadMdYBEJQrQcJ6XL4zoeyrd34SN3v3SIBvmEj6fezms0SFRnbqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQl8sq20; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073994; x=1781609994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ma9+AWd3cIZf5Lwt4Vp92HukPMmMYh/Kb6RRViodh+0=;
  b=RQl8sq20vMv3fxNKRmqNp0Sc2ODwBAjvN3nctJYJHKywa+mCheKwKWzj
   yjXZm+nALaiXK/vxd1O1mdFC5kkGwKE14y+t4KPPVxpGBpsKSZY1clikA
   UiMfruklXMBkVmGsCV+c9sgOIFKxNabHPypyCMFI5sy4pXdnS/SPNKC6T
   QAr2iHiZX4HbRa8PGIv4wn8tjqVC/ZyaSrZGhHcC4Z19WqtYjtnpTJLK8
   KPenbezXJosXM9G+6ZqvtMl8bZgVURMiWiQ73BdidB8LXJYXi11IS6g+d
   TDGUrVvjI+kF/p8qYh55h+3AWP67xLWku1g5aJl4wfjL5e/GdmunDXpyj
   g==;
X-CSE-ConnectionGUID: /GKS4iugSCOChmoCdX71wQ==
X-CSE-MsgGUID: N7j1M+nKSuC+rIxMIoUjXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52303585"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52303585"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:39:54 -0700
X-CSE-ConnectionGUID: 4QcUPl3STGqo4EMxHH73Ew==
X-CSE-MsgGUID: hF5ltUg9SAaHsRMrX3NVog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148282666"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:39:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR8Be-000000073pQ-0wKC;
	Mon, 16 Jun 2025 14:39:38 +0300
Date: Mon, 16 Jun 2025 14:39:38 +0300
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 07/28] drivers: core: Use fw_devlink_set_device()
Message-ID: <aFACeiO9ysybUwtv@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-8-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 03:47:47PM +0200, Herve Codina wrote:
> The code set directly fwnode->dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



