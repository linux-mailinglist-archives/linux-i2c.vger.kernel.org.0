Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D13449E61
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 22:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240526AbhKHVnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:43:03 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44050
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240521AbhKHVnC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:43:02 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EBEE03F1B0
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 21:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636407616;
        bh=xMlhz60Y7Re9w6VZ4mCdMM9k1oT7By2/e2a+Ful96Aw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=WalAfbpky6/c73gSsfMx3bMWWMQjZ5fTUA4a3mxKgalIyWp120Ai0Qf1bQ6olgEzn
         jAJM8faFgyhM5tEycEPfUF9Wm8IzDgvl6Gw0ZXZaAShXvoVdtQV7f6GhMkbKJtYMgQ
         pKFR/6biruGE3WYJxxb532NJdFP6DwS/j/0lWo2jMrUo5uOAbadN6Tip0pB4QDUeRO
         FlN3GtQwnW2lx84htj9eEVnzmagfNq7+3+vn6vYvAzuBfWfwbR3YVBAoOtXBM03Uj+
         /3QRGmqhfx4/jg9bNguxpNpNyLAIWg6z8xPOwxye2cdLoRiEwRmnl+WHx6I2b7ngDh
         rUADzZMIfhjzg==
Received: by mail-lf1-f69.google.com with SMTP id c14-20020a056512104e00b004036d17f91bso2292625lfb.17
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 13:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xMlhz60Y7Re9w6VZ4mCdMM9k1oT7By2/e2a+Ful96Aw=;
        b=abSMn8172AiauDPRYehVuGbuCvVk1PS0xaVar6GVzjQU4GbyKUvGklLxg4qX+3O9Nh
         OAsUIAZIqIWaEnPoIBo7UBUANbZ1faLgEuVxrpRd9DJEHAuC2o00Ug5QMx6ZNgqi8lkk
         O6GQuiNJm2YdSmugy8zDhzUhtwPlXiQluaGcU/EIeV4R6Jw4dp62K1yKaIDQJii9zIm5
         xhXeNY8JQSj12hq3Fy/PDrHXOcjYMCweeVqy9Fr8px4oiGjOO3UOP2kthRWyFt3XBIS8
         +xfB9TkewZyk7eYgxNZpecDdrkX6BaMVRbVAbiBEAH8pV7JCyyzJ1mc1eSdDrsQIvXi6
         debA==
X-Gm-Message-State: AOAM531ra5C7GJ5j68D47vKuS9oOwUyfQLSJe0gDJrwXiAgd6E3vTr8c
        6cdf3bbO7dukr2MMHA9Aedqn6j9CMGz5WIrfiATpNOOzeot2qZquKg/guzgHBq++MmyJU1NPl8H
        IYo7IXerHMn0iCLwdVtrSzv4WLiNRyGgZCgtgbQ==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr2168844lfq.307.1636407614505;
        Mon, 08 Nov 2021 13:40:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym1HJFJOCiKpshotep+fEMHGVvuCHCUht7Znnr1Fptl/CMGw7zMKN16qBDQpX9jY7h2z+d7w==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr2168813lfq.307.1636407614293;
        Mon, 08 Nov 2021 13:40:14 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h18sm295563ljh.133.2021.11.08.13.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:40:13 -0800 (PST)
Message-ID: <01fdf2cf-26ae-b062-178b-4b9a23cd5803@canonical.com>
Date:   Mon, 8 Nov 2021 22:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-13-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update the device tree for the icicle kit by splitting it into a third part,
> which contains peripherals in the fpga fabric, add new peripherals
> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
> map which have been changed.

