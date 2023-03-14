Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84D56B97D2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 15:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjCNOX2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 10:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjCNOX1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 10:23:27 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C3C559D0
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 07:23:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x3so62684723edb.10
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678803774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMxrUpznXSIBDo2JBKKZe9hAbpKqNtdthZ67TgrD304=;
        b=GTGBBybGUCWr8NRVVOUsCyAosbwVGVWSu3bqDDbw9xDnXA+8NgqD8LwkL86aoeNrIY
         euRoJQ9wyR2+H2vXJRuNuO3OHg1JpwxD3JhLl1nc2OR34rKiAsQFX1uuaMr/FeYwXjEx
         Gd7QsilVuCde+S1lII2v5woiuZYFM+nJfz62WM7vF7IeGdFbiPCs0URkEfM0a4PlFg/H
         DxEHgR1HxOocPfZzEnklSamjU0i7x7hFKSIvOdWpq77vaY3MtjXeeG5kKhrsmaPmxhW1
         X/FEe4x7JnF3/OOxEMG5Y1uaxP7y6HDEkREp6xy3W5udTmp17M+rAQQ8w4BSwl9rGNL/
         2eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678803774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMxrUpznXSIBDo2JBKKZe9hAbpKqNtdthZ67TgrD304=;
        b=d0JPfhvDir+Jetyco/GN5rEEs5S/4fPSPnr0wiQ2X/lFYZv2r+D0V53jsEEl895Ltd
         Hxqc9dCnrDPg/9f5EkHkQYzFTzxwpY5E71ozEBxItYcZb6rv5T72ZKdhULNyLrhbLXcj
         ZlXYLpE7N3Ubw2XRwPNcNGXFQj9qLlkJkVsEAGoi32V9g/VItgXI8g9+uL70vcpi8GbB
         ZF/mdI/nbRNzW/rQiRur4/sDmZPSCi6P2bNy9y91Vzj5SPkCxU4fNt2yTfjsapEYTJvj
         e6x66A9pSjrWa6T4aHQW/vklrB3HB1D1qTASn+9bjemcHC8BuiiuuVHVAK35lK6VA8eF
         9Fxw==
X-Gm-Message-State: AO0yUKWC99PWzF7SAXdvBLjtMpzg5tf45j3EKj2VMmW0/4AJbDKn9eGC
        jMNvfVggDPjx/rKWWzlEyu9xXg==
X-Google-Smtp-Source: AK7set/ies7q/bxpR0JGu9kGi9/sMVrE4sF4RFClvxfUbWMiesVzIQmDyZZF9q00uf84NX1+jmFjGA==
X-Received: by 2002:a17:906:4f8f:b0:88d:f759:15b0 with SMTP id o15-20020a1709064f8f00b0088df75915b0mr3266541eju.45.1678803774214;
        Tue, 14 Mar 2023 07:22:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id b27-20020a50ccdb000000b004ad601533a3sm1125175edj.55.2023.03.14.07.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 07:22:53 -0700 (PDT)
Message-ID: <ec504c7d-66d4-a4b7-547e-7272e012cdf9@linaro.org>
Date:   Tue, 14 Mar 2023 15:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-4-andi.shyti@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312233613.303408-4-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13/03/2023 00:36, Andi Shyti wrote:
> "fsl,timeout" is marked as deprecated and replaced by the
> "i2c-scl-clk-low-timeout-ms" i2c property.
> 
> Use this latter and, in case it is missing, for back
> compatibility, check whether we still have "fsl,timeout" defined.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/i2c/busses/i2c-mpc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index 87e5c1725750..28f11e30ac50 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -843,8 +843,18 @@ static int fsl_i2c_probe(struct platform_device *op)
>  			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
>  	}
>  
> +	/*
> +	 * "fsl,timeout" has been marked as deprecated and, to maintain
> +	 * backward compatibility, we will only look for it if
> +	 * "i2c-scl-clk-low-timeout-ms" is not present.
> +	 */
>  	result = of_property_read_u32(op->dev.of_node,
> -				      "fsl,timeout", &mpc_ops.timeout);
> +				      "i2c-scl-clk-low-timeout-ms",
> +				      &mpc_ops.timeout);
> +	if (result == -EINVAL)
> +		result = of_property_read_u32(op->dev.of_node,
> +					      "fsl,timeout", &mpc_ops.timeout);

Wasn't old property in us and new one is in ms?

Best regards,
Krzysztof

