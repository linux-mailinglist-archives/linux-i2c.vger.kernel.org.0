Return-Path: <linux-i2c+bounces-11675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D2AEBD89
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 18:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5595517C14A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 16:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883672EA724;
	Fri, 27 Jun 2025 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fs2Ad+ug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D12E54D5;
	Fri, 27 Jun 2025 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042038; cv=none; b=X6sSAq91vp5va2C6qBSrFMnhmZ4h/IXLXcfclbs3QFhFNZxYo2ftun0cXA8xv5xrEVzrH46o0O+l6Dga5ZnaJn8nykmrBEjVzBXrdeSeLqy9GvdGcYMW7srxLJq9D4rywev+ZYrQ01jEVcKoXbYXLCLvI2gSA+YX4XmTXdj8VbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042038; c=relaxed/simple;
	bh=Y2MaEeceKNbv4yiFNLVL6EuLylExKPZ4w7oafZAoUjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIZC0YPj4qLUWOWmpjAGtffE3Cu588GxX+irDgvlQxOgRF7RcdYc3vQ9UYz1mhcnop/tQ1RRwAiprHlqDETcbFXzcXxJYS5BDbf9UmyG2yYJu3xf78wKgx67TZAypToBeAjiOsuzeJ3xwgyJHnCka6CQiigahlH2dg5kJKpITtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fs2Ad+ug; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751042037; x=1782578037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2MaEeceKNbv4yiFNLVL6EuLylExKPZ4w7oafZAoUjc=;
  b=Fs2Ad+ugEnW8qSsWArq7KVp/lsBNdKr6NrF7KParsLYBR7T+yEk/tJaU
   dyJPDQmYz4KYZ6Su5/F793XJ0LVHZv5x4RKaroLfBoCkROG6Ygnjr7ygv
   Rowen59uXo/Ceoz/Bx0T675mCWUlY85IT+yQh3gWEVpQ0S1Z+d9xWyIqR
   DiG59v7XJ/QOfNdmCCIvyzGsZ1ai7wd1kJ3ECMn+h/Nh8c1CmbFdy2Hwh
   YdW8uiMPCnRuGzYhQYU7ZMShL/imkbJm+EoSxZp9qWL1yzewGX/yKik6J
   +dnhKUOCC6BxPOaMZjTaDXUe3BSz+TNDA7Spespo1jEHMrac/0b+ufLVT
   Q==;
X-CSE-ConnectionGUID: aDwHT5DZTHaKji7HqORHCQ==
X-CSE-MsgGUID: 5gb/9b34S5CPJ/EWiYVXyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53079635"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53079635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:33:56 -0700
X-CSE-ConnectionGUID: 1C2IXb2STTuL8X3DDhbOyQ==
X-CSE-MsgGUID: danC++UFS6ObVuVtA6jiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157388500"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:33:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uVC1D-0000000AXHz-2uXB;
	Fri, 27 Jun 2025 19:33:39 +0300
Date: Fri, 27 Jun 2025 19:33:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
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
	Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
Message-ID: <aF7H4-toeb7Ouz3d@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-19-herve.codina@bootlin.com>
 <20250627162245.GA3513535-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627162245.GA3513535-robh@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 11:22:45AM -0500, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:

...

> > -	if (IS_ENABLED(CONFIG_X86))
> > +	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))
> 
> I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not 
> add more users. 
> 
> I think this should instead check for specific platforms not with 
> kconfig symbols but DT properties. For ce4100, you can just check the 
> root compatible string. For OLPC, there isn't a root compatible (in the 
> DT I have). You could check for /architecture == OLPC instead. There's 
> some virtualization guests using DT now too. I would think their DT's 
> are simple enough to avoid any fw_devlink issues. 

I don't think this is good approach. The above check is more reliable in my
opinion.

> Alternatively, we could perhaps make x86 fw_devlink default off

For my (little) knowledge I believe this is not feasible anymore.
Some x86 code (drivers) relies on fw_devlink nowadays. But take
this with grain of salt, I may be way mistaken.

> and then enable it only when you create nodes. Maybe it has to be restricted
> a sub tree of the DT to avoid any later interactions if devices are unbound
> and rebound. Not a fully fleshed out idea...

-- 
With Best Regards,
Andy Shevchenko



