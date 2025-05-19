Return-Path: <linux-i2c+bounces-11020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6964ABBC92
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C66E17DC9E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33289275877;
	Mon, 19 May 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="StjPzBot"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024D27585C;
	Mon, 19 May 2025 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654532; cv=none; b=kjTrMp5jV5cMLnl0atxgo1j0l+YI+Yvw10oXPMWk1/3xzTSZSYCQca97jJPYdw4r6pt/KHa+GpI3Qwzkr/0BnJOJjBPyZqZqGjP3f1POMXtgX7Cn5FYflfuEPVhgGf03JmUL/AD741Xttrwy4y/Zel8/ODyEgX0TivoHQ7tdbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654532; c=relaxed/simple;
	bh=c4Lvu7ujHMSmlSyU6+Vgw3jLSD6EdIq9iAtPYK1lm4A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ltgdi6pooAihFju3VSvBL8LaY4eZUptwVzOQ+BGm3siHMFoJR13UXw6PS+JoEcP8nupWDjW7G4mepzB6Wm3e6IhXMKyVLMpNV0q4PakbcN9AOXrD+rw6LkfMei2cbjE6Fl90Lh0nmyVYTyx2BfYNAkELP/MFvstTzaru/tEgzL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=StjPzBot; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87DEC43A0B;
	Mon, 19 May 2025 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747654527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81nL3/GhkQ2VjUOe+1pO+ZBtDt54R0erupT3wBOarVI=;
	b=StjPzBotRjmZ4tnUHmQoqCmpf+mchssIgwwekn96rt1gfXBps2XWX7jLEZAhJe4G9sVKqv
	t6dbwwTxJQEQBRizkflnOEQ8fY20CF6dugtMThMZyT9BLTOXR906FTXrOhwTeD7o9LHG2W
	DeyxuJBEDBhEEOK37c8ykjfjoE8X5mI4wOUa+DCUfmlFzBMUIgJKFpRcdUWxi1k356vUSX
	YsJdZmSF+EWVG/OYIn7c8cLUX/s9oBWV8FbtM1QSTJ/cJvwkRRBRophSkMp0kTrFsEVMoX
	V0tBDlm/n8mpuJ37edJqKi3vLAbvNmdUE5+t+cba0AlWo3W1HaVw7M0xJYtMog==
Date: Mon, 19 May 2025 13:35:22 +0200
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
Subject: Re: [PATCH v2 04/26] driver core: Avoid warning when removing a
 device while its supplier is unbinding
Message-ID: <20250519133522.63acf5e5@bootlin.com>
In-Reply-To: <aBt5FvZ95S1Y_Mba@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-5-herve.codina@bootlin.com>
	<aBt5FvZ95S1Y_Mba@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Wed, 7 May 2025 18:15:34 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> 
> >  		if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
> >  			WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
> >  		} else {
> > -			WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
> > +			if (link->supplier->links.status != DL_DEV_UNBINDING)
> > +				WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));  
> 
> Why not
> 
> 			WARN_ON(link->supplier->links.status != DL_DEV_UNBINDING &&
> 			        !(link->flags & DL_FLAG_SYNC_STATE_ONLY));

Indeed, I will update in that way in the next iteration.

> 
> >  			WRITE_ONCE(link->status, DL_STATE_DORMANT);
> >  		}  
> 

Best regards,
Hervé

