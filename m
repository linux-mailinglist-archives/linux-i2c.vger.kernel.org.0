Return-Path: <linux-i2c+bounces-14086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759BC5EC6D
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 19:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C70F381066
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 17:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476A2348899;
	Fri, 14 Nov 2025 17:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrRY4ZQr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C03451B0;
	Fri, 14 Nov 2025 17:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142527; cv=none; b=NT/aFXl3SHt0Dxq85VbCrEo/YYhzksJVvgiNn8Bk80KrrtFvKrf3z2nFLkk8QCAwKoOpIIHbluCcL2s3SN/zfEsn9K9WS+C5gfivErLlvPaaK1Gza5Nmr95SMKyT4JZgspqdbRMicVgUSIjdgGszzyQ8V8mw6j/0kJxJriQ5z4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142527; c=relaxed/simple;
	bh=yocwTQVHHZ1oHWeawnGjtUSUysV1o9GGmLQY2fd93FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwkQfKbYruidPj+x6DurcpMrZzpgF3Ez8A2lwN+CYoDOnoAFHFNlwnx25b3lJfDBA8C6ZmGtb6IAwYZcy+WeOjSu4mL0IT4csg/p/1ohRqGu4eTjphH9udvzbYf8/h7hg1YVjaHY2AHihKzFtKTAnvM9cE7vuI8voQEBAQhjRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrRY4ZQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BA5C116D0;
	Fri, 14 Nov 2025 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763142526;
	bh=yocwTQVHHZ1oHWeawnGjtUSUysV1o9GGmLQY2fd93FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrRY4ZQrDYvtv6r8RIAFYBCRLxeDPRRQdFhBOSiHfHjEmJEFZwQjQlxLe5Uy5KLpz
	 weOmScjpMD9XpoOt77SUWH5R7y/xNE8DF6lcEn4qWeNN540vDg+B8LgnWCgRqa4R0T
	 sib1hd1cIceLKwAzoZlfgOu3daGIE7raxiI1LC5BR0R8roVGqGTQ87bAasz2PxucVh
	 uMPcUqtO9zxeHeJw8B4UJ2oTIaZbpPI8n2wMKR0p34lGoQGI3RjZ5nLGBE/dkvN7+5
	 It+4AUl0P8h3pRHUb6PKeo/0OY1eivLQ27zQvNkN66gucGnW3u9he2Gr3NIwXLyYoC
	 uw7qDwwhB3xLQ==
Date: Fri, 14 Nov 2025 11:48:44 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 00/29] lan966x pci device: Add support for SFPs
Message-ID: <20251114174844.GA3792362-robh@kernel.org>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015071420.1173068-1-herve.codina@bootlin.com>

On Wed, Oct 15, 2025 at 09:13:47AM +0200, Herve Codina wrote:
> Hi,
> 
> This series add support for SFPs ports available on the LAN966x PCI
> device. In order to have the SFPs supported, additional devices are
> needed such as clock controller and I2C.
> 
> As a reminder, the LAN966x PCI device driver use a device-tree overlay
> to describe devices available on the PCI board. Adding support for SFPs
> ports consists in adding more devices in the already existing
> device-tree overlay.
> 
> With those devices added, the device-tree overlay is more complex and
> some consumer/supplier relationship are needed in order to remove
> devices in correct order when the LAN966x PCI driver is removed.
> 
> Those links are typically provided by fw_devlink and we faced some
> issues with fw_devlink and overlays.
> 
> This series gives the big picture related to the SFPs support from
> fixing issues to adding new devices. Of course, it can be split if
> needed.
> 
> The first part of the series (patch 1, 2 and 3) fixes fw_devlink when it
> is used with overlay. Patches 1 and 3 were previously sent by Saravana
> [0]. I just rebased them on top of v6.18-rc1 and added patch 2 in order
> to take into account feedback received on the series sent by Saravana.
> 
> Those modification were not sufficient in our case and so, on top of
> that, patches 4 to 7 fix some more issues related to fw_devlink.
> 
> Patches 8 to 13 introduce and use fw_devlink_set_device() in already
> existing code.
> 
> Patches 14 and 15 are related also to fw_devlink but specific to PCI and
> the device-tree nodes created during enumeration.
> 
> Patches 16, 17 and 18 are related fw_devlink too but specific to I2C
> muxes. Patches purpose is to correctly set a link between an adapter
> supplier and its consumer. Indeed, an i2c mux adapter's parent is not
> the i2c mux supplier but the adapter the i2c mux is connected to. Adding
> a new link between the adapter supplier involved when i2c muxes are used
> avoid a freeze observed during device removal.
> 
> Patch 19 adds support for fw_delink on x86. fw_devlink is needed to have
> the consumer/supplier relationship between devices in order to ensure a
> correct device removal order. Adding fw_devlink support for x86 has been
> tried in the past but was reverted [1] because it broke some systems.
> Instead of enabling fw_devlink on *all* x86 system, enable it on *all*
> x86 except on those where it leads to issue.
> 
> Patches 20 and 21 allow to build clock and i2c controller used by the
> LAN966x PCI device when the LAN966x PCI device is enabled.
> 
> Patches 22 to 26 are specific to the LAN966x. They touch the current
> dtso, split it in dtsi/dtso files, rename the dtso and improve the
> driver to allow easier support for other boards.
> 
> The next patch (patch 27) update the LAN966x device-tree overlay itself
> to have the SPF ports and devices they depends on described.
> 
> The last two patches (patches 28 and 29) sort the existing drivers in
> the needed driver list available in the Kconfig help and add new drivers
> in this list keep the list up to date with the devices described in the
> device-tree overlay.
> 
> We believe some items from the above list can be merged separately, with
> no build dependencies. We expect:
> 
>  - Patches 1 to 7 to be taken by driver core maintainers
> 
>  - Patches 8 to 13 to be taken by driver core maintainers
> 
>  - Patches 14 and 15 to be taken by driver core or PCI maintainers
>   (depend on patch 8)
> 
>  - Patches 16 to 18 to be taken by I2C maintainers
> 
>  - Patch 19 to be taken by driver core or OF maintainers
> 
>  - Patch 20 to be taken by clock maintainers
> 
>  - Patch 21 to be taken by I2C maintainers
> 
>  - Patches 22 to 29 to be taken by misc maintainers

I don't think this is going to land in 6.19, so I've applied patches 1 
and 3.

Rob

