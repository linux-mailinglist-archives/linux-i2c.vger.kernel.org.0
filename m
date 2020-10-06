Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C941B284DB3
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 16:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgJFOaz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 10:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgJFOay (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 10:30:54 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DA6C061755;
        Tue,  6 Oct 2020 07:30:54 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id d28so6187363ote.1;
        Tue, 06 Oct 2020 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GDc+9tLOh//ohZszpQRAFznBLFF/taS4z/Oql+Felvk=;
        b=FDHRjtLdnzWjtHUZ+qNkX0eUmMPJHIO9EVNzw0NGjdkxv5PEIntcU7m0Beq2O3ssbo
         NBy8CUYb3BHB7nCwexwcT6is8uPvb5DXHWGADgyhsqsCXog20z0MFGLG7isovZe+uCk+
         fNuNSbMkeJ2ZI+fG202re59WPrayKc8U9mn5otbjEc0phM2fltBODeildI2FIjTH28Oy
         iY3vY7MOwqghA5eciDEiqwWxu/jq4wyJ83DDZzPth+Z4V3VY4bZRfQlD/BSC9wujTOxK
         ZKG6LfIpzD/L4yxn0R7lahlOzBuCvjkhrUzpkLcjDLHQvfTWzFmrpcxThYzCs176wgpY
         0xoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GDc+9tLOh//ohZszpQRAFznBLFF/taS4z/Oql+Felvk=;
        b=g1FmafpuqGlZHW2Nqzd2p9VNmVXM+NWatbLX97d2JDN+axx20SNcOSYTVkotzVf3eD
         plCUP+Aq87WjxqXuqjf1+vWZi42VMFtRbLQ+lEUX5GECWd20GM4lEUCqX6yZV2/uXPh6
         6JQIP0Cmb3K8RjWSpNHwjEz9v0mvIBQh7gtnrzMKLMS5QbD3bXiONq7gnLC2jEQ3sNX6
         LgAHBUNSOWo5h9lUDf6B1QSwgeFQ89j2NONRHLxaF9r5CNZl24RvF67jYMBQSIKWDfyI
         QVE3ON4WOJsqGAl5ioCZcobneF6zrFqupm23neT31WEmmQ/Etc/Skw4phHGdiVudKAco
         sxWQ==
X-Gm-Message-State: AOAM5312x6QgunKvHgZ7Y00sY+gr76HX9Y9Vy0vgsZfZDikveUgPjQHv
        53oRwQ31IKgG+puwsM1KmnWk6IP3myAouA==
X-Google-Smtp-Source: ABdhPJxT5diG78sVS+Q1RHT6fDf/rkSOMJ3mynW4afd/uHQFYp3qvQf/1Apwy92K+QAKtt6IIa1YOg==
X-Received: by 2002:a9d:6ada:: with SMTP id m26mr3188613otq.195.1601994649925;
        Tue, 06 Oct 2020 07:30:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q81sm951812oia.46.2020.10.06.07.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 07:30:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <83e74e8b-02ba-85a2-dda5-531dae6a3601@roeck-us.net>
Date:   Tue, 6 Oct 2020 07:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/5/20 11:38 AM, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml              | 2 ++
>  .../devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml      | 2 ++
>  Documentation/devicetree/bindings/ata/pata-common.yaml       | 2 ++
>  Documentation/devicetree/bindings/ata/sata-common.yaml       | 2 ++
>  Documentation/devicetree/bindings/bus/simple-pm-bus.yaml     | 2 ++
>  .../devicetree/bindings/chrome/google,cros-ec-typec.yaml     | 2 ++
>  .../devicetree/bindings/connector/usb-connector.yaml         | 2 ++
>  .../devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml | 2 ++
>  .../devicetree/bindings/display/dsi-controller.yaml          | 2 ++
>  Documentation/devicetree/bindings/display/panel/lvds.yaml    | 2 ++
>  .../devicetree/bindings/display/panel/panel-common.yaml      | 2 ++
>  Documentation/devicetree/bindings/dma/dma-common.yaml        | 2 ++
>  Documentation/devicetree/bindings/dma/dma-controller.yaml    | 2 ++
>  Documentation/devicetree/bindings/dma/dma-router.yaml        | 2 ++
>  Documentation/devicetree/bindings/extcon/wlf,arizona.yaml    | 2 ++
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml      | 5 ++++-
>  Documentation/devicetree/bindings/iio/common.yaml            | 2 ++
>  Documentation/devicetree/bindings/input/input.yaml           | 2 ++
>  Documentation/devicetree/bindings/input/matrix-keymap.yaml   | 2 ++
>  .../devicetree/bindings/input/touchscreen/touchscreen.yaml   | 2 ++
>  Documentation/devicetree/bindings/leds/common.yaml           | 2 ++
>  .../devicetree/bindings/leds/leds-class-multicolor.yaml      | 3 +++
>  Documentation/devicetree/bindings/leds/trigger-source.yaml   | 2 ++
>  Documentation/devicetree/bindings/media/rc.yaml              | 2 ++
>  Documentation/devicetree/bindings/mfd/syscon.yaml            | 2 +-
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml    | 2 ++
>  .../devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml     | 2 ++
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml   | 2 ++
>  .../devicetree/bindings/net/can/can-transceiver.yaml         | 2 ++
>  Documentation/devicetree/bindings/net/dsa/dsa.yaml           | 2 ++
>  .../devicetree/bindings/net/ethernet-controller.yaml         | 2 ++
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml      | 2 ++
>  Documentation/devicetree/bindings/net/mdio.yaml              | 2 ++
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml        | 2 ++
>  Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml  | 2 ++
>  Documentation/devicetree/bindings/nvmem/nvmem.yaml           | 2 ++
>  Documentation/devicetree/bindings/pci/cdns-pcie-ep.yaml      | 2 ++
>  Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml    | 2 ++
>  Documentation/devicetree/bindings/pci/cdns-pcie.yaml         | 2 ++
>  Documentation/devicetree/bindings/pci/pci-ep.yaml            | 2 ++
>  Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml | 2 ++
>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml   | 2 ++
>  Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml   | 2 ++
>  Documentation/devicetree/bindings/power/power-domain.yaml    | 2 ++
>  .../devicetree/bindings/power/supply/power-supply.yaml       | 2 ++
>  Documentation/devicetree/bindings/pwm/pwm.yaml               | 2 ++
>  Documentation/devicetree/bindings/regulator/regulator.yaml   | 2 ++
>  Documentation/devicetree/bindings/regulator/wlf,arizona.yaml | 2 ++
>  Documentation/devicetree/bindings/riscv/cpus.yaml            | 2 ++
>  Documentation/devicetree/bindings/rtc/rtc.yaml               | 2 ++
>  Documentation/devicetree/bindings/serial/rs485.yaml          | 3 +++
>  Documentation/devicetree/bindings/serial/serial.yaml         | 2 ++
>  Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml  | 2 ++
>  Documentation/devicetree/bindings/sound/amlogic,aiu.yaml     | 2 ++
>  Documentation/devicetree/bindings/sound/cirrus,madera.yaml   | 2 ++
>  .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml      | 3 +++
>  Documentation/devicetree/bindings/sound/wlf,arizona.yaml     | 2 ++
>  .../devicetree/bindings/soundwire/soundwire-controller.yaml  | 2 ++
>  Documentation/devicetree/bindings/spi/spi-controller.yaml    | 2 ++
>  Documentation/devicetree/bindings/spmi/spmi.yaml             | 2 ++
>  .../devicetree/bindings/thermal/thermal-cooling-devices.yaml | 2 ++
>  .../devicetree/bindings/thermal/thermal-sensor.yaml          | 2 ++
>  Documentation/devicetree/bindings/usb/ti,tps6598x.yaml       | 2 ++
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml           | 2 ++
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml     | 2 ++

For watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

>  65 files changed, 134 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 1222bf1831fa..14cd727d3c4b 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -341,6 +341,8 @@ required:
>  dependencies:
>    rockchip,pmu: [enable-method]
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      cpus {
> diff --git a/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml b/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
> index 1043e4be4fca..c9675c4cdc1b 100644
> --- a/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
> +++ b/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
> @@ -30,6 +30,8 @@ properties:
>        Specifies the bpmp node that needs to be queried to get
>        operating point data for all CPUs.
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      cpus {
> diff --git a/Documentation/devicetree/bindings/ata/pata-common.yaml b/Documentation/devicetree/bindings/ata/pata-common.yaml
> index fc5ebbe7108d..2412894a255d 100644
> --- a/Documentation/devicetree/bindings/ata/pata-common.yaml
> +++ b/Documentation/devicetree/bindings/ata/pata-common.yaml
> @@ -47,4 +47,6 @@ patternProperties:
>            The ID number of the drive port, 0 for the master port and 1 for the
>            slave port.
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/ata/sata-common.yaml b/Documentation/devicetree/bindings/ata/sata-common.yaml
> index 6783a4dec6b5..7ac77b1c5850 100644
> --- a/Documentation/devicetree/bindings/ata/sata-common.yaml
> +++ b/Documentation/devicetree/bindings/ata/sata-common.yaml
> @@ -47,4 +47,6 @@ patternProperties:
>            multiplier making it possible to connect up to 15 disks to a single
>            SATA port.
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> index 33326ffdb266..182134d7a6a3 100644
> --- a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> @@ -61,6 +61,8 @@ anyOf:
>    - required:
>        - power-domains
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,gcc-msm8996.h>
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> index 6d7396ab8bee..2d98f7c4d3bc 100644
> --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> @@ -26,6 +26,8 @@ properties:
>  required:
>    - compatible
>  
> +additionalProperties: true #fixme
> +
>  examples:
>    - |+
>      spi0 {
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index dc6ff64422d4..f037d65b018e 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -172,6 +172,8 @@ allOf:
>          type:
>            const: micro
>  
> +additionalProperties: true
> +
>  examples:
>    # Micro-USB connector with HS lines routed via controller (MUIC).
>    - |
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> index 012aa8e7cb8c..e42cb610f545 100644
> --- a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> @@ -66,3 +66,5 @@ required:
>    - clocks
>    - ports
>    - reg
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> index a02039e3aca0..ca21671f6bdd 100644
> --- a/Documentation/devicetree/bindings/display/dsi-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> @@ -73,6 +73,8 @@ patternProperties:
>      required:
>        - reg
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index 946dd354256c..31164608ba1d 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -112,4 +112,6 @@ oneOf:
>    - required:
>        - ports
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 45fe8fe5faba..cd6dc5461721 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -163,4 +163,6 @@ dependencies:
>    width-mm: [ height-mm ]
>    height-mm: [ width-mm ]
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
> index c36592683340..307b499e8968 100644
> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
> @@ -49,3 +49,5 @@ properties:
>  
>  required:
>    - "#dma-cells"
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/dma/dma-controller.yaml b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> index c39f6de76670..0043b91da95e 100644
> --- a/Documentation/devicetree/bindings/dma/dma-controller.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> @@ -17,6 +17,8 @@ properties:
>    $nodename:
>      pattern: "^dma-controller(@.*)?$"
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      dma: dma-controller@48000000 {
> diff --git a/Documentation/devicetree/bindings/dma/dma-router.yaml b/Documentation/devicetree/bindings/dma/dma-router.yaml
> index 5b5f07393135..4cee5667b8a8 100644
> --- a/Documentation/devicetree/bindings/dma/dma-router.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-router.yaml
> @@ -36,6 +36,8 @@ required:
>    - "#dma-cells"
>    - dma-masters
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      sdma_xbar: dma-router@4a002b78 {
> diff --git a/Documentation/devicetree/bindings/extcon/wlf,arizona.yaml b/Documentation/devicetree/bindings/extcon/wlf,arizona.yaml
> index f9845dc2f5ae..5fe784f487c5 100644
> --- a/Documentation/devicetree/bindings/extcon/wlf,arizona.yaml
> +++ b/Documentation/devicetree/bindings/extcon/wlf,arizona.yaml
> @@ -123,3 +123,5 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/uint32"
>      minimum: 0
>      maximum: 3
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 16d76482b4ff..cfb66ba45ee8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -46,6 +46,8 @@ properties:
>    "#io-channel-cells":
>      const: 1
>  
> +  io-channel-ranges: true
> +
>    vdd-supply: true
>  
>    samsung,syscon-phandle:
> @@ -107,7 +109,8 @@ allOf:
>            items:
>              - const: adc
>  
> -additionalProperties: false
> +additionalProperties:
> +  type: object
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/common.yaml b/Documentation/devicetree/bindings/iio/common.yaml
> index 97ffcb77043d..f845b41d74c4 100644
> --- a/Documentation/devicetree/bindings/iio/common.yaml
> +++ b/Documentation/devicetree/bindings/iio/common.yaml
> @@ -32,4 +32,6 @@ properties:
>        considered 'near' to the device (an object is near to the
>        sensor).
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
> index 8edcb3c31270..ab407f266bef 100644
> --- a/Documentation/devicetree/bindings/input/input.yaml
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -33,3 +33,5 @@ properties:
>        power off automatically. Device with key pressed shutdown feature can
>        specify this property.
>      $ref: /schemas/types.yaml#/definitions/uint32
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.yaml b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> index c3bf09156783..6699d5e32dca 100644
> --- a/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> +++ b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> @@ -35,6 +35,8 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: Number of column lines connected to the keypad controller.
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      keypad {
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> index 36dc7b56a453..a771a15f053f 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> @@ -81,3 +81,5 @@ dependencies:
>    touchscreen-size-y: [ touchscreen-size-x ]
>    touchscreen-x-mm: [ touchscreen-y-mm ]
>    touchscreen-y-mm: [ touchscreen-x-mm ]
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index a2a541bca73c..08b6700ca61e 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -156,6 +156,8 @@ properties:
>        Maximum timeout in microseconds after which the flash LED is turned off.
>        Required for flash LED nodes with configurable timeout.
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> index b55e1f1308a4..b1a53f054b89 100644
> --- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -34,4 +34,7 @@ patternProperties:
>  
>      required:
>        - color
> +
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/leds/trigger-source.yaml b/Documentation/devicetree/bindings/leds/trigger-source.yaml
> index 0618003e40bd..89a1cde2b8aa 100644
> --- a/Documentation/devicetree/bindings/leds/trigger-source.yaml
> +++ b/Documentation/devicetree/bindings/leds/trigger-source.yaml
> @@ -21,4 +21,6 @@ properties:
>        trigger sources (e.g. a specific USB port).
>      enum: [ 0, 1 ]
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index ded2ac43237d..8ad2cba5f61f 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -150,3 +150,5 @@ properties:
>        - rc-x96max
>        - rc-xbox-dvd
>        - rc-zx-irdec
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 844ee2a6ce05..5317a7d69aa5 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -71,7 +71,7 @@ required:
>    - compatible
>    - reg
>  
> -unevaluatedProperties: false
> +additionalProperties: true
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index b96da0c7f819..57319b425eaa 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -349,6 +349,8 @@ dependencies:
>    cd-debounce-delay-ms: [ cd-gpios ]
>    fixed-emmc-driver-type: [ non-removable ]
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      mmc@ab000000 {
> diff --git a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml
> index 85bd528e9a14..8dfad89c78a7 100644
> --- a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml
> @@ -62,3 +62,5 @@ properties:
>  
>    dma-names:
>      const: rx-tx
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 40fc5b0b2b8c..274bbe6a365e 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -128,6 +128,8 @@ required:
>    - "#address-cells"
>    - "#size-cells"
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      nand-controller {
> diff --git a/Documentation/devicetree/bindings/net/can/can-transceiver.yaml b/Documentation/devicetree/bindings/net/can/can-transceiver.yaml
> index 6396977d29e5..d1ef1fe6ab29 100644
> --- a/Documentation/devicetree/bindings/net/can/can-transceiver.yaml
> +++ b/Documentation/devicetree/bindings/net/can/can-transceiver.yaml
> @@ -16,3 +16,5 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: a positive non 0 value that determines the max speed that CAN/CAN-FD can run.
>      minimum: 1
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> index 6a1ec50ad4fd..a765ceba28c6 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -89,4 +89,6 @@ oneOf:
>    - required:
>        - ethernet-ports
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index fa2baca8c726..3fd85ce37e9c 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -205,4 +205,6 @@ properties:
>            required:
>              - speed
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index a9e547ac7905..6dd72faebd89 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -177,6 +177,8 @@ properties:
>  required:
>    - reg
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      ethernet {
> diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> index 26afb556dfae..e811e0fd851c 100644
> --- a/Documentation/devicetree/bindings/net/mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> @@ -100,6 +100,8 @@ patternProperties:
>      required:
>        - reg
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      davinci_mdio: mdio@5c030000 {
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 30a1efd26626..11a6fdb657c9 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -356,6 +356,8 @@ allOf:
>              Enables the TSO feature otherwise it will be managed by
>              MAC HW capability register.
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      stmmac_axi_setup: stmmac-axi-config {
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> index b7c00ed31085..d5d7f113bade 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> @@ -36,6 +36,8 @@ dependencies:
>    nvmem-names: [ nvmem ]
>    nvmem-cell-names: [ nvmem-cells ]
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      tsens {
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> index b459f9dba6c9..7481a9e48f19 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> @@ -67,6 +67,8 @@ patternProperties:
>      required:
>        - reg
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>        #include <dt-bindings/gpio/gpio.h>
> diff --git a/Documentation/devicetree/bindings/pci/cdns-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/cdns-pcie-ep.yaml
> index 016a5f61592d..60b8baf299bb 100644
> --- a/Documentation/devicetree/bindings/pci/cdns-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/cdns-pcie-ep.yaml
> @@ -22,3 +22,5 @@ properties:
>  
>  required:
>    - cdns,max-outbound-regions
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
> index 303078a7b7a8..a944f9bfffff 100644
> --- a/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
> @@ -33,3 +33,5 @@ properties:
>      deprecated: true
>  
>    msi-parent: true
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pci/cdns-pcie.yaml b/Documentation/devicetree/bindings/pci/cdns-pcie.yaml
> index 02553d5e6c51..df4fe28222b0 100644
> --- a/Documentation/devicetree/bindings/pci/cdns-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/cdns-pcie.yaml
> @@ -21,3 +21,5 @@ properties:
>      items:
>        - const: pcie-phy
>      # FIXME: names when more than 1
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pci/pci-ep.yaml b/Documentation/devicetree/bindings/pci/pci-ep.yaml
> index 0f8e575ac01a..7847bbcd4a03 100644
> --- a/Documentation/devicetree/bindings/pci/pci-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/pci-ep.yaml
> @@ -36,3 +36,5 @@ properties:
>  
>  required:
>    - compatible
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
> index 6bfc25d0e1b3..4cb174bf31ff 100644
> --- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
> @@ -120,3 +120,5 @@ properties:
>  required:
>    - pinctrl-0
>    - pinctrl-names
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index 13b7ab9dd6d5..71ed0a9def84 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -138,3 +138,5 @@ properties:
>        and the delay before latching a value to an output
>        pin. Typically indicates how many double-inverters are
>        used to delay the signal.
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> index ef8877ddb1eb..551df3d9b809 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> @@ -129,3 +129,5 @@ properties:
>  
>    pinctrl-pin-array:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> index dd564349aa53..aed51e9dcb11 100644
> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> @@ -69,6 +69,8 @@ properties:
>  required:
>    - "#power-domain-cells"
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      power: power-controller@12340000 {
> diff --git a/Documentation/devicetree/bindings/power/supply/power-supply.yaml b/Documentation/devicetree/bindings/power/supply/power-supply.yaml
> index 3bb02bb3a2d8..c5c55f627251 100644
> --- a/Documentation/devicetree/bindings/power/supply/power-supply.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/power-supply.yaml
> @@ -16,6 +16,8 @@ properties:
>        This property is added to a supply in order to list the devices which
>        supply it power, referenced by their phandles.
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      power {
> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
> index fa4f9de92090..7d1f687cee9c 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
> @@ -20,6 +20,8 @@ properties:
>  required:
>    - "#pwm-cells"
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      pwm: pwm@7000a000 {
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
> index ec505dbbf87c..6d0bc9cd4040 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
> @@ -188,6 +188,8 @@ patternProperties:
>  
>      additionalProperties: false
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      xyzreg: regulator {
> diff --git a/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml b/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
> index a0aea73bf412..7b4ae5d23351 100644
> --- a/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
> +++ b/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
> @@ -35,3 +35,5 @@ properties:
>        Initial data for the MICVDD regulator.
>      $ref: "regulator.yaml#"
>      type: object
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index f80ba2c66f71..c6925e0b16e4 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -91,6 +91,8 @@ required:
>    - riscv,isa
>    - interrupt-controller
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      // Example 1: SiFive Freedom U540G Development Kit
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> index ee237b2ed66a..2d055e37e6f7 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -47,4 +47,6 @@ properties:
>      description:
>        Enables wake up of host system on alarm.
>  
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/serial/rs485.yaml b/Documentation/devicetree/bindings/serial/rs485.yaml
> index fe90569475e1..0c9fa694f85c 100644
> --- a/Documentation/devicetree/bindings/serial/rs485.yaml
> +++ b/Documentation/devicetree/bindings/serial/rs485.yaml
> @@ -45,4 +45,7 @@ properties:
>    rs485-term-gpios:
>      description: GPIO pin to enable RS485 bus termination.
>      maxItems: 1
> +
> +additionalProperties: true
> +
>  ...
> diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
> index 8645d0e526b4..65e75d040521 100644
> --- a/Documentation/devicetree/bindings/serial/serial.yaml
> +++ b/Documentation/devicetree/bindings/serial/serial.yaml
> @@ -124,6 +124,8 @@ patternProperties:
>        required:
>          - compatible
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      serial@1234 {
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
> index 3cbf2d28a188..80d99861fec5 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
> @@ -35,6 +35,8 @@ required:
>    - compatible
>    - reg
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      bus@30000000 {
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
> index 7a7f28469624..f50558ed914f 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
> @@ -75,6 +75,8 @@ required:
>    - reg
>    - resets
>  
> +additionalProperties: false
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/gxbb-clkc.h>
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,madera.yaml b/Documentation/devicetree/bindings/sound/cirrus,madera.yaml
> index c4cd58b5acd4..23138ddcb62d 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,madera.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,madera.yaml
> @@ -111,3 +111,5 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 2
>      maxItems: 2
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> index 44ee9d844ae0..d77219727768 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> @@ -67,6 +67,9 @@ required:
>    - "#size-cells"
>    - ranges
>  
> +additionalProperties:
> +  type: object
> +
>  examples:
>    - |
>      #include<dt-bindings/clock/tegra210-car.h>
> diff --git a/Documentation/devicetree/bindings/sound/wlf,arizona.yaml b/Documentation/devicetree/bindings/sound/wlf,arizona.yaml
> index 22d54be7900a..1627c0bb69be 100644
> --- a/Documentation/devicetree/bindings/sound/wlf,arizona.yaml
> +++ b/Documentation/devicetree/bindings/sound/wlf,arizona.yaml
> @@ -112,3 +112,5 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 1
>      maxItems: 12
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> index 330924b8618e..4aad121eff3f 100644
> --- a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> @@ -57,6 +57,8 @@ required:
>    - "#address-cells"
>    - "#size-cells"
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      soundwire@c2d0000 {
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index c6a2f543648b..2b154803b181 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -140,6 +140,8 @@ patternProperties:
>        - compatible
>        - reg
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      spi@f00 {
> diff --git a/Documentation/devicetree/bindings/spmi/spmi.yaml b/Documentation/devicetree/bindings/spmi/spmi.yaml
> index 0cfbf56ba825..173940930719 100644
> --- a/Documentation/devicetree/bindings/spmi/spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
> @@ -55,6 +55,8 @@ patternProperties:
>  required:
>    - reg
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      #include <dt-bindings/spmi/spmi.h>
> diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
> index ad4beaf02842..f004779ba9b3 100644
> --- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
> +++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
> @@ -49,6 +49,8 @@ properties:
>        and the second cell is the maximum cooling state requested.
>      const: 2
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> diff --git a/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
> index 727d04550324..9f747921e851 100644
> --- a/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
> +++ b/Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
> @@ -36,6 +36,8 @@ properties:
>        containing several internal sensors.
>      enum: [0, 1]
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> index 8eaf4b6c4735..f6819bf2a3b5 100644
> --- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> @@ -32,6 +32,8 @@ required:
>    - interrupts
>    - interrupt-names
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> index 7263b7f2b510..b545b087b342 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -22,6 +22,8 @@ properties:
>      description:
>        Name specifier for the USB PHY
>  
> +additionalProperties: true
> +
>  examples:
>    - |
>      usb {
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> index 187bf6cb62bf..4e2c26cd981d 100644
> --- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -23,4 +23,6 @@ properties:
>      description:
>        Contains the watchdog timeout in seconds.
>  
> +additionalProperties: true
> +
>  ...
> 

