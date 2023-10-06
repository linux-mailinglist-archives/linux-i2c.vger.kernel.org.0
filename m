Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDADC7BB7BB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 14:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbjJFMdv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 08:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbjJFMdu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 08:33:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4B8EA
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 05:33:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-991c786369cso354178166b.1
        for <linux-i2c@vger.kernel.org>; Fri, 06 Oct 2023 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696595626; x=1697200426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCYV+HC7XcD59t+hsA8EwItmrpXkTbykkq+WOk3qcFw=;
        b=qucpv4YYTprpzpGj+N3AFlkxs1NHnyGVARTVtWL9eUg0XDp+8xklrOsLcMVxs1SGb1
         9uRAzCXJELwlNCR92Ra3/yzgvuxUxVCc2wDug2azWJW1PloW+uR5TBKLU1Eus8dVWfjS
         7SGTX0I8dwOa4InbI1u4oLFYf56bUsGOvF/izZCNm9VcQH8z+J6voG3YHbQgxusU8ULk
         g0s/YJ6dnaRn3MzLWsTHh7EHvghGStJe6ca5R7d4FRyVezfd0fM2sbb0O6qpyxm85ucd
         WwBPtjVv58FrkLZa6N3BFM6MsRmS22mlXKf2ySh7Ckft42AK+dLONAXjVPaOLYBLOI7e
         pE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696595626; x=1697200426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCYV+HC7XcD59t+hsA8EwItmrpXkTbykkq+WOk3qcFw=;
        b=I10+1Chnt2VYF9FDVuT3UceaZhBv03mbt6VZksd8biFznCKTvZNnCIUwDeLgSOe/3J
         JGuPxOWnoz/MJmyhklBYYt2AlQHFiX7c5dVetkEx9+spHjOLXBTF1ILw3idZk8QyNqo2
         iAczop2tPoi1CYidZflLqbZoh0pWgF2M/kGixRJp9mAnFo8V2tLorY4jvhjUi3iHY+92
         5HJbpu+KCjiBhN/4IcTEC6XiUOnoA1mDR1qoKQ7IId3moP3LNZ86yxLllsX1kQq85QyV
         sbwa8ycpzdq/Y/ByFO8Wh74EzzKbjRH0tzbbuymxLNJqoXULW5gkPbcBktuKz/6x535e
         sFQg==
X-Gm-Message-State: AOJu0YzxoJ5R7V8YB/523BewhclB+i4thlKfLDqJJRZNlI7VZzlPWsIr
        9T5XqE7lszLJihtJ/RjMS8m7mw==
X-Google-Smtp-Source: AGHT+IH6PozXCF4HnKdhwkRJKtOJc08eMDYgjx73aJ3iTmrEX9gS+m3M3pEMAzgBnY1H12h3euRRjw==
X-Received: by 2002:a17:907:2d8d:b0:9a5:a701:2b90 with SMTP id gt13-20020a1709072d8d00b009a5a7012b90mr10060402ejc.40.1696595625715;
        Fri, 06 Oct 2023 05:33:45 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906364b00b009a1a5a7ebacsm2765295ejb.201.2023.10.06.05.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 05:33:44 -0700 (PDT)
Message-ID: <ace84d7f-d332-4598-a95d-634c1d17f852@linaro.org>
Date:   Fri, 6 Oct 2023 14:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231006120159.3413789-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/10/2023 14:01, Bryan O'Donoghue wrote:
> Add bindings for qcom,sc8280xp-camss in order to support the camera
> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sc8280xp-camss.yaml   | 598 ++++++++++++++++++
>  1 file changed, 598 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> new file mode 100644
> index 000000000000..46d2da4ad373
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -0,0 +1,598 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sc8280xp-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CAMSS

Instead something like:
Qualcomm SC8280xp Camera SubSystem (CAMSS)
?

> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc8280xp-camss
> +
> +  clocks:
> +    minItems: 63

You can drop minItems if they equal maxItems.

