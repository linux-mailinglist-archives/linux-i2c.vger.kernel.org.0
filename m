Return-Path: <linux-i2c+bounces-10480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AF4A937A3
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 15:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE510189AFBB
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 13:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20471276053;
	Fri, 18 Apr 2025 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B5t3bSZd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACBD276030;
	Fri, 18 Apr 2025 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981851; cv=none; b=b6Uv1GSP5MmUDWjJhhRzKtZWnZs0cAIqKUbMQ170dp9+NXV2WUGKxCw8sY8Bg+CYqFoXN9Jqux2DGFeTaiXyKb3oeU7grdhTu41RDVtpuBBFG1hrJshpeVUzY3cSyzdHT+n/YgVh6DwPGiTDqJk8SdglB3+vzXEVGA4epwpRyjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981851; c=relaxed/simple;
	bh=JTTWxqBrwEtLKx6O5TyIr4GBL3p0TLD2eTF5sLveJGw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FdsiXrtRyUQQPSzyFJiq1Rm21XbGyvv+XZNmnmEqNZ78MXXgaiAeALVT5I7uvwvCeADM7RxGBHM4pYegPoJpckOJGZSgyGuFVtlFa6ToInxBQnaYMYma440KbkuPfCgUYeTyDdSDsrWDeiFgiv0XffaKymPz6JquPlrViAMiox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B5t3bSZd; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AC884333F;
	Fri, 18 Apr 2025 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744981840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=flWAz2w14wq7W+OFxNQQycVZnw0/ZbM/Zjd3vHnpprk=;
	b=B5t3bSZdX2Pd3XrVzuwEHF2KinZWkp5ZqrcvrtLQLoDFV4L/lSO9PtQI1lRmvm9jWuqbwg
	r6TLbHTP1PwPFSC+jXorCpZF3Ey3loGgGda6H2O4yjQzjdJrNVWOlk0bwSHzI5JplKUDsg
	GwOCyZfyyLFd7K4ig98jOczKvpBZcOjJaQ2wZMWuqYq9TlMMEaK7yr5oHZsdAh1j+ED3Ew
	NEJeHaRcd/8pveKH3k29fv3niVN9Fm86fCMZFHKVFMT+lcZCWAZhrU+JCRI+QBtNICDKDo
	CDMMC5zWgNSQx0LxfBAU5w44jp7ZAJvMkRZOCEU1GAW4B7VvnDvY4s/SH1hhUQ==
Date: Fri, 18 Apr 2025 15:10:36 +0200
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
Subject: Re: [PATCH 11/16] of: property: Allow fw_devlink device-tree
 support for x86
Message-ID: <20250418151036.719f982b@bootlin.com>
In-Reply-To: <Z_U0DkSemHK0lrJW@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-12-herve.codina@bootlin.com>
	<Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
	<20250408154925.5653d506@bootlin.com>
	<Z_U0DkSemHK0lrJW@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffekjeehffeihfefueehveegvdeiieeludekhffhjeeuffdvudevgeevtdeiueefnecuffhomhgrihhnpegrnhgrnhguthgvtghhrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegtddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Tue, 8 Apr 2025 17:34:54 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Apr 08, 2025 at 03:49:25PM +0200, Herve Codina wrote:
> > On Mon, 7 Apr 2025 18:36:28 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:  
> 
> ...
> 
> > > This is incorrect, they never had ACPI to begin with. Also there is third
> > > platform that are using DT on x86 core — SpreadTrum based phones.  
> > 
> > I will rework the commit log to avoid 'mixing ACPI and device-tree'
> > 
> > For "SpreadTrum based phones", do you have an idea about the Kconfig symbol
> > I could use to filter our this x86 systems?  
> 
> Hmm... good question. I don't think it was anything. The Airmont core just
> works and doesn't require anything special to be set. And platform is x86 with
> the devices that are established on ARM, so nothing special in device tree
> either, I suppose. Basically any x86 platform with OF should be excluded,
> rather think of what should be included. But I see that as opposite
> requirements to the same function. I have no idea how to solve this. Perhaps
> find that SpreadTrum Intel Atom-based device? Would be really hard, I believe.
> Especially if we want to install a custom kernel there...
> 
> > Anything I find upstream related to SpreadTrum seems base on ARM cpus.
> > I probably miss something.  
> 
> There were two SoCs that were Intel Atom based [1]. And some patches [2] to x86
> DT code were made to support those cases.
> 
> > > And not sure about AMD stuff (Geode?).  
> > 
> > Same here, if some AMD devices need to be filtered out, is there a specific
> > Kconfig symbol I can use ?  
> 
> This is question to AMD people. I have no clue.
> 
> [1]: https://www.anandtech.com/show/11196/mwc-2017-spreadtrum-launches-8core-intel-airmontbased-soc-with-cat-7-lte-for-smartphones
> 
> [2]: 4e07db9c8db8 ("x86/devicetree: Use CPU description from Device Tree")
> and co. `git log --no-merges 4e07db9c8db8 -- arch/x86/kernel/devicetree.c
> 

I have tried to find a solution for this topic.

Indeed, this patch enables fw_devlink based on device-tree on all x86
platform except OLPC and CE4100.

You have mentioned some other x86 based system that could have issues with
fw_devlink and it seems to be hard to have a complete list of systems for
which we should not enable fw_devlink (potential issues and so regression
against current kernel behavior).

As you also proposed, we can thing on the opposite direction and enable
fw_devlink on x86 systems that need it.

We need it because we need the device-tree description over PCI device feature
(CONFIG_PCI_DYNAMIC_OF_NODES) on x86 in order to support the LAN966x use case.

What do you think about the following condition?

	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))
 		return 0; /* Not enabled */

CONFIG_PCI_DYNAMIC_OF_NODES has already to set explicitly by the user.


Do you think it makes sense and could be a good alternative instead of
filtering out a list of x86 systems ?

Best regards,
Hervé

