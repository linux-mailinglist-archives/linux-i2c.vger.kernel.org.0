Return-Path: <linux-i2c+bounces-14489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EEACB2E17
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 13:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 854D731158B2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 12:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A563B322DD6;
	Wed, 10 Dec 2025 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B2lhjLv0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81338322C9D;
	Wed, 10 Dec 2025 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765369335; cv=none; b=cDsQo7x6Q/SqG7C1ojqVe8jecBVUfduwWxYimqmScfFFOG8P7wTQ8frPfR3wPkyligo86SUAmfZbbAyVEd5wcoFYJQsOc7t0Q4IzMV2SM0/WgTydH9mkUvL1cJwTsy0XVRimcC6MVECsWQvTe9ftEAk1VuNRYDABplih/GulROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765369335; c=relaxed/simple;
	bh=jd9K+mF97WGriGBzAJzag5o6OTccybfMhIaxrYKCKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pUK7I7KRP71apS/W+JKdYWJzznbYyM9IBucSaqlSZv8ayllBajhx4lVLv8WE4C2NA/xdOk69IB4oGTGMp0YACEPC4REZ7LnPby1iC0MWOk6DJidHLYFMcCKKXMZShDsjOtiDzAK4DT9urlmjT0bhPppopqWYXIAG/r9/0qdBGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B2lhjLv0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56DB1C180F6;
	Wed, 10 Dec 2025 12:21:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E7F96072F;
	Wed, 10 Dec 2025 12:22:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12FF8119315B3;
	Wed, 10 Dec 2025 13:21:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765369320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pOlUsVypsTSlBECjYHHoMGhNKvvFlUu0wSglyApNP7w=;
	b=B2lhjLv08HCS4nwPMQdM5rtA1PxYKChropbNXfAwuDvzNvXOVjVCwFTmvmtb2ORCVRW7Qi
	k66+Mas8QHLL/Sd+Ps87vPuBDRCwI7saahl3amPRs7SDyRx2/03xb8vTHThuJw2ga28vUp
	mWJuGni+C/1JJduukHwT93M8LHqErcT1tCB506+eg0lsH1ug4WelgtBydwGEI8bQLgP21q
	xgMbfofeVReqc6sRn9VIhYltwLdn5+wRI8qcr7mp32U/cqKfXDSUrrYJn+eHIG12gJQGaT
	OtIuCTUfZrFJAHa0b3F7XsnAhwmX5iend8orwE0uMkCFCSYS7ZIq32q+F/8bOg==
Date: Wed, 10 Dec 2025 13:21:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Arnd
 Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Linus
 Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
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
Message-ID: <20251210132140.32dbc3d7@bootlin.com>
In-Reply-To: <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
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

Hi Geert, Kalle, Rob,

On Thu, 4 Dec 2025 11:49:13 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hervé,
> 
> On Thu, 4 Dec 2025 at 08:39, Herve Codina <herve.codina@bootlin.com> wrote:
> > Indeed, Kalle, Geert, I don't have your hardware, your related overlay or
> > a similar one that could be used for test and also I don't have your out of
> > tree code used to handle this overlay.
> >
> > I know overlays and fw_devlink have issues. Links created by fw_devlink
> > when an overlay is applied were not correct on my side.
> >
> > Can you check your <supplier>--<consumer> links with 'ls /sys/class/devlinks'
> >
> > On my side, without my patches some links were not correct.
> > They linked to the parent of the supplier instead of the supplier itself.
> > The consequence is a kernel crash, use after free, refcounting failure, ...
> > when the supplier device is removed.
> >
> > Indeed, with wrong links consumers were not removed before suppliers they
> > used.
> >
> > Looking at Geert traces:
> > --- 8< ---
> > rcar_sound ec500000.sound: Failed to create device link (0x180) with
> > supplier soc for /soc/sound@ec500000/rcar_sound,src/src-0
> > rcar_sound ec500000.sound: Failed to create device link (0x180) with
> > supplier soc for /soc/sound@ec500000/rcar_sound,src/src-1
> > [...]
> > --- 8< ---
> >
> > Even if it is not correct, why the soc device cannot be a provider?
> > I don't have the answer to this question yet.  
> 
> I have no idea. These failures (sound) are also not related to the
> device I am adding through the overlay (SPI EEPROM).
> Note that these failures appear only with your suggested fix, and are
> not seen with just the patch in the subject of this email thread.
> 
> > Without having the exact tree structure of the base device-tree, the overlay
> > and the way it is applied, and so without been able to reproduce the issue
> > on my side, investigating the issue is going to be difficult.
> >
> > I hope to find some help to move forward and fix the issue.  
> 
> Base DTS is [1], overlay DTS is [2].
> Applying and removing the overlay is done using OF_CONFIGFS[3],
> and "overlay [add|rm] 25lc040"[4].
> 
> I assume you can reproduce the issue on any board that has an SPI
> EEPROM, after moving the SPI bus enablement and SPI EEPROM node to an
> overlay. Probably even with an I2C EEPROM instead.  Or even without
> an actual EEPROM connected, as even the SPI bus fails to appear.
> 
> > Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect.
> > Got emails delivery failure with this email address.  
> 
> Yeah, he moved company.
> He is still alive, I met him in the LPC Training Session yesterday ;-)
> 
> Thanks!
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> [2] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu-cn41-msiof0-25lc040.dtso?h=topic/renesas-overlays-v6.17-rc1
> [3] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/overlays-v6.17-rc1
> [4] https://elinux.org/R-Car/DT-Overlays#Helper_Script
> [5] https://lore.kernel.org/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> 

