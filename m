Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D65B722439
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 13:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbjFELLQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 07:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjFELLK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 07:11:10 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F85EC
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jun 2023 04:11:02 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-977d55ac17bso190827666b.3
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jun 2023 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20221208.gappssmtp.com; s=20221208; t=1685963461; x=1688555461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz/gIyGLAa00Ho9qsceUjDdF3ckRJGistqectqhHPQ0=;
        b=t0XcxfZTmxtrU4/ziMpt5ZPpzi0AXzfijXgg8AHq2rNydhE+oiaDLYH3u0hrpVudeD
         uXR/hg1KMjTOecO8X4pXeWEBLH868TCm379WtYxsMDs4AVnWZwoS/qKQ/cAKHfiwPTwt
         eEm0DJrQgNEMIFE4qBFffGyTe/DUOjWmcuBbLMBVnM1qjXE+wjvrVRAAMHL/v9S48L4/
         LKH6GTMATUc3X8h8jAHeFqlNi4H/7XDPvxOxLXTIZFJhA7jDKRhyMREGboUMRDZ129yY
         a+J0TwFcFy2BdtH1TiHjVGkLZyqe2U5O077dsOkiCK4MLTgMChuC42A/WYU+blk08gt7
         kg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685963461; x=1688555461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz/gIyGLAa00Ho9qsceUjDdF3ckRJGistqectqhHPQ0=;
        b=in2xQh/wjLwbHSu1aksdWna3caWmdyyc8KmnK8Dr3a3ubVZ4AroccUAcOPAF5qviNX
         36ynMQkrVGlG9capOP3GBFkijWxy802/pUQyPtuU24KZPIqNgqOFiSjjNZI8PafZLFYQ
         l1xjUn7+5FShCGJeNQw6K958RtnU+/z3IUxC1TUKf+T4cUrHRPNTO+S3TVbF+EkL/Lnt
         g7KiQWknVD4ouFQgyehx/D6wRNw+cBmxK3j+6bBoqskbV0FAWJJjKF5YpictWbfY95DQ
         9lrezrXiM0hMcHkKIiPgjaS4WNVj0BuLUkdRlCfQa/SvaLSRLQLsSmc2iI0przoKuZiQ
         /QOA==
X-Gm-Message-State: AC+VfDycJzoextSACUhB8lRC41st5a+/L+R0TqeqE8+V6r3/ZXfqfSew
        VTbJcY4sOdz/HEsRSKcDbfC/isB6gbDZa2hkCwiHpA==
X-Google-Smtp-Source: ACHHUZ7Myh4P550fmY4KgTrMjcVnpWx0cBq0yOe6l1+zqgJeRkdJtHt3XVmv5M7WqhGVjDr/M7wAxI8E9EIAXW/6zNA=
X-Received: by 2002:a17:907:26c4:b0:974:c32c:b484 with SMTP id
 bp4-20020a17090726c400b00974c32cb484mr5173211ejc.72.1685963460711; Mon, 05
 Jun 2023 04:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
