Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6C2654D9C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 09:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236021AbiLWIkC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Dec 2022 03:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235834AbiLWIkA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Dec 2022 03:40:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B54935798
        for <linux-i2c@vger.kernel.org>; Fri, 23 Dec 2022 00:39:59 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p8daf-0008Ux-EH; Fri, 23 Dec 2022 09:39:41 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p8dae-0007N9-FC; Fri, 23 Dec 2022 09:39:40 +0100
Date:   Fri, 23 Dec 2022 09:39:40 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ping.bai@nxp.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: imx8m: Integrate duplicated i.MX
 8M schemas
Message-ID: <20221223083940.cqjs6mvatnhsxvvx@pengutronix.de>
References: <20221223030708.91459-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223030708.91459-1-peng.fan@oss.nxp.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peng,

On 22-12-23, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX8MM/N/P/Q IOMUXC schemas are basically the same, it does not to
> have four schemas for almost the same binding.

Nice, just two nits see below.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  ...mm-pinctrl.yaml => fsl,imx8m-pinctrl.yaml} | 16 ++--
>  .../bindings/pinctrl/fsl,imx8mn-pinctrl.yaml  | 84 -------------------
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml  | 84 -------------------
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml  | 84 -------------------
>  4 files changed, 10 insertions(+), 258 deletions(-)
>  rename Documentation/devicetree/bindings/pinctrl/{fsl,imx8mm-pinctrl.yaml => fsl,imx8m-pinctrl.yaml} (82%)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
> similarity index 82%
> rename from Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml
> rename to Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
> index 6717f163390b..949d962a97b4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
> @@ -1,13 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mm-pinctrl.yaml#
> +$id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Freescale IMX8MM IOMUX Controller
> +title: Freescale IMX8M IOMUX Controller
>  
>  maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> +  - Peng Fan <peng.fan@nxp.com>
>  
>  description:
>    Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> @@ -15,7 +15,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: fsl,imx8mm-iomuxc
> +    enum:
> +      - fsl,imx8mm-iomuxc
> +      - fsl,imx8mn-iomuxc
> +      - fsl,imx8mp-iomuxc
> +      - fsl,imx8mq-iomuxc
>  
>    reg:
>      maxItems: 1
> @@ -34,9 +38,9 @@ patternProperties:
>            each entry consists of 6 integers and represents the mux and config
>            setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
>            mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> -          be found in <arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h>. The last
> +          be found in <arch/arm64/boot/dts/freescale/imx8m[m,n,p,q]-pinfunc.h>. The last
>            integer CONFIG is the pad setting value like pull-up on this pin. Please
> -          refer to i.MX8M Mini Reference Manual for detailed CONFIG settings.
> +          refer to i.MX8M Quad/Mini/Nano/Plus  Reference Manual for detailed CONFIG settings.
						 ^
				 duplicated whitespace and the line
				 looks rather long. Are these 80chars?

Regards,
  Marco


