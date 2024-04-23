Return-Path: <linux-i2c+bounces-3061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727DE8ADFE6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 10:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1061F238E9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 08:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0354B54F87;
	Tue, 23 Apr 2024 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hLHTY6wa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CE44C8F;
	Tue, 23 Apr 2024 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713861574; cv=none; b=T/NfNwD39TQ9QqMonhxt72Cf0Dv2oa3jtxHYzdubJQfOUeW86CI/SDWLr35HvUvEfJ65ImdCBn6iM8v4GronTKROXuTz0gQCwSPXzehJs56p29984XExj8AW0f7hMgIxkvMieIl1YW4V+4nrxGs/GiJaP6ozGntWDjWoeC9Na0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713861574; c=relaxed/simple;
	bh=QTujR1a7+ujDQPHOp+uzhs//S+2APRPzioOxbcORayA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgF6j0GM4gL3Z+e+y+4sOxNg2f+gyazMvoFJUHNJlnAq65oEEM3/Ck7kdZ7Rpkerymi5aCuh4WzUX3748+AXhBP1s3WcSf4s0aj3mWrgp5/duh6NWD+SZZghHattnfnIJJaVvzPlcXgn1GDkg1IOY7+f9pBdygjrflOM/vDXz/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hLHTY6wa; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 272DCE0004;
	Tue, 23 Apr 2024 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713861568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWooWzbcUrSnTPeszzSJpcTzFIEr2JfKzqakj4tFJJY=;
	b=hLHTY6waJMhOsBbEkB2wckL8NFXE/Z5ge/rWHSfH+e/KLA8ApALX67yjQ+GuQJt1ovw9p3
	jy+JZRWVzXB/GWT293hP1J7JhRVXmkqSKfV7nBqrtIJDzw3RLzJSwcmQt/73yWcvuQydfy
	FUR6cTax7hyIqbWcxzyYVXiSwdV+DRgtKDBRCk8cJIjEwiQIJGfgFc7QKr00M3kBFI8H9t
	aaKSs9g3e2tJqAfX3nK9a5x0L7TLJ6IPCUM7ADcyR/Om0qJTl5nT065vGP/9w+oz9el9ii
	qI98mhXg92GzjapvNeMLw6EPRcpE7Mc3eU88wsOSg+v/xix91Ef8xWRJ3kArxw==
Date: Tue, 23 Apr 2024 10:39:24 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, kernel-team@android.com, Wolfram Sang
 <wsa@kernel.org>, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 0/2] fw_devlink overlay fix
Message-ID: <20240423103924.366eba43@bootlin.com>
In-Reply-To: <20240411235623.1260061-1-saravanak@google.com>
References: <20240411235623.1260061-1-saravanak@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Saravana,

On Thu, 11 Apr 2024 16:56:20 -0700
Saravana Kannan <saravanak@google.com> wrote:

> Overlays don't work correctly with fw_devlink. This patch series fixes
> it. This series is now ready for review and merging once Geert and Herve
> give they Tested-by.
> 
> Geert and Herve,
> 
> This patch series should hopefully fix both of your use cases [1][2][3].
> Can you please check to make sure the device links created to/from the
> overlay devices are to/from the right ones?
> 
> Thanks,
> Saravana
> 

I tested the series.

On my Microchip use case (i.e. DT overlay on a PCIe device), I observed that
some driver removal were done in a wrong order. For instance, the onboard
PCIe device interrupt controller (oic@e00c0120) was removed before its
consumers.

I enabled debug traces in core.c and observed that many links were dropped.
These links are related to pinctrl, clock, reset, interrupts, ...
I have the feeling that these links should not be dropped.

