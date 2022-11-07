Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD8361FCAC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 19:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbiKGSEs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 13:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbiKGSEc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 13:04:32 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5734E2937C;
        Mon,  7 Nov 2022 10:00:13 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id d26so32230884eje.10;
        Mon, 07 Nov 2022 10:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qXYfH922nz60/C2ufg0GwkxiRdJKrLocdXP1wbKGBg=;
        b=f7rLot3YbAnFTqU/eAGjP36tD/WbjTGB/d7HVVGa4NwIhxDeLBcw31G1ZEWd0jFa+i
         S0KCN78AdrYspz3daBt6/18jhviRbiaPRdniIpZshxmiywDEZzqZdelcNCw+QrLAat+b
         +O2aXs2JL40wkVk4yLNLa1beabzaDYE5APoLWOF5HDKBxtRy34HtD9s7fKjqv45WsX6b
         Nl+j5oYUmHaxnkTqGYTfVhf3OYSzovdwc/nQ9llH9UCQc4NrxHodW9e4nx5gZrmM/s26
         91WzqjrVccJ2j9bT9WwN8N3Zb6oGA/IfII0DWKDdJ5lpXyLQcBPbjC5Ofaz6/rtOUeQU
         tctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qXYfH922nz60/C2ufg0GwkxiRdJKrLocdXP1wbKGBg=;
        b=rWrcUy+K1GczUa8DzQmidEYnY4aETsQ0e2elXvtxZS4HcmwwBfEQfJJu1AeUxVNjJ2
         kQr/ecpOJezLyQgtXObuL0lDiUka59vS92v5mk79PpbEM1q0aUYtKPsZRjJTx2NcH9zM
         XsHeFvKwMoW5e9/whgaQ+lcoymwQUdBXDiii+k2neC2Wk28xE4xeSc9q+3j3mRN+pF6o
         LpK7SVIli8A95sFRuSiUx2MdDPp+7+WNj4lUo1S0PR595BU//qOlA0NaBnWYf5ElnVuj
         or83vdmQMdS8XgJFbd0r8DgP0ek0GuFGXWPbfJm1RnGu/zNu5aBl36a0d4WfXuvn2rX4
         a3Fw==
X-Gm-Message-State: ACrzQf3WdIOqcHDSsBrhuP7KLdTspBxLLwvcHkS6+E6kPkFD07sKFA2K
        hBZ3azMhpcjeEw7c3BkgrGc=
X-Google-Smtp-Source: AMsMyM7UPfq/X2hAwiOl4KMSOHF8gEmbKBuGKWyMVpNPRUANx4uudsW0OpHCas2ISvqvwr+aSFH9iw==
X-Received: by 2002:a17:907:9615:b0:7ae:1219:7032 with SMTP id gb21-20020a170907961500b007ae12197032mr24624962ejc.658.1667844011844;
        Mon, 07 Nov 2022 10:00:11 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b0073dd8e5a39fsm3664768ejz.156.2022.11.07.10.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:00:11 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 03/10] ARM: dts: suniv: f1c100s: add I2C DT nodes
Date:   Mon, 07 Nov 2022 19:00:10 +0100
Message-ID: <7447015.EvYhyI6sBW@kista>
In-Reply-To: <20221107005433.11079-4-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221107005433.11079-4-andre.przywara@arm.com>
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

Dne ponedeljek, 07. november 2022 ob 01:54:26 CET je Andre Przywara 
napisal(a):
> The Allwinner F1C100s series of SoCs contain three I2C controllers
> compatible to the ones used in other Allwinner SoCs.
> 
> Add the DT nodes describing the resources of the controllers.
> I2C1 has only one possible pinmux, so add the pinctrl properties for
> that already.

Above statement doesn't match current changes anymore. With that removed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

If nothing else pops up, I can fix this while applying.

Best regards,
Jernej

> At least one board connects an on-board I2C chip to PD0/PD12 (I2C0), so
> include those pins already, to simplify referencing them later.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> b/arch/arm/boot/dts/suniv-f1c100s.dtsi index 81749d5da12f..4f45168cea42
> 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -192,6 +192,12 @@ mmc0_pins: mmc0-pins {
>  				drive-strength = <30>;
>  			};
> 
> +			/omit-if-no-ref/
> +			i2c0_pd_pins: i2c0-pd-pins {
> +				pins = "PD0", "PD12";
> +				function = "i2c0";
> +			};
> +
>  			spi0_pc_pins: spi0-pc-pins {
>  				pins = "PC0", "PC1", "PC2", 
"PC3";
>  				function = "spi0";
> @@ -203,6 +209,42 @@ uart0_pe_pins: uart0-pe-pins {
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
> --
> 2.35.5


