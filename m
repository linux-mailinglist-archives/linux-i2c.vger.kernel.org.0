Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175F42D5C15
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 14:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389449AbgLJNiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 08:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733284AbgLJNfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 08:35:40 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2F0C06179C;
        Thu, 10 Dec 2020 05:34:59 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id a16so4719225ybh.5;
        Thu, 10 Dec 2020 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vfSAyzZfUjlWeyeSEewwWw2mhFaO2D8flFMA2vqBuNA=;
        b=Jm8tEDfLMwIXJ2wrtH7X1/A+NaAlnDCauFW5AjRJgM62R64rLa5gsiCbx+txq0lpP8
         6SZaayc+pbJo/qLTgIEf/RkjmcPbtpz26lGK+WR8mgi17UegIYk8o7Gm8Vxfx5d134WS
         FAvE7cFGkO+XUnS83IWARxVZBjI93OTgPeamecAXTz3Kcb6BhPqyTrxr6HDGTtS1pzRD
         g7V5n2re2MmhW6K4FvyEYxSOwsg/BGo6SZVA0hAjEh+mJvu651IV12Uam+pm3mJ25qM4
         CI7B0WAR764SeYThgr+wugAk+K7kumO1Eksoad/lY3KqEHwbmYbj9DIxSWqODo1m95Jg
         1hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vfSAyzZfUjlWeyeSEewwWw2mhFaO2D8flFMA2vqBuNA=;
        b=EZSbnBFLRR5giegJhlV/ztv8b0j11p7pZkTvO3VGsml0GDf9tpjlyE8YaOOFDlrbAY
         PHg7duO44/NCk0J2DSCDneGYfESVAkNHsc5K3r1bAWAzp+w2JlhgqrFl1QWT9tQRgMji
         m2erK4ag6twrd7VggMErZdxKQBPsLXix4tXZ4CJRIWxC1iF0XHn9TGSYRt/ARgFZbmj0
         a+YDsVootJWAE1Ow6gqKqX5W2ZPl6nfzlvkG+Rs2iVWUf5yAS3Kma47xdS5+LkvwydEB
         Zjq3sdaW6iloftc6kInIS9IVDdySo5QF6rwPwjoh2jNKitd/JP11uvAJWNKFPp5SwisI
         AJBQ==
X-Gm-Message-State: AOAM533CID3s1j/ToD1tOCqD4rMNQ8VDIf+19GZAvznVksgL/rtvlYHw
        aciCF7Y8/Tyzb9hajgRWG11f7iU7/aVOj5Xg4ic=
X-Google-Smtp-Source: ABdhPJwXw2P7R5ISv4M6hrhYJ9kts/kEdAW82RV1P+4EI3ZDlat8PHriVJFzNbuowRuRDEPPEw6nCzOJR12j6/QfGb8=
X-Received: by 2002:a05:6902:210:: with SMTP id j16mr11138986ybs.122.1607607299236;
 Thu, 10 Dec 2020 05:34:59 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com> <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
From:   Bin Meng <bmeng.cn@gmail.com>
Date:   Thu, 10 Dec 2020 21:34:47 +0800
Message-ID: <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        broonie@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de,
        Thierry Reding <thierry.reding@gmail.com>, andrew@lunn.ch,
        Peter Korsgaard <peter@korsgaard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built

FU740-C000 Soc