This should be multiple commits because you mix up refactoring (split)
and adding new features. The patch is really, really difficult to
review. I gave up in the middle.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  21 ++
>  .../microchip/microchip-mpfs-icicle-kit.dts   | 159 +++++++--
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 333 ++++++++++++++----
>  3 files changed, 428 insertions(+), 85 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> new file mode 100644
> index 000000000000..8fa3356494f1
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> +
> +/ {
> +	fpgadma: fpgadma@60020000 {
> +		compatible = "microchip,mpfs-fpga-dma-uio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x0 0x60020000 0x0 0x1000>;
> +		interrupt-parent = <&plic>;
> +		interrupts = <PLIC_INT_FABRIC_F2H_2>;
> +		status = "okay";
> +	};
> +
> +	fpgalsram: fpga_lsram@61000000 {

Node names go with hyphen, but actually you should not need it, because
the name should be generic, e.g. "uio".

However there is no such compatible and checkpatch should complain about it.

> +		compatible = "generic-uio";
> +		reg = <0x0 0x61000000 0x0 0x0001000
> +			0x14 0x00000000 0x0 0x00010000>;
> +		status = "okay";
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index fc1e5869df1b..4212129fcdf1 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/* Copyright (c) 2020 Microchip Technology Inc */
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>  
>  /dts-v1/;
>  
> @@ -13,72 +13,187 @@ / {
>  	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>  
>  	aliases {
> -		ethernet0 = &emac1;
> -		serial0 = &serial0;
> -		serial1 = &serial1;
> -		serial2 = &serial2;
> -		serial3 = &serial3;> +		mmuart0 = &mmuart0;
> +		mmuart1 = &mmuart1;
> +		mmuart2 = &mmuart2;
> +		mmuart3 = &mmuart3;
> +		mmuart4 = &mmuart4;

Why? Commit msg does not explain it.

>  	};
>  
>  	chosen {
> -		stdout-path = "serial0:115200n8";
> +		stdout-path = "mmuart1:115200n8";
>  	};
>  
>  	cpus {
>  		timebase-frequency = <RTCCLK_FREQ>;
>  	};
>  
> -	memory@80000000 {
> +	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
> -		reg = <0x0 0x80000000 0x0 0x40000000>;
> -		clocks = <&clkcfg 26>;
> +		reg = <0x0 0x80000000 0x0 0x2e000000>;
> +		clocks = <&clkcfg CLK_DDRC>;
> +		status = "okay";
> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {
> +		device_type = "memory";
> +		reg = <0x10 0x0 0x0 0x40000000>;
> +		clocks = <&clkcfg CLK_DDRC>;
> +		status = "okay";
>  	};
>  };
>  
> -&serial0 {
> +&mmuart1 {
>  	status = "okay";
>  };
>  
> -&serial1 {
> +&mmuart2 {
>  	status = "okay";
>  };
>  
> -&serial2 {
> +&mmuart3 {
>  	status = "okay";
>  };
>  
> -&serial3 {
> +&mmuart4 {
>  	status = "okay";
>  };
>  
>  &mmc {
>  	status = "okay";
> -
>  	bus-width = <4>;
>  	disable-wp;
>  	cap-sd-highspeed;
> +	cap-mmc-highspeed;
>  	card-detect-delay = <200>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
>  	sd-uhs-sdr12;
>  	sd-uhs-sdr25;
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
>  };
>  
> -&emac0 {
> +&spi0 {
> +	status = "okay";
> +	spidev@0 {
> +		compatible = "spidev";

1. There is no such compatible,
2. You should have big fat warning when booting, so such DT cannot be
accepted.

> +		reg = <0>; /* CS 0 */
> +		spi-max-frequency = <10000000>;
> +		status = "okay";
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +};
> +
> +&qspi {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	pac193x: pac193x@10 {

Generic node name. Looks like compatible is not documented, so first
bindings.


> +		compatible = "microchip,pac1934";
> +		reg = <0x10>;
> +		samp-rate = <64>;
> +		status = "okay";
> +		ch0: channel0 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDDREG";
> +			channel_enabled;
> +		};
> +		ch1: channel1 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDDA25";
> +			channel_enabled;
> +		};
> +		ch2: channel2 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDD25";
> +			channel_enabled;
> +		};
> +		ch3: channel3 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDDA_REG";
> +			channel_enabled;
> +		};
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
>  	phy-mode = "sgmii";
>  	phy-handle = <&phy0>;
> -	phy0: ethernet-phy@8 {
> -		reg = <8>;
> -		ti,fifo-depth = <0x01>;
> -	};
>  };
>  
> -&emac1 {
> +&mac1 {

I gave up here, it's not easy to find what is effect of refactoring,
what is a new node.

Best regards,
Krzysztof
