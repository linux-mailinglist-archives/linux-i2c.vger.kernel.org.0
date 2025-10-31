Return-Path: <linux-i2c+bounces-13926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C92C2598C
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 15:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE743A631D
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 14:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFBA34C146;
	Fri, 31 Oct 2025 14:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m/llmHWP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926234BA5C;
	Fri, 31 Oct 2025 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920997; cv=none; b=n14dpXEq2e/hECGKfujc9AB0EbuOgQHfWcXnP/NJqZKGDnapYfPWuVOCx1N381TUxSNkiB4QlCpJ59KMypefT1fJDU0IoDFFuec2r95YV3zZ6KG1c7WJvNaa9vp+2ExKlqmKfQW6fTXQQjRkKPnmbifeoV9+AmnO1ghFwgfswOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920997; c=relaxed/simple;
	bh=DpRmmnQNFBCQ/QafgwFnqLT9Yw/H1JWWO9tLoLVtAy4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRiJNLWcnqkDFoYr5w1+yKPbVMU8T/15UZKg7VB9CPNoid0taKLhOew+ODO8O+T7+EqbXU7eNz8kY/rL+iBw/WOi8fgz5FbtncGBZtKnRRozKBHcVRcidP6SJnTLQnW0MvI9esOamXnUbuX8wR2UkPasvHHP/u/iFENq04OZRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m/llmHWP; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF21C1A17AF;
	Fri, 31 Oct 2025 14:29:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF96E60710;
	Fri, 31 Oct 2025 14:29:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4B4A11818003;
	Fri, 31 Oct 2025 15:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761920989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H1xEmCgdr5BM399Kc4ZsWwaTbhEQ52MJYYiQpqbSK6Q=;
	b=m/llmHWPK2GTOxgP86qebD1Z2Edet7KZozbxg7xHP71zP8WGHqlNCsjTjzbgRJW6AoYEg9
	PGGuEBK7TNuc+3zADlLbC1jrjiYc/TXhPfAwEtjv3025kcM3TvB0cUwMNtHDn+fuYXbapk
	18lKsj6lpv1/ObuOPQiBVRZx/Tm+zaLVFOXH7eT76X6+OiJSchpc3v+iGXicmC9AbAQ7Fi
	n3R42rQTkma0JCEYRFgzMb9znRzRns4yCbMUv4DSU7pRjgiVIxLEd6NnupsCZT4TGW2iAp
	n6HmKRiLt0yJEP375+9QgT+CNjKgF6b7Kiq48SW1im8mtyVm7PYpr3cu982RMw==
Date: Fri, 31 Oct 2025 15:29:30 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
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
Message-ID: <20251031152930.3c51a313@bootlin.com>
In-Reply-To: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
	<20251015071420.1173068-6-herve.codina@bootlin.com>
	<CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
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

On Fri, 31 Oct 2025 09:52:16 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hervé,
> 
> On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote:
> > A Simple Platform Bus is a transparent bus that doesn't need a specific
> > driver to perform operations at bus level.
> >
> > Similar to simple-bus, a Simple Platform Bus allows to automatically
> > instantiate devices connected to this bus.
> >
> > Those devices are instantiated only by the Simple Platform Bus probe
> > function itself.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bus/simple-platform-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Simple Platform Bus
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  A Simple Platform Bus is a transparent bus that doesn't need a specific
> > +  driver to perform operations at bus level.
> > +
> > +  Similar to simple-bus, a Simple Platform Bus allows to automatically
> > +  instantiate devices connected to this bus. Those devices are instantiated
> > +  only by the Simple Platform Bus probe function itself.  
> 
> So what are the differences with simple-bus? That its children are
> instantiated "only by the Simple Platform Bus probe function itself"?
> If that is the case, in which other places are simple-bus children
> instantiated?

In of_platform_populate(). It call of_platform_bus_create() which is
recursive:
  https://elixir.bootlin.com/linux/v6.14/source/drivers/of/platform.c#L374

So children are instantiated out of the bus probe().


> 
> Do we need properties related to power-management (clocks, power-domains),
> or will we need a "simple-pm-platform-bus" later? ;-)
> 
> FTR, I still think we wouldn't have needed the distinction between
> "simple-bus" and "simple-pm-bus"...

I would like that. Using simple-pm-bus solves my issue but I don't have any
clocks or power-domains to set. The simple-pm-bus bus requires at least
one of them. Even if the driver itself solved my issue, I cannot be
compliant with its binding.

Best regards,
Hervé

