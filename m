Return-Path: <linux-i2c+bounces-10414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C9A8B50E
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 11:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 539B019040ED
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89748235348;
	Wed, 16 Apr 2025 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nunaxTzV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25145230BE8;
	Wed, 16 Apr 2025 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795109; cv=none; b=FGyWE2WJc/AjkDu8jKpCK/jhV7+lLRLVML17OrRpkH3trJPMcvoUuFb17CIKexjh+OeA5kIb4hl0dLKuzW7WXqdlIgxo6V+MuId36qIijl40vzmdpDLVBo4jp8ppZ32FbghYqAxvX14lt2xtESYTiWitaDszNLlgaGzfPcjlylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795109; c=relaxed/simple;
	bh=XVpXGxl2fXHpOXZZcDAodwwPWK0sRmyWRilpTGEVAiU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ntif+5K2pwRnckRMmyHroh5bSjjv/Ye9SNotoa4zsuuHt5H84f91p60rX1WXMJaZqPncZayOG1+AKxOrclE1c4T/8evZHhdVkLMfS3oyZD5Q1SKFqitgT0+2qamn/ecDr37R0zAYiZo2yPgRdlRs9U788ZSjc+v9TM1fYaBVkgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nunaxTzV; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D0D61FCF1;
	Wed, 16 Apr 2025 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744795104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dllKgwcLha1xL/vp7a/BLD+IvTjOmLEdGFp4zUwZcgg=;
	b=nunaxTzVBV3n6npKioC4tkVt5qyJ/0ovo+X8BcdX9YasgCi5MZmYPXEYmZQLlVcbXUapoU
	/YW+9QKRf1K7y+ySRHWe80jMUkTndaRM8MOjvKCQyRoTQwPNs9rC5OBGm8mx+ZxtuFTS0M
	Mh+JZq330W/CcxlMqhLY9sUb27AkokWn+pB6L4aFnGPvahVNli93kPUcEwJ9DtSixG4nMG
	P1sEhO6BOAsiptpbuVq7KGWaNNBphmoJglgknx9T1i6XMbdUohCbAbO6ZiHQumVwZs6Zly
	BGVahasiNILSThVKRNFpHbojxJF6fnoFTX/w8G6I6tYPNy9h7p/XJv+V6hbqyA==
Date: Wed, 16 Apr 2025 11:18:19 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>
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
Message-ID: <20250416111819.4fd7b364@bootlin.com>
In-Reply-To: <20250410084809.1829dc65@windsurf>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-16-herve.codina@bootlin.com>
	<19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
	<20250408162603.02d6c3a1@bootlin.com>
	<D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
	<c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
	<D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
	<b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
	<20250409161444.6158d388@windsurf>
	<c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
	<20250410084809.1829dc65@windsurf>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlhesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com

Hi Thomas, Andrew,

On Thu, 10 Apr 2025 08:48:09 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed, 9 Apr 2025 17:03:45 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > So it only supports a single .dtbo. In its current form it does not
> > scale to multiple .dtso files for multiple different boards built
> > around the PCIe chip.
> > 
> > At the moment, that is not really an issue, but when the second board
> > comes along, some refactoring will be needed.  
> 
> Indeed, but that's really an implementation detail. It doesn't change
> anything to the overall approach. The only thing that would have to
> change is how the driver gets the .dtbo. We could bundle several .dtbos
> in the driver, we could fall back to request_firmware(), etc.
> 

Not sure we need to split right now the existing dtso file nor rename it
even if it is updated in the series.

This could be done later when an other user of the LAN996x PCI chip is
there.

Doing something right now will probably need other modification when this
potential other user comes in. Indeed, depending on specificities of this
future user, what is done now could not match the need of this future user.

Any opinion?

Best regards,
Hervé

