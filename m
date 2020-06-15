Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543F01F9E21
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 19:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgFORKY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 13:10:24 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42383 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgFORKX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 13:10:23 -0400
Received: by mail-il1-f194.google.com with SMTP id j19so11856887ilk.9;
        Mon, 15 Jun 2020 10:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r803xRFcPvmpXFa1K2XnBd/d3Bh9X4F37U/xu3Rfl4k=;
        b=d+hxdzKhY0MvgdfkyGSyWaUM0l1y2ATpnEo9dZZdNwC4WFb8Jvu9vZhHHbVgBrV9fA
         GNtYvC/GFpDUV+rzI23cE0/IeY5nQ9JzTxc0vbpcFXrnmB77Iid3HUkvy5hlndMkDCm/
         /HIfiwrBiNgfV9p9CXx5fhOPlNiv3Fp1WhuEPJg+sSk0FOITJ5r2CjZm2a+NIG59pjrT
         2bdhuNEQLIdQSm8i2yGC6EidsvHfWuksyWpH9CiFEl4ZEFuY814bzKD7Sk8O8SK2Toaf
         AhdMTwHS91jO3CkWp/n0byRCp1XrYFeMC7+RS37Y70zROQ7I7IOeIqp5oAhdvoZNsR5d
         6IWQ==
X-Gm-Message-State: AOAM531ZPt17ng4E/Tyg4HaEnoMC7GCHiipg7zEvTPXKCG/HDlb3/nef
        zvSxioDZk0CaVryLOMKrDg==
X-Google-Smtp-Source: ABdhPJwYFOkv4MBunz1/x3wynbR0mIu9yWv9/lv+W7Wq5EC//9bf9NoG5DNwv6k7SCoCT0S73eCFaQ==
X-Received: by 2002:a92:1b86:: with SMTP id f6mr28209946ill.9.1592241021829;
        Mon, 15 Jun 2020 10:10:21 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g15sm8155694ilq.39.2020.06.15.10.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:10:20 -0700 (PDT)
Received: (nullmailer pid 1967664 invoked by uid 1000);
        Mon, 15 Jun 2020 17:10:18 -0000
Date:   Mon, 15 Jun 2020 11:10:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux@rempel-privat.de,
        wolfram@the-dreams.de, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2 3/3] dt-bindings: i2c: Convert imx i2c to json-schema
Message-ID: <20200615171018.GA1961591@bogus>
References: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
 <1591235358-15516-4-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591235358-15516-4-git-send-email-Anson.Huang@nxp.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 04, 2020 at 09:49:18AM +0800, Anson Huang wrote:
