Return-Path: <linux-i2c+bounces-11030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B23ABC132
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 558F4166E8E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 14:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B5528466B;
	Mon, 19 May 2025 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eH3WdAKN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887792797B0;
	Mon, 19 May 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665896; cv=none; b=V7w0KyxFl2FB1QZGqGlglQ6PHu7irRpqfCd/YU9Oz/2/DsCSQCd6gOpWx9wTjT3FHuLypKAc07EmA6a0SAQDtwimSEiSL9dIzInwG3SUnO2KEiwmZonkAthSDxsfOWZr/B3+aGkzvbhfk+jcupuIQeLYZuVIruzkXhBRZj3Q0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665896; c=relaxed/simple;
	bh=vBqhKMKC4OdHgrV/CQyjfP3RTYzJtSE/7KU63stqSvg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OU9sWDd8Xa3eO9BQ1HZKVc9UFGEq0nu9VAsS9H+uLoEnql6ldzRU3Vok4CwCUZf6K2R+i+5J7eKMDhBgUP3j2R6PSkNApRY7ol+UvIifIeR8r3TsJiR/KbS961VvF+mJMO7QvKaR3ifuzwBSeqKsjx+xDe8k43Diuz1GNDnpEfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eH3WdAKN; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C35E543A62;
	Mon, 19 May 2025 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747665891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhRsdDycI0OlXvOuPwJxvAYxJ8SUxX7xj+GFLQ0kVvw=;
	b=eH3WdAKNnNb3TD5/ufVcgMos6dNTqXPDtuD8xsTELsY3XFQ2nqsXkOcUDh1YfySKaHwJz8
	I+/Fp/PaWvCD6rTsGXxTBdTUwvz1i56dSEnQ7WeL4xSL/dmY+eQ7hzb2XG6NmwN0kTYDhy
	NF6MfmYzMzFIqkMomuXzHCLETqPRY1nwHvOqSTwFe0VeKUEerfPB6LCt1T+Z+KZxjnYkPA
	FBEmBnaZXG/rxvub1PVImJTtGAPI4UiJvlFWZl0Fd/0fnmbLjWFeThj67uheOOpXUShINU
	4UBnKrqa15BzocMqVTJT33gGXwX+b6a+LPQ8BjWxKuC6xmy26F8Iz4/6Ac1gxg==
Date: Mon, 19 May 2025 16:44:48 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
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
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific
 data
Message-ID: <20250519164448.57792b6d@bootlin.com>
In-Reply-To: <8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-24-herve.codina@bootlin.com>
	<8b97e095-dbed-438c-9c6d-d3c2c5929fc0@lunn.ch>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhgu
 hhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Andrew,

On Thu, 8 May 2025 00:24:03 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> > Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> > and this overlay is directly referenced in lan966x_pci_load_overlay().
> > 
> > This avoid to use the code for an other board.
> > 
> > In order to be more generic and to allow support for other boards (PCI
> > Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> > it to PCI Vendor/Device IDs handled by the driver.
> > 
> > This structure contains information related to the PCI board such as
> > information related to the dtbo describing the board we have to load.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> How big is the dtbo ?

With current series applied, the dtbo is 6029 Bytes.

Best regards,
Hervé

