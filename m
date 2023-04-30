Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A2B6F28AF
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Apr 2023 14:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjD3MMj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Apr 2023 08:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjD3MMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Apr 2023 08:12:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E231728
        for <linux-i2c@vger.kernel.org>; Sun, 30 Apr 2023 05:12:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc4d96e14so1241081a12.1
        for <linux-i2c@vger.kernel.org>; Sun, 30 Apr 2023 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682856755; x=1685448755;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOAkIUSEs7b6pvNH1SS1me48LA5OZVukhoF6fPz2AOQ=;
        b=C5pKEgeIYe17zfHRFMD7nMORkSPnwSv4TqqfMhW90v3VYAYdlCH+KuyUheepPhCLOZ
         NGS+CWEU3RG9+tFryKHFsvKQ/vOTtl26DVwTv1IxW9bjsDhaT+rLJ8ldPQOLOGKw3lGz
         SJsvTygi4softPxrlUKypWB4jNxpNTIOQcMte1eS21uniYujFvErvAcCSVDoWTz+QP+W
         6UFl1khqUl0MCv9To2j1tnUHAT0s/AoqFSVMmUl3CnpPoBqs7J6IuLWENbuvEk04dcwX
         0tgjqj3sbfkrqqzJWpq/bZ0Y0iFAfIgl1Qhjd8EJNKQ8/dpiIGOsATb3E0PVnfFU3iMS
         LBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682856755; x=1685448755;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOAkIUSEs7b6pvNH1SS1me48LA5OZVukhoF6fPz2AOQ=;
        b=S9KQwjexufgFquujYACGc6eeMDejJUkz2DAbJWNsJWSv2ItCzwWoqlO1QmiWEeWw6P
         nOmIJF6Q2LIRkiakG6nJhxUhz2eF73IY5Q4QW5UaoQclsQgqsyQIH4wT5A2E4rQ9vKD1
         5eWTDFeKOpnVxN91OkUn6KQzrCBWMTuXhv3vgYdB0pLPCtcPuuMMvC4kQcFMKJUg9Zo6
         ScKokvYS5MDxb/dL5lTYtsJDrRe/nRD9Ua71eRJFHa57gnC33zqqB3+sescWswCxK8CR
         yy1p11hMlzMGjIb0XLnS4hcmgJ6Mhyp8QtNhTIVMCdHurlaUjPlvFGKb9RE9ExM9nO4h
         9ztw==
X-Gm-Message-State: AC+VfDxVz3DLCLiHH5Y5XuOvv2U7HimfzJRn4C+7cOTJHs4/V/5T8qO/
        yWc7K7M8O/BG/PAK1rReRYQGWw==
X-Google-Smtp-Source: ACHHUZ5vH8qhRuHSQ+Tiok+SsLg5uU8X83UFPedVxJQtdsvj32geMRotH8gGl3QtxwPoko8dEjLKxw==
X-Received: by 2002:a17:907:2da4:b0:94e:83d3:1b51 with SMTP id gt36-20020a1709072da400b0094e83d31b51mr10241997ejc.23.1682856754746;
        Sun, 30 Apr 2023 05:12:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4f23:e9a6:a1cf:ebd3? ([2a02:810d:15c0:828:4f23:e9a6:a1cf:ebd3])
        by smtp.gmail.com with ESMTPSA id hb8-20020a170906b88800b0094bb4c75695sm13630346ejb.194.2023.04.30.05.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 05:12:34 -0700 (PDT)
Message-ID: <d10e48cf-3cf8-89b7-8741-260adccfdfed@linaro.org>
Date:   Sun, 30 Apr 2023 14:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
 <168234258850.2489090.5138716439435477956.robh@kernel.org>
 <20230426172354.GB2506@standask-GA-A55M-S2HP> <ZE4Q6p1tAiIoZo/M@sai>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZE4Q6p1tAiIoZo/M@sai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/04/2023 08:55, Wolfram Sang wrote:
> 
>>> i2c@1c000: compatible: ['brcm,kona-i2c'] is too short
>>> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
>>>
>>
>> These warnings are fixed by the first patch in the series.
>> Maybe it didn't apply?
> 
> So, this depends on patch 1 but I2C doesn't pick up DT changes. So,
> shall this go via arm-soc, then? Or DT? Anyway, for any route:
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>

The dtbs warnings - if fixed via any other pactch - can be safely
ignored. They do not affect bisectability. Please grab this patch via
I2C. The DTS will go separately via arm-soc.

Best regards,
Krzysztof

