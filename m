Return-Path: <linux-i2c+bounces-10242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4692A82770
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 16:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6678C46225C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 14:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA9E266F05;
	Wed,  9 Apr 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mZxItQWe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75F265633;
	Wed,  9 Apr 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208099; cv=none; b=Yhue0hMAhgpNp6Zbg24sMpIa1f6lcwaNf4Q4b3iQMfCnBHhdEBDadPdCE0R34XNKw3ETjWwTvDDBdoK+S4OwK0AKLJgpLCUk/9QjMnYax9Dqlymy8eV/9EX46OzaCmtKTInHq+nZgQHa14snKCtZtzrcp1L5vG58tsAXn8kP6KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208099; c=relaxed/simple;
	bh=hya6kzCYQiQ71aaCFHe80q4Y/3EjgCzGRkoayCtGRJI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/BvALYkB0qyn8QnTrbYlg+pMLBmrIWyrA2hTAYF81Zgm7sH8aaP/Q2cTQrt4Q3SgI0jyHOshJLVIXqXz3s622hrO7/8VOZv5Oe+8fQDwRhEAhTfhi4ZIShe/3STvaysCQ1dP1de+SI231rXnoo2shoCFxYbbAwI5z4nitlKOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mZxItQWe; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 567EC444F9;
	Wed,  9 Apr 2025 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744208089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLxwTHRi7+pphCiz5HHyw3cwRGM2mE+0rupeRS3R5Jc=;
	b=mZxItQWeYtS91WG0xrklvKrgMDJ4xi4zviw2Z6yvob6kxgVmrZ7m8Z3LZdFat82D5la9OK
	4rqcNF2OZoXNsjUFcr2TMwdSoHdwIP18APId2aUrU7zRyzjehA8hOzcGb95U/CX7oqPQq1
	uSodaepIui1Q7wXxR+AoPwQ6y+EDmpnh1vV1KNJID3sE0cB4l0ThgYrGplSm5L9T3MlGbD
	fCGkwYfM3QhVZuvSdatV3g5AihihEe9tOCKeX7Tdnx7In7Rop58FOygkXQuUyQsurThxKS
	i4e4LV/8a7sZ4qO2DCa2o8RtfomG2PP9gPcTSgcBW37KeEEqY0mqnUtLr+Xfgw==
Date: Wed, 9 Apr 2025 16:14:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman
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
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <20250409161444.6158d388@windsurf>
In-Reply-To: <b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-16-herve.codina@bootlin.com>
	<19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
	<20250408162603.02d6c3a1@bootlin.com>
	<D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
	<c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
	<D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
	<b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhrvghgkhhhs
 ehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: thomas.petazzoni@bootlin.com

On Wed, 9 Apr 2025 16:04:51 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> And you need some way to map the PCI ID to the correct .dtso file.
> Maybe that is just a lookup table in the driver, or maybe you can pack
> the .dtso file into a kernel module with the correct
> MODULE_DEVICE_TABLE(pci, ...) so that PCI probing pulls in the
> specific driver module with the .dtso, which via dependencies pulls in
> the core driver which can actually make use of the .dtso?

Well, check the already upstream driver:

  https://elixir.bootlin.com/linux/v6.13.7/source/drivers/misc/lan966x_pci.c

It indeed binds on the PCI ID, and the driver bundles the .dtbo.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

