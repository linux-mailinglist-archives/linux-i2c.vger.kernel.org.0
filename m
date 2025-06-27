Return-Path: <linux-i2c+bounces-11671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF324AEBACB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 17:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F8733BB16C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 14:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04BE2E8DEA;
	Fri, 27 Jun 2025 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AZZxZg1s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479C29DB6B;
	Fri, 27 Jun 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036382; cv=none; b=BtbMBsi2X0oQfPe3oTZ694CiizSVa+trKPxr4Y21BR++kbDeijB2C3UPF308joSsQiTz3BlRrgyLzBhB+ZEazzy42C18P2Pv0Zkrnx4FuvhRLpE+xDef1B9PUjyP5fy5ngAu40Dn2jU0/SBGbSSNhOY6VDuc1cTz1XefXEbq284=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036382; c=relaxed/simple;
	bh=Q624Qj2i25nnhuv7Bqn+nxJwHsYhIYSd8aBORWKkTDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GUxZ3siR29RkQQ3hzSfsF44cAPFhjlhJ6OB2O3hSA4TH4oGbLanc5cOK52bK4uIWzSJk+A7IUTKYhUMkX5DhGcX5zjFA2sNGueFn266b/SfmpFXanXICW3iE52T9S5uAsM3KYyLCWvTKRZ//U1L+IIKjmxmT0GPEeSj248SfJYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AZZxZg1s; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B280243914;
	Fri, 27 Jun 2025 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751036376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThiterbTvL+mYGXh+idmEWQ5hcYVOVl2geFkwk5TYJc=;
	b=AZZxZg1sYkT9vHUrIb2/97+6gfdNO4TtsAae3Q97XVRt49b0/Vi8ATyjffit62MZ37kfFL
	ymp82e/YrnESaBvIOQpjbOf2NByT+aIPb77AUb4LL4j2gswmjCDrkd8q8JlI9EKD/dTAGv
	ehdRnIQrsEL+gjpbp5/HZ3gDsDO5/1suKp3xnM2E14rmnSJF/7NfSxhMn203GJECVD9In9
	m8CXZqLY8ct1ish67IsDUCaBumDTG5qcx7dEbGr9De+dkZwMfiwoTHf5QNh6Zrf48SviUx
	IemOqFS+LYffkXWwV86Y/xGnsTH8VmnMH3qqowHZYUhXdCZGAKaDau1hHDHE3g==
Date: Fri, 27 Jun 2025 16:59:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown
 <lenb@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Sakari Ailus
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
Subject: Re: [PATCH v3 06/28] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <20250627165930.344b429c@bootlin.com>
In-Reply-To: <20250616090406.32f62ca4@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
	<20250613134817.681832-7-herve.codina@bootlin.com>
	<CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
	<20250616090406.32f62ca4@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegkedprhgtphhtthhopehsrghrrghvrghnrghksehgohhoghhlvgdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: herve.codina@bootlin.com

Hi Saravana,

On Mon, 16 Jun 2025 09:04:06 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Saravana,
> 
> On Fri, 13 Jun 2025 14:13:49 -0700
> Saravana Kannan <saravanak@google.com> wrote:
> 
> > On Fri, Jun 13, 2025 at 6:49 AM Herve Codina <herve.codina@bootlin.com> wrote:  
> > >
> > > Setting fwnode->dev is specific to fw_devlink.
> > >
> > > In order to avoid having a direct 'fwnode->dev = dev;' in several
> > > place in the kernel, introduce fw_devlink_set_device() helper to perform
> > > this operation.
> > >    
> > 
> > This should not be set anywhere outside the driver core files. I'll
> > get to reviewing the series, but until then, NACK to this.
> > 
> > Is there a specific patch that explain why we need to set this outside
> > driver core?  
> 
> We need to set it in case of creating device-tree node for PCI.
> 
> Usually, fwnode are created (based on DT or ACPI) and then, dev are
> created.
> 
> In the PCI DT node creation case, device are already created and then, based
> on information already computed by the kernel, DT node are created.
> 
> You can see that on patch 11 (dev setting was already upstream and it is
> replace by a call to the helper for PCI host bridge) and on patch 13 (PCI
> device).
> 
> Other patches (8, 9 and 10) replace the existing direct setting of the dev
> member by a call to the helper.
> 

Have you got time to look at the series, patches I pointed out and the reply
from Andy?

Are modifications still nacked on your side?
If so, what kind of modification would you like to see in order to move
forward?

Best regards,
Hervé

