Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5512A4F7C0E
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 11:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237289AbiDGJrs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Apr 2022 05:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244001AbiDGJrf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 05:47:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0CF1BB7AA;
        Thu,  7 Apr 2022 02:45:35 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 49CAA1F45DD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649324734;
        bh=L0r7ZwmFnBVo/NbGBVz0kgb+5537luDptsTBBJWqS5o=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TkckvxikMUzBrJbYhEwScFTQbnCWKfHPBZk81WwX4QWn/kyI5huVQL8m+lrh/TY27
         t8+AVCoYvzQA8k7HgKlgk6iXiGmDAI2IjteA2HIsO5aUjIwRdkLr0akOWZZjD9uQdC
         pUu2GyUcCTdVpb2+NlG9uYKqGt2sGsGEKv17CvCBp5xikUohiEWoVIUJoufs4WwNRs
         TjXUfwVlqR09bu7yIlOk2soTGrkWHg20lbx8RBtQFX+JFbwIT3BnWYzvN1AuNeQxU8
         0U1OzbmwxiCfQLtt/T5b71e43t6Wimm61QP3cGThbGFZA7Xp8srjNOf2Cii0Uub237
         dpCQ5n8UffTBQ==
Message-ID: <507fd6e4-a425-dbbe-f76f-da90870ff29e@collabora.com>
Date:   Thu, 7 Apr 2022 11:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Content-Language: en-US
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     devicetree@vger.kernel.org, hsinyi@chromium.org,
        kewei.xu@mediatek.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, qii.wang@mediatek.com, robh+dt@kernel.org,
        wsa@kernel.org
References: <20220406152940.140224-1-angelogioacchino.delregno@collabora.com>
 <20220406232400.2788-1-miles.chen@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406232400.2788-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Il 07/04/22 01:24, Miles Chen ha scritto:
> Hi AngeloGioacchino,
> 
>> Convert I2C binding for MediaTek SoCs to Devicetree schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
>>   .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
>>   MAINTAINERS                                   |   2 +-
>>   3 files changed, 119 insertions(+), 54 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>>   create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>> deleted file mode 100644
>> index 026985b8f61a..000000000000
>> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>> +++ /dev/null

..snip..

>> -  - clocks: clock name from clock manager
>> -  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
>> -    one bus has more than two i2c controllers, if enable have-pmic need include
>> -    "pmic" extra.
> 
>> +
>> +  clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: Main clock for I2C bus
>> +      - description: Clock for I2C via DMA
>> +      - description: Bus arbitrator clock
>> +      - description: Clock for I2C from PMIC
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: main
>> +      - const: dma
>> +      - const: arb
>> +      - const: pmic
> 
> I read "clock-names: Must include "main" and "dma"" from i2c-mt65xx.txt.
> Does it means that we should have at least 2 clock-names (minItems: 2)?
> 
> Thanks,
> Miles
> 

Hello Miles,
yes, you're right, I just rechecked the code and this is indeed the case.

Thanks for catching that, will send a v2 shortly.

Regards,
Angelo


