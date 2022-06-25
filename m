Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83BBB55ACA6
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jun 2022 22:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbiFYUnS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jun 2022 16:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiFYUnR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Jun 2022 16:43:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5766D65C9
        for <linux-i2c@vger.kernel.org>; Sat, 25 Jun 2022 13:43:16 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id t5so11395648eje.1
        for <linux-i2c@vger.kernel.org>; Sat, 25 Jun 2022 13:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iFd1veKfhTMGQGljEN9uvXrZe1abjjQ/8ra6X7ZXp/A=;
        b=Q7zhM31lwwRJmmE86uF2FZdYeGJWH8clPbsigWZbDLOJkiq5xQB4H51dgNqn2WCHnx
         yUXJzBRWoVFajl57tWs4A69Wbki0B8V6iPIANs+sUlfUDigI0GlifsugGjE5wqOMd+/y
         3CpLaWbqBcZr37Ce7sSFjjD7xg1mqyT69ipPkjCsv48oCysOCsktRsLZtjVgT497qpu5
         DcAvK9SrwWTCZO9i+rwbxJ16hZqYBo02WvDH26todecvwLGQfVRcLMTNMPFHBJoqb6Wc
         75Xbhv36Ay184RbeLY8M/ygMw1D3mXj5nHzu+9iKS2YnB3+L4/fqYfrHAu+Ie1/0gzhZ
         ls3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iFd1veKfhTMGQGljEN9uvXrZe1abjjQ/8ra6X7ZXp/A=;
        b=axd9ki2IUfZBXmkW81EW4QV94WtNyoqetp4TCGPrMthMZdLM7lHLfUgR8qmrWPUiD9
         kePw9SttoAroyAVlV0yjAXSiDGC+L1QcbGWlxy2nOna2f/vQeZQlBYi1Im7DUJsP1zb1
         TTk0yhveLsV6KNkUO3byWZ0KmkE6lUj5WkjM95uUeeK2ZXwf1Br1oD+nEORLLaBwDv86
         hk30oWUJwwxdBvp1tx43vy+CdnrO7hU1WPylqb7aopzFT7eZxA2dDf1zvEkwajXfMuVL
         +oCI1cpalCT42uH/479ucvIAUCuN2yHKX8Lp6z18363J+TDS1+H7ORl6rBvsFdDSy6eT
         FCAA==
X-Gm-Message-State: AJIora+R2yKvfrw9eCH8aqbE3CgujGiVd626ViTHC7zqecuLWdxMTt6G
        le5qZFpHrtrEhHvxQO/6zk4JXC3SEelBhg==
X-Google-Smtp-Source: AGRyM1ubzxZPS0hDWjk/Wtmb8RnNWKmiyIjbS5HD1t1lVciAej4xtBFwV019ReryeNb/GjF5I2Bz9Q==
X-Received: by 2002:a17:907:2ce4:b0:722:df67:12cc with SMTP id hz4-20020a1709072ce400b00722df6712ccmr5399009ejc.715.1656189794930;
        Sat, 25 Jun 2022 13:43:14 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g26-20020a170906199a00b00724ff3251c4sm3019630ejd.26.2022.06.25.13.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:43:14 -0700 (PDT)
Message-ID: <2f2b2544-9c53-3a6a-d9c9-375e75b112f3@linaro.org>
Date:   Sat, 25 Jun 2022 22:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-2-phil.edworthy@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624101736.27217-2-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/06/2022 12:17, Phil Edworthy wrote:
> Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/i2c/renesas,rzv2m.yaml           | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> new file mode 100644
> index 000000000000..9049461ad2f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/renesas,rzv2m.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2M I2C Bus Interface
> +
> +maintainers:
> +  - Phil Edworthy <phil.edworthy@renesas.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,i2c-r9a09g011  # RZ/V2M
> +      - const: renesas,rzv2m-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Data transmission/reception interrupt
> +      - description: Status interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: tia
> +      - const: tis
> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz. The absence of this property
> +      indicates the default frequency 100 kHz.

Instead of last sentence, just add "default: 100000".

> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - power-domains
> +  - resets

This was not mentioned in properties. Why?

> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c0: i2c@a4030000 {
> +            compatible = "renesas,i2c-r9a09g011", "renesas,rzv2m-i2c";
> +            reg = <0xa4030000 0x80>;
> +            interrupts = <GIC_SPI 232 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "tia", "tis";
> +            clocks = <&cpg CPG_MOD R9A09G011_IIC_PCLK0>;
> +            resets = <&cpg R9A09G011_IIC_GPA_PRESETN>;
> +            power-domains = <&cpg>;
> +            clock-frequency = <100000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +    };


Best regards,
Krzysztof
