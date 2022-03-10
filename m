Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC564D41BF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 08:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiCJHYA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 02:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239601AbiCJHX7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 02:23:59 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1B14F9D0
        for <linux-i2c@vger.kernel.org>; Wed,  9 Mar 2022 23:22:59 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B70593F1AF
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 07:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646896977;
        bh=vvJ1s6MAam4XpCarGjHQuEzwyDsZZuI/+V4fbf0u5IY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Y8KfwDWYzJw9jpmaLpL5V28lqxXeW2w7lHIeenrbXDuMG/onmpzec0dd2L6f70RsR
         2GFO2YgTUgME/vtTUHpAMMzNsSwt9VdWcBt0uNbmq1hKmx3/FWFTB5i+GSnDUWH+sH
         8PETHQA4ND4GZQpsdrIksb330isZHFfwrwmwsY/HZyqOhot/zQIWe39tWC4Inx2FCQ
         0VYaL/+to70FmNz6JPGSC7mqMoU4P5LLl2IrzqzJ4h198F/A43GT9he+dq48vK34He
         U2EZQVxq9uPvmuRhVsYY0Ayhim3feJ0BIpR5TEuDn6vzgl+TjJdqAy87TUTKsybah2
         4zOfSmyEw/RNQ==
Received: by mail-ej1-f70.google.com with SMTP id h22-20020a1709060f5600b006b11a2d3dcfso2630764ejj.4
        for <linux-i2c@vger.kernel.org>; Wed, 09 Mar 2022 23:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vvJ1s6MAam4XpCarGjHQuEzwyDsZZuI/+V4fbf0u5IY=;
        b=2spMc9A4Y4Yc9kzmxeCSlAe5APx9vUDmtVyFnGkPdkvDWA745wlPgEpASKd/vMdSZC
         hbAQcLkSCC5r2poPw6fEUBdqmZRTUD8CVZruS6ULJliskzuW2mIF7LnJ6OG/PD295MLw
         wRbW8TDnSiRnXAt0Js6Gizwt34Aa1HfMhTnDnyxoH65zHn/FcsN0t2qH3u8fV0JmXpgP
         q/q4tEaL6ETpaLajEntcfRyqz4Z+q9MMsS0kZN/lCiICb/BqjCCwH/j9XymEJ5o9HeSN
         1yWOPFOUmh1pQkYKy2rQRiEW1sdsLxIgR+XPsqylphQJPlfFQgesiYBq2ku2AR6OCP8C
         +aEw==
X-Gm-Message-State: AOAM531G6h7w4IgZdyN+gIlybHqQgwoydhlFWGmdH3tJQDZ3gsUrEvKc
        Vi90WmyZfD13NFEFv56FS3fB3lazDYrktbYH3yc5Qw51y6kmiT6BHwH4HUH2Qfacp1pyzw2ttjV
        h5oylh5uUOmmdAyeoakdYHfyObKd7XpT7Uy0JYw==
X-Received: by 2002:a05:6402:150f:b0:416:175d:3f5d with SMTP id f15-20020a056402150f00b00416175d3f5dmr2999950edw.184.1646896977395;
        Wed, 09 Mar 2022 23:22:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEH8VFBsYcKtizhDQ0TramGL1ojYlnymp0dVdUmk7PREVnAiIV2i+N3PUIjHR3Kn6HpURR4w==
X-Received: by 2002:a05:6402:150f:b0:416:175d:3f5d with SMTP id f15-20020a056402150f00b00416175d3f5dmr2999935edw.184.1646896977179;
        Wed, 09 Mar 2022 23:22:57 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906395600b006cec40b9cf0sm1484883eje.92.2022.03.09.23.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 23:22:56 -0800 (PST)
Message-ID: <d6886c55-6f4a-916f-20fd-9f6465a8a0cd@canonical.com>
Date:   Thu, 10 Mar 2022 08:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] dt-bindings: i2c: at91: Add SAMA7G5 compatible
 strings list
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, robh+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220309120714.51393-1-sergiu.moga@microchip.com>
 <20220309120714.51393-4-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220309120714.51393-4-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/03/2022 13:07, Sergiu Moga wrote:
> Add compatible strings list for SAMA7G5.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  .../bindings/i2c/atmel,at91sam-i2c.yaml       | 38 ++++++++++++-------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index d4aadbbd1a11..661a679b98cf 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -16,10 +16,15 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            enum:
> -              - atmel,sama5d4-i2c
> -              - atmel,sama5d2-i2c
> -              - microchip,sam9x60-i2c
> +            oneOf:
> +              - items:
> +                  - enum:
> +                      - atmel,sama5d4-i2c
> +                      - atmel,sama5d2-i2c
> +                      - microchip,sam9x60-i2c
> +              - items:
> +                  - const: microchip,sama7g5-i2c
> +                  - const: microchip,sam9x60-i2c

This looks not needed, because it contains microchip,sam9x60-i2c which
is mentioned earlier.


>      then:
>        properties:
>          i2c-sda-hold-time-ns:
> @@ -29,16 +34,21 @@ allOf:
>  

Best regards,
Krzysztof
