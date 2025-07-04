Return-Path: <linux-i2c+bounces-11828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7912AAF8D84
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 11:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AF3B5A08FC
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 09:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8004F2F50B9;
	Fri,  4 Jul 2025 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IsFNgvOI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7BC2F50B2;
	Fri,  4 Jul 2025 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619464; cv=none; b=f6movLKyJRvpjRiGsMj4mDQi0IS9UatXPem/F8Stpdrrfgu7C6Kxw/CgIkRPHG1vmfgm7w902VTlrELKkks9MfxAFvJIyizu7PcMET/BgSF6I6GLr6MqbGQV9E2HVZmoMTb7vrOkniJncMwMwoGCZMuTZo27rhmJcyUoShCnq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619464; c=relaxed/simple;
	bh=Hq3evHZffKrfDtkoD9VkUHgds86PykelMMQhzlru9Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X/nxzsRwd1Tup1uKouZYYhidsPZFBNiij+ludw6SL+J2MW3YOEMJBtDI57LOteWkvJC+5CxVBHT6kU1k+EbltUZNIZhqAiHXNouGFHcjWdrW2GP/oN1SptdFmQDnY2lKPyi9jjfbigMWDmPihBfB6AfigX+wJw7aQ1mPzV47Jg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IsFNgvOI; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E24143AEE;
	Fri,  4 Jul 2025 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751619453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/ao/2kml8jJZFHPFKKmBePrXHDwomfciEfTApf1ng0=;
	b=IsFNgvOIXVOwfZalpbJl3HeOSXGJ/b0Br9jNwmVj8c8XWQeGRJ8yNf3TykuiXP9YVWVNg9
	WswEtsNyDmTb6lPYtNo8jxAwOyYHr7+xBhPVcBIgta1Gmw8VnOWUw/IIgLl0UbPh+PxatT
	QEnGVRZSbWRjlpWe41sTUlxkGP/Yq4rgQ07Ce2ffpGvDVrPXEuUvzR/vQ7m9UpYt7tin2Y
	sLZZm9ZYReoWxyEcrLAoB6ePBBOxMVsZYJxN9iYmAivhvHar9hS8v4H3i9GFkWozo5fSTm
	tDdAojqJukJpigemHSwc8gA9r4PchXfJlcnlZExGtC/OGPUfoanwJMSTvEwmSg==
Date: Fri, 4 Jul 2025 10:57:25 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
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
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250704105725.50cb72b9@bootlin.com>
In-Reply-To: <20250703093302.4f7743ea@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-6-herve.codina@bootlin.com>
	<20250627155200.GB3234475-robh@kernel.org>
	<20250703093302.4f7743ea@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeekpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Thu, 3 Jul 2025 09:33:02 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Rob,
> 
> On Fri, 27 Jun 2025 10:52:00 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:  
> > > The simple-pm-bus driver handles several simple busses. When it is used
> > > with busses other than a compatible "simple-pm-bus", it doesn't populate
> > > its child devices during its probe.
> > > 
> > > This confuses fw_devlink and results in wrong or missing devlinks.
> > > 
> > > Once a driver is bound to a device and the probe() has been called,
> > > device_links_driver_bound() is called.
> > > 
> > > This function performs operation based on the following assumption:
> > >     If a child firmware node of the bound device is not added as a
> > >     device, it will never be added.
> > > 
> > > Among operations done on fw_devlinks of those "never be added" devices,
> > > device_links_driver_bound() changes their supplier.
> > > 
> > > With devices attached to a simple-bus compatible device, this change
> > > leads to wrong devlinks where supplier of devices points to the device
> > > parent (i.e. simple-bus compatible device) instead of the device itself
> > > (i.e. simple-bus child).
> > > 
> > > When the device attached to the simple-bus is removed, because devlinks
> > > are not correct, its consumers are not removed first.
> > > 
> > > In order to have correct devlinks created, make the simple-pm-bus driver
> > > compliant with the devlink assumption and create its child devices
> > > during its probe.    
> > 
> > IIRC, skipping child nodes was because there were problems with 
> > letting the driver handle 'simple-bus'. How does this avoid that now?  
> 
> I don't know about the specific issues related to those problems. Do you
> have some pointers about them?
> 
> > 
> > The root of_platform_populate() that created the simple-bus device that 
> > gets us to the probe here will continue descending into child nodes. 
> > Meanwhile, the probe here is also descending into those same child 
> > nodes. Best case, that's just redundant. Worst case, won't you still 
> > have the same problem if the first of_platform_populate() creates the 
> > devices first?
> >   
> 
> Maybe we could simply avoid of_platform_populate() to be recursive when a
> device populate by of_platform_populate() is one of devices handled by
> the simple-bus driver and let the simple-bus driver do the job.
> 
> of_platform_populate will handle the first level. It will populate children
> of the node given to of_platform_populate() and the children of those
> children will be populate by the simple-bus driver.
> 
> I could try a modification in that way. Do you think it could be a correct
> solution?
> 

I have started to look at this solution and it's going to be more complex
than than I thought.

Many MFD drivers uses a compatible of this kind (the same exist for bus
driver with "simple-bus"):
  compatible = "foo,bar", "simple-mfd";

Usually the last compatible string ("simple-mfd" here) is a last fallback
and the first string is the more specific one.

In the problematic case, "foo,bar" has a specific driver and the driver
performs some operations at probe() but doesn't call of_platform_populate()
and relies on the core to do the device creations (recursively) based on
the "simple,mfd" string present in the compatible property.

Some other calls of_platform_populate() in they probe (which I think is
correct) and in that case, the child device creation can be done at two
location: specific driver probe() and core.

You pointed out that the core could create devices before the specific
driver is probed. In that case, some of existing drivers calling
of_platform_populate() are going to have issues.

I can try to modify existing MFD and bus drivers (compatible fallback to
simple-mfd, simple-bus, ...) in order to have them call of_platform_populate()
in they probe() and after all problematic drivers are converted, the
recursive creation of devices done in the core could be removed.

Before starting in that way, can you confirm that this is the right
direction?

Best regards,
Hervé

