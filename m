Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422BF6B66DB
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 14:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjCLNo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 09:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjCLNoX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 09:44:23 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761802A9BA
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 06:44:09 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id j11so38688748edq.4
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678628648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tBbTPTC2o42UH1LVv9NvXHJsa5O/FZkrhUZ0HNae1NA=;
        b=qIR7dBgT8zJxyAagUaIMdOGaMWgd5o3eN7qxfcgr3I+x8B8LefSWIZDdOlMqs6F9BN
         4espMC8HaUnExW4MFEZEIJhNwUXmf1VQvfB3Yl3DIh/Dq1yaQI6cmSnzLYsalnNUbPiH
         Wfp+OiGdfa9wFCatk0m2jTAeiLgNRe/+9GLqep/nQ1PyPu+g8LRaIGT5OjXuGXmxtveG
         i7kjwnf6t2VtV4SzAgolLtM+JfmOkXpmX2mF396i6/1BK0SMaSHRP821KGzo6KTKL05s
         mtiVJ336+dBIyHXSkvw6C//9Q4Lt1jjr1psljdre97tQnjuoHhAsELLNipJOhZ/h8kzw
         uYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBbTPTC2o42UH1LVv9NvXHJsa5O/FZkrhUZ0HNae1NA=;
        b=qbn0D3fNB+oenSKQwgTM9e9fzquBMKj7g/lGhIaKzk+ZWquCstmtzCU3fHP5Xcil69
         ts2FLib1Cy6aw+tHgnVj+0qUcpulzyFgJuONGIR3xSh88g3V5wjO5N0BoEN3WihFnzMO
         2BopED3P5C62gdbGf29ILtBcGYIqvD50WuC2+u9s85FfpoMzZjczl3DeHsFMkgg0clMU
         OgMVMthZiNE/d7QVZ5g2PVyL+fsDAHIjPgbhsIVNUvJHnGxqWBSBJxTkTcAVCnK4jQRq
         levWtDfweTp1ds3exAcEG9f6Q6Z4Pzrf663DMCp6zcTSBc0F3Gq6GY5j3jvXFEQ3/3zG
         130A==
X-Gm-Message-State: AO0yUKXHrHAkbiYRjDhmke9xMomWKHTdy/L3Vjv2643Ge9xXV+zjijPI
        gy93aDJ/Zo5gjnSNIFflInTtcw==
X-Google-Smtp-Source: AK7set96daCm0CO4t9fbn7pxc3mpEPLe58TuahQyDh0BgqbBPFF0YSSZU4DbQEcJWw9vRumcpLIg3g==
X-Received: by 2002:a17:906:584:b0:8d6:626d:7e03 with SMTP id 4-20020a170906058400b008d6626d7e03mr34146795ejn.40.1678628647815;
        Sun, 12 Mar 2023 06:44:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id ji16-20020a170907981000b008dea022f5e6sm2228652ejc.24.2023.03.12.06.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 06:44:07 -0700 (PDT)
Message-ID: <4d056690-0bbd-902b-a942-d4dd701e9b1c@linaro.org>
Date:   Sun, 12 Mar 2023 14:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] i2c: mpc: Use the i2c-scl-clk-low-timeout-ms property
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230312131933.248715-1-andi.shyti@kernel.org>
 <20230312131933.248715-3-andi.shyti@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312131933.248715-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/03/2023 14:19, Andi Shyti wrote:
> Now we have the i2c-scl-clk-low-timeout-ms property defined in
> the binding. Use it and remove the previous "fsl,timeout".
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 12 ++++++------
>  drivers/i2c/busses/i2c-mpc.c                       |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> index 018e1b944424..c01547585456 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> @@ -41,11 +41,6 @@ properties:
>        if defined, the clock settings from the bootloader are
>        preserved (not touched)
>  
> -  fsl,timeout:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description: |
> -      I2C bus timeout in microseconds

Instead:
  deprecated: true

> -
>    fsl,i2c-erratum-a004447:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description: |
> @@ -53,6 +48,11 @@ properties:
>        says that the standard i2c recovery scheme mechanism does
>        not work and an alternate implementation is needed.
>  
> +  i2c-scl-clk-low-timeout-ms:
> +    description:
> +      Indicates the SCL timeouts which used to force the client
> +      into a waiting state

No need for this - will be coming from dtschema.

> +
>  required:
>    - compatible
>    - reg
> @@ -95,6 +95,6 @@ examples:
>          interrupts = <43 2>;
>          interrupt-parent = <&mpic>;
>          clock-frequency = <400000>;
> -        fsl,timeout = <10000>;
> +        i2c-scl-clk-low-timeout-ms = <10000>;
>      };
>  ...
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index 81ac92bb4f6f..93c484efc3f3 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -846,7 +846,8 @@ static int fsl_i2c_probe(struct platform_device *op)
>  			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
>  	}
>  
> -	prop = of_get_property(op->dev.of_node, "fsl,timeout", &plen);
> +	prop = of_get_property(op->dev.of_node,
> +			       "i2c-scl-clk-low-timeout-ms", &plen);

That's an ABI break. You need to keep old code as fallback.


Best regards,
Krzysztof

