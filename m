Return-Path: <linux-i2c+bounces-14375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ECEC9C644
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 18:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34161346703
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 17:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6582B2C0F92;
	Tue,  2 Dec 2025 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JXgL/7g8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977152C0F70;
	Tue,  2 Dec 2025 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764696545; cv=none; b=SExadeegH8rLvc25FQSDxsWAQx5VkJAAASFWcPRjx15yTImbuj5lFT6rAMNpDFZq0/n1nJI7Oy10RHHjGRaMwv+ZPkLVGROmbwmULxFbHkWhdaXIgRFfEueVZgrPKC54suKhyLWjwHtOV94WFADlhCWrug8bnBEqN9JUSVmBNW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764696545; c=relaxed/simple;
	bh=0CWgiXQjHQ+aAB2ksEpI1/F3O3ikreeGDOLzHq6IPXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LUFdpOPgQoalc1FN02wcRcxkhJEzj2T0CVhRsrC/b1ARQi05DUWZ6YIgK7U6cPTv/uPEa8y0xTKTkYqVZIfGZy0k5mwW3i5tItCZzQPDfIKp3GulhxjmIC9q3ympAWGZ+LjGkcF0v+27UZUSeb4mez52U78lmngrqKsCfkI+acc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JXgL/7g8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D227A1A1EDC;
	Tue,  2 Dec 2025 17:29:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EB6160706;
	Tue,  2 Dec 2025 17:29:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9122811919DC9;
	Tue,  2 Dec 2025 18:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764696536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4BQ1XtM/oSaifBg16TjvVJ4//gt59MDXZf9Ix2wTO1g=;
	b=JXgL/7g8k9S4vyskm8xyx1v29w1Me/J6AytYr7l55uyR3/5yDOXjtNyXEpR4wnxzYATmyM
	vHSSeoX3hQa4vzJXXb6fc5ZendC+ixZc9ZsDBq5nvDbybqEuvHLSPd6L1sl+qyeFU7MMzF
	Pakz/1p9eIVtQHV4cEBWcCm34HvitG+eThoA2ZyRWEjJuwS9JIrY+uH0GWqHJhx7YDau78
	0rJqXrBVIAcZoW1khXUNBI6hJAnO3V31IUdVOOPz3tTjjTANzVp+WhhiUK2qKCKK6iRk1y
	Qi0+GI7U02463lZtkJONer2Ox9Cl+afa+OUmpY8ymeUYGSefeooQJPNbGx16sg==
Date: Tue, 2 Dec 2025 18:28:34 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Charles
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
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <20251202182834.65d7f0a1@bootlin.com>
In-Reply-To: <CAMuHMdXogrkTAm=4pC0B+Sybr=PR3XovnBgmiEyTvUMmJHvBRA@mail.gmail.com>
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
	<CAMuHMdXogrkTAm=4pC0B+Sybr=PR3XovnBgmiEyTvUMmJHvBRA@mail.gmail.com>
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

Hi Geert,

On Tue, 2 Dec 2025 17:35:35 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hervé,
> 
> On Tue, 2 Dec 2025 at 10:26, Herve Codina <herve.codina@bootlin.com> wrote:
> > On Fri, 28 Nov 2025 10:34:57 +0200
> > Kalle Niemi <kaleposti@gmail.com> wrote:  
> > > >>>>>> Test system testing drivers for ROHM ICs bisected this commit to cause
> > > >>>>>> BD71847 drivers probe to not be called.  
> > > >>>>> This driver (and overlay support) is in linux-next or something out of
> > > >>>>> tree on top of linux-next?
> > > >>>>>
> > > >>>>> Rob  
> > > >>>> Yes the driver is in mainline linux: /drivers/mfd/rohm-bd718x7.c  
> > > >>> I don't see any support to apply overlays in that driver.  
> > > >> Ah. Sorry for the confusion peeps. I asked Kalle to report this without
> > > >> proper consideration. 100% my bad.
> > > >>
> > > >> While the bd718x7 drive indeed is mainline (and tested), the actual
> > > >> 'glue-code' doing the overlay is part of the downstream test
> > > >> infrastructure. So yes, this is not a bug in upstream kernel - this
> > > >> falls in the category of an upstream change causing downstream things to
> > > >> break. So, feel free to say: "Go fix your code" :)
> > > >>
> > > >> Now that this is sorted, if someone is still interested in helping us to
> > > >> get our upstream drivers tested - the downstream piece is just taking
> > > >> the compiled device-tree overlay at runtime (via bin-attribute file),
> > > >> and applying it using the of_overlay_fdt_apply(). The approach is
> > > >> working for our testing purposes when the device is added to I2C/SPI
> > > >> node which is already enabled. However, in case where we have the I2C
> > > >> disabled, and enable it in the same overlay where we add the new device
> > > >> - then the new device does not get probed.
> > > >>
> > > >> I would be really grateful if someone had a pointer for us.  
> > > > Seems to be fw_devlink related. I suppose if you turn it off it works?
> > > > There's info about the dependencies in sysfs or maybe debugfs. I don't
> > > > remember the details, but that should help to tell you why things
> > > > aren't probing.  
> >
> > Rob reverted patches but I plan to continue my work on it.
> > On my side, I need the reverted patches but I fully understand that, on
> > your side, you need a working system.
> >
> > In order to move forward and find a solution for my next iteration, can you
> > send your overlay (dtso) used in your working and non working cases?  
> 
> Hmm, I must have missed when Rob applied (part of) this series, as I
> do an overlay test (using the out-of-tree configfs) on top of every
> (bi-weekly) renesas-drivers release, and saw no issues during the last
> few months.
> 
> So I applied this series and tested loading my SPI EEPROM overlay.
> And it indeed breaks, with the culprit being this particular patch.
> 
> Interestingly, quoting from this patch:
> 
>    "While the commit fixed fw_devlink overlay handling for one case, it
>     broke it for another case. So revert it and redo the fix in a separate
>     patch."
> 
> Where is the separate patch that redid the fix? I assume it is "[PATCH
> v4 03/29] of: dynamic: Fix overlayed devices not probing because
> of fw_devlink"?  Unfortunately that doesn't fix the issue for me.
> 
> Quoting more from this patch:
> 
>    "Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/"
> 
> Strange that it claims to fix the issue reported there, as the failure
> mode I am seeing is exactly the same as documented in that report?
> 
> Do you know what is wrong? The overlay I am using is referenced in
> the bug report linked above.

The first patch "Fix probing of devices in DT overlays" didn't fix all cases
and so Saravana reverted this patch and proposed "of: dynamic: Fix overlayed
devices not probing because of fw_devlink".

This second patch was needed to fix my use case even if more modification were
needed to have my use case fully fixed (other patches in my series).

Rob applied those first patches from my series and some systems were broken.
The breakage has been reported my Kalle and Matti and led to a revert of culprit
patches.

I tried to understand what was wrong. I am pretty convinced that modification
done in "of: dynamic: Fix overlayed devices not probing because of fw_devlink"
are really better than modification available in "treewide: Fix probing of
devices in DT overlays".

I proposed an update [0] and I will be glad if you can also test this update 
on your side and give me your feedback.

[0] https://lore.kernel.org/lkml/20251202175836.747593c0@bootlin.com/

Best regards,
Hervé

