Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBE06B66D2
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 14:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjCLNnX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 09:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjCLNnV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 09:43:21 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B938C14EAC
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 06:43:14 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g10so9797839eda.1
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 06:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678628593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3iUN11DrzuzPMfFFj12OwdJMcoiZbJZcwKV+23ak0c=;
        b=JplCRdbIE7Xoood5Q2DTakN65IsZzSGDiJFtWX9EiaZQI/K861tTqvnbDOHCo4cnSq
         MDblVdeHDsqCLRPeo1dnLn94hPqi9n4zBJOcHeOouaSkXHKvN2qEqOwzPX2pcQywmYpm
         KvPJxvOsb89FiiRb45WmDgw+gMzMZ6S2bxyh8GjXu2oDte00todUPSBfdVCG8DGnLaor
         7gASl2eiCi7tFEvVPfbVPZ0ynYqOIhyBu1sLLipE8nL0WMPBQ921KD1xG/rEsCW80ZyE
         ffe/GesRPTj2fB6krB0Vtdb7jaHRQeH451A6Ezl6DWNosBsbzMY2HYI8nxzrNQ8jUg6/
         ZluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3iUN11DrzuzPMfFFj12OwdJMcoiZbJZcwKV+23ak0c=;
        b=oZ1COcsScRWjq8mqPOzKNPqaK9/IHeshWH4QHTC+u4e1zAtCE4k7lpi5sEK8oQXYvo
         qXWYQ2H7PW2YcxBedgkzaQHMAK7o2aSl+gTNF5ixll+oPJ+E+XiM05oT1IHq/HltTjg3
         PWAATBQW5Pe/syB+7tyvPZwy5N992EAQ6e6fExB6nGtrDfwLo0Y6w6Ctz6AOQY+0dBoj
         m89S0DmJ1umidw6vr9uPEA8GWrIAs0sPoOE7wci+gZJg0jPaCO0YGpwSK9uFXI80Pwfu
         VqlCSzUWFYoaFE69aLMjIzobLv9UYiDVk/l36Sxbx3sZOvI3cQMIXDUlbRD6CwtIHfT9
         xxuw==
X-Gm-Message-State: AO0yUKVVc+Z4VtnM9MN7eHh6tD9rP/eVQg7MZijAN9om5I5R0gzrFYE5
        Bn5WvCqHiSZMatBhPQGqT85UmA==
X-Google-Smtp-Source: AK7set/kRBOjIV/XpKuBn39h8Vum09AMeyOVi2viOLHD6UWQc0sLpA/l9hklBDEpzLhZktLH1ooF/g==
X-Received: by 2002:aa7:c1c4:0:b0:4c5:bc48:d422 with SMTP id d4-20020aa7c1c4000000b004c5bc48d422mr25727842edp.7.1678628593250;
        Sun, 12 Mar 2023 06:43:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id t7-20020a50ab47000000b004cbe45d2db5sm2200108edc.37.2023.03.12.06.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 06:43:12 -0700 (PDT)
Message-ID: <c3e3019c-eb93-110c-33bd-73bcc8ce53a5@linaro.org>
Date:   Sun, 12 Mar 2023 14:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add the clock stretching property
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230312131933.248715-1-andi.shyti@kernel.org>
 <20230312131933.248715-2-andi.shyti@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312131933.248715-2-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/03/2023 14:19, Andi Shyti wrote:
> The I2C specification allows for the clock line to be held low
> for a specified timeout to force the slave device into a 'wait'
> mode. This feature is known as 'Clock stretching' and is
> optional.
> 
> In the NXP I2C specification, clock stretching is described as
> the process of pausing a transaction by holding the SCL line LOW.
> The transaction can only continue when the line is released HIGH
> again.[*] However, most target devices do not include an SCL
> driver and are therefore unable to stretch the clock.
> 
> Add the following properties:
> 
>  - i2c-scl-clk-low-timeout-ms: This property specifies the
>    duration, in milliseconds, for which the clock is kept low and
>    a client needs to detect a forced waiting state.
> 
>  - i2c-scl-has-clk-low-timeout: This property specifies whether
>     the I2C controller implements the clock stretching property.
> 
> It's important to note that this feature should not be confused
> with the SMBUS clock timeout, which serves a similar function but
> specifies a timeout of 25-35ms. The I2C specification does not
> recommend any specific timeout.
> 
> [*] NXP, UM10204 - I2C-bus specification and user manual
>     Rev. 7.0, 1 October 2021, chapter 3.1.9.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index fc3dd7ec0445..12c311f0e831 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt

Although the properties are still sometimes added here, but the bindings
are now in dtschema, so rather this should be updated:

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

> @@ -45,6 +45,15 @@ wants to support one of the below features, it should adapt these bindings.
>  	Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
>  	specification.
>  
> +- i2c-scl-clk-low-timeout-ms
> +	Number of miliseconds the clock line needs to be pulled down in order
> +	to force a waiting state.
> +
> +- i2c-scl-has-clk-low-timeout
> +	Boolean value that indicates whether the controller implements the
> +	feature of wait induction through SCL low, with the timeout being
> +	implemented internally by the controller.
> +
>  - i2c-sda-falling-time-ns
>  	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
>  	specification.

Best regards,
Krzysztof

