Return-Path: <linux-i2c+bounces-11023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D37ABBE37
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 14:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB7E189F774
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 12:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96EA276054;
	Mon, 19 May 2025 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ILHAtyQv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72DF3F9D2;
	Mon, 19 May 2025 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658779; cv=none; b=lgOOUBFq8MyXyoldZTB7jD1S1dIoOWC5H/6kevA6C8UVY0UTibDij3pdILbXvILIfhlHUAe/aj1p2+SgYD+VIZIBIy/IV9fju24jlZQ8OS80k3z6N+bqlGSREAN/x3z43h5sU3MJ5p4gBbWDGNJuMagfRa4dBzdwI1efsywy77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658779; c=relaxed/simple;
	bh=zSLiK74+854AbjStgDFA1Lpx3mRIWseM8M2ZjwDK8fw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0cBQa5GxRqT/4y6NRDvR8tJncbL6bwrlPkdx02Hhxj1+qbdzro4gDBqpArIhDRa1E9D891NQoABBqy6Pqp3IFAFL1Hv5Dk77D54OCD+yTY9TfUrYyzzewiN7C65/M3R6PZow7tdqG7msg+lNfMkTjnweNKvNP+1Q/KN5hLoZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ILHAtyQv; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F2CF43B16;
	Mon, 19 May 2025 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747658768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftDhpzUCFCgv9VuWBrFfvAn7gkRBGVdQ8LoorzEtpsw=;
	b=ILHAtyQvoP+l2aYzHP8Fne8YPi4v3LTOIJmtiweeGuqExqV7XVp/RAGwvlWo+2bozMnJxz
	xvT2E0qMBoy/JD4wgc6RIcO0JDORVOwgN+JNpzL1Jh2kQ9iNH8Xp0BDG2RJ2h6CvUeVnHW
	vzQNNTOebdoZy+NCYZ6DHctXLI07e0mzrWnLh5MnJ4sUL7vHKuUvljTnyHJnOMrjTvBAGD
	pzOqJu4GyhIFiwLVotKe5XZ8jGxnwS6gzpXVsb3qlCYp/gJCXGvOD90J5VhE2H+5Xg2AFQ
	/Ki2TGqtfWeo7+6iL1S2bR5R9EEHx8pr6jLf0w3i/oScnDNxEkwd0ylP3bzyyA==
Date: Mon, 19 May 2025 14:46:02 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250519144602.0399c9c5@bootlin.com>
In-Reply-To: <CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-6-herve.codina@bootlin.com>
	<CAJZ5v0iL9-JzTzE7pYTJGuB1BbrE6L12K2FKNpQ8dhX9GureJw@mail.gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddugedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Rafael,

On Fri, 16 May 2025 21:22:20 +0200
"Rafael J. Wysocki" <rafael@kernel.org> wrote:

> On Wed, May 7, 2025 at 9:13 AM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > The simple-pm-bus drivers handles several simple bus. When it is used  
> 
> s/drivers/driver/ (I think)
> s/simple bus/simple busses/

Will be fixed.

> 
> > with busses other than a compatible "simple-pm-bus", it don't populate  
> 
> s/it don't/it doesn't/

Will be fixed.

> 
> > its child devices during its probe.
> >
> > This confuses fw_devlink and results in wrong or missing devlinks.  
> 
> Well, fair enough, but doesn't it do that for a reason?

I think devlink is confused just because "simple-bus" or similar handled
by this driver didn't follow the devlink rule: "Child nodes should be
created during parent probe".

Suppose the following:
   foo@0 {
	compatible = "vendor,foo"

	bar@0 {
		compatible = "simple-bus";

		baz@100 {
			compatible = "vendor,baz"
		};
	};
   };

The foo driver probe() calls from of_platform_default_populate() to create
the bar device.

The bar is create and thanks to its compatible string, the simple-bus
probe() is called. Without my modification, the baz device was not created
during the simple-bus probe().

of_platform_default_populate() called from foo probe() creates the baz
device thanks to the recursive of_platform_bus_create() call.

This leads the baz device created outside the bar probe() call.
This "out of bus probe()" device creation confuses devlink.

