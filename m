Return-Path: <linux-i2c+bounces-10207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0DA80A3B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C0527A50EF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 13:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD7226AA9A;
	Tue,  8 Apr 2025 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nf4kYgYR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449D26AA85;
	Tue,  8 Apr 2025 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116715; cv=none; b=U+Hv9NzGmNziwrLFQhmGQPSHrBKF7xf61wa0gXeNLirOhYM5zEhqWzMtshu4fSD7m+Vez9JTwlqCWZ21VQs1LdZxY4kEQDHIpZEbU4cXgjozzVbE2MnEnqHsq2SadUwlUDUyuQKrHDav+hdSg6pkq+te2wwPaozIwkUMsReNYb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116715; c=relaxed/simple;
	bh=7lm2K430Lexgx1320bQ639uUSZH0FepdkHfEwGSiCh8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I08ujOr+JN4CCC86iykZFS2LXKNCOxmsK1QQFGkmI5DdWj/SqKD9ScFfeBFQLHRJ4oVsy/wVR5t+Kv4h9/ZHU/aE3czdf9XkG/f8kO+g2IupeBKiaFsQm19Sugz2GnnVBhSE5WEZf6uUfdFY9QZFDmi3SzHAMahvXCW+2oopYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nf4kYgYR; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DBCA43210;
	Tue,  8 Apr 2025 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744116704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOhMDuFqtRk7BH6T/PmLdxDa9c5hJPubu57xqa7O+Ro=;
	b=nf4kYgYRWY4bZyISBsuoJ7DSaNAl7+wuSlkQE1iZDaE5xSpRmvhSWjeY7hJmDti38AuTzm
	AUnD9vw+BQFSq+MrJEm+87J0zwgLW7Fivj/7S9JjOMEeNTD/TxY2sdf4fW1daGQpoyn3WX
	D/oqMLYo4M5wfxErSiXaBLtG11yE3YIwhsc2oNFI3mpmM6Z10Q35Nl9yDnxMYq9cEnH0RL
	iA3yzrX9pfWy0AsorLfINMFg4DofnttwbhAIIQsE6PYgDhrNddQPNrLnYtqBYGFBE3Wegg
	cCT109goYuFvc37Qr0/1D3+27OR+dn+OuoFrn6y0iOz5YvjQrEOG5c5HC4ZtUQ==
Date: Tue, 8 Apr 2025 14:51:39 +0200
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
Subject: Re: [PATCH 06/16] PCI: of: Set fwnode.dev of newly created PCI
 device nodes
Message-ID: <20250408145139.293c79a2@bootlin.com>
In-Reply-To: <Z_PvhVkdhubA9jAe@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-7-herve.codina@bootlin.com>
	<Z_PvhVkdhubA9jAe@smile.fi.intel.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegtddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Andy,

On Mon, 7 Apr 2025 18:30:13 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:35PM +0200, Herve Codina wrote:
> > Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> > node are created and filled based on PCI core information but the
> > fwnode.dev field is not set.
> > 
> > When later an overlay is applied, this consuses fw_devlink. Indeed,
> > without any device attached to the node, fw_devlink considers that this
> > node will never become a device. When this node is pointed as a
> > supplier, devlink looks at its ancestors in order to find a node with a
> > device that could be used as the supplier.
> > 
> > In the PCI use case, this leads to links that wrongly use the PCI root
> > bridge device as the supplier instead of the expected PCI device.
> > 
> > Setting fwnode.dev to the dev of the PCI device allows devlink to use
> > this device as a supplier and so, correct links are created.  
> 
> ...
> 
> > +	/*
> > +	 * Set the fwnode.dev in order to have fw_devlink creating links
> > +	 * pointing to this PCI device instead of walking up to the PCI host
> > +	 * bridge.
> > +	 */
> > +	np->fwnode.dev = &pdev->dev;  
> 
> This is too invasive. I suppose here should be a helper for this kind of
> operation. If not, create one.
> 
> 	fw_devlink_set_device(...);
> 
> 
> or alike.

Yes, I will add
  void fw_devlink_set_device(struct fwnode_handle *fwnode, struct device *dev);

Also, I will probably add a new patch in this series in order to use
the new fw_devlink_set_device() when relevant in the already existing code.

Best regards,
Hervé

