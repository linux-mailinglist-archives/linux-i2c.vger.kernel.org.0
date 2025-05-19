Return-Path: <linux-i2c+bounces-11027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A436EABC094
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CBF4174E84
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 14:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBA4283CB1;
	Mon, 19 May 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cX20EnD8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9794B283C8D;
	Mon, 19 May 2025 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664691; cv=none; b=eiTBs+Jyqsw9PFBNBx138In1hiinzJnxaUmruSGfS+i3ARqKC145n8HJmNAAcn1L0jlks8wR0pCfxkuX8C3v5WhLoAsrwDbPdYrutDV/mjcO2L8l2WhKyhyAd1sr+0mkzrEVMc3jtczjo/fMTQ5KZpHwASeN6VJbQXkWDraGcIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664691; c=relaxed/simple;
	bh=Xd3DUrIy4HPVtiF856Q+hjCloV/skh/Ob8QVcFySX/0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jXzVR3tPwsdER/Fiil2BZ5gtOB46P9vPDI5dKQaX2Mdu8NBYBkwsm3FVgRoXts3o+ylqAAsUJDA/CATBOyHw9Lr8IOC+B0GzeRGBpy/K46Va1qtGNUyjr02zmyCfQp1vE2s/vs1Pbx+ai0CYUMv5Nc3yQEUNd0Cpi/tJZX4qMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cX20EnD8; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BAC243B1E;
	Mon, 19 May 2025 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747664686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8zgaF3nulMiQiwbL4R1lWJxh4xru2nZDCsB/h+5Z9k=;
	b=cX20EnD8RXp6UsCYebQkq4d6GN5gAVUPkROwO2M9xsaoIFMPiZrGzjcMGG4YTOF5ZypiKz
	bNzqWh8AkHA8XYDSAQ+3a+nDeOH7p34OQpSx1w2sckJXKNw/MmTrQnlFjpeTjxePK9qOXy
	LjGKyGaLiyvKnZmv5MeTXtWmMiRy+lpWT8GlGUW5eFPT4GQzv1CZE80uaoTmYNYgbWWWvF
	GyDT7nN62WBBIL5eZamr3cahrUEnZkbj6zWX2gjxxdVdaohcrdr/MlAe+6v8/5f5ZN2U7b
	/n9OKyZSluLwCkHI5eDaTgSmsroyx0m1a0ohba3j+bpVa5SO8dvefi5a7LthKA==
Date: Mon, 19 May 2025 16:24:43 +0200
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
Message-ID: <20250519162443.20396e73@bootlin.com>
In-Reply-To: <aCseyW1iZgZNZNqd@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-6-herve.codina@bootlin.com>
	<aBy_aBkC7NpicXho@smile.fi.intel.com>
	<20250519135818.01db3341@bootlin.com>
	<aCseyW1iZgZNZNqd@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Mon, 19 May 2025 15:06:33 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, May 19, 2025 at 01:58:18PM +0200, Herve Codina wrote:
> > On Thu, 8 May 2025 17:27:52 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > On Wed, May 07, 2025 at 09:12:47AM +0200, Herve Codina wrote:  
> 
> ...
> 
> > > >  		if (of_property_match_string(np, "compatible", match->compatible) == 0)    
> > > 
> > > Side note, there is an fwnode_is_device_compatible() API for such cases. And IIRC
> > > there is also OF variant of it.  
> > 
> > fwnode_device_is_compatible() checked for all compatible string. I mean, if
> > we have compatible = "foo,custom-bus", "simple-bus";
> > fwnode_device_is_compatible() checking against "simple-bus" returns true.
> > 
> > Here, we want "simple-bus" as the first position in the compatible string.
> > In other word, we want to match the more specific compatible string as
> > mentioned in the comment.  
> 
> I admit I'm not an expert in DT, but why is the compatibility position
> dependent?
> 
> ...
> 
> > > > +	if (pdev->dev.of_node)    
> > > 
> > > Why do you need this check? AFAICS it dups the one the call has already in it.  
> > 
> > of_platform_populate() was called only if an OF node is present.
> > I want to call of_platform_depopulate() on removal also only if an OF node
> > is present.
> > 
> > I don't see the other call that duplicated this check.
> > 
> > Can you clarify?  
> 
> The of_...() is already NULL-aware (AFAICS), why do you need the duplicated
> check?

Oh, I see. I was focused on previous of_device_get_match_data() call.
My bad.

Indeed, you're right, I can call directly of_platform_depopulate() without
checking pdev->dev.of_node before the call. The check is already present
in of_platform_depopulate() itself.

I will do that in the next iteration.

Thanks for pointing out.

Best regards,
Hervé

