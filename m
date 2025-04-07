Return-Path: <linux-i2c+bounces-10171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BCA7E44C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B771044291C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F6B1FECB6;
	Mon,  7 Apr 2025 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLdcR7HN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859A1F8BBC;
	Mon,  7 Apr 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039059; cv=none; b=ezs4ecL33J1VueEKn2uJJk7VEotVGnirOeJVXdfC/lQpbnGvHUF15ykYYuHjPFXf4GzcuUi1SIbgdIWdsSQ+2Yij2yFPG0cYVikMcSf2dcaNt5yfDaR8BgifPjPrTzR7vQ4ZBVBizfPTh6oUNBicYEuPqPtTknStnr2p74aHbmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039059; c=relaxed/simple;
	bh=PslDmB+xXRuJt9oVyCJAThWQ5Sbb1YZU0r34pKry31k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI5HgVAEFkx5XedswTdEGWZWS+K8oX5ryYDxVYR+58W/aoSM0wz+0zrXV+zDP83sps0WamYAo9+MxuYF6m+FnS/v6HDjcy6FDSez0eDUAQ65JVoWHnnYdS4lvxyfoe/xkRkEGoC/nNOUjn+rDziz/MTC45Mj+NebFTrDxzLNS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLdcR7HN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039058; x=1775575058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PslDmB+xXRuJt9oVyCJAThWQ5Sbb1YZU0r34pKry31k=;
  b=lLdcR7HNBKPe9NE9bjFLVic+KdDj3jQig0gKMe3As0FdWc8wMh1LK9+0
   9diiUoXj7fA9ouvq4aaWGQqY1ob3OZ7BRpsjzuTE9CY2keomKJabcCjCk
   nzXuiZYfJbo09WCKe7xDszmXR0gaX2barW3TH0WFnSLa5HayWIVsXDhxR
   KOfMWH2B2rWhMSK6Y6hHZ8gyhInyF6fsrrBE98LXrcue6dVAjqvByDOf5
   6oU/myhP9/jxC88pfWYSyU9wiw5CarjMK+P0oWRH2bFoyuB2T+gcTxD83
   2DQOULbBlbSxnTlMg+qtWRCcXBobC4FGmjA7vjjGiAPathx9+5gSVPyrD
   w==;
X-CSE-ConnectionGUID: QZjZWV4wRCq5ZR0yirHesg==
X-CSE-MsgGUID: Gjgrttn3Qc+wW8QZkElQGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56069866"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56069866"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:17:37 -0700
X-CSE-ConnectionGUID: Q9eEfbCtQner0+TLJmb8Tg==
X-CSE-MsgGUID: /e5hd6FESmOlGWRlOu5MBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158973456"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:17:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oE0-0000000A6hm-3YVn;
	Mon, 07 Apr 2025 18:17:24 +0300
Date: Mon, 7 Apr 2025 18:17:24 +0300
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
Subject: Re: [PATCH 01/16] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <Z_PshFwFJQ0z8JOU@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-2-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:30PM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> From: Saravana Kannan <saravanak@google.com>

No need to have this in the commit message.

> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> 
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.

-- 
With Best Regards,
Andy Shevchenko



