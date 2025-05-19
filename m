Return-Path: <linux-i2c+bounces-11021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E72FABBD15
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F8F1899F4B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172462777F3;
	Mon, 19 May 2025 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IgT29pBY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B12777E4;
	Mon, 19 May 2025 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655906; cv=none; b=lq1E4KeuplmDRmkMe7LbtSJaq3PsO95GMfNrSqqCiXokkGkOIwUm+agEiaaPXp+mAWjYG5z8DjPtnIvN29ppVFmMA+qIgllDmYk3N5R1O/gvc4PVOvYrrtKG414vIcdvvWYOkviMSmsD0aUx7rWO6p8Mtg+0g1wfv97PbEutwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655906; c=relaxed/simple;
	bh=W6vNJt1RMhyXz8ga5g+DqhM5Q30vnvMDQZ0Zo9Ry6AE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aVxFqDSHCGce2iBTAKP6tMgvn7OeK7sSgB2i/7FxjLtY/goVFbq4gATmKmphbmVoZZKTW/xJk8NwprD85lZM3M7FadpFnNlcOfYtFVHUzIfxGg6HEHMt29bCzv7ko+rs41ltKz6AIYx3iZuWROPNpwC7jv4qGw0KNmAfGHSq3iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IgT29pBY; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE63842E7E;
	Mon, 19 May 2025 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747655901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kh9CSiQhvcyTLsM/Bz8dkPxEJqF9S3PrOOEfDd7a+xM=;
	b=IgT29pBY4dxUjp9NxcjfY42GTiU5Mmwv45iHgcCl1FYwagG/e6p0mLdW4LzrQjS+YoIHO/
	FnCi+f+o0UnykAkEoe4k6+gqMX41JyWro4D7cJ4fSeYnyIC+EiP611O0DbkK4cnFmdahr/
	XwFxYH0i7oimkebEmFa7AMYhYeYuPXz/WHV/2Nc4DugKacKuJo5w6C0pBsZ1V3PiSP5QOC
	57YFAEYYEInhdiyLZgmL1g+wVGP9IHATT8VTn42djFLXLBaowQW3nqC6DQgUhzgB9VUI1Q
	+lutXTZETYo82rSJC7GNuEqEgCbzMisUeyZNJFLxujXiLvYI9x01UPrW9LSKIQ==
Date: Mon, 19 May 2025 13:58:18 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
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
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20250519135818.01db3341@bootlin.com>
In-Reply-To: <aBy_aBkC7NpicXho@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-6-herve.codina@bootlin.com>
	<aBy_aBkC7NpicXho@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Thu, 8 May 2025 17:27:52 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, May 07, 2025 at 09:12:47AM +0200, Herve Codina wrote:
> > The simple-pm-bus drivers handles several simple bus. When it is used  
> 
> bus --> busses ?

Yes sure.

> 
> > with busses other than a compatible "simple-pm-bus", it don't populate
> > its child devices during its probe.
> > 
> > This confuses fw_devlink and results in wrong or missing devlinks.
> > 
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
> 
> ...
> 
> >  	if (match && match->data) {
> >  		if (of_property_match_string(np, "compatible", match->compatible) == 0)  
> 
> Side note, there is an fwnode_is_device_compatible() API for such cases. And IIRC
> there is also OF variant of it.

fwnode_device_is_compatible() checked for all compatible string. I mean, if
we have compatible = "foo,custom-bus", "simple-bus";
fwnode_device_is_compatible() checking against "simple-bus" returns true.

Here, we want "simple-bus" as the first position in the compatible string.
In other word, we want to match the more specific compatible string as
mentioned in the comment.

> 
> > -			return 0;
> > +			goto populate;
> >  		else
> >  			return -ENODEV;
> >  	}  
> 
> ...
> 
> > +	if (pdev->dev.of_node)  
> 
> Why do you need this check? AFAICS it dups the one the call has already in it.

of_platform_populate() was called only if an OF node is present.
I want to call of_platform_depopulate() on removal also only if an OF node
is present.

I don't see the other call that duplicated this check.

Can you clarify?

> 
> > +		of_platform_depopulate(&pdev->dev);  
> 

Best regards,
Hervé

