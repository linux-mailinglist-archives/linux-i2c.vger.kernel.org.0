Return-Path: <linux-i2c+bounces-14506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 401ACCB5DC7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 13:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ACF33061E91
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 12:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1FD31329B;
	Thu, 11 Dec 2025 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IjInWeKl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F061313278;
	Thu, 11 Dec 2025 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765455670; cv=none; b=d7CZalEgFlqpXzzAJ4DnlhpIdjMxFoKtecioHxjY2F4Pi6g5weOUuFBtrn+Q0RI/XEBuiFrsxueZY/zK4h3HDQeYY19PiIjfS39Bm9qUqya+oIGF+Llq42ENUug1fm+8NqoIC5Y684yk6sSCKgOJ0023OmvPApJbfzBFAS6zDE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765455670; c=relaxed/simple;
	bh=/vgpPVra5oX60x9VjkwZBWSoe+NZGWdku0olx5e7T7w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZmqaxaHTF5STog+yxIDEiQ+8rzfd9nMW9aa+qTFVyeaGJXhhtCfyX39kWFbIxP2/ikcahdwNQ82kdTnCwzf5sIpPPWRB/qdpjQPAP56NOTX0bXmAyX0mgR1FnmT+nZqOC5A51w/n/YoasMP5YyTv0v2WUVO/wshGATg0iPye28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IjInWeKl; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10415C1934A;
	Thu, 11 Dec 2025 12:20:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC92660738;
	Thu, 11 Dec 2025 12:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0008B103C8C7B;
	Thu, 11 Dec 2025 13:20:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765455663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y60RLBstvqr0/tZgH22eIXq0hipLzZ65ZyEuPfHKBSU=;
	b=IjInWeKlYOFPOumcxa8beepe8z3enCkm9QJK7R7eqYYjwSwLdRD40bWQDLG8p48lOccH44
	9YU/TzCVlvVpLBH+VisZeK+QOHu4XWz8XDCzY9/UldUTvpBnpLQrY6MsRgZTW0DUcUTBe4
	hibWIU0HY6qCZJdJqbZJP4zCLvsjmBPv4RMN/0DSBbBZnIkJWur8sOjI5FpOp2WjXFssDo
	n6FNS6Cg4jv8sDVHEVqN/NeB1i/T29a9TQ+V4fVEVUsILjTkiBTIkC0m/ee7SA5YBVSF2y
	zhhNHhmGfVvaoZgGD3mkjX0rl8yUEpSeXJno276hVApN2fvcwOEqe/6Na5xCoQ==
Date: Thu, 11 Dec 2025 13:20:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Kalle Niemi
 <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas
 <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Linus Walleij <linus.walleij@linaro.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, Alison
 Schofield <alison.schofield@intel.com>, Vishal Verma
 <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
 <dan.j.williams@intel.com>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <20251211132044.10f5b1ea@bootlin.com>
In-Reply-To: <c50c40cc-69f6-436c-a94e-94a3a10f6727@gmail.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
	<20251015071420.1173068-2-herve.codina@bootlin.com>
	<f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
	<CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
	<5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
	<CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
	<072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
	<CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
	<55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
	<20251202102619.5cd971cc@bootlin.com>
	<088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
	<20251202175836.747593c0@bootlin.com>
	<dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
	<20251204083839.4fb8a4b1@bootlin.com>
	<CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
	<20251210132140.32dbc3d7@bootlin.com>
	<c50c40cc-69f6-436c-a94e-94a3a10f6727@gmail.com>
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

Hi Matti,

