Return-Path: <linux-i2c+bounces-11028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C653CABC0B2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1DAD7B027F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 14:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A68283C9C;
	Mon, 19 May 2025 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KPDyy+L4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B926980F;
	Mon, 19 May 2025 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664862; cv=none; b=dLKBN40QyB7iLDZRtm9+o6vGtTqXtN5SsMmuStZU8gupJtYRhFVKXc42mG4kEYOPrPBMYaML67C7U1CKLZWMc52d+ymhCshqhSRrM/0RnBX7uD+aSsCzZ+XStQnFEWZh0TA8mGLi8BcVN/21GfcF3mvCHuQDgTv+JZb6aZexafc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664862; c=relaxed/simple;
	bh=xhKmM+gfHAy6/K2yCwonmggKcnhDD1pEwXUFZhRnD6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDPBYpZmReyZV+x7VB1eFZrlQRBD7e+7WFqLnFKUW4ujMm3UVXz/xoGDpOqijhSXA/A2s1J2UA9HPlSmMefk0zDaqUpzKtnR3Ya08Jmlyo4gf8c8k68DpiFFAOSmavkwIyeO5jFj3cskbtBVM0nLankAf2EQJFUEwyjXXRnSQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KPDyy+L4; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F23D14397E;
	Mon, 19 May 2025 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747664858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMIQ5j4O4hhkkXDBrtnUP9c1BM9Lw9LhW4rCV+JF4qo=;
	b=KPDyy+L4/pZBa2cLkw0ZUcC/t8rYe1alekyOJHI2L357/ABWIW2l77vPCeqjLt6ZKftunk
	gc9U3l6270Yon2+sihKOQPrx1ucqucmm0w2hVe3oE+xzPMvnDzakmKrrioYOQIeCHJTrDV
	w19guANFSsFUeD26WaHkWPZUKztJoPMOj2HylC8EZxi7qDsNCG4zA9/f1fMDYMXfwWvn28
	1KyRQciYejW0VpyxKN5Hcs5cMXQWddLeUW0vN9Fi3V4gbfTrIcssDSaU5ip7653w8+a7JM
	bbqYCTx6pZP/NdQ4WhEdcO1tSehTzs6BHuCTO77ylHRy8J+eAwmJQ4WpkO4wDg==
Date: Mon, 19 May 2025 16:27:33 +0200
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
Subject: Re: [PATCH v2 06/26] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <20250519162733.2ef82127@bootlin.com>
In-Reply-To: <aBt2EHYf6j6Ulthb@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-7-herve.codina@bootlin.com>
	<aBt2EHYf6j6Ulthb@smile.fi.intel.com>
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

On Wed, 7 May 2025 18:02:40 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, May 07, 2025 at 09:12:48AM +0200, Herve Codina wrote:
> > Setting fwnode->dev is specific to fw_devlink.
> > 
> > In order to avoid having a direct 'fwnode->dev = dev;' in several
> > place in the kernel, introduce fw_devlink_set_device() helper to perform
> > this operation.  
> 
> Makes sense, can you also mark that field as __private? So sparse can catch
> the abusers up.
> 

I didn't know about __private tag and related ACCESS_PRIVATE().
Indeed, It makes perfect sense.

I will add it in next iteration.

Thanks for pointing out.

Best regards,
Hervé

