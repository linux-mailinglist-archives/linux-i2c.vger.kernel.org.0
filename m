Return-Path: <linux-i2c+bounces-10211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AAFA80CF7
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61844A3642
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 13:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099681AA1C8;
	Tue,  8 Apr 2025 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ocTueDsO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477AD175D50;
	Tue,  8 Apr 2025 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120174; cv=none; b=BjRk8fgQSYaKEkLS5gxh0gE2+H+YNUyqm2zxcXGK2P5ERFx1OjuACqIE/cGgP7Wlo1qI/tFOVEkCnDB4Wuj7hjwY5UIgG5fVO5al9qiT7wbbIqoMveBj/Z1IZRBY7xBxbwT+wT98fx3+i0+0ZtzmsVUreuyUEhYKJRvqJKVfFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120174; c=relaxed/simple;
	bh=bJHBesezYdSwQj977PGWwvjWknkqIgR5+rczhLN73tc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sukp6UFaT68e5xEoVSDU1lFnZe4mTOeJ0Easr8d8jj3UP0iNRZRjM7Mjhyt8TC3/kX8Lv5EyJxD4Xf6598EymOCucbSzs8Vc4UBfLolAgqjhAMTJ6bBadfpReyV4xtQ3g700odSqQNewFn9VZQ+vHJ7xXCvPI1Ihw2Xpnjx8E/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ocTueDsO; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7CA443E60;
	Tue,  8 Apr 2025 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744120169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGv7EI/vb/WroSRb61QAnWmRAgGHfwWpS5vWQR/P62w=;
	b=ocTueDsOQBY97b6OOGZOl+0+CGjLCjgOKSwwXqHwiCnH6vmx1anE6O9yAj63OnXYrkuzyc
	ROeY6i+mCpKNCUjvpEnBoBGRjljPmj9YGxlYTA/MdqwYN0OvjRnHcXpWfG+ih9o15hA3om
	cSFR/SgeScMlY632kxbwMBT9LJSqMUtWn+KBqMpAkjocWWk9R/fDd/CBhILERv7yvmijyw
	d/Z/iOC9dEKOrcjowZeFJyqfiBe//l55JzjDhjW1oY0QoY71+uBBGstbso15FwiONrrOyg
	nYDzGAt8fmeGJE1pR3EzZACDqmlnhQmlHzJPn/UrRwysA5i1M4/SQN4buqsMSQ==
Date: Tue, 8 Apr 2025 15:49:25 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 11/16] of: property: Allow fw_devlink device-tree
 support for x86
Message-ID: <20250408154925.5653d506@bootlin.com>
In-Reply-To: <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-12-herve.codina@bootlin.com>
	<Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeevgfefffejteefveffkefffefgtedugedvhfevjedvgeekieelffeihfeuvdeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdpr
 hgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Mon, 7 Apr 2025 18:36:28 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:
> > PCI drivers can use a device-tree overlay to describe the hardware
> > available on the PCI board. This is the case, for instance, of the
> > LAN966x PCI device driver.
> > 
> > Adding some more nodes in the device-tree overlay adds some more
> > consumer/supplier relationship between devices instantiated from this
> > overlay.
> > 
> > Those fw_node consumer/supplier relationships are handled by fw_devlink
> > and are created based on the device-tree parsing done by the
> > of_fwnode_add_links() function.
> > 
> > Those consumer/supplier links are needed in order to ensure a correct PM
> > runtime management and a correct removal order between devices.
> > 
> > For instance, without those links a supplier can be removed before its
> > consumers is removed leading to all kind of issue if this consumer still
> > want the use the already removed supplier.
> > 
> > The support for the usage of an overlay from a PCI driver has been added
> > on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
> > host bridge node").
> > 
> > In the past, support for fw_devlink on x86 had been tried but this
> > support has been removed in commit 4a48b66b3f52 ("of: property: Disable
> > fw_devlink DT support for X86"). Indeed, this support was breaking some
> > x86 systems such as OLPC system and the regression was reported in [0].
> > 
> > Instead of disabling this support for all x86 system, use a finer grain
> > and disable this support only for the possible problematic subset of x86  
> 
> > system mixing ACPI and device-tree at boot time (i.e. OLPC and CE4100).  
> 
> This is incorrect, they never had ACPI to begin with. Also there is third
> platform that are using DT on x86 core — SpreadTrum based phones.

I will rework the commit log to avoid 'mixing ACPI and device-tree'

For "SpreadTrum based phones", do you have an idea about the Kconfig symbol
I could use to filter our this x86 systems?

Anything I find upstream related to SpreadTrum seems base on ARM cpus.
I probably miss something.

> 
> And not sure about AMD stuff (Geode?).

Same here, if some AMD devices need to be filtered out, is there a specific
Kconfig symbol I can use ?

> 
> > [0] https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/  
> 
> Can you make this to be a Link tag?
> 
> Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
> 

Yes, of course, I will do that in the next iteration.

Best regards,
Hervé




-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

