Return-Path: <linux-i2c+bounces-7929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E941D9C443E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 18:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8C46B2C7B0
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 17:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5CF1AA7A9;
	Mon, 11 Nov 2024 17:42:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F0114D283;
	Mon, 11 Nov 2024 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346957; cv=none; b=e5djbGSQIuM9CKU37D7Gfmo2fk8TPWqBvht6XnwL0eqHAl3F67LVeQePfaaM7DqjN5dMHHZ2vMkOofW175Fj+N2BXfFn9ABqSjk8E931j98xTJHBzudsVBuySxdUFCT+Xk7C/JoSeg7W4MLp28SmKKYtV5MQEyMVndDCKCC5klI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346957; c=relaxed/simple;
	bh=cmj7w/AC35+7igYwRW+VE0YRdC0RtuUs2QaBfiFGsz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qq2ZqUo8q55LBJleSh/lh9kZU5hTGeyMAitpLv63YuKnV8iXPVFHP42GwScuYeMEtH1/RiqIDJWv6tYKJWPRw3QVggHPTJASaNH8S0InHlVq7HCgTO5zUNdfOm0YUJWTub4Wizo3KPFQxfT9GJ/QSSR1+tW8oOySgOv2roHNOls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22A6B1480;
	Mon, 11 Nov 2024 09:43:03 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC2493F59E;
	Mon, 11 Nov 2024 09:42:28 -0800 (PST)
Date: Mon, 11 Nov 2024 17:42:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, Andi Shyti
 <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-watchdog@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Conor
 Dooley <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH 00/14] arm64: dts: allwinner: Add basic Allwinner A523
 support
Message-ID: <20241111174225.7360c6e4@donnerap.manchester.arm.com>
In-Reply-To: <173133346581.1281779.16221268010355943435.robh@kernel.org>
References: <20241111013033.22793-1-andre.przywara@arm.com>
	<173133346581.1281779.16221268010355943435.robh@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Nov 2024 09:32:53 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

Hi Rob,

> On Mon, 11 Nov 2024 01:30:19 +0000, Andre Przywara wrote:
> > Hi,
> > 
> > this series adds basic DT support for the Allwinner A523 SoC, plus the
> > Avaota-A1 router board using the T527 package variant of that SoC.[1]
> > Functionality-wise it relies on the pinctrl[2] and clock[3] support
> > series, though there is no direct code dependency series to this series
> > (apart from the respective binding patches in the two series').
> > 
> > Most of the patches add DT binding documentation for the most basic
> > peripherals, the vast majority of them actually being already supported,
> > courtesy of identical IP being used. This includes MMC and USB 2.0, so
> > with the above mentioned clock and pinctrl support this gives an already
> > somewhat usable mainline support for this new SoC family.
> > The watchdog is not completely compatible, but is an easy addition, so
> > this bit is included in here as well.
> > 
> > The A523 features 8 Arm Cortex-A55 cores, organised in two clusters,
> > clocked separately, with different OPP limits, in some kind of
> > little/LITTLE configuration. The GPU is a Arm Mali G57 MC01, and the chip
> > also features a single PCIe 2.1 lane, sharing a PHY with some USB 3.1
> > controller - which means only one of the two can be used.
> > The rest of the SoC is the usual soup of multimedia SoC IP, with eDP
> > support and two Gigabit Ethernet MACs among the highlights.
> > 
> > The main feature is patch 11/14, which adds the SoC .dtsi. This for now
> > is limited to the parts that are supported and could be tested. At the
> > moment there is no PSCI firmware, even the TF-A port from the BSP does
> > not seem to work for me. That's why the secondary cores have been omitted
> > for now, among other instances of some IP that I couldn't test yet.
> > I plan to add them in one of the next revisions.
> > 
> > The last patch adds basic support for the Avaota-A1 router board,
> > designed by YuzukiHD, with some boards now built by Pine64.
> > 
> > The mainline firmware side in general is somewhat lacking still: I have
> > basic U-Boot support working (including MMC and USB), although still
> > without DRAM support. This is for now covered by some binary blob found
> > in the (otherwise Open Source) Syterkit firmware, which also provides
> > the BSP versions of TF-A and the required (RISC-V) management core
> > firmware. Fortunately we have indications that DRAM support is not that
> > tricky, as the IP blocks are very similar to already supported, and dev
> > boards are on their way to the right people.
> > 
> > Meanwhile I would like people to have a look at those DT bits here. Please
> > compare them to the available user manual, and test them if you have access
> > to hardware.
> > 
> > Based on v6.12-rc1.
> > I pushed a branch with all the three series combined here:
> > https://github.com/apritzel/linux/commits/a523-v1/
> > 
> > Cheers,
> > Andre
> > 
> > [1] https://linux-sunxi.org/A523#Family_of_sun55iw3
> > [2] https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/#t
> > [3] https://lore.kernel.org/linux-sunxi/20241111004722.10130-1-andre.przywara@arm.com/T/#t
> > 
> > Andre Przywara (14):
> >   dt-bindings: mmc: sunxi: Simplify compatible string listing
> >   dt-bindings: mmc: sunxi: add compatible strings for Allwinner A523
> >   dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
> >   watchdog: sunxi_wdt: Add support for Allwinner A523
> >   dt-bindings: i2c: mv64xxx: Add Allwinner A523 compatible string
> >   dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI
> >     controller
> >   dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
> >   dt-bindings: usb: sunxi-musb: add Allwinner A523 compatible string
> >   dt-bindings: usb: add A523 compatible string for EHCI and OCHI
> >   dt-bindings: rtc: sun6i: Add Allwinner A523 support
> >   arm64: dts: allwinner: Add Allwinner A523 .dtsi file
> >   dt-bindings: vendor-prefixes: Add YuzukiHD name
> >   dt-bindings: arm: sunxi: Add Avaota A1 board
> >   arm64: dts: allwinner: a523: add Avaota-A1 router support
> > 
> >  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
> >  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
> >  .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
> >  .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  40 +-
> >  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  10 +-
> >  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   4 +-
> >  .../usb/allwinner,sun4i-a10-musb.yaml         |   1 +
> >  .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
> >  .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 386 ++++++++++++++++++
> >  .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 311 ++++++++++++++
> >  drivers/watchdog/sunxi_wdt.c                  |  11 +
> >  15 files changed, 751 insertions(+), 26 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > 
> > --
> > 2.46.2
> > 
> > 
> >   
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y allwinner/sun55i-t527-avaota-a1.dtb' for 20241111013033.22793-1-andre.przywara@arm.com:
> 
> In file included from arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts:6:
> arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:6:10: fatal error: dt-bindings/clock/sun55i-a523-ccu.h: No such file or directory
>     6 | #include <dt-bindings/clock/sun55i-a523-ccu.h>

Argh, the headers, forgot about them! I was hoping there would only be a
complaint about the undocumented compatible strings, and I didn't want to
tie the three series together unnecessarily, to avoid a harder to handle
28-patch series.

I hope this doesn't prevent actual review by people, my github has
the combined story, in case people want to avoid the issue:
https://github.com/apritzel/linux/commits/a523-v1/

Cheers,
Andre

>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[3]: *** [scripts/Makefile.dtbs:129: arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:478: arch/arm64/boot/dts/allwinner] Error 2
> make[2]: Target 'arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1399: allwinner/sun55i-t527-avaota-a1.dtb] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> make: Target 'allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.
> 
> 
> 
> 
> 


