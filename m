Return-Path: <linux-i2c+bounces-11479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE696ADA8D2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 09:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C6E1891F33
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 07:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0E51EEA4D;
	Mon, 16 Jun 2025 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RvuZAWtw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85D142AB0;
	Mon, 16 Jun 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057463; cv=none; b=Ik1/5DxckGVQ9duKjld+PXtY3Qj+ogDJCU1F5bEl1xHFi6cy4duB/yVxp0KzJ6TPqYQ/wCTu32iV99k0WZ+OHh3vdR/Psqv6sk+ReBePKzSZ2E4tpwrRgopDgfs8wUbkichozrjSHJLA9OYNnKVUop0Mzgq/k2U2lTiObB2xBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057463; c=relaxed/simple;
	bh=nLhGjURpTCk0v2y/8BYqjSMh+AN7in3C1Fv8fLv+X48=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjdmd8aUTNAGstWoNDkGNtXhqTPzbajBIH5Ew0bTryfKKT5vw0yEnC7eyopiPaIVaLTS2GWQZRV7RE9IXOU8lLmfqVCOiPvLE8urBEqhy7M1m16br5jthROYBR0sPEzBgSoTwmsoPY8fbQDtxe6Qoe9u5VGPHsILa0TONnX0PkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RvuZAWtw; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C090944358;
	Mon, 16 Jun 2025 07:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750057451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQpUEyE2hSL3/anSM+mUj3B/dfO987OTyH9st7Zw9rI=;
	b=RvuZAWtwncTDYBTmDQAlBIYQ37ITn2LNv8AE9RnE6ibp9xhLMXoG/P+FYoXnQn4WXwPoAU
	/kMIcIHg7mBPD6KS4fM4TATpCovYXdlJ/S/5tPFqDNgWBxRwyYcORmltrjG6O9PZf37lQB
	IQmasJyHwwVGFYltHgdTmBdQFOSbPNwi/8qxzvBfE4MxT7JDW0imBcadoL9/jsDUuPzXpw
	fBtVIp8AFo8XzSXPdRTZcI0QUmtJbiBZNxj1lORjNz3V1ub/LaYlPzQYKTAon4QLlOoMwk
	PeM3kR9n0FPn0e2zs4hpdyyi9dxvIyrQ9p8iEFKfpxusw0Kmk7p6j5aYgBKFCQ==
Date: Mon, 16 Jun 2025 09:04:06 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown
 <lenb@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Sakari Ailus
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
Subject: Re: [PATCH v3 06/28] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <20250616090406.32f62ca4@bootlin.com>
In-Reply-To: <CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-7-herve.codina@bootlin.com>
	<CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvheelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeekpdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com

Hi Saravana,

On Fri, 13 Jun 2025 14:13:49 -0700
Saravana Kannan <saravanak@google.com> wrote:

> On Fri, Jun 13, 2025 at 6:49 AM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > Setting fwnode->dev is specific to fw_devlink.
> >
> > In order to avoid having a direct 'fwnode->dev = dev;' in several
> > place in the kernel, introduce fw_devlink_set_device() helper to perform
> > this operation.
> >  
> 
> This should not be set anywhere outside the driver core files. I'll
> get to reviewing the series, but until then, NACK to this.
> 
> Is there a specific patch that explain why we need to set this outside
> driver core?

We need to set it in case of creating device-tree node for PCI.

Usually, fwnode are created (based on DT or ACPI) and then, dev are
created.

In the PCI DT node creation case, device are already created and then, based
on information already computed by the kernel, DT node are created.

You can see that on patch 11 (dev setting was already upstream and it is
replace by a call to the helper for PCI host bridge) and on patch 13 (PCI
device).

Other patches (8, 9 and 10) replace the existing direct setting of the dev
member by a call to the helper.

Best regards,
Hervé