On Thu, 11 Dec 2025 10:34:46 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> Hi Dee Ho peeps,
> 
> I tried to create a minimal piece of code/dts to demonstrate the issue 
> seem in the ROHM automated testing.
> 
> On 10/12/2025 14:21, Herve Codina wrote:
> > Hi Geert, Kalle, Rob,
> > 
> > On Thu, 4 Dec 2025 11:49:13 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> 
> //snip
> 
> > When a new node is added, a new device is created. Indeed, because the
> > driver is an MFD driver, it is a bus driver and handled by of_platform bus.  
> 
> We do also have an MFD device - but it is not a platform device but an 
> I2C device - thus it should be probed by the I2C bus (if I'm not 
> mistaken). So, I guess this is not bus-specific problem.
> https://elixir.bootlin.com/linux/v6.18/source/drivers/mfd/rohm-bd718x7.c#L206
> 
> 
> > My new node is considered by devlink as a node that will have a device ready
> > to work (driver attached and device probed). A link is created between this
> > node and the consumers of this node (i.e. the SPI controller). devlink is
> > waiting for this provider to be ready before allowing the its consumer to probe.
> > This node (simple pinmux description) will never lead to a device and devlink
> > will never see this "provider" ready.  
> 
> I believe Kalle did see the same "probe-not-called" -problem, even when 
> disabling the fw_devlink from the kernel commandline. (It's worth 
> mentioning that I am not sure if Kalle tried if probe was called with 
> "previously working" kernels when fw_devlink is disabled).
> 
> > Did a test with a Renesas RZ/N1D (r9a06g032) based board and built a similar
> > overlay involving I2C controller pinmux, I2C controller and an EEPROM.
> > 
> > Here, also the overlay didn't work but the issue is different.
> > 
> > The pinmux definition for pinctrl (i.e. pinctrl subnodes) are looked when
> > the pinctrl driver probes. Adding a new node later is not handled by the
> > pinctrl driver.
> > Applying the overlay leads to a simple:
> >    [   16.934168] rzn1-pinctrl 40067000.pinctrl: unable to find group for node /soc/pinctrl@40067000/pins_i2c2
> > 
> > Indeed, the 'pins_i2c2' has been added by the overlay and was not present
> > when the pinctrl probed.
> > 
> > Tried without adding a new pinmux node (pinctrl subnode) from the overlay
> > and used nodes already existing in the base DT.
> > 
> > On my Marvell Armada 3720 board, it works with or without my patches.
> > No regression detected due to my patches.
> > 
> > On my RZ/N1D board, it works also with or without my patches.
> > Here also, no regression detected.
> > 
> > Also, on my Marvell Armada 3720 board, I can plug my LAN966x PCI board.
> > The LAN966x PCI driver used an overlay to describe the LAN966x PCI board.
> > 
> > With the upstream patch not reverted, i.e. 1a50d9403fb9 ("treewide: Fix
> > probing of devices in DT overlays")" applied, devlinks created for the
> > LAN966x PCI board internal devices are incorrect and lead to crashes when
> > the LAN966x PCI driver is removed due to wrong provider/consumer dependencies.
> > 
> > When this patch is reverted and replaced by "of: dynamic: Fix overlayed
> > devices not probing because of fw_devlink", devlinks created for the LAN966x
> > PCI board internal devices are corrects and crashes are no more present on
> > removal.
> > 
> > Kalle, Geert, can you perform a test on your hardware with my patches
> > applied and moving your pinmux definition from the overlay to the base
> > device-tree?  
> 
> I got a bit lost regarding which patches to test :)

The next-20251127 tag has every patches needed for the test.
Tests you did with this kernel are perfectly valid. Many Thanks for that!

> 
> > The kernel you can use is for instance the kernel at the next-20251127 tag.
> > Needed patches for test are present in this kernel:
> >      - 76841259ac092 ("of: dynamic: Fix overlayed devices not probing because of fw_devlink")
> >      - 7d67ddc5f0148 ("Revert "treewide: Fix probing of devices in DT overlays"")
> >   
> 
> I did a minimal overlay test which can be ran on beaglebone black. I 
> assume the same can be done on any board where you have 
> (i2c/spi/xxx)-controller node with status="disabled". Doing this on BBB 
> requires recompiling the beaglebone black (base)device-tree with -@ 
> though, so that the overlay target nodes are found. I'll attach the 
> files for interested.
> 
> overlay-test.c:
> Is a 'device-driver' for device added in overlay. (simply a probe() with 
> print, extracted from the bd71847 driver).
> 
> overlay-test.dts:
> Is a minimal device-tree overlay describing the 'test device' matching 
> above overlay-test driver. When this is overlaid using next-20251121 
> (contains the 7d67ddc5f0148b3a03594a45bba5547e92640c89), probe in 
> overlay-test.c is not called. When 
> 7d67ddc5f0148b3a03594a45bba5547e92640c89 is reverted, the probe is called.
> 
> mva_overlay.c:
> Is simplified 'glue-code' for adding an overlay to running kernel by 
> feeding the compiled overlay to the bin_attribute - for example using:
> 
> dd if=/overlay-test.dtbo of=/sys/kernel/mva_overlay/overlay_add bs=4M
> 
> am335x-boneblack.dtb.dts.tmp and tps65217.dtsi:
> are (intermediate) beaglebone-black device-trees which can be recompiled 
> to a 'base device-tree' using:
> 
> dtc -O dtb -o am335x-boneblack.dtb -b 0 -@ am335x-boneblack.dtb.dts.tmp
>   - but I suggest you to use the dts from your kernel build. I provided 
> this just for the sake of the completeness.
> 
> Makefile:
> Off-tree build targets to build the above DTSes and modules. Requires 
> KERNEL_DIR and CC to be correctly set.
> 
> 
> My findings:
> The pinctrl node indeed plays a role. When the "pinctrl-0 = 
> <&i2c1_pins>;" (and fragment0) was removed from the dts, the 
> 'overlay-test' was probed with the "next-20251121".
> 
> With the pinctrl node, I see:
> [  104.098958] probe of 4802a000.i2c returned -517 (EPROBE_DEFER I 
> suppose) after 50 usecs
> - and the 'overlay-test' probe is not called.

Do you see the same trace with:
- "pinctrl-0 = <&i2c1_pins>;" in your overlay
- fragment0 removed from the overlay (i2c1_pins definition removed from
  the overlay.
- i2c1_pins node defined in your base DT.

In other word, is the issues related to adding a pinctrl sub-node (pinctrl
pins definition) in the overlay or is it something else?

Best regards,
Hervé