> 
> > Once a driver is bound to a device and the probe() has been called,
> > device_links_driver_bound() is called.
> >
> > This function performs operation based on the following assumption:
> >     If a child firmware node of the bound device is not added as a
> >     device, it will never be added.
> >
> > Among operations done on fw_devlinks of those "never be added" devices,
> > device_links_driver_bound() changes their supplier.
> >
> > With devices attached to a simple-bus compatible device, this change
> > leads to wrong devlinks where supplier of devices points to the device
> > parent (i.e. simple-bus compatible device) instead of the device itself
> > (i.e. simple-bus child).
> >
> > When the device attached to the simple-bus is removed, because devlinks
> > are not correct, its consumers are not removed first.
> >
> > In order to have correct devlinks created, make the simple-pm-bus driver
> > compliant with the devlink assumption and create its child devices
> > during its probe.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/bus/simple-pm-bus.c | 23 ++++++++++++++---------
> >  1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > index d8e029e7e53f..93c6ba605d7a 100644
> > --- a/drivers/bus/simple-pm-bus.c
> > +++ b/drivers/bus/simple-pm-bus.c
> > @@ -42,14 +42,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >         match = of_match_device(dev->driver->of_match_table, dev);
> >         /*
> >          * These are transparent bus devices (not simple-pm-bus matches) that
> > -        * have their child nodes populated automatically.  So, don't need to
> > -        * do anything more. We only match with the device if this driver is
> > -        * the most specific match because we don't want to incorrectly bind to
> > -        * a device that has a more specific driver.
> > +        * have their child nodes populated automatically. So, don't need to
> > +        * do anything more except populate child nodes.  
> 
> The above part of the comment has become hard to grasp after the
> change.  In particular, why populate child notes if they are populated
> automatically?

What do you thing about:
	/*
	 * These are transparent bus devices (not simple-pm-bus matches) that
	 * have their child nodes be populated automatically. So, don't need to
	 * do anything more except populate child nodes. We only match with the
	 * device if this driver is the most specific match because we don't
	 * want to incorrectly bind to a device that has a more specific driver.
	 */

> 
> > + We only match with the
> > +        * device if this driver is the most specific match because we don't
> > +        * want to incorrectly bind to a device that has a more specific driver.
> >          */
> >         if (match && match->data) {
> >                 if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > -                       return 0;
> > +                       goto populate;  
> 
> Doesn't this interfere with anything, like the automatic population of
> child nodes mentioned in the comment?

I don't think so.

Device population is protected against multiple calls with OF_POPULATED_BUS
flag:
  https://elixir.bootlin.com/linux/v6.15-rc6/source/drivers/of/platform.c#L349

> 
> >                 else
> >                         return -ENODEV;
> >         }
> > @@ -64,13 +64,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >
> >         dev_set_drvdata(&pdev->dev, bus);
> >
> > -       dev_dbg(&pdev->dev, "%s\n", __func__);
> > -
> >         pm_runtime_enable(&pdev->dev);
> >
> > +populate:
> >         if (np)
> >                 of_platform_populate(np, NULL, lookup, &pdev->dev);
> >
> > +       dev_dbg(&pdev->dev, "%s\n", __func__);  
> 
> So how to distinguish between devices that only have child nodes
> populated and the ones that have drvdata set?

Hum, I don't see your point.
Can you clarify ?

> 
> > +
> >         return 0;
> >  }
> >
> > @@ -78,12 +79,16 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
> >  {
> >         const void *data = of_device_get_match_data(&pdev->dev);
> >
> > -       if (pdev->driver_override || data)
> > +       if (pdev->driver_override)
> >                 return;
> >
> >         dev_dbg(&pdev->dev, "%s\n", __func__);
> >
> > -       pm_runtime_disable(&pdev->dev);
> > +       if (pdev->dev.of_node)
> > +               of_platform_depopulate(&pdev->dev);
> > +
> > +       if (!data)
> > +               pm_runtime_disable(&pdev->dev);
> >  }
> >
> >  static int simple_pm_bus_runtime_suspend(struct device *dev)
> > --  

Thanks for your feedback.

Best regards,
Hervé

