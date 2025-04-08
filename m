Return-Path: <linux-i2c+bounces-10215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9954A80E3C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E2619E1D46
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7FC22D7AC;
	Tue,  8 Apr 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gxVrnn/J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ED71E32C3;
	Tue,  8 Apr 2025 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122548; cv=none; b=PYGyt/ECQ9sJRbT9Z9StzeMyygTsFkVpmNkxwxRycYFwX+AXtcZZ9oqqM8Lo8YFgFl6eglB8mOFYpU8yq6ycWJmQG8qQ00Z5TetJYo0VhZ69wDUDbUKBIQmsJswkCsaVKjiirk/3zqyveTFICrD4t+Yd15s+vdxwYW/TR7tk3SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122548; c=relaxed/simple;
	bh=E+sux4jgwb2zA9NM20uBp55k+dzLb2YrMqfaeXyO4/0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNqp1vBbMXLFMtT8MLyHGYL7S0PsdB3fOSZZD7Hd+h93EWCWeYPnzWYt6K3DN7KThc6vQdOVYHaxIIZiF/8/6wIZTve70xwNIpWlPNDlMy5cPZeYqoGUOHqs8e4LdMC/gtaPOi48C0O3FsPPVCIZWzvMtG1+LcohV342OTTLN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gxVrnn/J; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74EF144351;
	Tue,  8 Apr 2025 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744122543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wy3Km0AVXCTI4DrQJkFCQiFPROUoaPoc5lNFfKuzy6A=;
	b=gxVrnn/JVh0iC4BPAsAridJn4qT7FAvRDSKdNs6dH7buDlSemR54nzZAPf3tIIgziWPivZ
	owfGzS3t8eTMAXID8Ioi7sBsZdU89YTITi0SEbf8OqVFObyYjO+ht1vLjc5sY+ZyvqoT1K
	XbseKEUk2rLd/GRjaBGXXD4ZWxucg5+n12Wvsu4S5CSPYu5QmT6BNMavIW1w1SbZQReccT
	qUUpAhhXYCUUmyEmRSVEe1j6vwK02/srrDJfFTL7lpFtxTtMFeLk14cSsFkAKRvzUyYHkM
	gSlm2nGbIp2xmGhocUyVGi1ZV+VblO56FfmKtmdd8n0wwK2H7ES6ZJo6/49MhQ==
Date: Tue, 8 Apr 2025 16:29:00 +0200
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
Subject: Re: [PATCH 08/16] i2c: core: Introduce i2c_get_adapter_supplier()
Message-ID: <20250408162900.41b6bc08@bootlin.com>
In-Reply-To: <Z_UpB1cgU_99JHdF@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-9-herve.codina@bootlin.com>
	<Z_Puy8eEBc6tubEx@smile.fi.intel.com>
	<20250408150836.327a337d@bootlin.com>
	<Z_UpB1cgU_99JHdF@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegtddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

On Tue, 8 Apr 2025 16:47:51 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Apr 08, 2025 at 03:08:36PM +0200, Herve Codina wrote:
> > On Mon, 7 Apr 2025 18:27:07 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > On Mon, Apr 07, 2025 at 04:55:37PM +0200, Herve Codina wrote:  
> 
> ...
> 
> > > > +	return get_device(adapter->supplier ?: adapter->dev.parent);    
> > > 
> > > What will be the meaning when both are set? Why dev.parent is not the same
> > > as supplier in this case?  Looking at the commit message example, it seems
> > > like you want to provide a physdev or sysdev (as term supplier seems more
> > > devlink:ish), like it's done elsewhere. And in the same way _always_ initialise
> > > it. In such a case, the ambiguity will be gone.  
> > 
> > When both are set (this is case for i2c muxes), the adapter->supplier the
> > device that register the I2C adapter using i2c_add_adapter() or variant.
> > In other word, the device that creates the I2C adapter.
> > 
> > The adapter->dev.parent is most of the time the device that register the
> > I2C adapter except for i2c muxes. For I2C muxes, this adapter->dev.parent
> > is the adapter the i2c mux is connected to.
> > 
> > Between physdev and sysdev, I really prefer physdev and, if renaming from
> > supplier to physdev is still needed (and wanted), I will rename it. Let me
> > know.  
> 
> The terms supplier/consumer are widely used in terms of power and devlink.
> I think here should not be used the term supplier.

physdev seems good.
I will use that.

> 
> > For initialization, I don't want to modify all the I2C controller drivers.
> > What I can do is to initialize adapter->supplier using adapter->dev.parent
> > during the i2c_register_adapter() call if it was not already initialize by
> > the caller (i.e. the I2C controller driver).  
> 
> This can be done in the I²C core, but I'm not insisting on this part.
> We can start from your function only and then decide later on how to
> proceed (depending on how many users of that field appear and what
> they want to do with it).
> 

Right I think I can keep my function as it.

Wolfram any opinion?

Best regards,
Hervé

