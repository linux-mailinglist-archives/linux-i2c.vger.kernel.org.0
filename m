Return-Path: <linux-i2c+bounces-10876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299AAAE3FC
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 17:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E953A1C03D88
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 15:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A91B28A416;
	Wed,  7 May 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cX6+TqKU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF4289E3E;
	Wed,  7 May 2025 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630655; cv=none; b=b5sHBYrSxO32AoeYh9PBZ4PoF92/1mB1bhENIrS7IAcVmot5Biuat5eDKrRHdN1c+uoEU+1u5YARpyjYyBmhnC1Jg1fcW0X2jxu7IiXIJMNVSewuYi+UXlZ+UQllz/sN87aLqRk6MEv+Rp48haSNLEE0zxfsvX411ConWDXeySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630655; c=relaxed/simple;
	bh=1xPQQ8cgSsnUdxWhhTMgGFgv6gyyo/ahFyXwkkVFqhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTOWnRi2vlIerXGFn93OkExT2r/jn1/H9clUhOA5AP6ISrRJZnPfZC7CfF/xzjIIZVA86I3dHjmzXx31a3J7feWgAwlPjRZRZue7ltB5mm0Zlhv7Pj7CJ3ak1UKEZ2vyvFcezgcf2pWNpWOwrLxl5Hure8kHWx0cPIxk6RJbp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cX6+TqKU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630654; x=1778166654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1xPQQ8cgSsnUdxWhhTMgGFgv6gyyo/ahFyXwkkVFqhg=;
  b=cX6+TqKU7RQGNVxclZExECRgjj1qxucMa//puAi3K+1dxZEau90FSejs
   U57OnZLDO2OvxfzSxUvWRrxSGJ3JIQavgEwmdgt/TigGDJsymOLddWSLz
   PXdgUsx0/DllTzuSzy6lx2mfyHxyBmK1EInwqy08Ydhv747DEKTqd8fhL
   elC0tr4tr+uS2aE4n7ZNaWkFdVcyrTFZzTaBeoU7/9EryXiEAMSiz249J
   0inEZuKxRktoF7/9LDgfgPm14VSpZ+Ny2wPgmMCy+/1PsFJV6cLPXcN8Y
   Ulh7XL5lV5YAdOwXThhzzNAALpEZZgiP90EIMlfda3+5dLmgNZKiIDlXl
   Q==;
X-CSE-ConnectionGUID: WiifXXYMTwy5uqo8RFAFAA==
X-CSE-MsgGUID: j+4C9r5XTs2XnDDYJQpvXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48385043"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48385043"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:10:53 -0700
X-CSE-ConnectionGUID: 8ZDu9uRDQC+SvUB3OKws0Q==
X-CSE-MsgGUID: PnZJEGOxR4WhtEqGsijYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141107107"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:10:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgPw-00000003lUL-1quq;
	Wed, 07 May 2025 18:10:40 +0300
Date: Wed, 7 May 2025 18:10:40 +0300
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
Subject: Re: [PATCH v2 09/26] cxl/test: Use device_set_node()
Message-ID: <aBt38JR-YGD5nnC4@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-10-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-10-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:51AM +0200, Herve Codina wrote:
> The code set directly dev->fwnode.
> 
> Use the dedicated helper to perform this operation.

...

> @@ -1046,7 +1046,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
>  {
>  	device_initialize(&adev->dev);
>  	fwnode_init(&adev->fwnode, NULL);
> -	dev->fwnode = &adev->fwnode;
> +	device_set_node(dev, &adev->fwnode);
>  	adev->fwnode.dev = dev;
>  }

This code is questionable to begin with. Can the original author explain what
is the motivation behind this as the only callers of fwnode_init() are deep
core pieces _and_ this only module. Why?!

-- 
With Best Regards,
Andy Shevchenko