Here are extracted traces:
--- 8< ---
  [    9.225355] mchp_lan966x 0000:01:00.0: enabling device (0000 -> 0002)
  [    9.279024] device: 'd0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0': device_add
  [    9.286555] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/oic@e00c0120
  [    9.302168] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/reset@e200400c
  [    9.317489] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064/tod_pins
  ...
  [    9.403387] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/mdio@e200413c Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/reset@e200400c
  [    9.418466] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth3 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064
  [    9.433263] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth2 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064
  ...
  [    9.495849] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8
  [    9.512111] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000/i2c@600 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/oic@e00c0120
  [    9.527931] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000/i2c@600 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8
  [    9.544878] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000/i2c@600 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064/fcb4-i2c-pins
  ...
  [    9.562283] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/reset@e200400c
  [    9.577563] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/oic@e00c0120
  ...
  [    9.592813] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/cpu_clk
  [    9.608258] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/ddr_clk
  [    9.623731] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sys_clk
  [    9.639269] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/oic@e00c0120 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0
  [    9.651930] device: 'pci:0000:01:00.0--platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0': device_add
  [    9.661716] platform d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0: Linked as a sync state only consumer to 0000:01:00.0
  ...
  [    9.803560] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth2 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [    9.816827] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth2 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064
  [    9.831309] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth3 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [    9.844561] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth3 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064
  ...
  [    9.919384] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000/i2c@600 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [    9.934028] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000/i2c@600 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064/fcb4-i2c-pins
  [    9.951138] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [    9.965012] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064/tod_pins
  [    9.980886] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [    9.994831] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/reset@e200400c
  [   10.009834] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/mdio@e200413c Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [   10.023520] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/mdio@e200413c Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/reset@e200400c
  [   10.038248] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/reset@e200400c
  [   10.053160] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000/i2c@600 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8
  [   10.069820] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [   10.083772] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8
  [   10.099739] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8 Linked as a fwnode consumer to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [   10.114471] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sys_clk
  [   10.129648] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/ddr_clk
  [   10.144818] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/clock-controller@e00c00a8 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/cpu_clk
  [   10.159986] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/pinctrl@e2004064 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/oic@e00c0120
  [   10.174802] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000/i2c@600 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/oic@e00c0120
  [   10.190323] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/oic@e00c0120
  [   10.205098] simple-pm-bus d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0: Dropping the link to 0000:01:00.0
  [   10.214501] device: 'pci:0000:01:00.0--platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0': device_unregister
  [   10.225187] device: 'ea000000.switch': device_add
  [   10.230321] device: 'platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0--platform:ea000000.switch': device_add
  [   10.240806] devices_kset: Moving ea000000.switch to end of list
  [   10.246794] platform ea000000.switch: Linked as a consumer to d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0
  [   10.256399] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/switch@e0000000 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [   10.270803] device: 'e800413c.mdio': device_add
  [   10.275775] device: 'platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0--platform:e800413c.mdio': device_add
  [   10.286036] devices_kset: Moving e800413c.mdio to end of list
  [   10.291863] platform e800413c.mdio: Linked as a consumer to d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0
  [   10.301213] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/mdio@e200413c Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [   10.315260] mscc-miim e800413c.mdio: error -EPROBE_DEFER: Failed to get reset
  ...
  [   10.387676] device: 'd0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth3': device_add
  [   10.388124] devices_kset: Moving ea000000.switch to end of list
  [   10.402096] device: 'platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0--platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth3': device_add
  [   10.416004] devices_kset: Moving d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth3 to end of list
  [   10.425281] platform d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth3: Linked as a consumer to d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0
  [   10.437942] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth3 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [   10.451352] devices_kset: Moving e800413c.mdio to end of list
  [   10.451912] device: 'd0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth2': device_add
  [   10.458161] mscc-miim e800413c.mdio: error -EPROBE_DEFER: Failed to get reset
  [   10.466501] device: 'platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0--platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth2': device_add
  [   10.485906] devices_kset: Moving d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth2 to end of list
  [   10.495096] platform d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0:sfp-eth2: Linked as a consumer to d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0
  [   10.507855] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/sfp-eth2 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  ...
  [   10.580486] device: 'ea040000.flexcom': device_add
  [   10.585753] device: 'platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0--platform:ea040000.flexcom': device_add
  [   10.596336] devices_kset: Moving ea040000.flexcom to end of list
  [   10.602429] platform ea040000.flexcom: Linked as a consumer to d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0
  [   10.612031] /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0/flexcom@e0040000 Dropping the fwnode link to /soc/pcie@d0070000/pci@0,0/dev@0,0/pci-ep-bus@0
  [   10.626863] device: 'e8004064.pinctrl': device_add
  [   10.632045] device: 'platform:d0070000.pcie:pci@0,0:dev@0,0:pci-ep-bus@0--platform:e8004064.pinctrl': device_add
  ...
