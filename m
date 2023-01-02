Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEC765ADDC
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jan 2023 09:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjABIGs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Jan 2023 03:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjABIGr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Jan 2023 03:06:47 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E559C1092;
        Mon,  2 Jan 2023 00:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672646804; x=1704182804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=veKOufvzsDh8m+WG9BQ4mPSrOlaa4WGpJHiH80CC9b0=;
  b=j0rg66bTUvuWR3a3oriqm4ts40q19b5p8GX1WfRriquVdOmZF66c/taP
   p5WFXTvOJ1N4iK3mvDVs8+UXBvKKXvMzO/dv07vmF3lsuNDxqsJZnJ+G9
   hFwHCA+4vYdzrPMXUj4Qn+xvmAOa2Z9nPRaSn48wIveg8sGCltIIBz3Sw
   ELI8sJd3iEQEOpDgXRur1g0ImTx8nzV6jrhRF+Qf/O1eQDqq82vSBi8hF
   otB2iWTXdHpiD/zDX1Qk6nxwUj0bb6yHrKJCuoUYWVtgAmfgG7/GmpiU1
   iNw2AASlgThR3VA89jJ6tRtce23k5e9CNTtUC7OJbu7lecepALmAp1hld
   g==;
X-IronPort-AV: E=Sophos;i="5.96,293,1665439200"; 
   d="scan'208";a="28196760"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jan 2023 09:06:42 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 02 Jan 2023 09:06:42 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 02 Jan 2023 09:06:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672646802; x=1704182802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=veKOufvzsDh8m+WG9BQ4mPSrOlaa4WGpJHiH80CC9b0=;
  b=edFioQnHHr7w9BjycbJNb05T+xPXI3pUtOicw1oee38Sc3+lT1mYj5l2
   qdlDzvaHWO5rC+VXT7YZR5kFqpBpK3iCU/bkjUVkTDVMW0M5sb6CISXRJ
   9GmYl8LHG+4uaqi59fOAvjwhe8WbpIacZh8opYZ/KWje8vhP3RhXc7rJz
   J6c83J3wEhas28Oo/Pkly0y8aTLyVfAyPUz8mOnY+kTQNByIEae18zd0w
   Wc2xocJV5Mlv/NSU5EdgWiiloufY08yMQjQOt4CR0FVI88yqyywFzHZeM
   KnkaqCFqw4D/iK9eKD+BNep4aP/wP/EGdeBwmvd2z9JqKRalYOQbzRUiS
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,293,1665439200"; 
   d="scan'208";a="28196759"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jan 2023 09:06:41 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        by vtuxmail01.tq-net.de (Postfix) with ESMTP id A2C43280072;
        Mon,  2 Jan 2023 09:06:41 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ping.bai@nxp.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: imx8m: Integrate duplicated i.MX 8M schemas
Date:   Mon, 02 Jan 2023 09:04:37 +0100
Message-ID: <3225978.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221223030708.91459-1-peng.fan@oss.nxp.com>
References: <20221223030708.91459-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Peng,

Am Freitag, 23. Dezember 2022, 04:07:08 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX8MM/N/P/Q IOMUXC schemas are basically the same, it does not to
> have four schemas for almost the same binding.

Nice, just one nit below.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  ...mm-pinctrl.yaml => fsl,imx8m-pinctrl.yaml} | 16 ++--
>  .../bindings/pinctrl/fsl,imx8mn-pinctrl.yaml  | 84 -------------------
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml  | 84 -------------------
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml  | 84 -------------------
>  4 files changed, 10 insertions(+), 258 deletions(-)
>  rename Documentation/devicetree/bindings/pinctrl/{fsl,imx8mm-pinctrl.yaml
> => fsl,imx8m-pinctrl.yaml} (82%) delete mode 100644
> Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml delete
> mode 100644
> Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml delete
> mode 100644
> Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml
> similarity index 82%
> rename from
> Documentation/devicetree/bindings/pinctrl/fsl,imx8mm-pinctrl.yaml rename to
> Documentation/devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml index
> 6717f163390b..949d962a97b4 100644
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
>    Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this
> directory @@ -15,7 +15,11 @@ description:
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
>            each entry consists of 6 integers and represents the mux and
> config setting for one pin. The first 5 integers <mux_reg conf_reg
> input_reg mux_val input_val> are specified using a PIN_FUNC_ID macro, which
> can -          be found in
> <arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h>. The last +          be
> found in <arch/arm64/boot/dts/freescale/imx8m[m,n,p,q]-pinfunc.h>. The last
> integer CONFIG is the pad setting value like pull-up on this pin. Please - 
>         refer to i.MX8M Mini Reference Manual for detailed CONFIG settings.
> +          refer to i.MX8M Quad/Mini/Nano/Plus  Reference Manual for