> around the SiFIve U7 Core Complex and a TileLink interconnect.
>
> This file is expected to grow as more device drivers are added to the
> kernel.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293 +++++++++++++++++++++++++++++
>  1 file changed, 293 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>
> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> new file mode 100644
> index 0000000..eeb4f8c3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 SiFive, Inc */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/clock/sifive-fu740-prci.h>
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       compatible = "sifive,fu740-c000", "sifive,fu740";
> +
> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart1;
> +               ethernet0 = &eth0;
> +       };
> +
> +       chosen {
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               cpu0: cpu@0 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <16384>;
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x0>;
> +                       riscv,isa = "rv64imac";
> +                       status = "disabled";
> +                       cpu0_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu1: cpu@1 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x1>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       cpu1_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu2: cpu@2 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x2>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       cpu2_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu3: cpu@3 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x3>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       cpu3_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu4: cpu@4 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x4>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       cpu4_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +       };
> +       soc {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +               plic0: interrupt-controller@c000000 {
> +                       #interrupt-cells = <1>;
> +                       #address-cells = <0>;
> +                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";

I don't see bindings updated for FU740 PLIC, like "sifive,fu740-c000-plic"?

> +                       reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       riscv,ndev = <69>;
> +                       interrupt-controller;
> +                       interrupts-extended = <
> +                               &cpu0_intc 0xffffffff
> +                               &cpu1_intc 0xffffffff &cpu1_intc 9
> +                               &cpu2_intc 0xffffffff &cpu2_intc 9
> +                               &cpu3_intc 0xffffffff &cpu3_intc 9
> +                               &cpu4_intc 0xffffffff &cpu4_intc 9>;
> +               };
> +               prci: clock-controller@10000000 {
> +                       compatible = "sifive,fu740-c000-prci";
> +                       reg = <0x0 0x10000000 0x0 0x1000>;
> +                       clocks = <&hfclk>, <&rtcclk>;
> +                       #clock-cells = <1>;
> +               };
> +               uart0: serial@10010000 {
> +                       compatible = "sifive,fu740-c000-uart", "sifive,uart0";
> +                       reg = <0x0 0x10010000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <39>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       status = "disabled";
> +               };
> +               uart1: serial@10011000 {
> +                       compatible = "sifive,fu740-c000-uart", "sifive,uart0";
> +                       reg = <0x0 0x10011000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <40>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       status = "disabled";
> +               };
> +               i2c0: i2c@10030000 {
> +                       compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
> +                       reg = <0x0 0x10030000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <52>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       reg-shift = <2>;
> +                       reg-io-width = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               i2c1: i2c@10031000 {
> +                       compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
> +                       reg = <0x0 0x10031000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <53>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       reg-shift = <2>;
> +                       reg-io-width = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               qspi0: spi@10040000 {
> +                       compatible = "sifive,fu740-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10040000 0x0 0x1000>,
> +                             <0x0 0x20000000 0x0 0x10000000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <41>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               qspi1: spi@10041000 {
> +                       compatible = "sifive,fu740-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10041000 0x0 0x1000>,
> +                             <0x0 0x30000000 0x0 0x10000000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <42>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               spi0: spi@10050000 {
> +                       compatible = "sifive,fu740-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10050000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <43>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               eth0: ethernet@10090000 {
> +                       compatible = "sifive,fu540-c000-gem";

"sifive,fu740-c000-gem"?

> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <55>;
> +                       reg = <0x0 0x10090000 0x0 0x2000>,
> +                             <0x0 0x100a0000 0x0 0x1000>;
> +                       local-mac-address = [00 00 00 00 00 00];
> +                       clock-names = "pclk", "hclk";
> +                       clocks = <&prci PRCI_CLK_GEMGXLPLL>,
> +                                <&prci PRCI_CLK_GEMGXLPLL>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               pwm0: pwm@10020000 {
> +                       compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
> +                       reg = <0x0 0x10020000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <44>, <45>, <46>, <47>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +               pwm1: pwm@10021000 {
> +                       compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
> +                       reg = <0x0 0x10021000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <48>, <49>, <50>, <51>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +               ccache: cache-controller@2010000 {
> +                       compatible = "sifive,fu740-c000-ccache", "cache";
> +                       cache-block-size = <64>;
> +                       cache-level = <2>;
> +                       cache-sets = <2048>;
> +                       cache-size = <2097152>;
> +                       cache-unified;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <19 20 21 22>;
> +                       reg = <0x0 0x2010000 0x0 0x1000>;
> +               };
> +               gpio: gpio@10060000 {
> +                       compatible = "sifive,fu740-c000-gpio", "sifive,gpio0";
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
> +                                    <30>, <31>, <32>, <33>, <34>, <35>, <36>,
> +                                    <37>, <38>;
> +                       reg = <0x0 0x10060000 0x0 0x1000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       status = "disabled";
> +               };
> +       };
> +};

Regards,
Bin
