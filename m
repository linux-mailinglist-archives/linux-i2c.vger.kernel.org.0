Return-Path: <linux-i2c+bounces-7928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D679C41E8
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 16:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728481F24FC5
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 15:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAB11A265D;
	Mon, 11 Nov 2024 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq4ZRtgX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3EF1A0B13;
	Mon, 11 Nov 2024 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731339175; cv=none; b=EuuXSisuUuF4ajV5EGRBRDepiqi7K9IfZ9e3IHgjyn7D25dEf/KyUHdNzx1Fz5XRr+VKnJufw65OYoch9TOwNlue2wkNVfWcXOsXFEgmYiFJtx+vWf7X+EWRO+QY7w4s2voWXfyRT4kcblao0HZjmzA3A9Btv39/MP1gaBSodcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731339175; c=relaxed/simple;
	bh=r8avJOgeVnHmCQ1tIPDEAoD6KMM+18rldtBBgroTd4s=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=qnVehbc6vwfMX40AdhRCVYYYxP36M0eTqS1lU/rE+Fah1zikVZRnKEukhWjxAXlrCIR/z9wotjC2x2SZs2U7GIrSUkwsvkrE91QjJKmhZj9reISthXat/4uyyCxytAUyEhOdzSsnD0A0aL7nPFFfQJLsTc9qT4smd8C0eRJxiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq4ZRtgX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86B5C4CED6;
	Mon, 11 Nov 2024 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731339175;
	bh=r8avJOgeVnHmCQ1tIPDEAoD6KMM+18rldtBBgroTd4s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Dq4ZRtgXjHZZ63uC5JzTAgqwfrl+cT85RYM80IhD1SuvaTaZaAeWymI4w9P6DAtyb
	 TK1RZx6nYV1FxYpZ2aCtjgxxUCP/FbEZXXYrDW+kY48Ze7jqHHx9MnFr6+Vo9D/DYT
	 xC8VqlmWRzcf330Zg8HtIFjZHdSJEa8lDToAg/uItkY36sJhJmX+HMKE8twd/OQCpP
	 HqFCFnUYebC4+kGGiTc6mdU0mSguLM5NBK1yRokiZLRHEDxX+g4zLO+PUnJnObDVND
	 1XeHxRM2JIENzbyjH6qgry5qx3hmAOZntzliUZw957ALIbxfB776IHt7LZEiIiSJps
	 yk14S8C0s4gCw==
Date: Mon, 11 Nov 2024 09:32:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org, 
 linux-mmc@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-watchdog@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 linux-usb@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
Message-Id: <173133346581.1281779.16221268010355943435.robh@kernel.org>
Subject: Re: [PATCH 00/14] arm64: dts: allwinner: Add basic Allwinner A523
 support


On Mon, 11 Nov 2024 01:30:19 +0000, Andre Przywara wrote:
> Hi,
> 
> this series adds basic DT support for the Allwinner A523 SoC, plus the
> Avaota-A1 router board using the T527 package variant of that SoC.[1]
> Functionality-wise it relies on the pinctrl[2] and clock[3] support
> series, though there is no direct code dependency series to this series
> (apart from the respective binding patches in the two series').
> 
> Most of the patches add DT binding documentation for the most basic
> peripherals, the vast majority of them actually being already supported,
> courtesy of identical IP being used. This includes MMC and USB 2.0, so
> with the above mentioned clock and pinctrl support this gives an already
> somewhat usable mainline support for this new SoC family.
> The watchdog is not completely compatible, but is an easy addition, so
> this bit is included in here as well.
> 
> The A523 features 8 Arm Cortex-A55 cores, organised in two clusters,
> clocked separately, with different OPP limits, in some kind of
> little/LITTLE configuration. The GPU is a Arm Mali G57 MC01, and the chip
> also features a single PCIe 2.1 lane, sharing a PHY with some USB 3.1
> controller - which means only one of the two can be used.
> The rest of the SoC is the usual soup of multimedia SoC IP, with eDP
> support and two Gigabit Ethernet MACs among the highlights.
> 
> The main feature is patch 11/14, which adds the SoC .dtsi. This for now
> is limited to the parts that are supported and could be tested. At the
> moment there is no PSCI firmware, even the TF-A port from the BSP does
> not seem to work for me. That's why the secondary cores have been omitted
> for now, among other instances of some IP that I couldn't test yet.
> I plan to add them in one of the next revisions.
> 
> The last patch adds basic support for the Avaota-A1 router board,
> designed by YuzukiHD, with some boards now built by Pine64.
> 
> The mainline firmware side in general is somewhat lacking still: I have
> basic U-Boot support working (including MMC and USB), although still
> without DRAM support. This is for now covered by some binary blob found
> in the (otherwise Open Source) Syterkit firmware, which also provides
> the BSP versions of TF-A and the required (RISC-V) management core
> firmware. Fortunately we have indications that DRAM support is not that
> tricky, as the IP blocks are very similar to already supported, and dev
> boards are on their way to the right people.
> 
> Meanwhile I would like people to have a look at those DT bits here. Please
> compare them to the available user manual, and test them if you have access
> to hardware.
> 
> Based on v6.12-rc1.
> I pushed a branch with all the three series combined here:
> https://github.com/apritzel/linux/commits/a523-v1/
> 
> Cheers,
> Andre
> 
> [1] https://linux-sunxi.org/A523#Family_of_sun55iw3
> [2] https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/#t
> [3] https://lore.kernel.org/linux-sunxi/20241111004722.10130-1-andre.przywara@arm.com/T/#t
> 
> Andre Przywara (14):
>   dt-bindings: mmc: sunxi: Simplify compatible string listing
>   dt-bindings: mmc: sunxi: add compatible strings for Allwinner A523
>   dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
>   watchdog: sunxi_wdt: Add support for Allwinner A523
>   dt-bindings: i2c: mv64xxx: Add Allwinner A523 compatible string
>   dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI
>     controller
>   dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
>   dt-bindings: usb: sunxi-musb: add Allwinner A523 compatible string
>   dt-bindings: usb: add A523 compatible string for EHCI and OCHI
>   dt-bindings: rtc: sun6i: Add Allwinner A523 support
>   arm64: dts: allwinner: Add Allwinner A523 .dtsi file
>   dt-bindings: vendor-prefixes: Add YuzukiHD name
>   dt-bindings: arm: sunxi: Add Avaota A1 board
>   arm64: dts: allwinner: a523: add Avaota-A1 router support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
>  .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
>  .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  40 +-
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  10 +-
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   4 +-
>  .../usb/allwinner,sun4i-a10-musb.yaml         |   1 +
>  .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
>  .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 386 ++++++++++++++++++
>  .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 311 ++++++++++++++
>  drivers/watchdog/sunxi_wdt.c                  |  11 +
>  15 files changed, 751 insertions(+), 26 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> 
> --
> 2.46.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y allwinner/sun55i-t527-avaota-a1.dtb' for 20241111013033.22793-1-andre.przywara@arm.com:

In file included from arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts:6:
arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:6:10: fatal error: dt-bindings/clock/sun55i-a523-ccu.h: No such file or directory
    6 | #include <dt-bindings/clock/sun55i-a523-ccu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:129: arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb] Error 1
make[2]: *** [scripts/Makefile.build:478: arch/arm64/boot/dts/allwinner] Error 2
make[2]: Target 'arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1399: allwinner/sun55i-t527-avaota-a1.dtb] Error 2
make: *** [Makefile:224: __sub-make] Error 2
make: Target 'allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.