Please sort this alphabetically, similar to the compatible list. Thanks
Alexander

> detailed CONFIG settings. $ref:
> /schemas/types.yaml#/definitions/uint32-matrix
>          items:
>            items:
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml deleted
> file mode 100644
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
> -  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this
> directory -  for common binding part and usage.
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
> -      Pinctrl node's client devices use subnodes for desired pin
> configuration. -      Client device subnodes use below standard properties.
> -
> -    properties:
> -      fsl,pins:
> -        description:
> -          each entry consists of 6 integers and represents the mux and
> config -          setting for one pin. The first 5 integers <mux_reg
> conf_reg input_reg -          mux_val input_val> are specified using a
> PIN_FUNC_ID macro, which can -          be found in
> <arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h>. The last -         
> integer CONFIG is the pad setting value like pull-up on this pin. Please - 
>         refer to i.MX8M Nano Reference Manual for detailed CONFIG settings.
> -        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> -        items:
> -          items:
> -            - description: |
> -                "mux_reg" indicates the offset of mux register.
> -            - description: |
> -                "conf_reg" indicates the offset of pad configuration
> register. -            - description: |
> -                "input_reg" indicates the offset of select input register.
> -            - description: |
> -                "mux_val" indicates the mux value to be applied.
> -            - description: |
> -                "input_val" indicates the select input value to be applied.
> -            - description: |
> -                "pad_setting" indicates the pad configuration value to be
> applied. -
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
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml deleted
> file mode 100644
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
> -  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this
> directory -  for common binding part and usage.
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
> -      Pinctrl node's client devices use subnodes for desired pin
> configuration. -      Client device subnodes use below standard properties.
> -
> -    properties:
> -      fsl,pins:
> -        description:
> -          each entry consists of 6 integers and represents the mux and
> config -          setting for one pin. The first 5 integers <mux_reg
> conf_reg input_reg -          mux_val input_val> are specified using a
> PIN_FUNC_ID macro, which can -          be found in
> <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last -         
> integer CONFIG is the pad setting value like pull-up on this pin. Please - 
>         refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
> -        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> -        items:
> -          items:
> -            - description: |
> -                "mux_reg" indicates the offset of mux register.
> -            - description: |
> -                "conf_reg" indicates the offset of pad configuration
> register. -            - description: |
> -                "input_reg" indicates the offset of select input register.
> -            - description: |
> -                "mux_val" indicates the mux value to be applied.
> -            - description: |
> -                "input_val" indicates the select input value to be applied.
> -            - description: |
> -                "pad_setting" indicates the pad configuration value to be
> applied. -
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
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml deleted
> file mode 100644
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
> -  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this
> directory -  for common binding part and usage.
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
> -      Pinctrl node's client devices use subnodes for desired pin
> configuration. -      Client device subnodes use below standard properties.
> -
> -    properties:
> -      fsl,pins:
> -        description:
> -          each entry consists of 6 integers and represents the mux and
> config -          setting for one pin. The first 5 integers <mux_reg
> conf_reg input_reg -          mux_val input_val> are specified using a
> PIN_FUNC_ID macro, which can -          be found in
> <arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h>. The last -         
> integer CONFIG is the pad setting value like pull-up on this pin. Please - 
>         refer to i.MX8M Quad Reference Manual for detailed CONFIG settings.
> -        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> -        items:
> -          items:
> -            - description: |
> -                "mux_reg" indicates the offset of mux register.
> -            - description: |
> -                "conf_reg" indicates the offset of pad configuration
> register. -            - description: |
> -                "input_reg" indicates the offset of select input register.
> -            - description: |
> -                "mux_val" indicates the mux value to be applied.
> -            - description: |
> -                "input_val" indicates the select input value to be applied.
> -            - description: |
> -                "pad_setting" indicates the pad configuration value to be
> applied. -
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



