Return-Path: <linux-i2c+bounces-14393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A7CA2A7A
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 08:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99DB8300A576
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 07:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87C530E0FA;
	Thu,  4 Dec 2025 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PtQg8yrU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFB29346F;
	Thu,  4 Dec 2025 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764833948; cv=none; b=XO5dE/z6HhNgzXxs20faUqqiI5/2q2x22B9NYuHLLqqsDWvfEk4F4EdO9MaaStOkGHnV9EED1c2UBCpJPRMg4U0Fdkm1+RlCmshU68dzjNjrQM3ELxBWLDM/zd04pcqxklsYOEdcu5xkeh/mtfaI6NIhP0EnBOtKfVW6/77JcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764833948; c=relaxed/simple;
	bh=ZBbFP2u19PYaompzZPpRS3munLLvOSa0dafo71gqR4A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jz6b72SMf5E7xXR7cu3EIUkv/kYYMspkKplYndV8yG2/YzmSE6JLh6Hr97T4byf/J1PE3BH67uv1SEEcRCon/tkDGGWvs8vD6WAYZ0LomcBZq5VWYcErfaxMxWgwYJQ1mQsrfA8Hl4toADXHOLwfX0h1SZe36WLjubU7MLstiAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PtQg8yrU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3DC0DC1785A;
	Thu,  4 Dec 2025 07:38:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 830D060731;
	Thu,  4 Dec 2025 07:39:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9D2611921EB0;
	Thu,  4 Dec 2025 08:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764833941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k7CE06tyTx4yxeiWtpPuf1dnd1n3hRXeTtqv9aVcNzw=;
	b=PtQg8yrUoGAKG/Uii8S7XQtskQAWYlZadXyZzx8jkUIfm66LC9Z6ad4cKNE4THRD7VoZSf
	VpOBLrkjXDpI5hwZCvijtYB2Vy5ZG58J80S2F53J9dwWk7dpTNG30pcf/51U93DGiwEgRT
	fQpgrXdq5ncqdGM17SDz8p09cF/kH78uKk1HPXF2geoo/Iq2hdicWw0z1OcT8qIlGWX4io
	9e/70u+5e6wZE/l9cV4otQ1JJW0py/fWZuwlCOsKVDmZydp44Fq5GitqLtJS5kFRhZ2OUd
	f1Zx5ECtIQ4aGzbOVCxCdOdmcvN4wJ599iZIa+qSHKGSWZgKnUBDj/ecIp/4rQ==
Date: Thu, 4 Dec 2025 08:38:39 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org
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
Message-ID: <20251204083839.4fb8a4b1@bootlin.com>
In-Reply-To: <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
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

Hi Kalle,

On Wed, 3 Dec 2025 12:11:45 +0200
Kalle Niemi <kaleposti@gmail.com> wrote:

...
> 
> I tried this patch on next-20251127 by manually adding the added lines 
> to /drivers/of/overlay.c, and it did not solve the issue. I will 
> continue to test this.
> 

Did you observe same traces reported by Geert?

To move forward, I think I will need help.

Indeed, Kalle, Geert, I don't have your hardware, your related overlay or
a similar one that could be used for test and also I don't have your out of
tree code used to handle this overlay.

I know overlays and fw_devlink have issues. Links created by fw_devlink
when an overlay is applied were not correct on my side.

Can you check your <supplier>--<consumer> links with 'ls /sys/class/devlinks'

On my side, without my patches some links were not correct.
They linked to the parent of the supplier instead of the supplier itself.
The consequence is a kernel crash, use after free, refcounting failure, ...
when the supplier device is removed.

Indeed, with wrong links consumers were not removed before suppliers they
used.

Looking at Geert traces:
--- 8< ---
rcar_sound ec500000.sound: Failed to create device link (0x180) with
supplier soc for /soc/sound@ec500000/rcar_sound,src/src-0
rcar_sound ec500000.sound: Failed to create device link (0x180) with
supplier soc for /soc/sound@ec500000/rcar_sound,src/src-1
[...]
--- 8< ---

Even if it is not correct, why the soc device cannot be a provider?
I don't have the answer to this question yet.

Without having the exact tree structure of the base device-tree, the overlay
and the way it is applied, and so without been able to reproduce the issue
on my side, investigating the issue is going to be difficult.

I hope to find some help to move forward and fix the issue.

Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect.
Got emails delivery failure with this email address.

Best regards,
Hervé

