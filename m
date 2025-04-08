Return-Path: <linux-i2c+bounces-10224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F413A80FA4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503F9189D71B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC90C22333A;
	Tue,  8 Apr 2025 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e0UNBGod"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800091F098D;
	Tue,  8 Apr 2025 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125243; cv=none; b=YZpPgX34K1okvZ6EitRJ7B24uk99YVu8yINzvZuytcZO+ChYVh5rMhgEh+6RHgR/HH3zFRlXCB4aUvliqDE+t2nio0ATfLVOTek8AMXyZMOEcCHUCdbryj8LXnTgdfz/TWMeuAdvZi+g5UyYXI5der6p0L1yhzi6lR7t4h9i4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125243; c=relaxed/simple;
	bh=8p3t0lkqP6MY+gt6AiZADjhwdZ+1gjcjLL6bW89DHiY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=JmoiNPr4Gmv7j17tl6HFjKvWaGWm+xKn7q56N6qJe1qGYqKkAE3JLV6HI26sFzcj1zRjuDxyqDGvRygUMkL2CBi4ptxVGBWyIJN5VY7njz9RzxQiyCdU46m/b8yU8631AqdvRfTiOCM1NlpjJ7DJXDdIXdvbylZaC3GBkeKpjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e0UNBGod; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9081E44304;
	Tue,  8 Apr 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744125238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABDY6poh0HThAHrjisqjJxeh621Yt7h0FayEtDXs8a4=;
	b=e0UNBGodg2EZ86zi6OaGzuuF6bdNAYXjeXAwUVqzhoUgJk2DB2OMM6UbxH+GaL6AF+S6TE
	WkhDhb3vRWVzj8KS2Vo3uRT9UIX6UrANzHhaZRDIsbJjlyA9j5yw6aIO07XYDvRx3OD9Or
	++LdKi+50MW2olNWpkpYdKOgu5xHjzLp7FoMmdqO6uRWLkJtd4DE88vXIZKS8nFNgH1eo3
	cow28PW5jz2i+yrtMIr3ZuGX1iHJFoPmPLgeNBgvsMGdsnS53/bJEG5ob1SoFUe4v5Jplj
	pwubq7Ej8hXCwX4zDyec0KJ0k9PEgTFo7RNt8rel/Ra1V7jxu6MZmM4zscARAg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 17:13:54 +0200
Message-Id: <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Peter Rosin"
 <peda@axentia.se>, "Derek Kiernan" <derek.kiernan@amd.com>, "Dragan Cvetic"
 <dragan.cvetic@amd.com>, "Arnd Bergmann" <arnd@arndb.de>, "Rob Herring"
 <robh@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Mark Brown" <broonie@kernel.org>, "Len
 Brown" <lenb@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Wolfram Sang" <wsa@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-acpi@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "Andrew Lunn"
 <andrew@lunn.ch>
X-Mailer: aerc
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
In-Reply-To: <20250408162603.02d6c3a1@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcurfgvthgriiiiohhnihdfuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhgfeijeduheejtdduteffleeggeejieffiedvteefjeefudekvdeggfeihfeivdenucffohhmrghinheplhhptgdrvghvvghnthhspdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: thomas.petazzoni@bootlin.com

Andrew, Herv=C3=A9,

On Tue Apr 8, 2025 at 4:26 PM CEST, Herve Codina wrote:

>> What exactly does this DTSO file represent?
>
> The dsto represents de board connected to the PCI slot and identified
> by its PCI vendor/device IDs.

If I may extend on that by providing what I believe is a more
accurate/precise definition.

The DTSO doesn't represent the board, rather it describes the HW
topology of the devices inside the PCI endpoint. Indeed, the PCI
endpoint is a full-blown SoC with lots of different HW blocks that
already have drivers in the kernel (because the same chip can be used
with Linux running on an ARM core embedded in the SoC, rather than
access as a PCI endpoint). So the DTSO describes the full topology of
the HW blocks inside this complex PCI endpoint, just like the DTS
describes the full topology of the HW blocks inside an SoC.

Please see:

  https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2=
023%20Non-discoverable%20devices%20in%20PCI.pdf

And most notably slide 6.

Best regards,

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com