>          $ref: /schemas/types.yaml#/definitions/uint32-matrix
>          items:
>            items:
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
> deleted file mode 100644
> index b1cdbb56d4e4..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mn-pinctrl.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Freescale IMX8MN IOMUX Controller
> -
> -maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> -
> -description:
> -  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> -  for common binding part and usage.
> -
> -properties:
> -  compatible:
> -    const: fsl,imx8mn-iomuxc
> -
> -  reg:
> -    maxItems: 1
> -
> -# Client device subnode's properties
> -patternProperties:
> -  'grp$':
> -    type: object
> -    description:
> -      Pinctrl node's client devices use subnodes for desired pin configuration.
> -      Client device subnodes use below standard properties.
> -
> -    properties:
> -      fsl,pins:
> -        description:
> -          each entry consists of 6 integers and represents the mux and config
> -          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> -          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> -          be found in <arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h>. The last
> -          integer CONFIG is the pad setting value like pull-up on this pin. Please
> -          refer to i.MX8M Nano Reference Manual for detailed CONFIG settings.
> -        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> -        items:
> -          items:
> -            - description: |
> -                "mux_reg" indicates the offset of mux register.
> -            - description: |
> -                "conf_reg" indicates the offset of pad configuration register.
> -            - description: |
> -                "input_reg" indicates the offset of select input register.
> -            - description: |
> -                "mux_val" indicates the mux value to be applied.
> -            - description: |
> -                "input_val" indicates the select input value to be applied.
> -            - description: |
> -                "pad_setting" indicates the pad configuration value to be applied.
> -
> -    required:
> -      - fsl,pins
> -
> -    additionalProperties: false
> -
> -allOf:
> -  - $ref: "pinctrl.yaml#"
> -
> -required:
> -  - compatible
> -  - reg
> -
> -additionalProperties: false
> -
> -examples:
> -  # Pinmux controller node
> -  - |
> -    iomuxc: pinctrl@30330000 {
> -        compatible = "fsl,imx8mn-iomuxc";
> -        reg = <0x30330000 0x10000>;
> -
> -        pinctrl_uart2: uart2grp {
> -            fsl,pins =
> -                <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
> -                <0x240 0x4A8 0x000 0x0 0x0	0x140>;
> -        };
> -    };
> -
> -...
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> deleted file mode 100644
> index 4eed3a4e153a..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mp-pinctrl.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Freescale IMX8MP IOMUX Controller
> -
> -maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> -
> -description:
> -  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> -  for common binding part and usage.
> -
> -properties:
> -  compatible:
> -    const: fsl,imx8mp-iomuxc
> -
> -  reg:
> -    maxItems: 1
> -
> -# Client device subnode's properties
> -patternProperties:
> -  'grp$':
> -    type: object
> -    description:
> -      Pinctrl node's client devices use subnodes for desired pin configuration.
> -      Client device subnodes use below standard properties.
> -
> -    properties:
> -      fsl,pins:
> -        description:
> -          each entry consists of 6 integers and represents the mux and config
> -          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> -          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> -          be found in <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last
> -          integer CONFIG is the pad setting value like pull-up on this pin. Please
> -          refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
> -        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> -        items:
> -          items:
> -            - description: |
> -                "mux_reg" indicates the offset of mux register.
> -            - description: |
> -                "conf_reg" indicates the offset of pad configuration register.
> -            - description: |
> -                "input_reg" indicates the offset of select input register.
> -            - description: |
> -                "mux_val" indicates the mux value to be applied.
> -            - description: |
> -                "input_val" indicates the select input value to be applied.
> -            - description: |
> -                "pad_setting" indicates the pad configuration value to be applied.
> -
> -    required:
> -      - fsl,pins
> -
> -    additionalProperties: false
> -
> -allOf:
> -  - $ref: "pinctrl.yaml#"
> -
> -required:
> -  - compatible
> -  - reg
> -
> -additionalProperties: false
> -
> -examples:
> -  # Pinmux controller node
> -  - |
> -    iomuxc: pinctrl@30330000 {
> -        compatible = "fsl,imx8mp-iomuxc";
> -        reg = <0x30330000 0x10000>;
> -
> -        pinctrl_uart2: uart2grp {
> -            fsl,pins =
> -                <0x228 0x488 0x5F0 0x0 0x6	0x49>,
> -                <0x228 0x488 0x000 0x0 0x0	0x49>;
> -        };
> -    };
> -
> -...
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> deleted file mode 100644
> index d4a8ea5551a5..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mq-pinctrl.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Freescale IMX8MQ IOMUX Controller
> -
> -maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> -
> -description:
> -  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> -  for common binding part and usage.
> -
> -properties:
> -  compatible:
> -    const: fsl,imx8mq-iomuxc
> -
> -  reg:
> -    maxItems: 1
> -
> -# Client device subnode's properties
> -patternProperties:
> -  'grp$':
> -    type: object
> -    description:
> -      Pinctrl node's client devices use subnodes for desired pin configuration.
> -      Client device subnodes use below standard properties.
> -
> -    properties:
> -      fsl,pins:
> -        description:
> -          each entry consists of 6 integers and represents the mux and config
> -          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> -          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> -          be found in <arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h>. The last
> -          integer CONFIG is the pad setting value like pull-up on this pin. Please
> -          refer to i.MX8M Quad Reference Manual for detailed CONFIG settings.
> -        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> -        items:
> -          items:
> -            - description: |
> -                "mux_reg" indicates the offset of mux register.
> -            - description: |
> -                "conf_reg" indicates the offset of pad configuration register.
> -            - description: |
> -                "input_reg" indicates the offset of select input register.
> -            - description: |
> -                "mux_val" indicates the mux value to be applied.
> -            - description: |
> -                "input_val" indicates the select input value to be applied.
> -            - description: |
> -                "pad_setting" indicates the pad configuration value to be applied.
> -
> -    required:
> -      - fsl,pins
> -
> -    additionalProperties: false
> -
> -allOf:
> -  - $ref: "pinctrl.yaml#"
> -
> -required:
> -  - compatible
> -  - reg
> -
> -additionalProperties: false
> -
> -examples:
> -  # Pinmux controller node
> -  - |
> -    iomuxc: pinctrl@30330000 {
> -        compatible = "fsl,imx8mq-iomuxc";
> -        reg = <0x30330000 0x10000>;
> -
> -        pinctrl_uart1: uart1grp {
> -            fsl,pins =
> -                <0x234 0x49C 0x4F4 0x0 0x0	0x49>,
> -                <0x238 0x4A0 0x4F4 0x0 0x0	0x49>;
> -        };
> -    };
> -
> -...
> -- 
> 2.37.1
> 
> 
> 
