Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8D944AA12
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 10:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236819AbhKIJHv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 04:07:51 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:42699 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhKIJHu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 04:07:50 -0500
Received: by mail-ua1-f45.google.com with SMTP id t13so21827089uad.9;
        Tue, 09 Nov 2021 01:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlQKg1S95wm9Dg4YX5cgg1S1wN6XXJ3v2NlE44jQYRE=;
        b=pirckbXGiZ6IHUKF+9mV+PzlbKnbPChMgY1oViQheRVZu9yuZm6SoCInIvjCfGoeAv
         OAHGi3n9uoTnHa5kM7YmlS5XlpJTIKf279TLtYZFGAkVyc2ucokBgL2XB9N1EcOd5oAu
         j4bEClsZ7y+/XSQ0qP6xf1f/ucLvQES0JCRNMvZNI7dokK4fdc0equIa8bzO/fAqcPqI
         SyaGu8lYFLeWWjE+ZZ3nqzgnpGcoxWkLnN8JKZxg1Fc55V11ptsgaZ2kT0CvLETqRUBr
         Hcmm/B2Lg1xBsNTp9bCyPIyunQR9G3xRs4sMpRIyQ3B21bBlW/oKfZTESlBAwfbkz/rj
         SCRg==
X-Gm-Message-State: AOAM532YrDd+q/mF2HbItaLyBxBMv/eK29rNW6OSxNQACtDmy1b2BUZR
        7X6zIKNT1F5wuU++lUT5nuniaqH840crJTFq
X-Google-Smtp-Source: ABdhPJxGXqNrNa6N0zRmsMTUAfBbp6wd0JUwlOeB08oQ9zgDgEuW/NhKifmDPTdXlg6ApWi6z4zjdQ==
X-Received: by 2002:a67:bb11:: with SMTP id m17mr46877694vsn.5.1636448703835;
        Tue, 09 Nov 2021 01:05:03 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id y2sm2409633vke.43.2021.11.09.01.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 01:05:03 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id l43so37146748uad.4;
        Tue, 09 Nov 2021 01:05:02 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr7818542uaa.78.1636448702466;
 Tue, 09 Nov 2021 01:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-13-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-13-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 10:04:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
Message-ID: <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lewis Hanly <lewis.hanly@microchip.com>,
        daire.mcnamara@microchip.com, Atish Patra <atish.patra@wdc.com>,
        ivan.griffin@microchip.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Update the device tree for the icicle kit by splitting it into a third part,
> which contains peripherals in the fpga fabric, add new peripherals
> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
> map which have been changed.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

Please split it into logical separated parts.

> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> +
> +/ {
> +       fpgadma: fpgadma@60020000 {
> +               compatible = "microchip,mpfs-fpga-dma-uio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x0 0x60020000 0x0 0x1000>;
> +               interrupt-parent = <&plic>;
> +               interrupts = <PLIC_INT_FABRIC_F2H_2>;
> +               status = "okay";
> +       };
> +
> +       fpgalsram: fpga_lsram@61000000 {
> +               compatible = "generic-uio";
> +               reg = <0x0 0x61000000 0x0 0x0001000
> +                       0x14 0x00000000 0x0 0x00010000>;

Please group by angular brackets, to increase readability, and support
automatic validation:

<0x0 0x61000000 0x0 0x0001000>, <0x14 0x00000000 0x0 0x00010000>

> +               status = "okay";
> +       };

Do we really want UIO nodes in upstream DT?

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
>         compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>
>         aliases {
> -               ethernet0 = &emac1;
> -               serial0 = &serial0;
> -               serial1 = &serial1;
> -               serial2 = &serial2;
> -               serial3 = &serial3;
> +               mmuart0 = &mmuart0;
> +               mmuart1 = &mmuart1;
> +               mmuart2 = &mmuart2;
> +               mmuart3 = &mmuart3;
> +               mmuart4 = &mmuart4;

Why? SerialN is the standard alias name.

>         };

>
> -&emac0 {
> +&spi0 {
> +       status = "okay";
> +       spidev@0 {
> +               compatible = "spidev";

Please don't use "spidev", but a proper compatible value describing
what is really connected.  If you want to use it with spidev (which
is software policy, not hardware description), add that compatible
value to drivers/spi/spidev.c:spidev_dt_ids[], or use driver_override
in sysfs at runtime.

> +               reg = <0>; /* CS 0 */
> +               spi-max-frequency = <10000000>;
> +               status = "okay";
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";

No slave devices specified?

> +};
> +
> +&qspi {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +       pac193x: pac193x@10 {

adc@, I guess?

> +               compatible = "microchip,pac1934";
> +               reg = <0x10>;
> +               samp-rate = <64>;
> +               status = "okay";
> +               ch0: channel0 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDDREG";
> +                       channel_enabled;
> +               };
> +               ch1: channel1 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDDA25";
> +                       channel_enabled;
> +               };
> +               ch2: channel2 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDD25";
> +                       channel_enabled;
> +               };
> +               ch3: channel3 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDDA_REG";
> +                       channel_enabled;
> +               };
> +       };
> +};

