Return-Path: <linux-i2c+bounces-11673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F34AEBCB3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 17:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0971B188C109
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 15:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB362E9ECD;
	Fri, 27 Jun 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4tJ94JZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963819E990;
	Fri, 27 Jun 2025 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039919; cv=none; b=bR9chPMaORbaIfQnOBSduck6sEDrjc5b6Vjdb0mXWFtcgQaj+9mvp6Lv8cTMv9q6qcj+Eb82xNsumsGSvn1dP9bosnFe5mBYrDu7OXaHvaCJLSpcU4PEYni3rgoODNvxI9sBnkhZAEgTOxM20JAQu9NSdcgVqKDC8ILRGxymOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039919; c=relaxed/simple;
	bh=tBv0zN4w3fBWkY/nFOn0k+IhVxh6OQEYPfuuw9vKCvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfiq9Wl2ge9Vvl0GWciZkfrZXqScZ6GVoCwn9lxxARBLQfVGwjv/C+rjGj183umfD84M0ykVcv904w5kHF6kMdnc1IXNyaPrhZFrvXB1snWQSI1Pm2Oaa8DM0JKGqXh/hbc1KT2oqYVQjcm8VKfB41D7bjDWZzZ1pZMiham4WgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4tJ94JZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7B3C4CEE3;
	Fri, 27 Jun 2025 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039918;
	bh=tBv0zN4w3fBWkY/nFOn0k+IhVxh6OQEYPfuuw9vKCvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4tJ94JZTjGfbHmZDMM8bIuOky0BWZylZfr+Z7v8HXEL7evqfsEWw1BgYoEYnFfpX
	 SdKj4hkTwOEnNMp6O4y/hMVwX+Tk/9SY3kG6RNby6zDETioc5MDSawDH9+LcaRgrsG
	 Pz3RCeX3aRYkjYStdMtyjYME4zWrNpS+iykXmBun6VP+XXrF6ivxSzv5WeRN87gV/M
	 HLSMkb13vj/LZuOP9gKQN4koUKfveUcJGZoe0jAWfkjC9sE+Y1rfFm+XLyHfVaaSV5
	 SQAYvDPy3PQkLshJCnEyhDpwGRkyX80rd1xx5d7Iwju+Cm+YcCtjz9Kx4UzxQ1xIYx
	 RCWGTryFzxJ0Q==
Date: Fri, 27 Jun 2025 10:58:37 -0500
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
Subject: Re: [PATCH v3 00/28] lan966x pci device: Add support for SFPs
Message-ID: <20250627155837.GC3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>

On Fri, Jun 13, 2025 at 03:47:40PM +0200, Herve Codina wrote:
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
> [0]. I just rebased them on top of v6.15-rc1 and added patch 2 in order
> to take into account feedback received on the series sent by Saravana.
> 
> Those modification were not sufficient in our case and so, on top of
> that, patch 4 and 5 fix some more issues related to fw_devlink.
> 
> Patches 6 to 12 introduce and use fw_devlink_set_device() in already
> existing code.
> 
> Patches 13 and 14 are related also to fw_devlink but specific to PCI and
> the device-tree nodes created during enumeration.
> 
> Patches 15, 15 and 17 are related fw_devlink too but specific to I2C
> muxes. Patches purpose is to correctly set a link between an adapter
> supplier and its consumer. Indeed, an i2c mux adapter's parent is not
> the i2c mux supplier but the adapter the i2c mux is connected to. Adding
> a new link between the adapter supplier involved when i2c muxes are used
> avoid a freeze observed during device removal.
> 
> Patch 18 adds support for fw_delink on x86. fw_devlink is needed to have
> the consumer/supplier relationship between devices in order to ensure a
> correct device removal order. Adding fw_devlink support for x86 has been
> tried in the past but was reverted [1] because it broke some systems.
> Instead of enabling fw_devlink on *all* x86 system or on *all* x86
> system except on those where it leads to issue, enable it only on system
> where it is needed.
> 
> Patches 19 and 20 allow to build clock and i2c controller used by the
> LAN966x PCI device when the LAN966x PCI device is enabled.
> 
> Patches 21 to 25 are specific to the LAN966x. They touch the current
> dtso, split it in dtsi/dtso files, rename the dtso and improve the
> driver to allow easier support for other boards.
> 
> The next patch (patch 26) update the LAN966x device-tree overlay itself
> to have the SPF ports and devices they depends on described.
> 
> The last two patches (patches 27 and 28) sort the existing drivers in
> the needed driver list available in the Kconfig help and add new drivers
> in this list keep the list up to date with the devices described in the
> device-tree overlay.
> 
> Once again, this series gives the big picture and can be split if
> needed. Let me know.

Please suggest how you think this should get merged? There's 8 
maintainer trees involved here. Some parts can be merged independently? 
We need to spread over 2 cycles? Greg just takes it all?

Rob

