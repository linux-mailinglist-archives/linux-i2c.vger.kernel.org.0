Return-Path: <linux-i2c+bounces-10212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FFA80D7D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D4D01B832C1
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3DF1DF268;
	Tue,  8 Apr 2025 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l4hAQeZm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F217E00E;
	Tue,  8 Apr 2025 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121036; cv=none; b=Z4cqCqv0GNQLgz9EWvW0DAIeC5mGbnl4t6vSIwv+2vUbnayqzfJ2FOea3M3/CS68i2z4zmb9f1VFNOWhBvQb60PWCTFXVWltMxS3rOaHjcctrriKzcH/YhSTWKjCrx/AawDXj/D82BTtdeAKN0zYgBtvLYxU1PGR1GyVp8BCiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121036; c=relaxed/simple;
	bh=Sf45kr7cUtCH9nLRIxWk9P6majZZZ7qoDJBtQNh1WRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2HHNd3SbHOEZPlIAfKUFguAXkLlfXQz4yRg8KEYzqPe6WkT6jFaMpjexjSR6FpZ6kU5GVHs3j3645tieeB53dsLprWZo7aC7Kx+tq/8dIsTVErjgP1rddBMd9Ha1oodQMGhMA6Oe/mYiFtK1B8yefAGUC56dUWvU8SmZS2jGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l4hAQeZm; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F197044327;
	Tue,  8 Apr 2025 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744121031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoHpHGrHvAWvhU7WqsQUuRPEF36RuyRVdBvT8MviKt0=;
	b=l4hAQeZmLC5TBAns0oXotjt35VFAVSgOe8VItJYKZBXR/JTgmG4mFx+mLLC+YZ09PT1PQn
	IgcQ5XgjFd6R+LQZ/Ca/rD8cIIxblv50Pc0HceVa4xxDBag3jg70UiwZsK+W/ffrwkXTXm
	J/NlvHM0suGF4SfgCPO/f/VMxvOJZfb1deFP9s60qCPHuX9egj4CjqXBI2Hq0O0irkW5Vj
	6qQ5wnA7slRnIBspIo+Q6eHd6vwsgouiokXn6ChDwTS7ZGR69VRxSze3J2xk/sA0yzw+nB
	W4Jfz79hgJsczIM+2YjLZ6eT/b7Uw8IHPn3d7X/fYDzjv9gEC09G204x/G4VmQ==
Date: Tue, 8 Apr 2025 16:03:44 +0200
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
Subject: Re: [PATCH 12/16] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <20250408160344.3d3c834b@bootlin.com>
In-Reply-To: <Z_PxdmKbBGlhpQpr@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-13-herve.codina@bootlin.com>
	<Z_PxdmKbBGlhpQpr@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfhleejtdeftdejveffgedtuddtgefhtedtudfhuefhtddtffeiueeigfdvhfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvl
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Mon, 7 Apr 2025 18:38:30 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:41PM +0200, Herve Codina wrote:
> > The lan966x clock controller depends on the LAN969x architecture or the
> > LAN966x SoC.
> > 
> > This clock controller can be used by the LAN966x PCI device and so it
> > needs to be available when the LAN966x PCI device is enabled.  
> 
> ...
> 
> >  	depends on HAS_IOMEM
> >  	depends on OF
> > -	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
> > +	depends on SOC_LAN966 || ARCH_LAN969X || MCHP_LAN966X_PCI || COMPILE_TEST  
> 
> This doesn't seem to scale. Why not simply
> 
> 	depends on HAS_IOMEM
> 	depends on OF || COMPILE_TEST
> 
> ?
> 

With your proposal, if we configure a kernel without SOC_LAN966x or
ARCH_LAN969x or MCHP_LAN966X_PCI, in other words we configure a kernel
without a real needed for this clock controller driver, the user will be
asked about this driver.

This was already reported by Geert
   https://lore.kernel.org/all/369233dfded88ff6fb342e03794fe31985d84d82.1737383314.git.geert+renesas@glider.be/

I agreed with Geert that asking the user about those driver the LAN966x
depends on was not a good things and leads to confusion.

So, to prevent asking the user about this driver, I followed the same
strategy and added the dependencies.

IMHO, we should keep those dependencies here.

Best regards,
Hervé