> +&gpio2 {
> +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT>;

Why override interrupts in the board .dts file?
Doesn't this belong in the SoC .dtsi file?
Please group using angular brackets.

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

> @@ -145,49 +149,55 @@ cpu4_intc: interrupt-controller {
>         soc {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
> -               compatible = "simple-bus";
> +               compatible = "microchip,mpfs-soc", "simple-bus";
>                 ranges;
>
> -               cache-controller@2010000 {
> +               cctrllr: cache-controller@2010000 {
>                         compatible = "sifive,fu540-c000-ccache", "cache";
> +                       reg = <0x0 0x2010000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <PLIC_INT_L2_METADATA_CORR
> +                               PLIC_INT_L2_METADAT_UNCORR
> +                               PLIC_INT_L2_DATA_CORR>;

Please group using angular brackets.

>                         cache-block-size = <64>;
>                         cache-level = <2>;
>                         cache-sets = <1024>;
>                         cache-size = <2097152>;
>                         cache-unified;
> -                       interrupt-parent = <&plic>;
> -                       interrupts = <1 2 3>;
> -                       reg = <0x0 0x2010000 0x0 0x1000>;
>                 };
>
> -               clint@2000000 {
> +               clint: clint@2000000 {
>                         compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>                         reg = <0x0 0x2000000 0x0 0xC000>;
> -                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> -                                               &cpu1_intc 3 &cpu1_intc 7
> -                                               &cpu2_intc 3 &cpu2_intc 7
> -                                               &cpu3_intc 3 &cpu3_intc 7
> -                                               &cpu4_intc 3 &cpu4_intc 7>;
> +                       interrupts-extended =
> +                                       <&cpu0_intc HART_INT_M_SOFT &cpu0_intc HART_INT_M_TIMER
> +                                        &cpu1_intc HART_INT_M_SOFT &cpu1_intc HART_INT_M_TIMER
> +                                        &cpu2_intc HART_INT_M_SOFT &cpu2_intc HART_INT_M_TIMER
> +                                        &cpu3_intc HART_INT_M_SOFT &cpu3_intc HART_INT_M_TIMER
> +                                        &cpu4_intc HART_INT_M_SOFT &cpu4_intc HART_INT_M_TIMER>;

Please group using angular brackets.

>                 };
>
>                 plic: interrupt-controller@c000000 {
> -                       #interrupt-cells = <1>;
> -                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
> +                       compatible = "sifive,plic-1.0.0";

Why drop the first one again?

>                         reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       #interrupt-cells = <1>;
>                         riscv,ndev = <186>;
>                         interrupt-controller;
> -                       interrupts-extended = <&cpu0_intc 11
> -                                       &cpu1_intc 11 &cpu1_intc 9
> -                                       &cpu2_intc 11 &cpu2_intc 9
> -                                       &cpu3_intc 11 &cpu3_intc 9
> -                                       &cpu4_intc 11 &cpu4_intc 9>;
> +                       interrupts-extended = <&cpu0_intc HART_INT_M_EXT
> +                                       &cpu1_intc HART_INT_M_EXT &cpu1_intc HART_INT_S_EXT
> +                                       &cpu2_intc HART_INT_M_EXT &cpu2_intc HART_INT_S_EXT
> +                                       &cpu3_intc HART_INT_M_EXT &cpu3_intc HART_INT_S_EXT
> +                                       &cpu4_intc HART_INT_M_EXT &cpu4_intc HART_INT_S_EXT>;
>                 };
>
> -               dma@3000000 {
> -                       compatible = "sifive,fu540-c000-pdma";
> +               pdma: pdma@3000000 {
> +                       compatible = "microchip,mpfs-pdma-uio";
>                         reg = <0x0 0x3000000 0x0 0x8000>;
>                         interrupt-parent = <&plic>;
> -                       interrupts = <23 24 25 26 27 28 29 30>;
> +                       interrupts = <PLIC_INT_DMA_CH0_DONE PLIC_INT_DMA_CH0_ERR
> +                               PLIC_INT_DMA_CH1_DONE PLIC_INT_DMA_CH1_ERR
> +                               PLIC_INT_DMA_CH2_DONE PLIC_INT_DMA_CH2_ERR
> +                               PLIC_INT_DMA_CH3_DONE PLIC_INT_DMA_CH3_ERR>;

Please group using angular brackets.

>                         #dma-cells = <1>;
>                 };
>
> @@ -205,7 +215,7 @@ clkcfg: clkcfg@20002000 {
>                         clocks = <&refclk>;
>                         #clock-cells = <1>;
>                         clock-output-names = "cpu", "axi", "ahb", "envm",       /* 0-3   */
> -                                "mac0", "mac1", "mmc", "timer",                /* 4-7   */
> +                               "mac0", "mac1", "mmc", "timer",                 /* 4-7   */
>                                 "mmuart0", "mmuart1", "mmuart2", "mmuart3",     /* 8-11  */
>                                 "mmuart4", "spi0", "spi1", "i2c0",              /* 12-15 */
>                                 "i2c1", "can0", "can1", "usb",                  /* 16-19 */

No need for clock-output-names at all.

>
> -               emac1: ethernet@20112000 {
> +               mac0: ethernet@20110000 {
>                         compatible = "cdns,macb";
> -                       reg = <0x0 0x20112000 0x0 0x2000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x0 0x20110000 0x0 0x2000>;
> +                       clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
> +                       clock-names = "pclk", "hclk";
>                         interrupt-parent = <&plic>;
> -                       interrupts = <70 71 72 73>;
> -                       local-mac-address = [00 00 00 00 00 00];
> -                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       interrupts = <PLIC_INT_MAC0_INT
> +                               PLIC_INT_MAC0_QUEUE1
> +                               PLIC_INT_MAC0_QUEUE2
> +                               PLIC_INT_MAC0_QUEUE3
> +                               PLIC_INT_MAC0_EMAC
> +                               PLIC_INT_MAC0_MMSL>;

Please group using angular brackets.

> +                       mac-address = [56 34 12 00 FC 01];

Please drop this.

>                         status = "disabled";
> +               };
>
> +               rtc: rtc@20124000 {
> +                       compatible = "microchip,mpfs-rtc";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       reg = <0x0 0x20124000 0x0 0x1000>;
> +                       clocks = <&clkcfg CLK_RTC>;
> +                       clock-names = "rtc";
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <PLIC_INT_RTC_WAKEUP PLIC_INT_RTC_MATCH>;

Please group using angular brackets.

> +                       status = "disabled";
>                 };
>
> +               usb: usb@20201000 {
> +                       compatible = "microchip,mpfs-usb-host";
> +                       reg = <0x0 0x20201000 0x0 0x1000>;
> +                       reg-names = "mc","control";
> +                       clocks = <&clkcfg CLK_USB>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;

Please group using angular brackets.

> +                       interrupt-names = "dma","mc";
> +                       dr_mode = "host";
> +                       status = "disabled";
> +               };
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
