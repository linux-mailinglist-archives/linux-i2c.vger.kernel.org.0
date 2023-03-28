Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED876CBE0C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Mar 2023 13:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjC1LtF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Mar 2023 07:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjC1LtE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Mar 2023 07:49:04 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F514EE7
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 04:49:03 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eh3so48389535edb.11
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 04:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680004142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+gYkRLzPec9yxMWag3b4xjfGsVDDrPt8d2gXGuiwhyc=;
        b=BcznN7lkFma/0TZivl0KEICrWqRi9TGqtA9tTzAXu3QKGkxmXRQy0cH4kpcUe2z1vX
         bf3FLFqPc6dlbK79FiXeAnyr77XeCuI3YLCK+9MQBJgGMncLKrUozLL8eiSxhyqEUrjf
         4P72EC2tko+O1J2pfvPy7ZR/HddvVf5FSHPXS6DPt9THl5RtsHe1OWjl2m8bnP6NS2c1
         AZyyjBTU6QMhe/u7OSYAWQQU2rWm0lONPS0cIqnJNSgqjOIHI04omf/OODgeAHvHWOBX
         hXj16q0gwBjAAsfuDUfUocFZ8ZyYXpOwbgyS3zbT9k/dnSPwHG5n+IUqk1rfJPYYzpLF
         7Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680004142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gYkRLzPec9yxMWag3b4xjfGsVDDrPt8d2gXGuiwhyc=;
        b=gVBJw4lW0WLnbE4jC8OmMz+40IhruTqw3J/qmTKeqzP/WhySaoPZVYTg3lWk99jTCE
         HQh+fXKoiO0tRDzJXM5PWgUUZDyfIa1TbKDQ9Imrs/fi0qrJuDtb6Jw8lLI/NaRmMebw
         Uw2rWMoKEQbvS+/qHzxUnCf1kQjg2C1g5+EEqz/aPnDcK1w2Mgk+VekiKlzwB0y04/ih
         TpY1a72/hjmTaXKieAX4Lx/nemyd0mrnqz4jH+kssOnaY3GaI+IAGyTmIW85ySjfTCRS
         yzQ1ZJWfIgKyvrz3rIOQa6MLPiAA2/qZLaV/Ww8BWgK3dxZHhhbRRpX/hyEqzKCUFN3n
         Yzew==
X-Gm-Message-State: AAQBX9dq0BuNHbhqdo1RZQ9TG5sGa8rNcOoEOUQlIcKLkd9Z66LVb2KQ
        FhHMMa0eowuAx5H9SLfmxCh7NwazCLyJtZuVp7k=
X-Google-Smtp-Source: AKy350bF2c+luO4tOJ29JP8/XWmMZiTM2EJbdUi9zxizj83KcYXCQa4KgOsVqm+2Qp/3W18lnOXdyA==
X-Received: by 2002:a17:906:ac1:b0:92d:9767:8e0a with SMTP id z1-20020a1709060ac100b0092d97678e0amr13886925ejf.13.1680004141784;
        Tue, 28 Mar 2023 04:49:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id x23-20020a50d617000000b004fa268da13esm15980472edi.56.2023.03.28.04.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 04:49:01 -0700 (PDT)
Message-ID: <13440581-cc57-d47a-4745-c89a729f240b@linaro.org>
Date:   Tue, 28 Mar 2023 13:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To:     Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-aspeed@lists.ozlabs.org
References: <20230327092524.3916389-1-ryan_chen@aspeedtech.com>
 <20230327092524.3916389-2-ryan_chen@aspeedtech.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327092524.3916389-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/03/2023 11:25, Ryan Chen wrote:
> Update ASPEED I2C maintainers email.

Everything is an update. Describe what is wrong in original maintainer
email (e.g. Fix typo in maintainer's name and email).

> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 56 +++++++++++++++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index f597f73ccd87..00b92c97f432 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -7,10 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
>  
>  maintainers:
> -  - Rayn Chen <rayn_chen@aspeedtech.com>
> -
> -allOf:
> -  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
>  
>  properties:
>    compatible:
> @@ -49,6 +46,25 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  aspeed,enable-dma:
> +    type: boolean
> +    description: |
> +      I2C bus enable dma mode transfer.
> +
> +      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
> +      single DMA engine. DTS files can specify the data transfer mode to/from
> +      the device, either DMA or programmed I/O. However, hardware limitations
> +      may require a DTS to manually allocate which controller can use DMA mode.
> +      The "aspeed,enable-dma" property allows control of this.
> +
> +      In cases where one the hardware design results in a specific
> +      controller handling a larger amount of data, a DTS would likely
> +      enable DMA mode for that one controller.
> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.
> +
>  required:
>    - reg
>    - compatible
> @@ -57,6 +73,26 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-i2cv2
> +
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +      required:
> +        - aspeed,global-regs
> +    else:
> +      properties:
> +        aspeed,global-regs: false
> +        aspeed,enable-dma: false
> +
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> @@ -71,3 +107,15 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "aspeed,ast2600-i2cv2";
> +      reg = <0x80 0x80>, <0xc00 0x20>;

Compatible and reg are always first properties in DTS.

> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      aspeed,global-regs = <&i2c_global>;

Best regards,
Krzysztof

