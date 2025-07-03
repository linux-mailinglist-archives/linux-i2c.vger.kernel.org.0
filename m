Return-Path: <linux-i2c+bounces-11797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78FAF6A72
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 08:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81FC97AAE9B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 06:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B768291C33;
	Thu,  3 Jul 2025 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PwapMf4A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870D228CB0;
	Thu,  3 Jul 2025 06:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524684; cv=none; b=WYQqkfMWlGqUVdSnw4pVN0aYjX1GlGKEUOWLEXOYjnQrcdGF96BIre0iTkTvBS2atoPDT4+MKHRPn55g6L4iUE4kjr39XXJn5u+77rVuRr9oUEKNDJ3laGykS+0aTEUT13OZUBSWDg1piVMrtyrZaBFwMTOcZ/jRX7VxquKTDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524684; c=relaxed/simple;
	bh=ycFo1nLp5/0QWcqp2qZGxrXVZQq/5D3iTncGtW7GLO8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhRnV1CSMqGL+4N2Qcljk4uqYmyCDYjyUReeDAwIRn6oS2plNDuGYwL3KH/w6PvaBfEgxFLdeRR4xua4soCcJrDuX28/3o7obAT6EjXtsIJdY4/LsLvfLO0Qitsd1+ZNf/zMo+hC8Ktg/Lq5jwg+l81aSqcYM01ADDXVb6/L9RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PwapMf4A; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598C041B5F;
	Thu,  3 Jul 2025 06:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751524679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+WaR4VhxZXal3ni8c5FuKUZQzKkcDX9MLohXTPfTgg=;
	b=PwapMf4AOf1u09JZyAvuq3MEs5Q4wJkpokCf2i9YxktO3oxlAqxu3Kuva4qlUMVWrZe6Ch
	VsiHnhZuSck3prB2PK5yzQ3fhCQSCMLnythuh+f1I7Xp/uqgW095xyV41I1sLuK+fb2Rt4
	34LwUAwFXNTWwxNYB2VkvYdynIt2L6NXbtpqKiJNhf9VRJHwM5lSz6I4HCFqw9fpinlL/Q
	6J9qijxfXxGDsGK9I7GWGydnMqWvaV6jJyPnc6KvT53yUQPq+TtCmIIR/doowMzDlFQfuL
	lyDTf+GBFBaRwnczT067UcPIVZgQ9a5tk0e34+6QyDx5/zD9/kxezacCrcPHxA==
Date: Thu, 3 Jul 2025 08:37:55 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn
 <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len
 Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
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
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
Message-ID: <20250703083755.2fee7e7c@bootlin.com>
In-Reply-To: <CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-19-herve.codina@bootlin.com>
	<20250627162245.GA3513535-robh@kernel.org>
	<aF7H4-toeb7Ouz3d@smile.fi.intel.com>
	<CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfeljedtfedtjeevffegtddutdeghfettdduhfeuhfdttdffieeuiefgvdfhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegkedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgth
 hdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob, Andy,

On Fri, 27 Jun 2025 12:49:36 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 27, 2025 at 11:33 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jun 27, 2025 at 11:22:45AM -0500, Rob Herring wrote:  
> > > On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:  
> >
> > ...
> >  
> > > > -   if (IS_ENABLED(CONFIG_X86))
> > > > +   if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))  
> > >
> > > I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not
> > > add more users.
> > >
> > > I think this should instead check for specific platforms not with
> > > kconfig symbols but DT properties. For ce4100, you can just check the
> > > root compatible string. For OLPC, there isn't a root compatible (in the
> > > DT I have). You could check for /architecture == OLPC instead. There's
> > > some virtualization guests using DT now too. I would think their DT's
> > > are simple enough to avoid any fw_devlink issues.  
> >
> > I don't think this is good approach. The above check is more reliable in my
> > opinion.  
> 
> I'm fine with any solution that doesn't add a
> CONFIG_PCI_DYNAMIC_OF_NODES which we can't remove. Adding it was a
> kick the can down the road to merge the support worry the mixed
> usecase (on ACPI systems) later. It's now later.
> 
> > > Alternatively, we could perhaps make x86 fw_devlink default off  
> >
> > For my (little) knowledge I believe this is not feasible anymore.
> > Some x86 code (drivers) relies on fw_devlink nowadays. But take
> > this with grain of salt, I may be way mistaken.  
> 
> Doesn't the CONFIG_X86 check disable it?
> 
> Rob

Filtering out by Kconfig seems a no-go:
  - Check for CONFIG_OLPC of CONFIG_X86_INTEL_CE as proposed in v1
    (https://lore.kernel.org/lkml/20250407145546.270683-12-herve.codina@bootlin.com/)
    was a no-go from Andy

  - Check for CONFIG_PCI_DYNAMIC_OF_NODES as proposed here is a no-go from
    Rob

I will follow Rob's suggestion based on DT properties. With a DT property
list, it would be easier to add more x86 fw_delink broken system in the list
of the system to exclude.

Best regards,
Hervé

