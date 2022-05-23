Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459C3530DCD
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 12:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbiEWKHR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 06:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbiEWKHQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 06:07:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B455B45788
        for <linux-i2c@vger.kernel.org>; Mon, 23 May 2022 03:07:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id e4so16033815ljb.13
        for <linux-i2c@vger.kernel.org>; Mon, 23 May 2022 03:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=F4taQ5+IrXRMwOAhNcJUo/s1Ca6XrXb6YnUM76RxKpE=;
        b=hX7ISdFon39d4aZ4z+AZ7AYEURkSDfboUIf7TkGGh7Z5DkqaT9KiJRDsY0VAxjH1Bc
         z4DBfFwGuF5ibhJKm8kqPiyPNksBcGHKRcW9iwmNYcbKvVg3p8zoQPRoNEgd/aXVpQMr
         itMwpv/WO6/dE4lRl7sKPKzDcNNsIa/amVUWyKxQSPtpwICmd9BuEPvMq64h12fuCy1p
         I6tFyK/+ks1PQLol1jf5ng59rpGrN4CqlGMmd0+uL1wj0MmgrHUPkGTBOJ9fyGK5UMrM
         oSqQdnCizMO8lXw4hsWxV9vF4QsteELBxkri21RDgsQn1xdgJlT6pwplVS+rFwNs9Hd5
         DDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=F4taQ5+IrXRMwOAhNcJUo/s1Ca6XrXb6YnUM76RxKpE=;
        b=FfA58Z2QT4jIsrt0Byt3oXll70SkZRJqoSgthA1bbWT6KKPORWP5zxvO0Jvln51Ix0
         Vvnp5nvYKLi+bQcWl+d0uXStIY5nfoKYKhoUTLq9jeyGCQX3VC/N2al/pAbu4JsW4jlr
         HyHJgYK2thOhtsdJQdhMC1cHsivmN/tCpsQ7aAGV6QxbpTRIt4J08nq6jinEcXtA8iXk
         UfDYJ3JyI6usjNkHF8D1OY2KYTbHaMzOdyFNETjMYS2HY9D+XJNkHqq7pSsJnEze25U1
         P/2HQir7LOJS0b0a6dQFQqViyCWbtdU8UvzxIe1YEcHa4kJkoTlYnYgND+g6TAvPHelo
         WrDQ==
X-Gm-Message-State: AOAM530uIEn+64iSM+4QvaS+eYaXXjP1L/nDwD1BHDpZl2n11yAaXLmi
        QRpvlMi/wdOTjkm1RGSw8vx74w==
X-Google-Smtp-Source: ABdhPJxMjrqPZFZvMoxN4x/AxW+GX9hdhs+gP+izmBR2K0BBNuq8/KL6QCSUi/r+3onn1sJRZlR8NA==
X-Received: by 2002:a2e:a794:0:b0:250:5de1:1ec5 with SMTP id c20-20020a2ea794000000b002505de11ec5mr12601741ljf.270.1653300431926;
        Mon, 23 May 2022 03:07:11 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z6-20020a196506000000b0047861c163d0sm1063397lfb.37.2022.05.23.03.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 03:07:11 -0700 (PDT)
Message-ID: <170dd20b-ab0b-0f61-bfe9-cb9167a2e133@linaro.org>
Date:   Mon, 23 May 2022 12:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 01/14] media: dt-bindings: media: camss: Add
 qcom,msm8974-camss binding
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20220522162802.208275-1-luca@z3ntu.xyz>
 <20220522162802.208275-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522162802.208275-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/05/2022 18:27, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Thank you for your patch. There is something to discuss/improve.

> 
> Add bindings for qcom,msm8974-camss in order to support the camera
> subsystem on MSM8974.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../bindings/media/qcom,msm8974-camss.yaml    | 321 ++++++++++++++++++
>  1 file changed, 321 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
> new file mode 100644
> index 000000000000..f8f71e477535
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
> @@ -0,0 +1,321 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,msm8974-camss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm CAMSS ISP
> +
> +maintainers:
> +  - Robert Foss <robert.foss@linaro.org>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8974-camss
> +
> +  clocks:
> +    minItems: 31

No need for minItems, they are equal to max by default.

> +    maxItems: 31
> +
> +  clock-names:
> +    items:
> +      - const: top_ahb
> +      - const: ispif_ahb
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: csiphy2_timer
> +      - const: csi0_ahb
> +      - const: csi0
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1_ahb
> +      - const: csi1
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2_ahb
> +      - const: csi2
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: csi3_ahb
> +      - const: csi3
> +      - const: csi3_phy
> +      - const: csi3_pix
> +      - const: csi3_rdi
> +      - const: vfe0
> +      - const: vfe1
> +      - const: csi_vfe0
> +      - const: csi_vfe1
> +      - const: iface
> +      - const: bus
> +
> +  interrupts:
> +    minItems: 10

Same.

> +    maxItems: 10
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid3
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe1
> +
> +  power-domains:
> +    items:
> +      - description: VFE GDSC - Video Front End, Global Distributed Switch Controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
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
> +                items:
> +                  - const: 1
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

