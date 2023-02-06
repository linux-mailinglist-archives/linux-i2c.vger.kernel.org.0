Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729D768B68C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 08:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjBFHlQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 02:41:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBFHlO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 02:41:14 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4341166FC
        for <linux-i2c@vger.kernel.org>; Sun,  5 Feb 2023 23:41:12 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so2742197wmb.2
        for <linux-i2c@vger.kernel.org>; Sun, 05 Feb 2023 23:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3oROpYigvyreUmAKfX7vQra//gQmW6nHo6GnvRG+Ds=;
        b=uC/3bR6d3VYjEUiBUYrnmwYW7IZ9T9owdYDzl1rJRth07R5DPKBihZ4b93sLM8hNrU
         sYaInZleorUxt42QjW/4A9B0UfYWAm4t/r6ylrhIv8RIS0BTw8X57MqLo7TV1HXFsy1W
         gT7yF97aj+MFP70toD0nZ9JIlzqbi6d8UqXsVfzekdW85z8t4aUAyaywMqXqhGSEHp18
         Rl0lidpGqssAJ42hzBTj97FflGCQT7xm8zlUWtDF++g3dC+4iiI3wpOOc99cpgUxkjcx
         X3wFmasnJI3m3xmxgAJzCQg+X8laBXE+8KP3Zz3ZqMlOuFj9wwTorJJQqMyuAyVw5Aja
         fI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3oROpYigvyreUmAKfX7vQra//gQmW6nHo6GnvRG+Ds=;
        b=eRDXXtICqFg2SpVrrhfKFC2yDKP4yrz6tlaJ8/Km4CNgCdUVOP8SsS5bXJogUdcJhn
         XZXjDEIETYuOwtLStiRHegTdzP8GVzfOksjVJXyv8BI1x6NQL23u2z0UxOCvA/hq4XyS
         s03YVvuVlJUzukrtZQEascWPtCtP85u0SYTJ8AVEebsRjFhZnSfIMOabde78nyKM5dA2
         BFxUnCvwKqxK1j8Y0guBTJSf0UKZHmLWHXUFyOz/ZoTn66zBQP4DlPXGXZ96SziFz0hy
         V20tr8+9ZDhklm2AJiYdRpeepFMo9rpv2bD6gDhkbe6XpcKLWWTkt6+tDOYIaJr0Gc86
         iJaw==
X-Gm-Message-State: AO0yUKXaL1++2VrnJUlkxLPHf9UyicyJP4e62wbLgmwsDgNxVix0BzKk
        RTqnN3ooNpyJMo/2D3zlUC6O+w==
X-Google-Smtp-Source: AK7set8YaWcc9JJj3MGvQEDd6EkBxt0phIHKLKG0WnWIA71woqKMG6XTB/vMdc1p7z/ph+u7c1TBaw==
X-Received: by 2002:a05:600c:6026:b0:3df:ef18:b0a1 with SMTP id az38-20020a05600c602600b003dfef18b0a1mr10142064wmb.12.1675669271267;
        Sun, 05 Feb 2023 23:41:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c3b8900b003d9aa76dc6asm16220625wms.0.2023.02.05.23.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 23:41:10 -0800 (PST)
Message-ID: <06920579-74d2-8e35-a534-8a65dee322d1@linaro.org>
Date:   Mon, 6 Feb 2023 08:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] dt-bindings: i2c: cadence: Document `cdns,fifo-depth`
 property
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230205230208.58355-1-lars@metafoo.de>
 <20230205230208.58355-2-lars@metafoo.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230205230208.58355-2-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/02/2023 00:02, Lars-Peter Clausen wrote:
> The depth of the FIFO of the Cadence I2C controller IP is a synthesis
> configuration parameter. Different instances of the IP can have different
> values. For correct operation software needs to be aware of the size of the
> FIFO.

Cannot this be inferred from compatible?

> 
> Add the documentation for the devicetree property that describes the FIFO
> depth of the IP core.
> 
> The default value of 16 is for backwards compatibility reasons with
> existing hardware descriptions where this property is not specified and
> software has assumed that the FIFO depth is 16.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..3daa2fa73257 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -38,6 +38,12 @@ properties:
>      description: |
>        Input clock name.
>  
> +  cdns,fifo-depth:
> +    description:
> +      Size of the data FIFO in words.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Drop quotes.

> +    default: 16

maximum
minimum?


Best regards,
Krzysztof

