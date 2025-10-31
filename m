Return-Path: <linux-i2c+bounces-13937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF0DC25D04
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 16:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242FF189A6E3
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 15:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4C02C326D;
	Fri, 31 Oct 2025 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZXX1Bma9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8382BEFE8;
	Fri, 31 Oct 2025 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761924030; cv=none; b=ZNEKAbLyroFbt3tBAvQcZY9QYeTiAGiX1SzC8peQ4f8t+sDmwBelAleHe5XPOyzm9NUFeYsreEwcOGds458lXU5MraRIVJ0L6MNSAcyiDNtxm8zqSCuAi2I9F3QLJ22H/qeulh/VWG00arhqpdxT/nw4+xEbdGOGGzK3iXxMfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761924030; c=relaxed/simple;
	bh=y3b+wUCsWckPBCTPgAZadRRNBEdlpxrfsSHKNnGesNY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIaBcq2DZFuFNWCJ69Rp0+KvIfpGueRbZrey+b0r4YUEldPX23/cFLYyPXuR7y7OVFEDeUfC36Mk+wy6edhs8knsppObLPKWJzX7olzwvTmKIcm7U2PRpgMev9arNBx8aTv5dw3R4a0H4WpDPy2dAuPOut7Zp8NffcGGgLtXzO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZXX1Bma9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B52E14E41440;
	Fri, 31 Oct 2025 15:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C26D60704;
	Fri, 31 Oct 2025 15:20:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 067DE11818041;
	Fri, 31 Oct 2025 16:20:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761924023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=goHQM/1NASiwEpJFuU+gt1w80LtYcWXr5Gc0K9tmMcc=;
	b=ZXX1Bma9X3KMNXlEJ6m3KmzgeWaoHvqKZUDGbtyXcyczSWNcqa1WxZl7PaaP3QnmzL9gq4
	h0YuPlq7t/ag22Qc0RV6DUkEOizZ8aU4YvVAi5tQ0oCrNCN9uTlgnrGvmTf6uzjWAFrc/P
	iOZon5nGEinDurKqvP8UIygDFPUWAiUqm59zHUbmHyOs3e60XOGs63ifmZhf114mLUKRqK
	bIKj+JoZJxnMO/w5PK2AbEIM7ADXeVegLKetdhc6qx0E6UYxyvcnSln30z+BZXKje9+TfM
	AmSNEEcgTn5HJwFcJWmSNYyzhr1jXdHX0RhRB0lSnwspgtNFDoD+bFqnfo/hgQ==
Date: Fri, 31 Oct 2025 16:20:04 +0100
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
Message-ID: <20251031162004.180d5e3f@bootlin.com>
In-Reply-To: <20251030141448.GA3853761-robh@kernel.org>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
	<20251015071420.1173068-6-herve.codina@bootlin.com>
	<20251030141448.GA3853761-robh@kernel.org>
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

On Thu, 30 Oct 2025 09:14:48 -0500
Rob Herring <robh@kernel.org> wrote:

> On Wed, Oct 15, 2025 at 09:13:52AM +0200, Herve Codina wrote:
> > A Simple Platform Bus is a transparent bus that doesn't need a specific
> > driver to perform operations at bus level.
> > 
> > Similar to simple-bus, a Simple Platform Bus allows to automatically
> > instantiate devices connected to this bus.
> > 
> > Those devices are instantiated only by the Simple Platform Bus probe
> > function itself.  
> 
> Don't let Greg see this... :)
> 
> I can't say I'm a fan either. "Platform bus" is a kernel thing, and the 
> distinction here between the 2 compatibles is certainly a kernel thing.
> 
> I think this needs to be solved within the kernel.

I fully agree with that.

> 
> What I previously said is define a list of compatibles to not 
> instantiate the child devices. This would essentially be any case having 
> a specific compatible and having its own driver. So if someone has 
> 'compatible = "vendor,not-so-simple-bus", "simple-bus"', when and if 
> they add a driver for "vendor,not-so-simple-bus", then they have to add 
> the compatible to the list in the simple-pm-bus driver. I wouldn't 
> expect this to be a large list. There's only a handful of cases where 
> "simple-bus" has a more specific compatible. And only a few of those 
> have a driver. A more general and complicated solution would be making 
> linux handle 2 (or more) drivers matching a node and picking the driver 
> with most specific match. That gets complicated with built-in vs. 
> modules. I'm not sure we really need to solve that problem.

Right. Let discard the "more general and complicated solution" and focus
on the list of compatible to avoid child devices instantiation.

Do you mean that, for "simple-bus" compatible we should:
 - Remove the recursive device instantiation from of_platform_populate().
 - In simple-bus probe(), check the device we probe against the
   'no_instantiate_children' list
      - If it matches, do not instantiate chidren
      - If it doesn't match instantiate children

Is that correct?

Best regards,
Hervé

