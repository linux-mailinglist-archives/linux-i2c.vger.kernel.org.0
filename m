Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77582EEBC1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 04:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbhAHDNP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jan 2021 22:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbhAHDNO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jan 2021 22:13:14 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE274C0612F5
        for <linux-i2c@vger.kernel.org>; Thu,  7 Jan 2021 19:12:27 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id c13so2655802pfi.12
        for <linux-i2c@vger.kernel.org>; Thu, 07 Jan 2021 19:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=SjIxw593j/BG7x2X3ksVVnxB2uu71tEZmxrMsCj4BiM=;
        b=h2ktI7s4n8xCoqkoSVH4EHqwEk9bp/enKaHzfXG4daTjSVem3smhzGjWZOERytTBt1
         uct1LT+TzDwe1P+tWsKICLXw/a9f1Y5NGttqGWBIlq7W0terFsRHlavDYV15Cf8egItt
         ssfplpyFYDBmZLa4Bss7IeleNkqZcrj7JtyEEWkZPzvoHbtHiUCt9ectPN4fr1muZPpM
         ywgRFdcUijDEgD1cnBXSpdui63N7Pur/ocDaLM3e7YxpSFI76doqdNO0TUcSv7NbVbUQ
         egGDX7XIhDuYYpHZ5nnBoNW06xDqi3t8gF0kGVKM7WpiLVNcmrFR1T8datur+4zctrQd
         fHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=SjIxw593j/BG7x2X3ksVVnxB2uu71tEZmxrMsCj4BiM=;
        b=FQwZaMlyxD0umZkSzEyPcm8I8jTPX86Kk00Sa93XyHeB87DIhBixyPEVH3cjgJ6Kca
         HUZOrfKD0olap2ewOwQXrU1O//nxMk0v6ZoSB5C7/zn3N/8r4Q8A6ERpG7G1pAbXSaE8
         uwGXMANGlQAqHo53ySz6BjVxPlr0WVR3w2K7VumV259Z+m0DVZFshXh3d4YfBdsV6QYP
         y2bo3IWo35OUN3eshP8qPoGLLVIKzedasziWoT13bGAH5Bdgn967BOd9VwYn3D7B0ahL
         NKWHE7ifLMgAEo5swtBJOJOd9OtL6nN2gtLWhOcIS1k8CEkCMYMibxQ4n/KQl7YOSoXB
         gtsA==
X-Gm-Message-State: AOAM530grbgwgm0aIuO2/xyJs2M1V7TzmnVmcTTEf0A0G3T3O6DqzGD3
        3w9OYRnGRq18oEWnkFkBoW4ilg==
X-Google-Smtp-Source: ABdhPJxeTiUgNKGaw5qtkvFU0vf1c4xAKljKlMnfqJb88DCjQRxBowLvlBQ4gqSHPM+ucT8Xlx08sQ==
X-Received: by 2002:a63:1f47:: with SMTP id q7mr4962672pgm.10.1610075547296;
        Thu, 07 Jan 2021 19:12:27 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id r185sm6938981pfc.53.2021.01.07.19.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 19:12:26 -0800 (PST)
Date:   Thu, 07 Jan 2021 19:12:26 -0800 (PST)
X-Google-Original-Date: Thu, 07 Jan 2021 17:52:56 PST (-0800)
Subject:     Re: [PATCH v2 0/9] arch: riscv: add board and SoC DT file support
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
CC:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        broonie@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        aou@eecs.berkeley.edu, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        andrew@lunn.ch, peter@korsgaard.com,
        Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        yash.shah@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     yash.shah@sifive.com
Message-ID: <mhng-abbd57b3-7d81-4c66-9883-67bc11f1f3a3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 07 Dec 2020 20:55:32 PST (-0800), yash.shah@sifive.com wrote:
> Start board support by adding initial support for the SiFive FU740 SoC
> and the first development board that uses it, the SiFive HiFive
> Unmatched A00.
>
> Boot-tested on Linux 5.10-rc4 on a HiFive Unmatched A00 board using the
> U-boot and OpenSBI.
>
> This patch series is dependent on Zong's Patchset[0]. The patchset also
> adds two new nodes in dtsi file. The binding documentation patch
> for these nodes are already posted on the mailing list[1][2].
>
> [0]: https://lore.kernel.org/linux-riscv/20201130082330.77268-4-zong.li@sifive.com/T/#u
> [1]: https://lore.kernel.org/linux-riscv/1606714984-16593-1-git-send-email-yash.shah@sifive.com/T/#t
> [2]: https://lore.kernel.org/linux-riscv/20201126030043.67390-1-zong.li@sifive.com/T/#u
>
> Changes in v2:
> - The dt bindings patch is split into several individual patches.
> - Expand the full list for compatible strings in i2c-ocores.txt
>
> Yash Shah (9):
>   dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: spi: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: pwm: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: serial: Update DT binding docs to support SiFive FU740
>     SoC
>   dt-bindings: gpio: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: i2c: Update DT binding docs to support SiFive FU740 SoC
>   riscv: dts: add initial support for the SiFive FU740-C000 SoC
>   dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched
>     board
>   riscv: dts: add initial board data for the SiFive HiFive Unmatched
>
>  .../devicetree/bindings/gpio/sifive,gpio.yaml      |   4 +-
>  .../devicetree/bindings/i2c/i2c-ocores.txt         |   8 +-
>  .../devicetree/bindings/pwm/pwm-sifive.yaml        |   9 +-
>  Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
>  .../devicetree/bindings/riscv/sifive.yaml          |  17 +-
>  .../devicetree/bindings/serial/sifive-serial.yaml  |   4 +-
>  .../devicetree/bindings/spi/spi-sifive.yaml        |  10 +-
>  arch/riscv/boot/dts/sifive/Makefile                |   3 +-
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi         | 293 +++++++++++++++++++++
>  .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 ++++++++++++++++++
>  10 files changed, 590 insertions(+), 17 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts

Thanks, these are on for-next.  There was one checkpatch warning about the
missing ISSI device tree entry, but we already had that in the FU540 so I'm OK
letting it slide.

I'm also not really sure this is the right way to do this sort of thing: most
of the patches here really aren't RISC-V things, they're SiFive SOC things.
Some of these patches have been picked up by other trees, but I just took the
rest.  I'm not all that happy about taking DT bindings for things like GPIO or
PWM bindings, but as they're pretty small I'm OK doing it in this instance.

In the future it would really be better to split these up and land them via
their respectitve trees, rather than trying to do all the SOC stuff over here.
I know that can be a headache, but we have that SOC group for this purpose to
try and keep things a bit more together -- I know it was a while ago and there
really hasn't been much SOC activity on the RISC-V side of things so maybe it
hasn't been that widley discussed, but that was really designed to solve these
sorts of problems.