I did some tests with boards I have.

First I used a Marvel board based on an Armada 3720.

In my overlay, I added the pinmux related to the SPI controller, enabled
this SPI controller and added a SPI flash.

It didn't work with or without culprit patches from my series applied.
Indeed, the pinctrl driver used is an MFD driver an mixed pinmux definition
nodes with device description (a clock) node.

When a new node is added, a new device is created. Indeed, because the
driver is an MFD driver, it is a bus driver and handled by of_platform bus.

My new node is considered by devlink as a node that will have a device ready
to work (driver attached and device probed). A link is created between this
node and the consumers of this node (i.e. the SPI controller). devlink is
waiting for this provider to be ready before allowing the its consumer to probe.
This node (simple pinmux description) will never lead to a device and devlink
will never see this "provider" ready.

Did a test with a Renesas RZ/N1D (r9a06g032) based board and built a similar
overlay involving I2C controller pinmux, I2C controller and an EEPROM.

Here, also the overlay didn't work but the issue is different.

The pinmux definition for pinctrl (i.e. pinctrl subnodes) are looked when
the pinctrl driver probes. Adding a new node later is not handled by the
pinctrl driver.
Applying the overlay leads to a simple:
  [   16.934168] rzn1-pinctrl 40067000.pinctrl: unable to find group for node /soc/pinctrl@40067000/pins_i2c2

Indeed, the 'pins_i2c2' has been added by the overlay and was not present
when the pinctrl probed.

Tried without adding a new pinmux node (pinctrl subnode) from the overlay
and used nodes already existing in the base DT.

On my Marvell Armada 3720 board, it works with or without my patches.
No regression detected due to my patches.

On my RZ/N1D board, it works also with or without my patches.
Here also, no regression detected.

Also, on my Marvell Armada 3720 board, I can plug my LAN966x PCI board.
The LAN966x PCI driver used an overlay to describe the LAN966x PCI board.

With the upstream patch not reverted, i.e. 1a50d9403fb9 ("treewide: Fix
probing of devices in DT overlays")" applied, devlinks created for the
LAN966x PCI board internal devices are incorrect and lead to crashes when
the LAN966x PCI driver is removed due to wrong provider/consumer dependencies.

When this patch is reverted and replaced by "of: dynamic: Fix overlayed
devices not probing because of fw_devlink", devlinks created for the LAN966x
PCI board internal devices are corrects and crashes are no more present on
removal.

Kalle, Geert, can you perform a test on your hardware with my patches
applied and moving your pinmux definition from the overlay to the base
device-tree?

The kernel you can use is for instance the kernel at the next-20251127 tag.
Needed patches for test are present in this kernel:
    - 76841259ac092 ("of: dynamic: Fix overlayed devices not probing because of fw_devlink")
    - 7d67ddc5f0148 ("Revert "treewide: Fix probing of devices in DT overlays"")

Best regards,
Hervé

