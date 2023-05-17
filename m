Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85417706AD7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 16:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjEQOQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 10:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjEQOQ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 10:16:56 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9A718C;
        Wed, 17 May 2023 07:16:54 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9661a1ff1e9so119738366b.1;
        Wed, 17 May 2023 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684333013; x=1686925013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mWuBFORINAsgkFiENnuZWACjGF2Zo8AfvFi7n4DTJY=;
        b=biypyogl/DqZwN8+l2p9gGZMhx1QXp7js5dS6YSXbdcF3ZHK3bAXOKr9bIZ2d5+mvl
         Qn4Gx8A74tCXzyGwgnn35/7evQqgN/7wXY9AeQJjQf2d0yv+FYmCHdYp8GwNzBMM0M2X
         RepZrNuNaoOJQYiVZCSiNqbUDnKxLYbuFDB8j4b1yBI/QsVPe3WOIE4R72ZLtO7EIxoT
         24iEumAIof2PKi6dQYEuyikyK+F0NROw542Ffk8G2rKhOQY1gF3SmvrkEBVbE4TJefAI
         GSNWr7uxGsud5z6OeWp2cGbBzJ4OT09LPkQaqsMmhTV5gi2hCXnVzgGn3dz+0FxHoXgI
         VP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684333013; x=1686925013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mWuBFORINAsgkFiENnuZWACjGF2Zo8AfvFi7n4DTJY=;
        b=Z+pQ/oqFjWFJrG9+QOfmcz2fk6OWGFRuNpj7cn7shDKRiYpYGRowq2JkVCH+kIFmIE
         Z+0NVG8IOQUjZKlbbISdY7MjZKegbdAZtLRCoaG1zNR0fgP1TIgmH3N5XFiNQzdHdBnq
         /abMBpvgJN9Fhoxr2Unjzxbrf982Poi9gPfMU/V+4s8UYXrLNCrOxyg/2ZFPVVdup7oM
         V2twmI0RsL0z51GbdEiOchF4MggywuQOyDAYGkJlRsqmXHdd7IprC9JGRI2HIlRl0F42
         5AjgXpG+NqpXRXqQKXbczJ3a9xWbkvy1NFceT+GK4eMZUxXbd6K/9yEmefwohVyZzQ0P
         lziQ==
X-Gm-Message-State: AC+VfDwxtRBr8RIE7cgkgUEf6LEFJU/lPfTBEAuqBqM5CSGiYZfEo1KB
        BXxqVrmLl5g5ht0kVKhEg9+SlUrulB4J1qMrc2c=
X-Google-Smtp-Source: ACHHUZ5TyNAWL0L+xFq4qCoGU4tNyKIEpqxlZu0ALd+ZVRg36+lSEN4BwR3Z/P1zVEHc2oshTTV+tnv1x2FEG17G5M8=
X-Received: by 2002:a17:907:36c3:b0:96a:3811:f589 with SMTP id
 bj3-20020a17090736c300b0096a3811f589mr24647279ejc.10.1684333012989; Wed, 17
 May 2023 07:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
In-Reply-To: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Wed, 17 May 2023 09:16:41 -0500
Message-ID: <CABb+yY2JaC8b-HFEU_WnSBSCr2edgEezXJkfMUYqjeLBA1MvYw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
To:     Michal Simek <michal.simek@amd.com>
Cc:     piyush.mehta@amd.com, nava.kishore.manne@amd.com,
        sai.krishna.potthuri@amd.com, shubhrajyoti.datta@amd.com,
        vishal.sagar@amd.com, kalyani.akula@amd.com,
        bharat.kumar.gogada@amd.com, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manish Narani <manish.narani@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 16, 2023 at 8:51=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
>
> @xilinx.com is still working but better to switch to new amd.com after
> AMD/Xilinx acquisition.
>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
>  Documentation/devicetree/bindings/arm/xilinx.yaml             | 2 +-
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml     | 2 +-
>  .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml       | 2 +-
>  Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml  | 2 +-
>  Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml | 4 ++--
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml        | 2 +-
>  .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml        | 2 +-
>  Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml  | 2 +-
>  .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml       | 2 +-
>  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml         | 2 +-
>  Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml  | 2 +-
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 2 +-
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 2 +-
>  .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 2 +-
>  .../devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml       | 2 +-
>  .../bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml      | 2 +-
>  .../bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml       | 2 +-
>  Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml        | 2 +-
>  .../devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      | 2 +-
>  .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml    | 2 +-
>  Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml    | 2 +-
>  Documentation/devicetree/bindings/serial/cdns,uart.yaml       | 2 +-
>  Documentation/devicetree/bindings/spi/spi-cadence.yaml        | 2 +-
>  Documentation/devicetree/bindings/spi/spi-xilinx.yaml         | 2 +-
>  Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml    | 2 +-
>  Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml     | 2 +-
>  Documentation/devicetree/bindings/timer/cdns,ttc.yaml         | 2 +-
>  .../devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml   | 4 ++--
>  29 files changed, 31 insertions(+), 31 deletions(-)
>
.....
> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-ma=
ilbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mail=
box.yaml
> index 374ffe64016f..aeaddbf574b0 100644
> --- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.y=
aml
> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.y=
aml
> @@ -33,7 +33,7 @@ description: |
>                +------------------------------------------+
>
>  maintainers:
> -  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>
>  properties:
>    compatible:
>
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Just curious, some developers' ids are left unchanged, and not all
devs have S.O.B.

cheers.
