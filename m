Return-Path: <linux-i2c+bounces-14083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99561C5BCBE
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 08:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A38D54E76A5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 07:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8692C326D;
	Fri, 14 Nov 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ihh3mPg2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA92EBB9A;
	Fri, 14 Nov 2025 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105480; cv=none; b=klnkoQzjsK1bB+xGfaO6TXFqJ+xXuEKYZSvZ36Rcphx2yEKa6QF3BQ4VvYA74ORl9iLVJjuK5XOvUFdkz6SIFvmwPAfUzMTA85UHMtEdyVwSU373z21zLu9gyXuP6IacmD+dg2JwtrNNUOiUViUlIEb3g+Omap/QEWIgdGgZvPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105480; c=relaxed/simple;
	bh=IxF8X1vfgVSVMfT8B2eub1WyPsdDbytWvtHeqhTmLhA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bHcQIEK6/4AM+zIqvhoF1bnKY240npXMQZDDvhWLUTwEi7327xIZL4e09xOsbeVs024VgXKlFQ8CrhjYirP4oaVbGcW2ORim9u7vvYtMyMPTGCXDUSt+IzZhuwuTEWVQPhjKZK2BLzXkzVacnN43/HHMDaFR1NKcRgYg3JKKFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ihh3mPg2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D08544E416AF;
	Fri, 14 Nov 2025 07:31:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90B36606F6;
	Fri, 14 Nov 2025 07:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91780102F24BE;
	Fri, 14 Nov 2025 08:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763105473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I/md1yzfYHmg4zf6NhSCwlxOr7WiJ5xSExfYcNRcf0c=;
	b=Ihh3mPg240Inv5tK6a0y2bc6iUFXi846hUKdidOylUDZuvveWMMENdHQaSkRED6RzFOXBq
	s3tYQSOkev+hYVQeHR4xdj9gsjCBZE4xoVzfSAK/1g2MipCnnjRB9Bkk5GjuXG3Cx7DOFw
	kYgFKBggTQm+b9pCxa+CSSQ/ZTWCwURcGhX3PYd9ux7EBGyx/9AHjyRmK+4KGnJIGUEThM
	qzUZSLvpXFlxbq5qUbppYDVR3bLAksRf/LYtY1SMB9VNJh0223ScvrKjeOG9M97dF0T3LW
	uvqxAXMSPLBRG2VoFl3r/PtCN/OynUaIXjcWuLff+sSzDc+2UloAc/8A3W9eSw==
Date: Fri, 14 Nov 2025 08:30:56 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Arnd
 Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Linus
 Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
Message-ID: <20251114083056.31553866@bootlin.com>
In-Reply-To: <CAL_JsqJ89EcUvQnS0xYXOrw6wJ30TT5oFA85eCqHYdu43056cw@mail.gmail.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
	<20251015071420.1173068-6-herve.codina@bootlin.com>
	<20251030141448.GA3853761-robh@kernel.org>
	<20251031162004.180d5e3f@bootlin.com>
	<20251112142632.GA1610836-robh@kernel.org>
	<CAL_JsqJ89EcUvQnS0xYXOrw6wJ30TT5oFA85eCqHYdu43056cw@mail.gmail.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

On Wed, 12 Nov 2025 13:29:09 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Nov 12, 2025 at 8:26 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Oct 31, 2025 at 04:20:04PM +0100, Herve Codina wrote:  
> > > Hi Rob,
> > >
> > > On Thu, 30 Oct 2025 09:14:48 -0500
> > > Rob Herring <robh@kernel.org> wrote:
> > >  
> > > > On Wed, Oct 15, 2025 at 09:13:52AM +0200, Herve Codina wrote:  
> > > > > A Simple Platform Bus is a transparent bus that doesn't need a specific
> > > > > driver to perform operations at bus level.
> > > > >
> > > > > Similar to simple-bus, a Simple Platform Bus allows to automatically
> > > > > instantiate devices connected to this bus.
> > > > >
> > > > > Those devices are instantiated only by the Simple Platform Bus probe
> > > > > function itself.  
> > > >
> > > > Don't let Greg see this... :)
> > > >
> > > > I can't say I'm a fan either. "Platform bus" is a kernel thing, and the
> > > > distinction here between the 2 compatibles is certainly a kernel thing.
> > > >
> > > > I think this needs to be solved within the kernel.  
> > >
> > > I fully agree with that.
> > >  
> > > >
> > > > What I previously said is define a list of compatibles to not
> > > > instantiate the child devices. This would essentially be any case having
> > > > a specific compatible and having its own driver. So if someone has
> > > > 'compatible = "vendor,not-so-simple-bus", "simple-bus"', when and if
> > > > they add a driver for "vendor,not-so-simple-bus", then they have to add
> > > > the compatible to the list in the simple-pm-bus driver. I wouldn't
> > > > expect this to be a large list. There's only a handful of cases where
> > > > "simple-bus" has a more specific compatible. And only a few of those
> > > > have a driver. A more general and complicated solution would be making
> > > > linux handle 2 (or more) drivers matching a node and picking the driver
> > > > with most specific match. That gets complicated with built-in vs.
> > > > modules. I'm not sure we really need to solve that problem.  
> > >
> > > Right. Let discard the "more general and complicated solution" and focus
> > > on the list of compatible to avoid child devices instantiation.
> > >
> > > Do you mean that, for "simple-bus" compatible we should:
> > >  - Remove the recursive device instantiation from of_platform_populate().  
> >
> > That may be a problem I hadn't considered. While we've solved most probe
> > ordering issues, I think some may remain. Even when of_platform_populate()
> > is called affects this. For example, I tried removing various arm32
> > of_platform_.*populate() calls which run earlier than the default call,
> > but that broke some platforms. (Looking at the list of remaining ones, I
> > fixed the at91 pinctrl/gpio drivers, but never tried to remove the
> > calls again.)
> >
> > Maybe this can be restricted to cases which are not recursively created
> > from the root node. Not sure how we detect that. Perhaps no OF_POPULATED
> > flag on the parent node? Or we could just enable this for OF_DYNAMIC
> > nodes? That should be sufficient for your usecase.  
> 
> Thinking a bit more about this, I think you don't have to do anything.
> If child nodes already got populated, calling of_platform_populate() a
> second time is essentially a nop. And for cases you care about, that
> wouldn't have happened. Of course, I'd still rather there only be 1
> path that devices could have been instantiated.
> 

Hum, if my understanding is correct, this looks like what I did in the v3
iteration [1].

The idea was:
  1) Do not change anything in of_platform_.*populate()
  2) Update the simple-bus driver to populate children if there is only one
     compatible string and this string matches the compatible string handled
     by the driver.

We can be more restrictive for 2) and only populate children if the only one
compatible string is "simple-bus". This will keep current behavior for
"simple-mfd", "isa" and "arm,amba-bus".

If you think this could be the right direction, I will bring those modification
in the next iteration.

Also, do you think we should be more restrictive and populate children in the
simple-bus driver only for "simple-bus" compatible?

[1] https://lore.kernel.org/lkml/20250613134817.681832-6-herve.codina@bootlin.com/

Best regards,
Hervé