In-Reply-To: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Mon, 5 Jun 2023 13:10:48 +0200
Message-ID: <CAHTX3dJMVZhh3BUA1TWErFd5G0rdrtnr-UmEiOfO2ZyzPKdZ0w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
To:     Michal Simek <michal.simek@amd.com>
Cc:     piyush.mehta@amd.com, nava.kishore.manne@amd.com,
        sai.krishna.potthuri@amd.com, shubhrajyoti.datta@amd.com,
        vishal.sagar@amd.com, kalyani.akula@amd.com,
        bharat.kumar.gogada@amd.com, linux-kernel@vger.kernel.org,
        git@xilinx.com, Alessandro Zummo <a.zummo@towertech.it>,
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
        Jassi Brar <jassisinghbrar@gmail.com>,
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
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C3=BAt 16. 5. 2023 v 15:51 odes=C3=ADlatel Michal Simek <michal.simek@amd.=
com> napsal:
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
> diff --git a/Documentation/devicetree/bindings/arm/xilinx.yaml b/Document=
ation/devicetree/bindings/arm/xilinx.yaml
> index b3071d10ea65..f57ed0347894 100644
> --- a/Documentation/devicetree/bindings/arm/xilinx.yaml
> +++ b/Documentation/devicetree/bindings/arm/xilinx.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Zynq Platforms
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  description: |
>    Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
> diff --git a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml b/=
Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> index 71364c6081ff..b29ce598f9aa 100644
> --- a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> +++ b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Ceva AHCI SATA Controller
>
>  maintainers:
> -  - Piyush Mehta <piyush.mehta@xilinx.com>
> +  - Piyush Mehta <piyush.mehta@amd.com>
>
>  description: |
>    The Ceva SATA controller mostly conforms to the AHCI interface with so=
me
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard=
.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> index c1f04830a832..02bd556bd91a 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx clocking wizard
>
>  maintainers:
> -  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>
>  description:
>    The clocking wizard is a soft ip clocking block of Xilinx versal. It
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index 229af98b1d30..93ae349cf9e9 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Versal clock controller
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>    - Jolly Shah <jolly.shah@xilinx.com>
>    - Rajan Vaja <rajan.vaja@xilinx.com>
>
> diff --git a/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yam=
l b/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
> index 9e8fbd02b150..8aead97a585b 100644
> --- a/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml
> @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx ZynqMP AES-GCM Hardware Accelerator
>
>  maintainers:
> -  - Kalyani Akula <kalyani.akula@xilinx.com>
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Kalyani Akula <kalyani.akula@amd.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  description: |
>    The ZynqMP AES-GCM hardened cryptographic accelerator is used to
> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqm=
p-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zy=
nqmp-firmware.yaml
> index f14f7b454f07..910bebe6cfa8 100644
> --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmw=
are.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx firmware driver
>
>  maintainers:
> -  - Nava kishore Manne <nava.manne@xilinx.com>
> +  - Nava kishore Manne <nava.kishore.manne@amd.com>
>
>  description: The zynqmp-firmware node describes the interface to platfor=
m
>    firmware. ZynqMP has an interface to communicate with secure firmware.
> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.=
yaml b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
> index f47b6140a742..04dcadc2c20e 100644
> --- a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
> +++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Zynq FPGA Manager
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml=
 b/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
> index ac6a207278d5..26f18834caa3 100644
> --- a/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
> +++ b/Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Versal FPGA driver.
>
>  maintainers:
> -  - Nava kishore Manne <nava.manne@xilinx.com>
> +  - Nava kishore Manne <nava.kishore.manne@amd.com>
>
>  description: |
>    Device Tree Versal FPGA bindings for the Versal SoC, controlled
> diff --git a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga=
.yaml b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml
> index 00a8d92ff736..1390ae103b0b 100644
> --- a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml
> +++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Zynq Ultrascale MPSoC FPGA Manager
>
>  maintainers:
> -  - Nava kishore Manne <navam@xilinx.com>
> +  - Nava kishore Manne <nava.kishore.manne@amd.com>
>
>  description: |
>    Device Tree Bindings for Zynq Ultrascale MPSoC FPGA Manager.
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Docu=
mentation/devicetree/bindings/gpio/gpio-zynq.yaml
> index 572e1718f501..5e2496379a3c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Zynq GPIO controller
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml=
 b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> index f333ee2288e7..c1060e5fcef3 100644
> --- a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx AXI GPIO controller
>
>  maintainers:
> -  - Neeli Srinivas <srinivas.neeli@xilinx.com>
> +  - Neeli Srinivas <srinivas.neeli@amd.com>
>
>  description:
>    The AXI GPIO design provides a general purpose input/output interface
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-mode=
pin.yaml b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.=
yaml
> index 31c0fc345903..18e61aff2185 100644
> --- a/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yam=
l
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yam=
l
> @@ -12,7 +12,7 @@ description:
>    PS_MODE). Every pin can be configured as input/output.
>
>  maintainers:
> -  - Piyush Mehta <piyush.mehta@xilinx.com>
> +  - Piyush Mehta <piyush.mehta@amd.com>
>
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/=
Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index cb24d7b3221c..ff57c5416ebc 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Cadence I2C controller
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
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
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss=
.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> index 7d77823dbb7a..43daf837fc9f 100644
> --- a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx MIPI CSI-2 Receiver Subsystem
>
>  maintainers:
> -  - Vishal Sagar <vishal.sagar@xilinx.com>
> +  - Vishal Sagar <vishal.sagar@amd.com>
>
>  description: |
>    The Xilinx MIPI CSI-2 Receiver Subsystem is used to capture MIPI CSI-2
> diff --git a/Documentation/devicetree/bindings/memory-controllers/snps,dw=
-umctl2-ddrc.yaml b/Documentation/devicetree/bindings/memory-controllers/sn=
ps,dw-umctl2-ddrc.yaml
> index e68c4306025a..6b62d5d83476 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2=
-ddrc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2=
-ddrc.yaml
> @@ -9,7 +9,7 @@ title: Synopsys DesignWare Universal Multi-Protocol Memor=
y Controller
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>    - Manish Narani <manish.narani@xilinx.com>
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  description: |
>    Synopsys DesignWare Enhanced uMCTL2 DDR Memory Controller is capable o=
f
> diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,zy=
nq-ddrc-a05.yaml b/Documentation/devicetree/bindings/memory-controllers/xln=
x,zynq-ddrc-a05.yaml
> index 8f72e2f8588a..7864a1c994eb 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc=
-a05.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc=
-a05.yaml
> @@ -9,7 +9,7 @@ title: Zynq A05 DDR Memory Controller
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>    - Manish Narani <manish.narani@xilinx.com>
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  description:
>    The Zynq DDR ECC controller has an optional ECC support in half-bus wi=
dth
> diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml=
 b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> index 24ddc2855b94..4734be456bde 100644