These look all the same, so just use patternPropreties (in "ports") with
proper pattern.

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
> +                items:
> +                  - const: 1
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
> +                items:
> +                  - const: 1
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
> +    minItems: 14
> +    maxItems: 14
> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: csiphy2
> +      - const: csiphy2_clk_mux
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid3
> +      - const: ispif
> +      - const: csi_clk_mux
> +      - const: vfe0
> +      - const: vfe1
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupt-names
> +  - interrupts
> +  - power-domains
> +  - reg
> +  - reg-names
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8974.h>
> +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +    camss@fda00000 {

Generic node name, so "isp" I guess?

> +        compatible = "qcom,msm8974-camss";
> +        reg = <0xfda0ac00 0x200>,
> +              <0xfda00030 0x4>,
> +              <0xfda0b000 0x200>,
> +              <0xfda00038 0x4>,
> +              <0xfda0b400 0x200>,
> +              <0xfda00040 0x4>,
> +              <0xfda08000 0x100>,
> +              <0xfda08400 0x100>,
> +              <0xfda08800 0x100>,
> +              <0xfda08c00 0x100>,
> +              <0xfda0a000 0x800>,
> +              <0xfda00020 0x10>,
> +              <0xfda10000 0x1000>,
> +              <0xfda14000 0x1000>;
> +        reg-names = "csiphy0",
> +                    "csiphy0_clk_mux",
> +                    "csiphy1",
> +                    "csiphy1_clk_mux",
> +                    "csiphy2",
> +                    "csiphy2_clk_mux",
> +                    "csid0",
> +                    "csid1",
> +                    "csid2",
> +                    "csid3",
> +                    "ispif",
> +                    "csi_clk_mux",
> +                    "vfe0",
> +                    "vfe1";
> +        interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 53 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 54 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 58 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "csiphy0",
> +                          "csiphy1",
> +                          "csiphy2",
> +                          "csid0",
> +                          "csid1",
> +                          "csid2",
> +                          "csid3",
> +                          "ispif",
> +                          "vfe0",
> +                          "vfe1";
> +        power-domains = <&mmcc CAMSS_VFE_GDSC>;
> +        clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
> +                 <&mmcc CAMSS_ISPIF_AHB_CLK>,
> +                 <&mmcc CAMSS_PHY0_CSI0PHYTIMER_CLK>,
> +                 <&mmcc CAMSS_PHY1_CSI1PHYTIMER_CLK>,
> +                 <&mmcc CAMSS_PHY2_CSI2PHYTIMER_CLK>,
> +                 <&mmcc CAMSS_CSI0_AHB_CLK>,
> +                 <&mmcc CAMSS_CSI0_CLK>,
> +                 <&mmcc CAMSS_CSI0PHY_CLK>,
> +                 <&mmcc CAMSS_CSI0PIX_CLK>,
> +                 <&mmcc CAMSS_CSI0RDI_CLK>,
> +                 <&mmcc CAMSS_CSI1_AHB_CLK>,
> +                 <&mmcc CAMSS_CSI1_CLK>,
> +                 <&mmcc CAMSS_CSI1PHY_CLK>,
> +                 <&mmcc CAMSS_CSI1PIX_CLK>,
> +                 <&mmcc CAMSS_CSI1RDI_CLK>,
> +                 <&mmcc CAMSS_CSI2_AHB_CLK>,
> +                 <&mmcc CAMSS_CSI2_CLK>,
> +                 <&mmcc CAMSS_CSI2PHY_CLK>,
> +                 <&mmcc CAMSS_CSI2PIX_CLK>,
> +                 <&mmcc CAMSS_CSI2RDI_CLK>,
> +                 <&mmcc CAMSS_CSI3_AHB_CLK>,
> +                 <&mmcc CAMSS_CSI3_CLK>,
> +                 <&mmcc CAMSS_CSI3PHY_CLK>,
> +                 <&mmcc CAMSS_CSI3PIX_CLK>,
> +                 <&mmcc CAMSS_CSI3RDI_CLK>,
> +                 <&mmcc CAMSS_VFE_VFE0_CLK>,
> +                 <&mmcc CAMSS_VFE_VFE1_CLK>,
> +                 <&mmcc CAMSS_CSI_VFE0_CLK>,
> +                 <&mmcc CAMSS_CSI_VFE1_CLK>,
> +                 <&mmcc CAMSS_VFE_VFE_AHB_CLK>,
> +                 <&mmcc CAMSS_VFE_VFE_AXI_CLK>;
> +        clock-names = "top_ahb",
> +                      "ispif_ahb",
> +                      "csiphy0_timer",
> +                      "csiphy1_timer",
> +                      "csiphy2_timer",
> +                      "csi0_ahb",
> +                      "csi0",
> +                      "csi0_phy",
> +                      "csi0_pix",
> +                      "csi0_rdi",
> +                      "csi1_ahb",
> +                      "csi1",
> +                      "csi1_phy",
> +                      "csi1_pix",
> +                      "csi1_rdi",
> +                      "csi2_ahb",
> +                      "csi2",
> +                      "csi2_phy",
> +                      "csi2_pix",
> +                      "csi2_rdi",
> +                      "csi3_ahb",
> +                      "csi3",
> +                      "csi3_phy",
> +                      "csi3_pix",
> +                      "csi3_rdi",
> +                      "vfe0",
> +                      "vfe1",
> +                      "csi_vfe0",
> +                      "csi_vfe1",
> +                      "iface",
> +                      "bus";
> +
> +        vdda-supply = <&pm8941_l12>;
> +
> +        ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;

This is not a complete example... empty ports node is useless, isn't it?

> +        };
> +    };


Best regards,
Krzysztof
