Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8058D117A27
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 23:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfLIWyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 17:54:22 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45920 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727621AbfLIWyW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Dec 2019 17:54:22 -0500
Received: by mail-pl1-f195.google.com with SMTP id w7so6409920plz.12
        for <linux-i2c@vger.kernel.org>; Mon, 09 Dec 2019 14:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=GZbS2xfEltGE7F6nx/Sqk3zKGRtEeNKmrbNzg2JwiAc=;
        b=mUW88DZZcUm77HMOxXwdlW6E09GhqoZdMi73UXyZvqXuxha8a/66J2NeEmajC50CRk
         uppHSqsk6KZHN5slwK1hx8E1lS59JSJvffgtzvzQCCxoXvGEDs9g6yOrYKjrRQc0U2VJ
         F14XddSIXzsYYLvZsaRRw8i6eGlXsRTa8DVQOtQgFAg4WGiZIXhzticlJkngYIiqZUiS
         zYvyRcJUcIUxVNQf3PvH7XVTAVQq++X8LmuBCfi53vTg7GhZ2oC5qsbIOHt1PGov85IV
         P+2JlSX9fuav7dYzPqKnHewt2fbwfzjZ+dAb5juXdJEkLzYajGr6Yer6SwKDajIRbAit
         eEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=GZbS2xfEltGE7F6nx/Sqk3zKGRtEeNKmrbNzg2JwiAc=;
        b=Ty7ImHZFeJtwVpUSPmKCcD5WyQwCZ9YwUqGDaKprQhZKef5lnR4gj5e99dNEtOnxbi
         W9QQtEYyjQufKjA+L06AR0nwhXMTxv4oBSnwL88rEmPa3Onenxny6ycfAy59oNmhSomv
         2arheTc0tB5r859eLx//gKt7Ny4XnqZcBYRoekLuFkfF4rdcdxg5NMMjSd3zfvwmcc9f
         Gt4+RAJ/OHJiBP6c7HohtLXsTAA0d/uc7zTd9R1sZsjhY4SBskNR+t5Hj9kVAT99sVEu
         l8WT5gJlqfdVVNLnWefoNOKOmT16DLQtI9JtP0CpkBzzTJJ+BAwM1ipyvVB+q+LkZE67
         9lfw==
X-Gm-Message-State: APjAAAV6OEM9vuCqyOEEjRsYrSUNoIZg5KhwPC4gRWjdZ9yAQ0uYcaj3
        xOMH+RYh9k9TxxYaoUURGrI3gQ==
X-Google-Smtp-Source: APXvYqwNJMLkK5JvNCFW6hNtE0esgiRwTzkpNVJU4zltb0IL3k5qCFuUjWhWC1FqrZ+fqHmQWyHuQg==
X-Received: by 2002:a17:902:d883:: with SMTP id b3mr1804416plz.231.1575932059858;
        Mon, 09 Dec 2019 14:54:19 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id a25sm499720pfo.116.2019.12.09.14.54.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 14:54:19 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jian Hu <jian.hu@amlogic.com>, "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <20191202111253.94872-1-jian.hu@amlogic.com>
References: <20191202111253.94872-1-jian.hu@amlogic.com>
Date:   Mon, 09 Dec 2019 14:54:18 -0800
Message-ID: <7hsgltqfdx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jian,

Jian Hu <jian.hu@amlogic.com> writes:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG.The I2C nodes
> depend on pinmux and clock controller.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index eab2ecd36aa8..d0a73d953f5e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -16,6 +16,13 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> @@ -117,6 +124,46 @@
>  				};
>  			};
>  
> +			i2c0: i2c@1400 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x1400 0x0 0x24>;

The AXG DT files use 0x20 for the length.  You are using 0x24.  I don't
see any additional registers added to the driver, so this doesn't look right.

> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@5c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x5c00 0x0 0x24>;
> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@6800 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x6800 0x0 0x24>;
> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@6c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x6c00 0x0 0x24>;
> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
> +				status = "disabled";
> +			};
> +
>  			uart_AO: serial@1c00 {
>  				compatible = "amlogic,meson-gx-uart",
>  					     "amlogic,meson-ao-uart";
> @@ -171,3 +218,105 @@
>  		#clock-cells = <0>;
>  	};
>  };
> +
> +&periphs_pinctrl {
> +	i2c0_f11_pins:i2c0-f11 {
> +		mux {
> +			groups = "i2c0_sck_f11",
> +				"i2c0_sda_f12";
> +			function = "i2c0";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;

Can you also add some comment to the changelog about the need for
drive-strength compared to AXG.

> +		};
> +	};

Kevin