> +    maxItems: 63
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer_src
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer_src
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer_src
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer_src
> +      - const: csiphy3_timer
> +      - const: vfe0_axi
> +      - const: vfe0_src
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid_src
> +      - const: vfe0_csid
> +      - const: vfe1_axi
> +      - const: vfe1_src
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid_src
> +      - const: vfe1_csid
> +      - const: vfe2_axi
> +      - const: vfe2_src
> +      - const: vfe2
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid_src
> +      - const: vfe2_csid
> +      - const: vfe3_axi
> +      - const: vfe3_src
> +      - const: vfe3
> +      - const: vfe3_cphy_rx
> +      - const: vfe3_csid_src
> +      - const: vfe3_csid
> +      - const: vfe_lite0_src
> +      - const: vfe_lite0
> +      - const: vfe_lite0_cphy_rx
> +      - const: vfe_lite0_csid_src
> +      - const: vfe_lite0_csid
> +      - const: vfe_lite1_src
> +      - const: vfe_lite1
> +      - const: vfe_lite1_cphy_rx
> +      - const: vfe_lite1_csid_src
> +      - const: vfe_lite1_csid
> +      - const: vfe_lite2_src
> +      - const: vfe_lite2
> +      - const: vfe_lite2_cphy_rx
> +      - const: vfe_lite2_csid_src
> +      - const: vfe_lite2_csid
> +      - const: vfe_lite3_src
> +      - const: vfe_lite3
> +      - const: vfe_lite3_cphy_rx
> +      - const: vfe_lite3_csid_src
> +      - const: vfe_lite3_csid
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: slow_ahb_src
> +
> +  interrupts:
> +    minItems: 20

You can drop minItems if they equal maxItems.


> +    maxItems: 20
> +
> +  interrupt-names:
> +    items:
> +      - const: csid1_lite
> +      - const: vfe_lite1
> +      - const: csiphy3
> +      - const: csid0
> +      - const: vfe0
> +      - const: csid1
> +      - const: vfe1
> +      - const: csid0_lite
> +      - const: vfe_lite0
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csid2
> +      - const: vfe2
> +      - const: csid3_lite
> +      - const: csid2_lite
> +      - const: vfe_lite3
> +      - const: vfe_lite2
> +      - const: csid3
> +      - const: vfe3
> +
> +  iommus:
> +    minItems: 16

You can drop minItems if they equal maxItems.

> +    maxItems: 16
> +
> +  interconnects:
> +    minItems: 4

You can drop minItems if they equal maxItems.


> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_mnoc
> +      - const: cam_sf_mnoc
> +      - const: cam_sf_icp_mnoc
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE3 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - description: ife0
> +      - description: ife1
> +      - description: ife2
> +      - description: ife3
> +      - description: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +

On this level of indentation:
additionalProperties: false

> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.

No output ports to some ISP?

> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +  reg:
> +    minItems: 20

Drop

