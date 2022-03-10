Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7094D454F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 12:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239496AbiCJLGQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 06:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239150AbiCJLGP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 06:06:15 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8C763511
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 03:05:12 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7C09C3F60D
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646910311;
        bh=qvOE3jak++pUiow8bpU9bXWS/P2UoZ4k0QK3oOQxPEQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=KfNqk4buoHB+HoBaSGfjs8ti/o3c++UfLDu7VjPD2vY00zfKHDoFw5APrlh/wST7K
         aETyLF6Lk6tseiqjQ2OqgLYU89HJcclptsvxD1LrednArQJW0R9NFlJeyC38qMA/ke
         qD1Y50aXe8u17SDK3dwg+bQBXGl7Eilayx6N5jGsqNIW24RqY7F75b05wNO0SVO0ks
         I2yuzDtkPxRFZNWp1cDQv7sti5JaEo+4ylLtVDnCQsqqMyMV55vvfTaonVRZMH2UsI
         c9asHO8eJSXRMs7CZRKSziZS/05+1POmb7i4Rh4p6grwS1jBXqbFGbgRg+drzqoNgF
         KFibcn8Kl1qvA==
Received: by mail-ej1-f70.google.com with SMTP id le4-20020a170907170400b006dab546bc40so2909259ejc.15
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 03:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qvOE3jak++pUiow8bpU9bXWS/P2UoZ4k0QK3oOQxPEQ=;
        b=UgO8j2i9ChRrwGde51UW6MvYndKweHFdjHTt8cl1PF2TTji+cjbEW22GO0yFipoDKZ
         PnSx7kpKqHT4pvoYLy8CGDbD0qPsOxVnPQsig+GL3fLvw+b2xoy4067ohiyN74cWhM2s
         a16dXiI2i6TPfzSb6QQKOCOUws4ikYImpiphZWzEXaF0raUp89vPJ8Mhp3j1kBgDvH4K
         X4eOAGLbxramV210ByiiIx81jy/lV4h/TQdAaHIqozZ2RMqp8MwGaGLjMPuoJGmjjYTd
         NCgnYwG+2BOksmi9YXtY92n05CVVtN4M+oNw8SFquqpWtY/qUePmKAb5gXqT1nC4qRKC
         DFUA==
X-Gm-Message-State: AOAM531Ufmt77AhcmayXdlr5/n30C/hnYZ/iINkWdRAeVrkBVBKYNAjc
        Z8c8dLfeSDGDSx6s2kWHavcQyJWth4jit7TPAORc527jGLU3tUdbc9YW4mgtDCINOVl+20Zjeej
        Hzs6aqXRIYL2KuTyw/dv3nLQLOFQfbpVc0eYpEQ==
X-Received: by 2002:a05:6402:26cc:b0:416:4189:f65e with SMTP id x12-20020a05640226cc00b004164189f65emr3763625edd.228.1646910311023;
        Thu, 10 Mar 2022 03:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz81Ol/hHx3CSkPPpYceDYz0s+ll9kenGjUXG5PHNhMeitK48hiWFXZWQN8EL7jnkvBtOCsaw==
X-Received: by 2002:a05:6402:26cc:b0:416:4189:f65e with SMTP id x12-20020a05640226cc00b004164189f65emr3763567edd.228.1646910310361;
        Thu, 10 Mar 2022 03:05:10 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p4-20020a50d884000000b004128cf5fe2asm1892496edj.79.2022.03.10.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 03:05:09 -0800 (PST)
Message-ID: <2b271ddf-d054-522f-7897-cd842e935823@canonical.com>
Date:   Thu, 10 Mar 2022 12:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] dt-bindings: i2c: at91: Add SAMA7G5 compatible
 strings list
Content-Language: en-US
To:     Sergiu.Moga@microchip.com, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Claudiu.Beznea@microchip.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220309120714.51393-1-sergiu.moga@microchip.com>
 <20220309120714.51393-4-sergiu.moga@microchip.com>
 <d6886c55-6f4a-916f-20fd-9f6465a8a0cd@canonical.com>
 <8f4cc7ad-6ce2-2c78-dab4-759d05761a64@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <8f4cc7ad-6ce2-2c78-dab4-759d05761a64@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/03/2022 11:42, Sergiu.Moga@microchip.com wrote:
> On 10.03.2022 09:22, Krzysztof Kozlowski wrote:
>> On 09/03/2022 13:07, Sergiu Moga wrote:
>>> Add compatible strings list for SAMA7G5.
>>>
>>> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
>>> ---
>>>   .../bindings/i2c/atmel,at91sam-i2c.yaml       | 38 ++++++++++++-------
>>>   1 file changed, 24 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
>>> index d4aadbbd1a11..661a679b98cf 100644
>>> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
>>> @@ -16,10 +16,15 @@ allOf:
>>>         properties:
>>>           compatible:
>>>             contains:
>>> -            enum:
>>> -              - atmel,sama5d4-i2c
>>> -              - atmel,sama5d2-i2c
>>> -              - microchip,sam9x60-i2c
>>> +            oneOf:
>>> +              - items:
>>> +                  - enum:
>>> +                      - atmel,sama5d4-i2c
>>> +                      - atmel,sama5d2-i2c
>>> +                      - microchip,sam9x60-i2c
>>> +              - items:
>>> +                  - const: microchip,sama7g5-i2c
>>> +                  - const: microchip,sam9x60-i2c
>> This looks not needed, because it contains microchip,sam9x60-i2c which
>> is mentioned earlier.
>>
> Hmm, I might have misunderstood the functionality. I thought it would be 
> stricter, having to match all the strings of that compatible. I guess 
> something like this should be enough then?
>             oneOf:
>                - enum:
>                    - atmel,sama5d4-i2c
>                    - atmel,sama5d2-i2c
>                    - microchip,sam9x60-i2c
>                    - microchip,sama7g5-i2
> 
> Just adding the sama7g5 compatible seems to pass the check on my end.

Yes, that is also a good solution.

Best regards,
Krzysztof