> Convert the i.MX I2C binding to DT schema format using json-schema,
> some improvements applied, such as update example based on latest DT
> file, add more compatible for existing SoCs, and remove unnecessary
> common property "pinctrl".
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- add "additionalProperties: false".
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.txt  |  49 ---------
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 119 +++++++++++++++++++++
>  2 files changed, 119 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.txt b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> deleted file mode 100644
> index b967544..0000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -* Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
> -
> -Required properties:
> -- compatible :
> -  - "fsl,imx1-i2c" for I2C compatible with the one integrated on i.MX1 SoC
> -  - "fsl,imx21-i2c" for I2C compatible with the one integrated on i.MX21 SoC
> -  - "fsl,vf610-i2c" for I2C compatible with the one integrated on Vybrid vf610 SoC
> -- reg : Should contain I2C/HS-I2C registers location and length
> -- interrupts : Should contain I2C/HS-I2C interrupt
> -- clocks : Should contain the I2C/HS-I2C clock specifier
> -
> -Optional properties:
> -- clock-frequency : Constains desired I2C/HS-I2C bus clock frequency in Hz.
> -  The absence of the property indicates the default frequency 100 kHz.
> -- dmas: A list of two dma specifiers, one for each entry in dma-names.
> -- dma-names: should contain "tx" and "rx".
> -- scl-gpios: specify the gpio related to SCL pin
> -- sda-gpios: specify the gpio related to SDA pin
> -- pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
> -  bus recovery, call it "gpio" state
> -
> -Examples:
> -
> -i2c@83fc4000 { /* I2C2 on i.MX51 */
> -	compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
> -	reg = <0x83fc4000 0x4000>;
> -	interrupts = <63>;
> -};
> -
> -i2c@70038000 { /* HS-I2C on i.MX51 */
> -	compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
> -	reg = <0x70038000 0x4000>;
> -	interrupts = <64>;
> -	clock-frequency = <400000>;
> -};
> -
> -i2c0: i2c@40066000 { /* i2c0 on vf610 */
> -	compatible = "fsl,vf610-i2c";
> -	reg = <0x40066000 0x1000>;
> -	interrupts =<0 71 0x04>;
> -	dmas = <&edma0 0 50>,
> -		<&edma0 0 51>;
> -	dma-names = "rx","tx";
> -	pinctrl-names = "default", "gpio";
> -	pinctrl-0 = <&pinctrl_i2c1>;
> -	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> -	scl-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>;
> -	sda-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> -};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> new file mode 100644
> index 0000000..63cceab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
> +
> +maintainers:
> +  - Wolfram Sang <wolfram@the-dreams.de>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx1-i2c
> +      - const: fsl,imx21-i2c
> +      - const: fsl,vf610-i2c
> +      - items:
> +          - const: fsl,imx35-i2c
> +          - const: fsl,imx1-i2c
> +      - items:
> +          - enum:
> +            - fsl,imx25-i2c
> +            - fsl,imx27-i2c
> +            - fsl,imx31-i2c
> +            - fsl,imx50-i2c
> +            - fsl,imx51-i2c
> +            - fsl,imx53-i2c
> +            - fsl,imx6q-i2c
> +            - fsl,imx6sl-i2c
> +            - fsl,imx6sx-i2c
> +            - fsl,imx6sll-i2c
> +            - fsl,imx6ul-i2c
> +            - fsl,imx7s-i2c
> +            - fsl,imx8mq-i2c
> +            - fsl,imx8mm-i2c
> +            - fsl,imx8mn-i2c
> +            - fsl,imx8mp-i2c
> +          - const: fsl,imx21-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ipg
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Already has a type.

> +    description: |
> +      Constains desired I2C/HS-I2C bus clock frequency in Hz.
> +      The absence of the property indicates the default frequency 100 kHz.
> +    default: 100000

The bus default is up to 3MHz. Is that valid here?

> +
> +  dmas:
> +    items:
> +      - description: DMA controller phandle and request line for RX
> +      - description: DMA controller phandle and request line for TX
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  sda-gpios:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'

*-gpios already has a type

> +    description: |
> +      gpio used for the sda signal, this should be flagged as
> +      active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
> +      from <dt-bindings/gpio/gpio.h> since the signal is by definition
> +      open drain.
> +    maxItems: 1
> +
> +  scl-gpios:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    description: |
> +      gpio used for the scl signal, this should be flagged as
> +      active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
> +      from <dt-bindings/gpio/gpio.h> since the signal is by definition
> +      open drain.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx5-clock.h>
> +    #include <dt-bindings/clock/vf610-clock.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c@83fc4000 {
> +        compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
> +        reg = <0x83fc4000 0x4000>;
> +        interrupts = <63>;
> +        clocks = <&clks IMX5_CLK_I2C2_GATE>;
> +    };
> +
> +    i2c@40066000 {
> +        compatible = "fsl,vf610-i2c";
> +        reg = <0x40066000 0x1000>;
> +        interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks VF610_CLK_I2C0>;
> +        clock-names = "ipg";
> +        dmas = <&edma0 0 50>,
> +               <&edma0 0 51>;
> +        dma-names = "rx","tx";

space                       ^

> +    };
> -- 
> 2.7.4
> 
