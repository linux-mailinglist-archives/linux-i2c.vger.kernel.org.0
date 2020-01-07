Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3BF132313
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgAGJ6Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:58:16 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40835 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgAGJ6Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:58:16 -0500
Received: by mail-wm1-f66.google.com with SMTP id t14so18629411wmi.5
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=UfGDE/pY8GyHptw1+lgKhCDTDIHwOAgtK6t8XN0nv5M=;
        b=ziDuMHvptB5Iu+MWIvv7l5G8tPvQ62nt+243YesP3kh3NQllbFzC0wCoWuOPEliMoN
         fO8w5gcZPdaccC5JuLJLdvgPrLjqL5NMPXXhH9H+If4iQQR4TwPn94FfkkM9ixj98/tI
         eiNUZ0h09fFAS6fsjhBMM3VPL9oFlrySbPVIbbo2bkKhmdEQ2ib1aWRSNM1l/Ka5D/3u
         HaDAB7iNzcL0++VaSvgApD5ZwEvqceQQ2onwnpRQNghmfll5WqYbhG7v5iayIrHzmDw6
         qcliaLUXAbEkkV2d8LJ2M1/jzQm7CUgjmZoNEZjokSJ5AynhB/n2OY/cV0XY5GwUTyqw
         Wmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=UfGDE/pY8GyHptw1+lgKhCDTDIHwOAgtK6t8XN0nv5M=;
        b=Rb2+4ouc3i6M9Czv1ValgeBcH7vVSX8pz2J/YPg3WD0jzV4ct80rSaDMowKdprKNLk
         4WwCEHvV1ZCH16+2W6vQFstblfMCDimRPEcy6yqyHh2f7f2RTB+SkmVTLp51WGtHBfWY
         q86kGoRU38ABUSsv0PAHK+HpYR9G13c03lvuY7KLK6EFhxxXbI+UvByCSBj/FRhWn+Ol
         2Xz52E3gOp1xlWfYZejv0svBwc6hhNh9JoHvSdxqFNf81UMMbr3BvORAsccWZ5d6p8h2
         TqaE3tuKD4W2MJBTIIc9sy/HlKFJUmE+skauvdKhuLTe3RLhG4IuEcwqvKkDyfap+C77
         VoxQ==
X-Gm-Message-State: APjAAAUKzHgy8OPj+d7Q2JsHUaqEJnmXe9dQM6/4qx0YhysIX+yLAD1Y
        VpCCgEhUmFLNAdEcqOHKA2NaDg==
X-Google-Smtp-Source: APXvYqw02ATk0nvqjCckJPV3pNCB6y4om3PfcHfNjLxZVW3lmZbv6PEn/XkS6a6cZR4h/pibsnaHDw==
X-Received: by 2002:a1c:61c1:: with SMTP id v184mr38685861wmb.160.1578391093938;
        Tue, 07 Jan 2020 01:58:13 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h8sm78708203wrx.63.2020.01.07.01.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 01:58:13 -0800 (PST)
References: <20191220091611.36319-1-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: meson-a1: add I2C nodes
In-reply-to: <20191220091611.36319-1-jian.hu@amlogic.com>
Date:   Tue, 07 Jan 2020 10:58:12 +0100
Message-ID: <1ja76zsi4r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri 20 Dec 2019 at 10:16, Jian Hu <jian.hu@amlogic.com> wrote:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG. Compared to AXG,
> Drive strength feature is newly added in A1.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>
> ---
> This patch depends on A1 clock patchset at [0][3]
>
> Changes since v1 at [1]:
> -change reg length to 0x20
> -assign i2c bus alias in dts file
> -add new feature note compared to AXG in changelog
>
> Changes since v2 at [2]:
> -remove the dependence the commit description
> -remove i2c alias in dtsi
> -reorder the i2c nodes
> -reorder the i2c pins
>
> [0] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
> [1] https://lkml.kernel.org/r/20191202111253.94872-1-jian.hu@amlogic.com
> [2] https://lkml.kernel.org/r/20191211032802.83309-1-jian.hu@amlogic.com
> [3] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
> ---
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 142 ++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index eab2ecd36aa8..1542eeee699d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -117,6 +117,16 @@
>  				};
>  			};
>  
> +			i2c0: i2c@1400 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x1400 0x0 0x20>;
> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
> +				status = "disabled";
> +			};
> +
>  			uart_AO: serial@1c00 {
>  				compatible = "amlogic,meson-gx-uart",
>  					     "amlogic,meson-ao-uart";
> @@ -136,6 +146,36 @@
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> +
> +			i2c1: i2c@5c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x5c00 0x0 0x20>;
> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@6800 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x6800 0x0 0x20>;
> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@6c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x6c00 0x0 0x20>;
> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		gic: interrupt-controller@ff901000 {
> @@ -171,3 +211,105 @@
>  		#clock-cells = <0>;
>  	};
>  };
> +
> +&periphs_pinctrl {

Why is this not directly under the periphs_pinctrl node ?

> +	i2c0_f9_pins:i2c0-f9 {
                     ^
                     Missing space here. Same for the other nodes

> +		mux {
> +			groups = "i2c0_sck_f9",
> +				"i2c0_sda_f10";
> +			function = "i2c0";
> +			bias-pull-up;

Most device we have seen so far have the pull-up on the PCB.

If you look at the other dts file, the i2c pad bias is disabled. If the
pull-up resistor is missing on the PCB, this setting can overloaded in
the board dt.

Bottom line please put "bias-disable" or justify why a1 is different
from the SoC.

> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c0_f11_pins:i2c0-f11 {
> +		mux {
> +			groups = "i2c0_sck_f11",
> +				"i2c0_sda_f12";
> +			function = "i2c0";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c1_a_pins:i2c1-a {
> +		mux {
> +			groups = "i2c1_sck_a",
> +				"i2c1_sda_a";
> +			function = "i2c1";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c1_x_pins:i2c1-x {
> +		mux {
> +			groups = "i2c1_sck_x",
> +				"i2c1_sda_x";
> +			function = "i2c1";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c2_a4_pins:i2c2-a4 {
> +		mux {
> +			groups = "i2c2_sck_a4",
> +				"i2c2_sda_a5";
> +			function = "i2c2";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c2_a8_pins:i2c2-a8 {
> +		mux {
> +			groups = "i2c2_sck_a8",
> +				"i2c2_sda_a9";
> +			function = "i2c2";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c2_x0_pins:i2c2-x0 {
> +		mux {
> +			groups = "i2c2_sck_x0",
> +				"i2c2_sda_x1";
> +			function = "i2c2";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c2_x15_pins:i2c2-x15 {
> +		mux {
> +			groups = "i2c2_sck_x15",
> +				"i2c2_sda_x16";
> +			function = "i2c2";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c3_f_pins:i2c3-f {
> +		mux {
> +			groups = "i2c3_sck_f",
> +				"i2c3_sda_f";
> +			function = "i2c3";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +
> +	i2c3_x_pins:i2c3-x {
> +		mux {
> +			groups = "i2c3_sck_x",
> +				"i2c3_sda_x";
> +			function = "i2c3";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;
> +		};
> +	};
> +};

