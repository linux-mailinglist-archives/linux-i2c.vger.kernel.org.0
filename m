Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32D85BF6D9
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 08:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiIUG7N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 02:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiIUG7M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 02:59:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF8280EAF
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:59:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i26so7604736lfp.11
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HgFRLa6RZfxCSzyKzG51QeSheAMqgBptz4NFN1+wABA=;
        b=yK8M5MqvestK5tuVqPXXMT4E3PSbxbGxQYxddSfYgkVNtGTRe2EJowMAWc7iZ8JTyk
         FI8CR/ZY5FRxklQX5lxiWxXo1Str92tn4o6p9Cqt8QQuNsArRdG+g3y15GozaN86E6p0
         G8GFt4yCtX65S6VOCO7bfjoHssnFqhwGvfmi0KAbgZTRFZPtN+0JlWbcXb2x7/l7Ozkb
         9f/d1dIQBVbWdQLMkCIULJXNfcFq4Ikr1l/FC7Et397BKZ5/EjQpPaw93K9Cq6hBgEJl
         0NZTnMyshBZMmcZSLN2ppzkGCPVFMTD9oRR3uVGMb4B/0qzGY7VrodhNkk5dc70AZ9f/
         PDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HgFRLa6RZfxCSzyKzG51QeSheAMqgBptz4NFN1+wABA=;
        b=K/Mks7kQMcUfjerxzmxTm2kcpSxUW4cQWpYlHhhK2rfKllcYbZ2N3AjN8q4TGisjB4
         aYkknUqbLNOGpfbgVXDcHUfLgKQvpAIFugZLd4GJpp8cFWpMMg/nTnX+bseYBlsUEIUO
         1UmmxcgOdyX+yvkhZoyx/NvlmEaN5MrgkMXuUwELIK7DOyrcepElaouM8eaM2fiVyyg7
         g7GaqtSrFV8jHfw/LL/WJe8ppMfJNconx3yBk1wRS8e/EM/D51up/e8HgOsz1H6UYrCT
         OvKOFy+1VxLZ68vnzRU1g9aLvJ58JIyjJtksecsk1z1T5egQyl49nlsstpqt7Q19b14k
         H9ig==
X-Gm-Message-State: ACrzQf05enjd2yXiw3Zj5lgod8Yk86Xr8sb+LWg66O/8fCqFSVrWlQzl
        iSECmTqyOj5fyV6+HRKjbZIzHA==
X-Google-Smtp-Source: AMsMyM7HnQKXnVoP9WXO58OKStdAy4yp8cOYJrfYs5ikswC1P3+8W8uEveKoGIX/yvZX+3kbHCVc9g==
X-Received: by 2002:a05:6512:11c8:b0:497:c19e:c709 with SMTP id h8-20020a05651211c800b00497c19ec709mr10425195lfr.152.1663743548671;
        Tue, 20 Sep 2022 23:59:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z12-20020a2eb52c000000b00261e2aab7c2sm306813ljm.58.2022.09.20.23.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:59:08 -0700 (PDT)
Message-ID: <b71a576b-170c-d596-a024-884223be44c6@linaro.org>
Date:   Wed, 21 Sep 2022 08:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 8/8] i2c: i2c-mlxbf.c: Update binding devicetree
Content-Language: en-US
To:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        robh@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Khalil Blaiech <kblaiech@nvidia.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920174736.9766-9-asmaa@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/09/2022 19:47, Asmaa Mnebhi wrote:
> In the latest version of the i2c-mlxbf.c driver, the "Smbus block"
> resource was broken down to 3 separate resources "Smbus timer",
> "Smbus master" and "Smbus slave" to accommodate for BlueField-3
> SoC registers' changes.
> 
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---


>    reg:
>      minItems: 3
> @@ -25,6 +27,9 @@ properties:
>        - description: Cause master registers
>        - description: Cause slave registers
>        - description: Cause coalesce registers
> +      - description: Smbus timer registers
> +      - description: Smbus master registers
> +      - description: Smbus slave registers
>  
>    interrupts:
>      maxItems: 1
> @@ -35,6 +40,13 @@ properties:
>        bus frequency used to configure timing registers;
>        The frequency is expressed in Hz. Default is 100000.
>  
> +  resource_version:

No underscores in names.

> +    enum: [ 0, 1 ]
> +    description:
> +      Version of the device tree. resource_version = 0 when the driver uses
> +      Smbus block resource. resource_version = 1 when the driver uses Smbus
> +      timer, Smbus master and Smbus slave resources.

No way. That's not a DT property.

> +
>  required:
>    - compatible
>    - reg
> @@ -42,18 +54,6 @@ required:
>  
>  unevaluatedProperties: false
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - mellanox,i2c-mlxbf1
> -
> -then:
> -  properties:
> -    reg:
> -      maxItems: 3

Why?

> -
>  examples:
>    - |
>      i2c@2804000 {
> @@ -61,8 +61,13 @@ examples:
>          reg = <0x02804000 0x800>,
>                <0x02801200 0x020>,
>                <0x02801260 0x020>;
> +              <0x00000001 0x1>;
> +              <0x02804000 0x40>,
> +              <0x02804200 0x200>,
> +              <0x02804400 0x200>,
>          interrupts = <57>;
>          clock-frequency = <100000>;
> +        resource_version = <1>;
>      };
>  
>    - |
> @@ -72,6 +77,25 @@ examples:
>                <0x02808e00 0x020>,
>                <0x02808e20 0x020>,
>                <0x02808e40 0x010>;
> +              <0x02808800 0x040>;
> +              <0x02808a00 0x200>,
> +              <0x02808c00 0x200>,
>          interrupts = <57>;
>          clock-frequency = <400000>;
> +        resource_version = <1>;
> +    };
> +
> +  - |
> +    i2c@2808800 {
> +        compatible = "mellanox,i2c-mlxbf3";
> +        reg = <0x00000001 0x1>,
> +              <0x13404400 0x020>,
> +              <0x13404420 0x020>,
> +              <0x13404440 0x010>;
> +              <0x13404480 0x40>,
> +              <0x13404200 0x200>,
> +              <0x13404000 0x200>,

No need for the same example.

Best regards,
Krzysztof
