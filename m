Return-Path: <linux-i2c+bounces-11670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B4AEBA89
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 16:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA18E3BEA2D
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 14:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A932E8DE7;
	Fri, 27 Jun 2025 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OTPRR4yK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992EA219300;
	Fri, 27 Jun 2025 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035969; cv=none; b=b+M/aWOYwQdZkyEI04h/nhsDF95zhI6j4JrFQ86cUcS3cHrFHhO0pGwGmlKsUPyqdmkXHGtY6aVtfG0sDu6yM+QZLvo1mePsoSlw+579hLs5XqGMVUbZwYWIvw2GfcTth/Rb20S1A41z3m9cfCaYwgnHVaw1ChWAmg/N1eyML2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035969; c=relaxed/simple;
	bh=Y9PSyNNXun1vslLOG1Em1fG3vkezxqyO8VcmI8EIDLE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=llMag44pWA0tuJbjcLcgaph3FIbCudujUpxnSGe6AX4p2t1tn/oHDPon99IeMNK6nxL2Ojnz8oovOkLl/Ls4XcHoZLCZyuZ/cnk3+h1IxQ8vIylcYPijSYsuU099I9nxZo/0JQupeM1UeFJGsacv+JtQlezelkvdWoLGdQIcd3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OTPRR4yK; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8126544365;
	Fri, 27 Jun 2025 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751035958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ga4DYhJ2FO3ImSWe5QoRj6QIF5B7qFE+8eHa0kIn7Ms=;
	b=OTPRR4yKaNYHU2ov192tpqD6SRrTnToZ1hO2EKs+LgXa/u/n5Ff5+AFuSXuKxf48WQTFy9
	tvP0bwTeZzQG3M2K/eR7hrlZMT6G/tr8dkcAMFgq0yZpFgxhn1qJYxP+/xp3VX8ODxcLB8
	ToGFVrpah/FsapRai7V9/GgGbWagJ0lOA/O2Ak6rrtlB9gTfkrlbsfteBQLNa8Gr5HSv/Q
	PIzpSkoHSZBa3wA1kJ2c4ku32k11PGXFGs00q8vloMEdslC0RUceJAXHB90+PIZ7ZJNG2F
	uQ5mtoEX9RSsaMLDQqL3bNZ6pMWN0+C9YhJgIXQ/pnLFiGEeqvO4o7iTbCQu4Q==
Date: Fri, 27 Jun 2025 16:52:32 +0200
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
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
Message-ID: <20250627165232.0b3dc935@bootlin.com>
In-Reply-To: <20250627141846.GA3234475-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-3-herve.codina@bootlin.com>
	<20250627141846.GA3234475-robh@kernel.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfhleejtdeftdejveffgedtuddtgefhtedtudfhuefhtddtffeiueeigfdvhfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeekpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Fri, 27 Jun 2025 09:18:46 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 13, 2025 at 03:47:42PM +0200, Herve Codina wrote:
> > get_dev_from_fwnode() calls get_device() and so it acquires a reference
> > on the device returned.
> > 
> > In order to be more obvious that this wrapper is a get_device() variant,
> > rename it to get_device_from_fwnode().
> > 
> > Suggested-by: Mark Brown <broonie@kernel.org>
> > Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Saravana Kannan <saravanak@google.com>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/base/core.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index cbc0099d8ef2..36ccee91ba9a 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
> >  	device_links_write_unlock();
> >  }
> >  
> > -#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
> > +#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)  
> 
> In patch 3, you add the same define. Is there some reason to not move it 
> to a header?
> 

In this patch (patch 2), I rename the define. In patch 3, I move the define in
an other place in the same file (core.c) in order to have it available for the
function added (also in patch 3).

I don't think we need to move it to a header.

Best regards,
Hervé

