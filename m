Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985AB6D19AE
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 10:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjCaIU7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 04:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjCaIU6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 04:20:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F2FAF35
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 01:20:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k37so27942438lfv.0
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680250850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LUNkFuCTpo4s4pgp3f84iyIbx4Bw8H+Fc6h+bxeTiw=;
        b=vnK9SrpyCi2xClxl047xnsMiazCp+evXnfM94UyrkMroflDjoHo0IsTsIHnFtmGaPU
         r5JkdFFVVc/P4vVm/UNt+R/5f7hDZizpcqfDEaTyJfKGx70Jz393RSBHm1lU0hbJd1aS
         80uIPfpbbBDXRRXwzDTdmRplKAjnRuwlDe7xak9r78c0OkcbG3AWbFXUhOfcIhqkIOMj
         SvuhuXmWxG+eCbakEzI9M7l4NiuFy5SOrVKVfDV2fRxMgoJq+kNSFsW9m2Vl5QP9Ms5v
         Bs4VgiT7zWkKdQr6vfsRDy0b60T1mDFryOI5eUdISSXdAxoyWqSEmqCHc/kXvPsvNaA4
         b/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680250850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LUNkFuCTpo4s4pgp3f84iyIbx4Bw8H+Fc6h+bxeTiw=;
        b=yBqqxlMYI0t8TU4DlbdrzREhr6c6ZKHcGA/0LzR4cc/PkYMWOHdz6OJQ1N485vCEKZ
         9trNZ124U/5btlj/Ajsik/JD4Pvx+zLvtKa+TsDxqPjqG45pDKHraWuzEkD+vgo89SBu
         iOFRpWI4J4NVMgIfv8YxGJlBeYSeJFY15sPgOPmCSwPrBYlOkl9mdDnIyC2XB/s3+dWA
         o2E8qwjFYt7xWiCZ50wqCPiAgJ/dDFvQgRAA/sVqHVSDL0/QtVs1FkSJFFyLrTndyPZ+
         9pPEe0CAVnfbyh8CjGV153MX5wlPAXnJH18qPVcadSa6+2MSagrT5UMRIGmZjN/Oeuvx
         Kx3w==
X-Gm-Message-State: AAQBX9fDoHQjz/FfgrXOUqnweP3ebGoQICSAJ6w5cb7k9UVuryN62mFb
        UznZvZ95fFoh5B2HPAYLZKvG7rYNy4ldMlBbM2g=
X-Google-Smtp-Source: AKy350ZyfH9M+fjJb2kjVrDFFL4yGwUxC1GNjIzGKIoXexJfz+KUvKqVPA1Oj4jRuqhm260Hiv/AuQ==
X-Received: by 2002:ac2:5963:0:b0:4d5:ae35:b221 with SMTP id h3-20020ac25963000000b004d5ae35b221mr7310080lfp.34.1680250850054;
        Fri, 31 Mar 2023 01:20:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004a9b9ccfbe6sm282482lfq.51.2023.03.31.01.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:20:49 -0700 (PDT)
Message-ID: <a4f12cc9-d9d2-2805-f9fa-58eafe0b976c@linaro.org>
Date:   Fri, 31 Mar 2023 10:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To:     Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-aspeed@lists.ozlabs.org
References: <20230330073259.485606-1-ryan_chen@aspeedtech.com>
 <20230330073259.485606-2-ryan_chen@aspeedtech.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330073259.485606-2-ryan_chen@aspeedtech.com>
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

On 30/03/2023 09:32, Ryan Chen wrote:
> Fix typo in maintainer's name and email.
> Remove ddress-cells, size-cells.

Typo: address?

> Use Compatible and reg are always first properties.

I don't understand this at all - what does it explain here? It looks
unrelated, just random sentence in the middle of commit msg.

> Add ast2600-i2cv2 compatible and aspeed,global-regs,
> aspeed,enable-dma and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 56 +++++++++++++++++--
>  1 file changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index f597f73ccd87..81e8ced64900 100644
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
> @@ -57,12 +73,30 @@ required:
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
>      i2c0: i2c-bus@40 {
> -      #address-cells = <1>;
> -      #size-cells = <0>;

Why? Indeed without children this is not really needed, but it points to
the fact that your example without children is not entirely complete.

Anyway you are doing now way too many things in one patch.

https://elixir.bootlin.com/linux/v5.19-rc5/source/Documentation/process/submitting-patches.rst


>        compatible = "aspeed,ast2500-i2c-bus";
>        reg = <0x40 0x40>;
>        clocks = <&syscon ASPEED_CLK_APB>;
> @@ -71,3 +105,13 @@ examples:
>        interrupts = <0>;
>        interrupt-parent = <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      compatible = "aspeed,ast2600-i2cv2";
> +      reg = <0x80 0x80>, <0xc00 0x20>;
> +      aspeed,global-regs = <&i2c_global>;
> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +    };

Best regards,
Krzysztof

