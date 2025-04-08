Return-Path: <linux-i2c+bounces-10209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7150BA80BE6
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 438C4506AFF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 13:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796591DF725;
	Tue,  8 Apr 2025 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CoGtiJjr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99451DED78;
	Tue,  8 Apr 2025 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117726; cv=none; b=QLIby3ZS3S4N6WG84Qx7ujtlFuQNCqANwzWZnGnti2W0gJjH1QqbGq3R6Vz3nk4/qbrY6JCACfcjkEUjjtRZZoAyrf5AKMi0njPUYtNuZvk3eCmYycN1ifP2+HvqLlKSyIW8I7GrmkwiIjhcrAy+diz/Pelrc5TzJPtJM6wfdhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117726; c=relaxed/simple;
	bh=RXNrlCWRVAP2kZW5DHHqBHlW5pOJ9IXKJbD4ElTd98M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpqLRvkWAtsBCi4/hjEnQxHIy/XlHIfnrPebAw++9TIjOAgS52a+nSLyWRAELC3udHFpbUPPbqx4T7alzXmdS5CCymGF7Fq73zYwrp8yoRT8eNfGDPVclt1+KkRU5Y3JFSTwm1PCpbvs5UH8j/H9v2OdFvqPTb/LZ/BG9Pn2lM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CoGtiJjr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B982944326;
	Tue,  8 Apr 2025 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744117721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MT039/hhuMMp5IO2JcEWxMC4o3y8QemyuoMvfE2SUFc=;
	b=CoGtiJjrd6pJSrynxk4Ww042keQh9u8acYoWopM/7RJrx9UjShh6+u7Qo3SEoi01uF1T+3
	7JYdjRmu+B/pSRo5pKCLoCR+Wnw9v1QhZDuWoasw9JAzB1/hEkC6kEYTs1u6jXCFCSypsd
	8EYWRBvHIoQB0sde8vSCwIyu2OYFXap+fsygdNhAOjLPHZ+ljCPsdEa9Tb3Zh19j7+9RMU
	5Bg5gS0f5LoXYD55neip1umz/F8gxUf2aVGhUaz63FSOKcaLxWUsac7ZoMUZgsTu5lm97u
	tV9Df778F4P+kiMOoJZJ/CJRrnkEnStg22TSuJc7wvqBsbmT23vNx5hI6wdulA==
Date: Tue, 8 Apr 2025 15:08:36 +0200
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
Message-ID: <20250408150836.327a337d@bootlin.com>
In-Reply-To: <Z_Puy8eEBc6tubEx@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-9-herve.codina@bootlin.com>
	<Z_Puy8eEBc6tubEx@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegtddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Mon, 7 Apr 2025 18:27:07 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:37PM +0200, Herve Codina wrote:
> > The supplier device of an I2C adapter is the device that calls
> > i2c_add_adapter() or variants and i2c_del_adapter().
> > 
> > Most of the time this supplier device is the parent of the adapter dev.
> > 
> > Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
> > parent of the adapter dev points to the adapter dev the mux is connected  
> 
> dev --> device (in both cases)

Will be updated in the newt iteration.

> 
> > to instead of the supplier of this adapter.
> > 
> > Introduce i2c_get_adapter_supplier() and a new supplier field in the
> > adapter structure in order to ease the adapter supplier retrieval.  
> 
> ...
> 
> > +/**
> > + * i2c_get_adapter_supplier() - Get the supplier of an adapter
> > + * @adapter: the adapter to get the supplier from
> > + *
> > + * return:  
> 
> Return:

Will be updated.

> 
> > + * Look up and return the &struct device corresponding to the device supplying
> > + * this adapter.  
> 
> @adapter

Will be updated.

> 
> > + * The user must call put_device() once done with the supplier returned.
> > + */
> > +struct device *i2c_get_adapter_supplier(struct i2c_adapter *adapter)
> > +{
> > +	return get_device(adapter->supplier ?: adapter->dev.parent);  
> 
> What will be the meaning when both are set? Why dev.parent is not the same
> as supplier in this case?  Looking at the commit message example, it seems
> like you want to provide a physdev or sysdev (as term supplier seems more
> devlink:ish), like it's done elsewhere. And in the same way _always_ initialise
> it. In such a case, the ambiguity will be gone.

When both are set (this is case for i2c muxes), the adapter->supplier the
device that register the I2C adapter using i2c_add_adapter() or variant.
In other word, the device that creates the I2C adapter.

The adapter->dev.parent is most of the time the device that register the
I2C adapter except for i2c muxes. For I2C muxes, this adapter->dev.parent
is the adapter the i2c mux is connected to.

Between physdev and sysdev, I really prefer physdev and, if renaming from
supplier to physdev is still needed (and wanted), I will rename it. Let me
know.

For initialization, I don't want to modify all the I2C controller drivers.
What I can do is to initialize adapter->supplier using adapter->dev.parent
during the i2c_register_adapter() call if it was not already initialize by
the caller (i.e. the I2C controller driver).

Does it make sense ?

Best regards,
Hervé

