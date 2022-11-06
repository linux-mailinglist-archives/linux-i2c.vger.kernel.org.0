Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B22F61E0CD
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Nov 2022 09:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiKFIJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Nov 2022 03:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiKFIJV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Nov 2022 03:09:21 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFC3EE2A;
        Sun,  6 Nov 2022 01:09:20 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bj12so22867170ejb.13;
        Sun, 06 Nov 2022 01:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pdd8CAL88lzkh5Qvct0XVSbDsIQmPY/9Ujmmsx7WLw=;
        b=jJ2vI+D6GzRUbKO1+A9EdmeWmj+VTvXG0zWtj5oMtDZjAuHDmet2IUdwRY49GduZhn
         wgfMg6TOOIdKEnVgv95roCXPG/JVkKvGBIoaogqJhQ+jyatDOCeqJEGifuiOmWY8wdNS
         xu4HP1Ze42PRAV3ZOJv10o4l3VWBBeygTzVnLfqRW3gOkZN0SLf4QE6ggjCCvmVSPehH
         B5h5CJyP6KRbCuy9a6piRwMl+4iH315V1v3vTHaVLbpH7yYysSnGRhxltxdDjAsYKeyj
         9Y2uCmn5kcs3N8us3DjmDrHw0eEEJV2leb3X69VobygyEqm2oXLwjDtxjW+zwa28wBZG
         nCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pdd8CAL88lzkh5Qvct0XVSbDsIQmPY/9Ujmmsx7WLw=;
        b=bUb2ZeoBuaScJcisLMWt89z9zSwuTOBMcaYdjfPeY4SyhXpBNn+jCG0ldgC4wz926E
         cjiFwmJ5/FI40eTw0geVCigjvsppamPh6O/fcqkALkjY/L0zMZN9s/PpcyvQ6lTJRghz
         U9vIBWItNHHoFU4Vxzv32BVWcwPxOr4PLWXjpCkeZ/BO2zAbT6iTbuvORu74rwUG1fOy
         ODwkYoPb+DBk/qaIkogBl25FzfK95e5v9zv/2rgBFpL8brYCw9cHb0rt9FGyPAlCVRz3
         YGTxiqhs2VBubItSUU+1W0yAT42FZS64mhZaSVN1nxMr+kEZzz5XfWepdhbzxiahEkSm
         aPyA==
X-Gm-Message-State: ACrzQf2HokKCTphzYBFndNkZcYj1j7DdT0tUF69rMZxjkSmV6d1AEKWr
        ecMjH88qmGNLwwTzUj8wMUI=
X-Google-Smtp-Source: AMsMyM4aMMJKBTGnjmQIfN3CXpAz5TIsD3tKoMlu9whaRzwl2Mca2l/tdFrbf27c9RaTRmxAXMka/A==
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id qb21-20020a1709077e9500b0078de9cf82c7mr43818369ejc.724.1667722158677;
        Sun, 06 Nov 2022 01:09:18 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id gv57-20020a1709072bf900b007acd04fcedcsm1835308ejc.46.2022.11.06.01.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:09:18 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/9] ARM: dts: suniv: f1c100s: add I2C DT nodes
Date:   Sun, 06 Nov 2022 09:09:17 +0100
Message-ID: <4223066.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20221101141658.3631342-5-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com> <20221101141658.3631342-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dne torek, 01. november 2022 ob 15:16:53 CET je Andre Przywara napisal(a):
> The Allwinner F1C100s series of SoCs contain three I2C controllers
> compatible to the ones used in other Allwinner SoCs.
> 
> Add the DT nodes describing the resources of the controllers.
> I2C1 has only one possible pinmux, so add the pinctrl properties for
> that already.
> At least one board connects an on-board I2C chip to PD0/PD12 (I2C0), so
> include those pins already, to simplify referencing them later.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 50 ++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> b/arch/arm/boot/dts/suniv-f1c100s.dtsi index d5a6324e76465..2901c586971b4
> 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -166,6 +166,18 @@ mmc0_pins: mmc0-pins {
>  				drive-strength = <30>;
>  			};
> 
> +			/omit-if-no-ref/
> +			i2c0_pd_pins: i2c0-pd-pins {
> +				pins = "PD0", "PD12";
> +				function = "i2c0";
> +			};
> +
> +			/omit-if-no-ref/

Above flag is meaningless if i2c1_pins is always referenced by i2c1. Anyway, I 
see in pinctrl driver that there are actually two possible pin assignments for 
i2c1. One on port D and another on port B.

Best regards,
Jernej

> +			i2c1_pins: i2c1-pins {
> +				pins = "PD5", "PD6";
> +				function = "i2c1";
> +			};
> +
>  			spi0_pc_pins: spi0-pc-pins {
>  				pins = "PC0", "PC1", "PC2", 
"PC3";
>  				function = "spi0";
> @@ -177,6 +189,44 @@ uart0_pe_pins: uart0-pe-pins {
>  			};
>  		};
> 
> +		i2c0: i2c@1c27000 {
> +			compatible = "allwinner,suniv-f1c100s-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c27000 0x400>;
> +			interrupts = <7>;
> +			clocks = <&ccu CLK_BUS_I2C0>;
> +			resets = <&ccu RST_BUS_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@1c27400 {
> +			compatible = "allwinner,suniv-f1c100s-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c27400 0x400>;
> +			interrupts = <8>;
> +			clocks = <&ccu CLK_BUS_I2C1>;
> +			resets = <&ccu RST_BUS_I2C1>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c1_pins>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@1c27800 {
> +			compatible = "allwinner,suniv-f1c100s-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c27800 0x400>;
> +			interrupts = <9>;
> +			clocks = <&ccu CLK_BUS_I2C2>;
> +			resets = <&ccu RST_BUS_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		timer@1c20c00 {
>  			compatible = "allwinner,suniv-f1c100s-
timer";
>  			reg = <0x01c20c00 0x90>;




