Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706E571FAC3
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jun 2023 09:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbjFBHMs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jun 2023 03:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbjFBHMP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jun 2023 03:12:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4470910C0
        for <linux-i2c@vger.kernel.org>; Fri,  2 Jun 2023 00:12:09 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96f7bf29550so245547666b.3
        for <linux-i2c@vger.kernel.org>; Fri, 02 Jun 2023 00:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685689928; x=1688281928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ID97egBGuXMI7J4GkeNsqWERFtG/jgBWuZXR0IgIwWE=;
        b=pJ6WxSKGbQ1lTXGYSx5AV6TgLnndwDX+mYc4xaGh0RzfzalUrq3xVEWx54oWvDi02I
         z1fvVun1fQXFZBEdCACH3A6qBZmGWyjxGbOKud+dLG9w+/9DEIU1owODdv9vBALtlBrf
         OXsvJ2jO/bxffy3BDljQJDG/GORMavqDuUvF6qtPv+yxO/+R3BQdJ3p6BTSbPay0Hxv7
         dY53Bs3Z8PYwSd5WBPOuwBbVrXj+sbZYw7QtiuISgIKdt4FCeuBAoBXK6n1Pq6mUXacl
         ZLN8o4wds8nM3S3H16LEMFHrkqTKHIWPKMnJARqQVdgy0rbl3V2ZrqlFi6a0s3q/rsLW
         KusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685689928; x=1688281928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ID97egBGuXMI7J4GkeNsqWERFtG/jgBWuZXR0IgIwWE=;
        b=RAfSmmHwjKQpabQH3qusX7QWiI7lCZ8dr+ROWCFWpZ9R3hSQqZUFwETiin5hHdSCbm
         a4mrriScc6fvKS/8v34osV9rLtMiDo8Q5mwb1xTtpHE6S3hZEAV3Woaz23TnOFiG4F2V
         kb+DkZjTQsuzjTsD0aXco4M2w5pCjialUz55YmeJWRHabil7YbRD+uypaabTqemROzu/
         TXkNzMjANroTCbApE0awPLsVFPtoRqymBoG1tlgu26AOJd0r6KqruxE4E/PO02GaQaoc
         5keR2FpUJR66Lv3w6XvJ5UklIUO+/NL/6d4QN5fxYO9fO7OOeQIVEABy6xRo/+Eowcp9
         GlCA==
X-Gm-Message-State: AC+VfDxDeadAnHhm3TaGljHbBKsE7HT4beAhgv27UCHXTePg6BP4fE0J
        /t8RPbn2KwwhRGNRde7MNtyN7LmFLtoQv2zLGK0=
X-Google-Smtp-Source: ACHHUZ4hbQaYX7U80wxKjvKgnV9pZX+PaiNP2lawdYjP7mjQi3B2eIAZoovKcl7m0wcRKYSz3aVP3Q==
X-Received: by 2002:a17:906:6a16:b0:947:ebd5:c798 with SMTP id qw22-20020a1709066a1600b00947ebd5c798mr10173625ejc.54.1685689927791;
        Fri, 02 Jun 2023 00:12:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906c18400b00969f13d886fsm397252ejz.71.2023.06.02.00.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 00:12:07 -0700 (PDT)
Message-ID: <7dfc6241-ed72-d655-7400-fd8f9c413e69@linaro.org>
Date:   Fri, 2 Jun 2023 09:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        =?UTF-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
 <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
 <ZHjtExYIdVFo3HnB@makrotopia.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZHjtExYIdVFo3HnB@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/06/2023 21:10, Daniel Golle wrote:
> On Thu, Jun 01, 2023 at 06:54:01PM +0200, Krzysztof Kozlowski wrote:
>> On 31/05/2023 18:10, Daniel Golle wrote:
>>> Add pck and mck clocks which are needed to access I2C registers on MT7981.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>> index fda0467cdd954..550795f6573c5 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>> @@ -78,6 +78,8 @@ properties:
>>>        - const: dma
>>>        - const: arb
>>>        - const: pmic
>>> +      - const: mck
>>> +      - const: pck
>>>  
>>
>> Adding names does not magically add the clocks. This wasn't tested.
> 
> Adding the clocks is done in patch 2/2 which just wasn't sent to
> devicetree@ and dt maintainers, but to the relevant mailing lists
> instead. Was that wrong and should I always send the complete series
> also to devicetree@ as well as dt maintainers?

I didn't mean implementation. I meant that you still do not allow more
clocks! You can put into names whatever you wish but clocks are taken
from "clocks" property, not from clock-names.


Best regards,
Krzysztof

