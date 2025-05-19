Return-Path: <linux-i2c+bounces-11029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336E4ABC108
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEA7C3BFB42
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 14:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B716F284B32;
	Mon, 19 May 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R7v7B6CD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB4283FFD;
	Mon, 19 May 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665591; cv=none; b=YKjf9zqrbZUkyvX5I9yZsrlLH2H6YEh6oG8nij8ze3PNY3QTbg/0z1YhKgfGGRj0Wazvt7aF2UurJOG9Gu6QfRcIJXeG59CLAGEWIT0dcKU3t3IFE5BKzbP6jeRS6SAzUziWhY8bZDwK7AbZinHXr26MxhKoVc0hJaX8J4Wj6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665591; c=relaxed/simple;
	bh=msd4Nbv4JsXtgheMB/Yu77g5qkVvbJz4LMQVT6RHC/8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFka7WdWXwnzsGkAtitwkcTo7CkYH4DQUFaphwBQGfAByMnVPqwiBbjn73vpjjDxu4+kAZCTlE6iLV0inZom/wlmrFzWoMXPxjzkDyrZvv0/lspJncUFD+cxlt+jN83AyH/x55OeCdMcDCzSnPWsynolK0F7qOOKPfJw7dJpfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R7v7B6CD; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A340F43150;
	Mon, 19 May 2025 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747665581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s78TSynP1yOAyv5ym7VeOQWFY/KVrRxunsW0R6Vz4B0=;
	b=R7v7B6CDR6I0+2oPYtmWBWzRnlYJgjGM2QkIe3qdD/oGnjK8GyM+fnt5g3CO81bKOUjxJ+
	z9pFesZxkLYN6SnX7pQI0/KypX07xDTZpGwRBw2cMkXFpSqam9BsKYON7+6iLDSWVFsJlm
	t2ueG/KBIL1kYvX6KuExE+eEV/8isoWnJNj8D1Ph8C2F7UUxQrABw8X8SCBO/5RggRK2EU
	wn+F5KqsdhyBKw5sJU2aeNn6MjEg3bZZI/bbr2leXReaNfQeHKQH94KlP3LoUJ09sKn6qM
	vb7hCmlrDD4j1zzcvnanZr8bYalKd5bLxL9srDdhcUdysADuHcWWugAsfM9Sgg==
Date: Mon, 19 May 2025 16:39:35 +0200
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
Subject: Re: [PATCH v2 16/26] i2c: mux: Create missing devlink between mux
 and adapter physical device
Message-ID: <20250519163935.3e47ec04@bootlin.com>
In-Reply-To: <aB0C05WnKkgslAuT@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-17-herve.codina@bootlin.com>
	<aB0C05WnKkgslAuT@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Thu, 8 May 2025 22:15:31 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, May 07, 2025 at 09:12:58AM +0200, Herve Codina wrote:
> > When removing an i2c controller device handling an i2c bus where an i2c
> > mux is connected to, the removal process hangs and is stuck in the
> > wait_completion() call done in i2c_del_adapter().
> > 
> > The i2c_del_adapter() tries to removed the i2c adapter related to the
> > i2c controller device and the wait_completion() is waiting for the i2c
> > adapter device release. This release is performed when the device is no
> > more used (i.e. refcount reaches zero).
> > 
> > When an i2c mux is involved in an i2c path, the struct dev topology is
> > the following:
> >     +----------------+                +-------------------+
> >     | i2c controller |                |      i2c mux      |
> >     |     device     |                |      device       |
> >     |       ^        |                |                   |
> >     |       |        |                |                   |
> >     |  dev's parent  |                |                   |
> >     |       |        |                |                   |
> >     |   i2c adapter  |                | i2c adapter chanX |
> >     |     device  <---- dev's parent ------  device       |
> >     |   (no driver)  |                |    (no driver)    |
> >     +----------------+                +-------------------+
> > 
> > When an i2c mux device creates an i2c adapter for its downstream
> > channel, a reference is taken to its adapter dev's parent. This parent
> > is the i2c mux upstream adapter device.
> > 
> > No relationship exists between the i2c mux device itself and the i2c
> > controller device (physical device) in order to have the i2c mux device
> > calling i2c_del_adapter() to remove its downtream adapters and so,
> > release references taken to the upstream adapter.
> > 
> > This consumer/supplier relationship is typically a devlink relationship.
> > 
> > Also, i2c muxes can be chained and so, the upstream adapter can be
> > supplied by either an i2c controller device or an other i2c mux device.
> > 
> > In order to get the physical device of the adapter a mux is connected
> > to, rely on the newly introduced i2c_adapter_get_physdev() and create
> > the missing devlink between the i2c mux device and the physical
> > device of the adapter the mux is connected to.
> > 
> > With that done, the i2c mux device is removed before the device
> > handling the upstream i2c adapter (i2c controller device or i2c mux
> > device). All references are released and the i2c_del_adapter() call
> > performed by driver handling the upstream adapter device is not blocking
> > anymore.  
> 
> ...
> 
> > +	/*
> > +	 * There is no relationship set between the mux device and the physical
> > +	 * device handling the parent adapter. Create this missing relationship
> > +	 * in order to remove the i2c mux device (consumer) and so the dowstream
> > +	 * channel adapters before removing the physical device (supplier) which
> > +	 * handles the i2c mux upstream adapter.
> > +	 */
> > +	parent_physdev = i2c_get_adapter_physdev(parent);
> > +	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
> > +	if (!dl) {
> > +		dev_err(muxc->dev, "failed to create device link to %s\n",
> > +			dev_name(parent_physdev));
> > +		put_device(parent_physdev);
> > +		ret = -EINVAL;
> > +		goto err_free_priv;
> > +	}
> > +	put_device(parent_physdev);  
> 
> Since you are not checking parent_physdev for NULL, the dev_name() can print a
> "(null)" string. Is this by design?

It is worse than that. If parent_physdev is NULL, dev_name() can crash.

I will fix that and check parent_physdev for NULL in the next iteration.

Best regards,
Hervé

