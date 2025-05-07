Return-Path: <linux-i2c+bounces-10875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B21AAE3DB
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 17:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AA287B82ED
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 15:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DAD28A1E0;
	Wed,  7 May 2025 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi5qpeWu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0785280325;
	Wed,  7 May 2025 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630379; cv=none; b=WxevQmuip5KvWgF2QkHpzsyWhLpt+6CTSPPxhY2XcaftVhv/1Zums915Mn120x1Y25cN9ZIpLk9IH2lyYmwX+lFSacY7wma0pCApiSc2uNrqRHiy9KG5kXE7c1Lim2zdahSbVr9cVIo31vDgqA8SUHUwlgEo88h9iPu8Msb4BIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630379; c=relaxed/simple;
	bh=Y/WUVh0ev6M+r+m9bgj7h8JDEj1XP6+S3ee84YZotzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzXdLFlZRumFwsb676Dql+0qKlrVFkSwQRcPn20p9056rFCCKdnBil1DEBVzz5Qt7H16aXoWJhUaVe9PBn65wJMn+1CNZe+LcOs9dX7y6WCDYgiAiHqY+TL7RhJOSzFC7xTsbElTxSKAKfMRyzsoQEVyMa8WSB9QiYy1fmqT9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi5qpeWu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630378; x=1778166378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y/WUVh0ev6M+r+m9bgj7h8JDEj1XP6+S3ee84YZotzA=;
  b=Hi5qpeWuqGVwCfebbZfd+jIULw1Al/Q0injcLNVQrC5XJb4dSjwyee04
   MIyAqnBYeOIDNUFqYpAcrUAL27Ti1AtBfEd1Waj5qwCBE7iZ6fDaEjh4S
   IvRNCM6Ezf//zmV5ujy2ncClCNt6/ZngFcY0M/EBDYnFKdqaH2u+hCQPv
   1BYC02Gy6iEXEkBxFkBjw6xCftTHo8yFFHs56YSecOlkRCPbK5rlZTr+S
   m4vDjDp4ZmAP2aXL0gvdm1fm3evZC8k4vIM3XgJ7/TEScuyJb79TLoc+n
   WIvaFDmVni6qvKn+PLxv3gyEGzQgN9uludtATJ1Anpeac2fQDeBl+NgFQ
   g==;
X-CSE-ConnectionGUID: BoVPYeN9QryGnx/F72B3MQ==
X-CSE-MsgGUID: YTKdKMdhR96JO91JgiPoRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52183812"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52183812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:06:16 -0700
X-CSE-ConnectionGUID: Z/H6YXNKTMeyF9mW6VqssQ==
X-CSE-MsgGUID: d/50a7xkRzuk5pzTD8W5Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136502215"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:06:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgLS-00000003lQ1-4BdZ;
	Wed, 07 May 2025 18:06:03 +0300
Date: Wed, 7 May 2025 18:06:02 +0300
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
Subject: Re: [PATCH v2 08/26] pinctrl: cs42l43: Use fw_devlink_set_device()
Message-ID: <aBt22olAebSy8Xx3@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-9-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:50AM +0200, Herve Codina wrote:
> The code set directly fwnode->dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

...

>  		fwnode = fwnode_get_named_child_node(fwnode, "pinctrl");
>  

>  		if (fwnode && !fwnode->dev)

Why do we bother checking the fwnode->dev here?
Just wondering... Hopefully the original author of the code can explain what is
going on here.

> -			fwnode->dev = priv->dev;
> +			fw_devlink_set_device(fwnode, priv->dev);
>  	}

-- 
With Best Regards,
Andy Shevchenko



