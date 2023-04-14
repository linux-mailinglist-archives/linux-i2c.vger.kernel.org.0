Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9506E2B8A
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 23:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjDNVMR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 17:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjDNVMQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 17:12:16 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49C44EDE
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 14:12:14 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kt6so10646485ejb.0
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681506733; x=1684098733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpwwM8DbcXGtGGGpWXw5xEbGhldxgCUGXxIxcQVNp8s=;
        b=g8xmMN8znp0OpiHnPEW9iZCKhziK0nNa18QIsSq1/RmlLHdR9uxF1QnjiXP/thmKuB
         /1Db5lm8pS3+oq0auA0j3hQYzz0gtuAW3wsJsX3pfCtZBANdtst1Uw9ktsHWyRg0Y7l9
         4gVmitqDwbA+ngkon06cDvZphQQQSW+DKWhENCtcLv1fdAAfOWyRiyxsJcfyT0frS5qM
         11jG6NvozqoQjEvHQVCqcqhjGjrf1623DrtQFauZsDPepAlTwUWkcPMjq9ty6JOqaUEi
         MOzKhN33keYrB6kcLcP1y3duxvV3zTfI8D4jqwBsz4Lz6MAhqnLn3VcjQyQLhxN/7CZx
         G6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681506733; x=1684098733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpwwM8DbcXGtGGGpWXw5xEbGhldxgCUGXxIxcQVNp8s=;
        b=ZUAAckHQMSOFJ0TyD9sItF7c4by9X/7x8qS+nTjY8jJBq/ShoDdItxh3/VeXp9E7jV
         4aYt8rBkiYHPKha/PLwk9N0dG40vN/3odfTnEE/SuvW2fN7NXoROddCwZP9PpFCaMvbF
         c98oQekrcfVY2DrefOOmMYy5kn42cX+BeDID5pvaPnPR3YmNgYtUcSUl/u33TiPes7Tu
         fAFqkmlsHMVC+x9CgRr5sMY1c2y+j4u5BF5134/giufzUYifIWeb0hOJrkGZgaW/67JF
         k9isq0KIo5zuPDL1guaHJ7AcgXRKUDuX3xgLW07STxvxsxuIV6vYT0QI3yudmb/0uF7+
         S44Q==
X-Gm-Message-State: AAQBX9c06pH8fb9JiBEKT3P39ufWWMuQHV1RdnZeZMuhD/B3PnHzmOyp
        VneLJHRnJF0/u/I4fxH3WlYwEA==
X-Google-Smtp-Source: AKy350biCvKQBwZA5r1WJE7zZK4OAppLAmWqrl+pC5eQnrCjfaW5vLswwMFckdRh/585lBvG6TCGkA==
X-Received: by 2002:a17:906:2c44:b0:94a:70ba:70ee with SMTP id f4-20020a1709062c4400b0094a70ba70eemr520804ejh.32.1681506733182;
        Fri, 14 Apr 2023 14:12:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ffae:8aab:ae5a:4688? ([2a02:810d:15c0:828:ffae:8aab:ae5a:4688])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709067d8800b0094a98a175cesm2903287ejo.80.2023.04.14.14.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 14:12:12 -0700 (PDT)
Message-ID: <83947c77-de8c-fc39-6721-e1e1cb5fc3fc@linaro.org>
Date:   Fri, 14 Apr 2023 23:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v11 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230414110137.401356-1-patrick.rudolph@9elements.com>
 <20230414110137.401356-2-patrick.rudolph@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414110137.401356-2-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14/04/2023 13:01, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.

Typo: existing


> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..6fed6eae9c9b 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -4,21 +4,29 @@
>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NXP PCA954x I2C bus switch
> +title: NXP PCA954x I2C and compatible bus switches
>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  
>  description:
> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> -
> -allOf:
> -  - $ref: /schemas/i2c/i2c-mux.yaml#
> +  The NXP PCA954x and compatible devices are I2C bus
> +  multiplexer/switches that share the same functionality
> +  and register layout.
> +  The devices usually have 4 or 8 child buses, which are
> +  attached to the parent bus by using the SMBus "Send Byte"
> +  command.
>  
>  properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
> +          - maxim,max7367
> +          - maxim,max7368
> +          - maxim,max7369
>            - nxp,pca9540
>            - nxp,pca9542
>            - nxp,pca9543
> @@ -59,10 +67,33 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-mux.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - maxim,max7367
> +                - maxim,max7369
> +                - nxp,pca9542
> +                - nxp,pca9543
> +                - nxp,pca9544
> +                - nxp,pca9545

That's independent change. You add here support for Maxim devices, not
customize PCA. Please split it to new patch (first in the series).

> +    then:
> +      properties:
> +        interrupts: false
> +        "#interrupt-cells": false
> +        interrupt-controller: false
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -74,11 +105,13 @@ examples:
>          #size-cells = <0>;
>  
>          i2c-mux@74 {
> -            compatible = "nxp,pca9548";
> +            compatible = "nxp,pca9545";

Best regards,
Krzysztof