> --- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> +++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: CPM Host Controller device tree for Xilinx Versal SoCs
>
>  maintainers:
> -  - Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>
> +  - Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>
>
>  allOf:
>    - $ref: /schemas/pci/pci-bus.yaml#
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.=
yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
> index 598a042850b8..b85f9e36ce4b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Zynq Pinctrl
>
>  maintainers:
> -  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> +  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>
>  description: |
>    Please refer to pinctrl-bindings.txt in this directory for details of =
the
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctr=
l.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> index 2722dc7bb03d..cdebfa991e06 100644
> --- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx ZynqMP Pinctrl
>
>  maintainers:
> -  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> +  - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>    - Rajan Vaja <rajan.vaja@xilinx.com>
>
>  description: |
> diff --git a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-po=
wer.yaml b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.=
yaml
> index 11f1f98c1cdc..45792e216981 100644
> --- a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yam=
l
> +++ b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yam=
l
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Zynq MPSoC Power Management
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  description: |
>    The zynqmp-power node describes the power management configurations.
> diff --git a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml b=
/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> index 7ed0230f6c67..d1f5eb996dba 100644
> --- a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> @@ -11,7 +11,7 @@ description:
>    The RTC controller has separate IRQ lines for seconds and alarm.
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  allOf:
>    - $ref: rtc.yaml#
> diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Do=
cumentation/devicetree/bindings/serial/cdns,uart.yaml
> index a8b323d7bf94..e35ad1109efc 100644
> --- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Cadence UART Controller
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Doc=
umentation/devicetree/bindings/spi/spi-cadence.yaml
> index b0f83b5c2cdd..b7552739b554 100644
> --- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Cadence SPI controller
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  allOf:
>    - $ref: spi-controller.yaml#
> diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml b/Docu=
mentation/devicetree/bindings/spi/spi-xilinx.yaml
> index 6bd83836eded..4beb3af0416d 100644
> --- a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx SPI controller
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  allOf:
>    - $ref: spi-controller.yaml#
> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b=
/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> index 226d8b493b57..e5199b109dad 100644
> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx Zynq UltraScale+ MPSoC GQSPI controller
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  allOf:
>    - $ref: spi-controller.yaml#
> diff --git a/Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml b/=
Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
> index 83e8fb4a548d..7ea8fb42ce2c 100644
> --- a/Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml
> @@ -14,7 +14,7 @@ allOf:
>    - $ref: spi-controller.yaml#
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  # Everything else is described in the common file
>  properties:
> diff --git a/Documentation/devicetree/bindings/timer/cdns,ttc.yaml b/Docu=
mentation/devicetree/bindings/timer/cdns,ttc.yaml
> index bc5e6f226295..dbba780c9b02 100644
> --- a/Documentation/devicetree/bindings/timer/cdns,ttc.yaml
> +++ b/Documentation/devicetree/bindings/timer/cdns,ttc.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Cadence TTC - Triple Timer Counter
>
>  maintainers:
> -  - Michal Simek <michal.simek@xilinx.com>
> +  - Michal Simek <michal.simek@amd.com>
>
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase=
-wdt.yaml b/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wd=
t.yaml
> index 8444c56dd602..dc1ff39d05a0 100644
> --- a/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.ya=
ml
> +++ b/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.ya=
ml
> @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx AXI/PLB softcore and window Watchdog Timer
>
>  maintainers:
> -  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> -  - Srinivas Neeli <srinivas.neeli@xilinx.com>
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> +  - Srinivas Neeli <srinivas.neeli@amd.com>
>
>  description:
>    The Timebase watchdog timer(WDT) is a free-running 32 bit counter.
> --
> 2.36.1
>

Applied.
M


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
