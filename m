Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA33E6F08C8
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 17:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244150AbjD0Pyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 11:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243711AbjD0Pyn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 11:54:43 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA656358D
        for <linux-i2c@vger.kernel.org>; Thu, 27 Apr 2023 08:54:41 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f19323259dso74721605e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 27 Apr 2023 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682610880; x=1685202880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NT5OMZcpsLf0lbuTdUMr8iotawbw3Liy9c/Vdmfa24E=;
        b=nqQ5p8zlRMDLN/yfAruMXjsqwL1+D8WJ+0/kCG4ScMQBqIhCQROP2qjHA6LZbeQwXx
         /Qw7cInIhmJQC3NteXOpQqvSD9teYyh+6kApv9svjUaIrHOxx7K48Bl3g8rZFl18FKZ7
         m0Q3riv/cUfRtuj8HQWgtyNuE/vr9/jEUUH7rZsoIEspEvMEs7oMpKIOVvuYqt1lgYFv
         3JU2Bx1Q2XjDMG3b2LEv2ubVhq7mSD5EZvEgInRfkOztkZHcpcpwDkcDmPItPn4+TaSH
         mDEfX+oFxZn/0RtZLkcnnVpjDwG8YKCg2a2PLr5t3WZ5pH2BinppK222FZJOyNENpXdK
         NHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682610880; x=1685202880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NT5OMZcpsLf0lbuTdUMr8iotawbw3Liy9c/Vdmfa24E=;
        b=lB1u2hy+5MvSbB2iZySrLPih7LOWqdQg1aFaYtUqizbWsRdlEXJ/Q5OZFXzH4OMlQ1
         KfjD+Qkb+9pjgeL+A7MQg2z5Qnwy8sNWli7uWIyLi3TFAt070p+jLJ42UihQk2FROll1
         Ca/drl6a0h7eHdlltFgWLG31PEroOI1+KHhP7lVg8aAFpGw1l3CC+zKUD2SBkSnLG16O
         P/CLgezgaetxQE5uNkPc7dN28xrqMwGAxFhlszAjGE2cklIZDUOyA/EBa37CtC8rMA4x
         5ajKPLOnAhbYuuFxIR3dPcV0GOy1o+QksSuoZQKyeyGxVoKNp9wMZgobN8auO6QggRgu
         eByQ==
X-Gm-Message-State: AC+VfDz4oDKDMSAe/aN4gjLDGuPkl2bvjTLuTehzATab3Fytoo2YSXjY
        3e3gAsIczw+UJ1QEMmQ2jhypQA==
X-Google-Smtp-Source: ACHHUZ68RQi5AnxrkZd2UuCXC+9MDWHIGwD4MJusXcFhTSBT7trk0UdJQWtK6Fpjc6YwGpTGvpzOyg==
X-Received: by 2002:a05:600c:21ca:b0:3eb:3945:d405 with SMTP id x10-20020a05600c21ca00b003eb3945d405mr2065143wmj.38.1682610880148;
        Thu, 27 Apr 2023 08:54:40 -0700 (PDT)
Received: from [172.23.2.142] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4cc7000000b002fa5a73bf9bsm18865705wrt.89.2023.04.27.08.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 08:54:39 -0700 (PDT)
Message-ID: <181a8d2e-fb27-13e0-5b7b-42559213ff42@linaro.org>
Date:   Thu, 27 Apr 2023 17:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Content-Language: en-US
To:     Stanislav Jakubek <stano.jakubek@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
 <8d6042cd-f690-d274-c658-e83ff3a5776e@linaro.org>
 <20230426171621.GA2506@standask-GA-A55M-S2HP>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230426171621.GA2506@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26/04/2023 19:16, Stanislav Jakubek wrote:
> On Mon, Apr 24, 2023 at 03:53:07PM +0200, Krzysztof Kozlowski wrote:
>> On 23/04/2023 14:40, Stanislav Jakubek wrote:
>>> Convert Broadcom Kona family I2C bindings to DT schema.
>>>
>>> Changes during conversion:
>>>   - add used, but previously undocumented SoC-specific compatibles
>>>   - drop references to SoCs that are not upstream
>>>   - add supported clock frequencies according to the Linux driver [1]
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/i2c/busses/i2c-bcm-kona.c#n731
>>
>> This line points to moving reference in next, so might no be accurate
>> later. If you need external reference, then it should be some stable
>> tag. But anyway if this is in mainline (is this?) then, why referencing
>> via external link?
> 
> Yes, it's in mainline since 2013. I just pointed to linux-next since
> that was what I had open at the time.
> 
> Just to make sure if I understood correctly, if it's in mainline then
> there's no need to reference it via link? Or should I point to some tag
> instead, e.g.:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-bcm-kona.c?h=v6.3#n731

Yes, this would be better but I propose still to drop the link entirely.
If you know the commit SHA which introduced this, mention it.

Best regards,
Krzysztof

