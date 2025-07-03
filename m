Return-Path: <linux-i2c+bounces-11802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3479AF6D67
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 10:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 242C8484248
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 08:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA36D2D373D;
	Thu,  3 Jul 2025 08:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LrYxjxAT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4C1D63F0;
	Thu,  3 Jul 2025 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532405; cv=none; b=CIxJWtj9Vs/yVZrVWh30fR6FoTcsc/vN6DABadz6Zlm8dkT9WgWIN7eGAQmLujLyGEbKFEbJwOTSh6pmr10+zp0cVqMAJxYhGFyGjD6N8f4aeFFOP3UKa+rAeEVt3QY68gwdgKhswjjj3dyE3ZxVt46XUEkCwRKdefAuYJclRDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532405; c=relaxed/simple;
	bh=oGnwNU54b6KjKEBNmnldSK7G2EHT2bg7bXi44Ajxx2c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGgnbG4emSswKOmOaqjQ+ux4ph16qD3PTorXTNW8O3j5peN42QuonMuObOdRk27z4GWAtc/tBo2pVRwhcoPA03jH5np7hEGMU0u5tkMr6X4nNef+KpOc5kOzcYl4L1vTHtUBmQFK6+wJHrn3EgHFCtL68zQV7Q4O//DxK6dUU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LrYxjxAT; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AD90432F4;
	Thu,  3 Jul 2025 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751532400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cYj0q/giLszIR3kilyQWrZxMIeIjICge0MHLXkjJFo=;
	b=LrYxjxAThrFQpeyWKPo7KHXblOcrN7BiWBU1ybIgmr/F8jlZn3oMMuFSHLRpDBJCmRCA1w
	MsFwFPjimMNCZQBEGw0AUhUDK+RAMDTtWJ2veBlFxBS70NDSyClS2oazJsm9GXuSSiABnA
	oV403Rb+nr5PpxxEXLcxSLdmT4WfVx+scbhDaUmQmv71EzmVWmfh952msl/4kd5FhS3UgG
	H6v5SK89osI7/Zr7u5WkZX5kRsBq/netzt1snf3UAWVuxgU+g1X7fWrnla9+ir1xgj8s0A
	kz1ZlldSa5AVR+gsrbQOELucUNukpblb0eV9CI8FzxxdgnsPKwKF60r3zk4j5Q==
Date: Thu, 3 Jul 2025 10:46:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len
 Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso
 <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 00/28] lan966x pci device: Add support for SFPs
Message-ID: <20250703104636.5012907d@bootlin.com>
In-Reply-To: <20250627155837.GC3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250627155837.GC3234475-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeekpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Fri, 27 Jun 2025 10:58:37 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 13, 2025 at 03:47:40PM +0200, Herve Codina wrote:
> > Hi,
> > 
> > This series add support for SFPs ports available on the LAN966x PCI
> > device. In order to have the SFPs supported, additional devices are
> > needed such as clock controller and I2C.
> > 
> > As a reminder, the LAN966x PCI device driver use a device-tree overlay
> > to describe devices available on the PCI board. Adding support for SFPs
> > ports consists in adding more devices in the already existing
> > device-tree overlay.
> > 
> > With those devices added, the device-tree overlay is more complex and
> > some consumer/supplier relationship are needed in order to remove
> > devices in correct order when the LAN966x PCI driver is removed.
> > 
> > Those links are typically provided by fw_devlink and we faced some
> > issues with fw_devlink and overlays.
> > 
> > This series gives the big picture related to the SFPs support from
> > fixing issues to adding new devices. Of course, it can be split if
> > needed.
> > 
> > The first part of the series (patch 1, 2 and 3) fixes fw_devlink when it
> > is used with overlay. Patches 1 and 3 were previously sent by Saravana
> > [0]. I just rebased them on top of v6.15-rc1 and added patch 2 in order
> > to take into account feedback received on the series sent by Saravana.
> > 
> > Those modification were not sufficient in our case and so, on top of
> > that, patch 4 and 5 fix some more issues related to fw_devlink.
> > 
> > Patches 6 to 12 introduce and use fw_devlink_set_device() in already
> > existing code.
> > 
> > Patches 13 and 14 are related also to fw_devlink but specific to PCI and
> > the device-tree nodes created during enumeration.
> > 
> > Patches 15, 15 and 17 are related fw_devlink too but specific to I2C
> > muxes. Patches purpose is to correctly set a link between an adapter
> > supplier and its consumer. Indeed, an i2c mux adapter's parent is not
> > the i2c mux supplier but the adapter the i2c mux is connected to. Adding
> > a new link between the adapter supplier involved when i2c muxes are used
> > avoid a freeze observed during device removal.
> > 
> > Patch 18 adds support for fw_delink on x86. fw_devlink is needed to have
> > the consumer/supplier relationship between devices in order to ensure a
> > correct device removal order. Adding fw_devlink support for x86 has been
> > tried in the past but was reverted [1] because it broke some systems.
> > Instead of enabling fw_devlink on *all* x86 system or on *all* x86
> > system except on those where it leads to issue, enable it only on system
> > where it is needed.
> > 
> > Patches 19 and 20 allow to build clock and i2c controller used by the
> > LAN966x PCI device when the LAN966x PCI device is enabled.
> > 
> > Patches 21 to 25 are specific to the LAN966x. They touch the current
> > dtso, split it in dtsi/dtso files, rename the dtso and improve the
> > driver to allow easier support for other boards.
> > 
> > The next patch (patch 26) update the LAN966x device-tree overlay itself
> > to have the SPF ports and devices they depends on described.
> > 
> > The last two patches (patches 27 and 28) sort the existing drivers in
> > the needed driver list available in the Kconfig help and add new drivers
> > in this list keep the list up to date with the devices described in the
> > device-tree overlay.
> > 
> > Once again, this series gives the big picture and can be split if
> > needed. Let me know.  
> 
> Please suggest how you think this should get merged? There's 8 
> maintainer trees involved here. Some parts can be merged independently? 
> We need to spread over 2 cycles? Greg just takes it all?
> 
> Rob

I will add this information in the next iteration.

I think, the merge strategy could be the following:
 - patches 1 to 14 could be merged by driver core maintainers in cycle N

 - patches 15 to 17 and 20 could be merged by I2C maintainers in cycle N
   without any dependency issues against other patches.

 - patch 18 could be merged by OF maintainers in cycle N without any
   dependency issues

 - patch 19 could be merged by clock maintainers in cycle N without any
   dependency issues.

 - patch 21 to 25 could be merged by misc maintainers in cycle N without any
   dependency issues.

 - patch 26 to 28, even if there is no compilation dependencies with other
   patches, they need the other patches applied to have a working system and
   so they could be merged in cycle N+1.

Also, as the big picture and the goal of this series has been shown, I can
extract patches from this series and send them alone depending on maintainers
preferences.

Maintainers, just tell me.

Best regards,
Hervé