> +    maxItems: 20
> +
> +  reg-names:
> +    items:
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: vfe0
> +      - const: csid0
> +      - const: vfe1
> +      - const: csid1
> +      - const: vfe2
> +      - const: csid2
> +      - const: vfe_lite0
> +      - const: csid0_lite
> +      - const: vfe_lite1
> +      - const: csid1_lite
> +      - const: vfe_lite2
> +      - const: csid2_lite
> +      - const: vfe_lite3
> +      - const: csid3_lite
> +      - const: vfe3
> +      - const: csid3
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
> +    #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@ac5a000 {
> +            compatible = "qcom,sc8280xp-camss";
> +
> +            reg = <0 0x0ac5a000 0 0x2000>,
> +                  <0 0x0ac5c000 0 0x2000>,
> +                  <0 0x0ac65000 0 0x2000>,
> +                  <0 0x0ac67000 0 0x2000>,
> +                  <0 0x0acaf000 0 0x4000>,
> +                  <0 0x0acb3000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x4000>,
> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acbd000 0 0x4000>,
> +                  <0 0x0acc1000 0 0x1000>,
> +                  <0 0x0acc4000 0 0x4000>,
> +                  <0 0x0acc8000 0 0x1000>,
> +                  <0 0x0accb000 0 0x4000>,
> +                  <0 0x0accf000 0 0x1000>,
> +                  <0 0x0acd2000 0 0x4000>,
> +                  <0 0x0acd6000 0 0x1000>,
> +                  <0 0x0acd9000 0 0x4000>,
> +                  <0 0x0acdd000 0 0x1000>,
> +                  <0 0x0ace0000 0 0x4000>,
> +                  <0 0x0ace4000 0 0x1000>;
> +
> +            reg-names = "csiphy2",
> +                        "csiphy3",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "vfe0",
> +                        "csid0",
> +                        "vfe1",
> +                        "csid1",
> +                        "vfe2",
> +                        "csid2",
> +                        "vfe_lite0",
> +                        "csid0_lite",
> +                        "vfe_lite1",
> +                        "csid1_lite",
> +                        "vfe_lite2",
> +                        "csid2_lite",
> +                        "vfe_lite3",
> +                        "csid3_lite",
> +                        "vfe3",
> +                        "csid3";
> +
> +            vdda-phy-supply = <&vreg_l6d>;
> +            vdda-pll-supply = <&vreg_l4d>;
> +
> +            interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            interrupt-names = "csid1_lite",
> +                              "vfe_lite1",
> +                              "csiphy3",
> +                              "csid0",
> +                              "vfe0",
> +                              "csid1",
> +                              "vfe1",
> +                              "csid0_lite",
> +                              "vfe_lite0",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csid2",
> +                              "vfe2",
> +                              "csid3_lite",
> +                              "csid2_lite",
> +                              "vfe_lite3",
> +                              "vfe_lite2",
> +                              "csid3",
> +                              "vfe3";
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc IFE_2_GDSC>,
> +                            <&camcc IFE_3_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>;
> +
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "ife2",
> +                                 "ife3",
> +                                 "top";
> +
> +            clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAMCC_CAMNOC_AXI_CLK_SRC>,
> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
> +                     <&camcc CAMCC_CPHY_RX_CLK_SRC>,
> +                     <&camcc CAMCC_CSIPHY0_CLK>,
> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK_SRC>,
> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY1_CLK>,
> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK_SRC>,
> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY2_CLK>,
> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK_SRC>,
> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY3_CLK>,
> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK_SRC>,
> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_0_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_0_CLK>,
> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_0_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_1_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_1_CLK>,
> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_1_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_2_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_2_CLK>,
> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_2_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_3_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_3_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_3_CLK>,
> +                     <&camcc CAMCC_IFE_3_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_3_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_3_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_0_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_0_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_0_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_0_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_0_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_1_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_1_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_1_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_1_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_1_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_2_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_2_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_2_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_2_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_2_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_3_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_3_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_3_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_3_CSID_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_LITE_3_CSID_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>;
> +
> +            clock-names = "camnoc_axi",
> +                          "camnoc_axi_src",
> +                          "cpas_ahb",
> +                          "cphy_rx_src",
> +                          "csiphy0",
> +                          "csiphy0_timer_src",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer_src",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer_src",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer_src",
> +                          "csiphy3_timer",
> +                          "vfe0_axi",
> +                          "vfe0_src",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_csid_src",
> +                          "vfe0_csid",
> +                          "vfe1_axi",
> +                          "vfe1_src",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_csid_src",
> +                          "vfe1_csid",
> +                          "vfe2_axi",
> +                          "vfe2_src",
> +                          "vfe2",
> +                          "vfe2_cphy_rx",
> +                          "vfe2_csid_src",
> +                          "vfe2_csid",
> +                          "vfe3_axi",
> +                          "vfe3_src",
> +                          "vfe3",
> +                          "vfe3_cphy_rx",
> +                          "vfe3_csid_src",
> +                          "vfe3_csid",
> +                          "vfe_lite0_src",
> +                          "vfe_lite0",
> +                          "vfe_lite0_cphy_rx",
> +                          "vfe_lite0_csid_src",
> +                          "vfe_lite0_csid",
> +                          "vfe_lite1_src",
> +                          "vfe_lite1",
> +                          "vfe_lite1_cphy_rx",
> +                          "vfe_lite1_csid_src",
> +                          "vfe_lite1_csid",
> +                          "vfe_lite2_src",
> +                          "vfe_lite2",
> +                          "vfe_lite2_cphy_rx",
> +                          "vfe_lite2_csid_src",
> +                          "vfe_lite2_csid",
> +                          "vfe_lite3_src",
> +                          "vfe_lite3",
> +                          "vfe_lite3_cphy_rx",
> +                          "vfe_lite3_csid_src",
> +                          "vfe_lite3_csid",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "slow_ahb_src";
> +
> +
> +            iommus = <&apps_smmu 0x2000 0x4e0>,
> +                     <&apps_smmu 0x2020 0x4e0>,
> +                     <&apps_smmu 0x2040 0x4e0>,
> +                     <&apps_smmu 0x2060 0x4e0>,
> +                     <&apps_smmu 0x2080 0x4e0>,
> +                     <&apps_smmu 0x20e0 0x4e0>,
> +                     <&apps_smmu 0x20c0 0x4e0>,
> +                     <&apps_smmu 0x20a0 0x4e0>,
> +                     <&apps_smmu 0x2400 0x4e0>,
> +                     <&apps_smmu 0x2420 0x4e0>,
> +                     <&apps_smmu 0x2440 0x4e0>,
> +                     <&apps_smmu 0x2460 0x4e0>,
> +                     <&apps_smmu 0x2480 0x4e0>,
> +                     <&apps_smmu 0x24e0 0x4e0>,
> +                     <&apps_smmu 0x24c0 0x4e0>,
> +                     <&apps_smmu 0x24a0 0x4e0>;
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +                            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
> +            interconnect-names = "cam_ahb",
> +                                 "cam_hf_mnoc",
> +                                 "cam_sf_mnoc",
> +                                 "cam_sf_icp_mnoc";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;

This looks incomplete. No endpoint?

Best regards,
Krzysztof

