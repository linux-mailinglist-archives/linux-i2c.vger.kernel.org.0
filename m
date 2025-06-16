Return-Path: <linux-i2c+bounces-11492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E35ADAEC3
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 13:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 531E21890484
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 11:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C192DA760;
	Mon, 16 Jun 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nu6LPlvX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78424261570;
	Mon, 16 Jun 2025 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073875; cv=none; b=YQ7WTXXLylVvyDXYOFC1Im7h3ZdOdWthZPAbI4HMbb4Wg1HFMWDNtCa7J2oG0ethzI9OOAZDeKK6uBY29FBtPjSCmbhv8xI/k/+lowm3eENUitfBEW7Si0uQfd1W0+kVDmT2450tfSMIMnaNlDKkQ5TAeGMFGHiRS5khtfYi0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073875; c=relaxed/simple;
	bh=fLvwmw7HfsZKXm1HnRSW1wbqeq9h4sVoqCvM+tJ5kAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEH/LZXtt89JOmDll6mST2EkjuQ5l/e7SydLjoddRD2WwMhT0CnonAenQJNoyfG4Z846o6+gybmoxIAXIxFcN8AEQZ5U863oydjBkz0hZn1vckCjlPhxbezCzKGJfAHoA931M/HNduhyAq/oSMCdxWL3TPo1Q8OO71ysQaGa1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nu6LPlvX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073873; x=1781609873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fLvwmw7HfsZKXm1HnRSW1wbqeq9h4sVoqCvM+tJ5kAw=;
  b=Nu6LPlvXdr+NdKqhTcNC/Nax3iN7L6CigZ8DRnhG2DMO9wXLEOW+c+PB
   VvLDvdL9cAIWhY6WdmJ38NKv0Im5/r+Zzm3DlSaDtfXN5eNyRpiqckzDd
   Q/+rwNSyDgG8UEjeG0COyCJBUiLgdt8jDStCDc4iUKx/54zOXmh2KbrU0
   BWtn6ZZ2RMFoJbPekJix9kYT+v3Jn6FtXXL7fhhCKia1QlaT+tFNUpvLh
   J/chZe3wwhcoOutGNxCHGuDJhjJ+VUQ4tBjp3AZm1avesdUY8duD+yfLM
   urHbTPquUjdB0J4PUjLNDoqoFeKwfnlJ6m/2CumJW6mcuyoY2sd+AQ3Cj
   g==;
X-CSE-ConnectionGUID: w2+ed9x3Sg+D26a0/QKDNg==
X-CSE-MsgGUID: zljgQdxaSWSkWqTbl15WMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56015605"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="56015605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:37:52 -0700
X-CSE-ConnectionGUID: uu/dMdKmTy6C/CMQq8oAyQ==
X-CSE-MsgGUID: vmFt6vaaS4WB85EZl06xXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148347549"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:37:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR89j-000000073o4-2D5Z;
	Mon, 16 Jun 2025 14:37:39 +0300
Date: Mon, 16 Jun 2025 14:37:39 +0300
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
Subject: Re: [PATCH v3 08/28] pinctrl: cs42l43: Use fw_devlink_set_device()
Message-ID: <aFACAwTAyIh2HtNm@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-9-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 03:47:48PM +0200, Herve Codina wrote:
> The code set directly fwnode->dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



