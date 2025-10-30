Return-Path: <linux-i2c+bounces-13906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FFC20883
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 15:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C230D3B5E4B
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 14:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598CA25A333;
	Thu, 30 Oct 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZRg3Lcv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD73023C513;
	Thu, 30 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833701; cv=none; b=SKWjHsyDdAWWep/tmNZkHK1OVlWGngxy3JyVdyDoBl0idjiT9c2l/yJlydz6565Mbb72bmjrwSpOrJUnuzOVpqqpVI+hLio3mkCwFE8xy5oRJUeUn+aYteD9RCBt5jhPr7ZvXw9LXWy5Xso/9e4N7bwBgqmkX95O509ox2PoCOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833701; c=relaxed/simple;
	bh=ARkbEZwIcjtq3UHgVcwLTAhe5ywrSMfhcggmgV1iso8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNVNM00lVRKALcENWHxHbHY5k8r2rKMp+mk4MNMxn5U9M5jP8vhYuXxgpfaD2CkScw1vlasg/8gVwPeh7PeEIfqlJIwJsm9hAb2zKcJq7nw/YjjWhVCTTTXRJZ6ipLExsajTdpucrkEYT4atv2gTa63YcCC+BD6L4ZoiuzcrrwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZRg3Lcv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43177C4CEFF;
	Thu, 30 Oct 2025 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761833699;
	bh=ARkbEZwIcjtq3UHgVcwLTAhe5ywrSMfhcggmgV1iso8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZRg3Lcvd8GObcu7mv5GNEOQTP82tLQK9Fl51npkDqQkq8vYqiXjd+sdbWRm+AaKS
	 KM05NDknRHsO9S3x92lDMWSXtGzaU5EbeIrn74EMy0Vn9dsDaegeR4nvExsA3djLUP
	 VIgK0Wjr8X+dTo/niyqSMRgbYKTqJXZY0RP0Co/azFwbieXvnh7lwPpyXWLgV7FNWX
	 twXnIP0x8vUNwSyA96xXCYhrS/xVTBSa143Z2dBIN1G3kq1e9zqrIJRND6e/Nt9r7B
	 CEPqGJIpLThMFYq2/zDzz6r1MwoPduvgQLuJg5UqqWx2aNvdP/Aj492SQNNbrfTU54
	 3aj6I/1c7UcYQ==
Date: Thu, 30 Oct 2025 09:14:48 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
Message-ID: <20251030141448.GA3853761-robh@kernel.org>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015071420.1173068-6-herve.codina@bootlin.com>

On Wed, Oct 15, 2025 at 09:13:52AM +0200, Herve Codina wrote:
> A Simple Platform Bus is a transparent bus that doesn't need a specific
> driver to perform operations at bus level.
> 
> Similar to simple-bus, a Simple Platform Bus allows to automatically
> instantiate devices connected to this bus.
> 
> Those devices are instantiated only by the Simple Platform Bus probe
> function itself.

Don't let Greg see this... :)

I can't say I'm a fan either. "Platform bus" is a kernel thing, and the 
distinction here between the 2 compatibles is certainly a kernel thing.

I think this needs to be solved within the kernel.

What I previously said is define a list of compatibles to not 
instantiate the child devices. This would essentially be any case having 
a specific compatible and having its own driver. So if someone has 
'compatible = "vendor,not-so-simple-bus", "simple-bus"', when and if 
they add a driver for "vendor,not-so-simple-bus", then they have to add 
the compatible to the list in the simple-pm-bus driver. I wouldn't 
expect this to be a large list. There's only a handful of cases where 
"simple-bus" has a more specific compatible. And only a few of those 
have a driver. A more general and complicated solution would be making 
linux handle 2 (or more) drivers matching a node and picking the driver 
with most specific match. That gets complicated with built-in vs. 
modules. I'm not sure we really need to solve that problem.

If we have to do something in the DT, then I think I prefer a property 
to control the behavior. That way we have the option to ignore it.

Rob

