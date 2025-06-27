Return-Path: <linux-i2c+bounces-11672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66615AEBC85
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 17:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F6CB6A42C8
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 15:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91ACD2EACF6;
	Fri, 27 Jun 2025 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyPdnJ7Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5152EA14C;
	Fri, 27 Jun 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039522; cv=none; b=LEw7Nl1HIzJZGatY7RH84Lx86NIdHR+BQFd18S2OJq5IxqiIl2XFYmEfHGHDJachz8frR5dS2JqLNvVPtp27gSQcY16fvWPp+71ZQNPdms5jOGKiXPrhIfcDjl+NVThwjlmRhEgY2NsFB4KCfmtaZlpBByKmE75wGgD3ZFJJV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039522; c=relaxed/simple;
	bh=f0UYA/EuZoGSHsVhZD3Fus+HSK9WipcpF5RxkV+BP5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGV7y1jQ45g4SXi1xJX7Ki495PudN3emL0VPxvAyvWaOzY5/KK5XiUr++9Ccp4AHluPh7dUAN9kA0ie1Q5HkWuzKi+sBhguyJQxwBK5DIkBlkyUL/ol5BI6D79XMNwvJbGOD4C2meXk3Zp1nM+FkGYN2IWi6WvehwGexpsRQTA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyPdnJ7Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B088C4CEED;
	Fri, 27 Jun 2025 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039521;
	bh=f0UYA/EuZoGSHsVhZD3Fus+HSK9WipcpF5RxkV+BP5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyPdnJ7Q7HuuIiKgrWaMDcrBwxGTZiscgxJc6vl+XrICm0G79l/w04xJOgIgSsiT4
	 nyJKeqIT4LG/SdOrP9BThyVFe+sK/VvM3jidhmIf4FL5wNqqTU5vXGLNIqJcAXv1fB
	 qKTpyLWg6gUYFK9zYNPKm3MeePbH4VzwGEN7jkKanOyl7pqQcVspMU/YR0KWDgEe+y
	 Zv5XPVN4hnsL9/6Codf3WfenmJLS/Wop+OvwNF2usYFuIMsbN5lfU8nIT0Fa6ZEQ9G
	 1eaaz5yVdyekzbuVGyJ58FdAsHP1VfbszTS+QL47CPNvx+4zmaedL/KBAtCkPkCxRv
	 NsSgI1XvWhPIA==
Date: Fri, 27 Jun 2025 10:52:00 -0500
From: Rob Herring <robh@kernel.org>
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
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250627155200.GB3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-6-herve.codina@bootlin.com>

On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:
> The simple-pm-bus driver handles several simple busses. When it is used
> with busses other than a compatible "simple-pm-bus", it doesn't populate
> its child devices during its probe.
> 
> This confuses fw_devlink and results in wrong or missing devlinks.
> 
> Once a driver is bound to a device and the probe() has been called,
> device_links_driver_bound() is called.
> 
> This function performs operation based on the following assumption:
>     If a child firmware node of the bound device is not added as a
>     device, it will never be added.
> 
> Among operations done on fw_devlinks of those "never be added" devices,
> device_links_driver_bound() changes their supplier.
> 
> With devices attached to a simple-bus compatible device, this change
> leads to wrong devlinks where supplier of devices points to the device
> parent (i.e. simple-bus compatible device) instead of the device itself
> (i.e. simple-bus child).
> 
> When the device attached to the simple-bus is removed, because devlinks
> are not correct, its consumers are not removed first.
> 
> In order to have correct devlinks created, make the simple-pm-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.

IIRC, skipping child nodes was because there were problems with 
letting the driver handle 'simple-bus'. How does this avoid that now?

The root of_platform_populate() that created the simple-bus device that 
gets us to the probe here will continue descending into child nodes. 
Meanwhile, the probe here is also descending into those same child 
nodes. Best case, that's just redundant. Worst case, won't you still 
have the same problem if the first of_platform_populate() creates the 
devices first?

Rob