--- 8< ---


Here is the related dtso applied at the PCIe device DT node:
--- 8< ---
/ {
	fragment@0 {
		target-path="";
		__overlay__ {
			#address-cells = <3>;
			#size-cells = <2>;

			pci-ep-bus@0 {
				compatible = "simple-bus";
				#address-cells = <1>;
				#size-cells = <1>;

				/*
				 * map @0xe2000000 (32MB) to BAR0 (CPU)
				 * map @0xe0000000 (16MB) to BAR1 (AMBA)
				 */
				ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
				          0xe0000000 0x01 0x00 0x00 0x1000000>;

				oic: oic@e00c0120 {
					compatible = "microchip,lan966x-oic";
					#interrupt-cells = <2>;
					interrupt-controller;
					interrupts = <0>; /* PCI INTx assigned interrupt */
					reg = <0xe00c0120 0x190>;
				};

				cpu_clk: cpu_clk {
					compatible = "fixed-clock";
					#clock-cells = <0>;
					clock-frequency = <600000000>;  // CPU clock = 600MHz
				};

				ddr_clk: ddr_clk {
					compatible = "fixed-clock";
					#clock-cells = <0>;
					clock-frequency = <30000000>;  // Fabric clock = 30MHz
				};

				sys_clk: sys_clk {
					compatible = "fixed-clock";
					#clock-cells = <0>;
					clock-frequency = <15625000>;  // System clock = 15.625MHz
				};

				clks: clock-controller@e00c00a8 {
					compatible = "microchip,lan966x-gck";
					#clock-cells = <1>;
					clocks = <&cpu_clk>, <&ddr_clk>, <&sys_clk>;
					clock-names = "cpu", "ddr", "sys";
					reg = <0xe00c00a8 0x38>, <0xe00c02cc 0x4>;
				};

				cpu_ctrl: syscon@e00c0000 {
					compatible = "microchip,lan966x-cpu-syscon", "syscon";
					reg = <0xe00c0000 0xa8>;
				};

				reset: reset@e200400c {
					compatible = "microchip,lan966x-switch-reset";
					reg = <0xe200400c 0x4>;
					reg-names = "gcb";
					#reset-cells = <1>;
					cpu-syscon = <&cpu_ctrl>;
				};

				gpio: pinctrl@e2004064 {
					compatible = "microchip,lan966x-pinctrl";
					reg = <0xe2004064 0xb4>,
					      <0xe2010024 0x138>;
					resets = <&reset 0>;
					reset-names = "switch";
					gpio-controller;
					#gpio-cells = <2>;
					gpio-ranges = <&gpio 0 0 78>;
					interrupt-parent = <&oic>;
					interrupt-controller;
					interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
					#interrupt-cells = <2>;

					tod_pins: tod_pins {
						pins = "GPIO_36";
						function = "ptpsync_1";
					};

					fc0_a_pins: fcb4-i2c-pins {
						/* RXD, TXD */
						pins = "GPIO_9", "GPIO_10";
						function = "fc0_a";
					};

					i2cmux_pins: i2cmux-pins {
						pins = "GPIO_76", "GPIO_77";
						function = "twi_slc_gate";
						output-low;
					};

					i2cmux_0: i2cmux-0 {
						pins = "GPIO_76";
						function = "twi_slc_gate";
						output-high;
					};

					i2cmux_1: i2cmux-1 {
						pins = "GPIO_77";
						function = "twi_slc_gate";
						output-high;
					};
				};

				flx0: flexcom@e0040000 {
					compatible = "atmel,sama5d2-flexcom";
					reg = <0xe0040000 0x100>;
					clocks = <&clks GCK_ID_FLEXCOM0>;
					#address-cells = <1>;
					#size-cells = <1>;
					ranges = <0x0 0xe0040000 0x800>;

					atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;

					i2c_lan966x: i2c@600 {
						compatible = "microchip,lan966x-i2c";
						reg = <0x600 0x200>;
						interrupt-parent = <&oic>;
						interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
						#address-cells = <1>;
						#size-cells = <0>;
						clocks = <&clks GCK_ID_FLEXCOM0>;
						assigned-clocks = <&clks GCK_ID_FLEXCOM0>;
						assigned-clock-rates = <20000000>;
						pinctrl-0 = <&fc0_a_pins>;
						pinctrl-names = "default";
						i2c-analog-filter;
						i2c-digital-filter;
						i2c-digital-filter-width-ns = <35>;
					};
				};

				i2c0_emux: i2c0-emux@0 {
					compatible = "i2c-mux-pinctrl";
					#address-cells = <1>;
					#size-cells = <0>;
					i2c-parent = <&i2c_lan966x>;
					pinctrl-names = "i2c102", "i2c103", "idle";
					pinctrl-0 = <&i2cmux_0>;
					pinctrl-1 = <&i2cmux_1>;
					pinctrl-2 = <&i2cmux_pins>;

					i2c102: i2c_sfp1 {
						reg = <0>;
						#address-cells = <1>;
						#size-cells = <0>;
					};

					i2c103: i2c_sfp2 {
						reg = <1>;
						#address-cells = <1>;
						#size-cells = <0>;
					};
				};

				sfp_eth2: sfp-eth2 {
					compatible       = "sff,sfp";
					i2c-bus          = <&i2c102>;
					tx-disable-gpios = <&gpio  0 GPIO_ACTIVE_HIGH>;
					los-gpios        = <&gpio 25 GPIO_ACTIVE_HIGH>;
					mod-def0-gpios   = <&gpio 18 GPIO_ACTIVE_LOW>;
					tx-fault-gpios   = <&gpio  2 GPIO_ACTIVE_HIGH>;
				};

				sfp_eth3: sfp-eth3 {
					compatible       = "sff,sfp";
					i2c-bus          = <&i2c103>;
					tx-disable-gpios = <&gpio  1 GPIO_ACTIVE_HIGH>;
					los-gpios        = <&gpio 26 GPIO_ACTIVE_HIGH>;
					mod-def0-gpios   = <&gpio 19 GPIO_ACTIVE_LOW>;
					tx-fault-gpios   = <&gpio  3 GPIO_ACTIVE_HIGH>;
				};

				serdes: serdes@e202c000 {
					compatible = "microchip,lan966x-serdes";
					reg = <0xe202c000 0x9c>,
					      <0xe2004010 0x4>;
					#phy-cells = <2>;
				};

				mdio1: mdio@e200413c {
					#address-cells = <1>;
					#size-cells = <0>;
					compatible = "microchip,lan966x-miim";
					reg = <0xe200413c 0x24>,
					      <0xe2010020 0x4>;

					resets = <&reset 0>;
					reset-names = "switch";

					lan966x_phy0: ethernet-lan966x_phy@1 {
						reg = <1>;
					};

					lan966x_phy1: ethernet-lan966x_phy@2 {
						reg = <2>;
					};
				};

				switch: switch@e0000000 {
					compatible = "microchip,lan966x-switch";
					reg = <0xe0000000 0x0100000>,
					      <0xe2000000 0x0800000>;
					reg-names = "cpu", "gcb";

					interrupt-parent = <&oic>;
					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
						     <9 IRQ_TYPE_LEVEL_HIGH>;
					interrupt-names = "xtr", "ana";

					resets = <&reset 0>;
					reset-names = "switch";

					pinctrl-names = "default";
					pinctrl-0 = <&tod_pins>;

					ethernet-ports {
						#address-cells = <1>;
						#size-cells = <0>;

						port0: port@0 {
							phy-handle = <&lan966x_phy0>;

							reg = <0>;
							phy-mode = "gmii";
							phys = <&serdes 0 CU(0)>;
						};

						port1: port@1 {
							phy-handle = <&lan966x_phy1>;

							reg = <1>;
							phy-mode = "gmii";
							phys = <&serdes 1 CU(1)>;
						};

						port2: port@2 {
							reg = <2>;
							phy-mode = "sgmii";
							phys = <&serdes 2 SERDES6G(0)>;
							sfp = <&sfp_eth2>;
							managed = "in-band-status";
						};

						port3: port@3 {
							reg = <3>;
							phy-mode = "sgmii";
							phys = <&serdes 3 SERDES6G(1)>;
							sfp = <&sfp_eth3>;
							managed = "in-band-status";
						};
					};
				};
			};
		};
	};
};
--- 8< ---

Best regards,
Hervé

