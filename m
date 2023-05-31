Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 004E9718A7F
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 21:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjEaTuO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 15:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjEaTuM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 15:50:12 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A82126
        for <linux-i2c@vger.kernel.org>; Wed, 31 May 2023 12:50:06 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96ff9c0a103so887047666b.0
        for <linux-i2c@vger.kernel.org>; Wed, 31 May 2023 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685562605; x=1688154605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Ap8ivNjjEOpFy0ZGNi/uN4rZsPt4ntDdAH9alXocoE=;
        b=V+o0KY6EHF2eGAko/76pQzl3pSBg62mpWcK2vyehG/3MIIb77ZsvRGl7CF0YsWq1Tx
         zk1RMf5cX2S00BzNWmWzQoQ1pRM+Yrj71zOIT1A8EFTHjY24LQrGlynVOcVET95q29n+
         HYeVvjjLfaOGHBThEu9Pr2lJHM85PbTmdpka7S57PWtf6jhqmbDYmUqIP6hUYgCQOdr1
         jEIZWtnKalI1Tv9iF5223ZJmQhrChTOtJad7aP1bqrFp00SoFWb8zMGEkXMXTfmNaB05
         LzKyCz/wQE+KuCCCtDNLfSyzQJ5n3Sl/8Inox0rCfgZi/9i65PpMneBtH+axGP1C3Eja
         eNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685562605; x=1688154605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ap8ivNjjEOpFy0ZGNi/uN4rZsPt4ntDdAH9alXocoE=;
        b=gn6GmFoQd41Z6UadpyidXl1foYtxsIXuY/oA2Unb9wvO+CtuhObe4C7YHiPKdQB6fV
         qccU+HrsmFz4GVEDwJQTzBabDK9t4+rkOD/u+Qh5ChXRpZd/ixKAMINJxyrpCMN1B4XD
         C9rVrIdwyk+VN2//Q1WoYVKnPvqVigaO3S2OEoaIiSVLVIvXAT+dXqpHzbuQxUIHPj/o
         xa4LRCR0kklrrcpaWHZXCIcp3Pg8cg7yE7yV1HN0kCsb2NmELBlAkk3zxqDpGRHuDYuy
         AHaa+yu62bqhqdSWyaVH4MADFyjDx4I04Q+2EqO2ehTG5iNlK+y9qbe4hLmBmO4Yz6sj
         RfaQ==
X-Gm-Message-State: AC+VfDzDqXENXa3rnYzWLrnLA4gbl3RYQ3bwP0vh198zD5Ix1mD8XcA/
        bWkw0/CPErXjudOusvVlrxC5tg==
X-Google-Smtp-Source: ACHHUZ4PjdSLkkd1JzVIKJUf6mH9GIes77eNlkJ5MIKSWkuyHYrUlyFCaskH7ywMFWJVRowdPVfYBA==
X-Received: by 2002:a17:907:e93:b0:971:484:6391 with SMTP id ho19-20020a1709070e9300b0097104846391mr6614763ejc.20.1685562604719;
        Wed, 31 May 2023 12:50:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j21-20020a17090686d500b00965a0f30fbfsm9383346ejy.186.2023.05.31.12.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 12:50:04 -0700 (PDT)
Message-ID: <f815348f-0f54-617c-8373-df283be532f4@linaro.org>
Date:   Wed, 31 May 2023 21:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXT] Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus
 recovery example
Content-Language: en-US
To:     Carlos Song <carlos.song@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>
Cc:     Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230529074302.3612294-1-carlos.song@nxp.com>
 <20230529074302.3612294-2-carlos.song@nxp.com>
 <ed004607-5a23-564a-3185-a63af87783e5@linaro.org>
 <VI1PR04MB5005E43373DB10A9FD726AD7E8489@VI1PR04MB5005.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1PR04MB5005E43373DB10A9FD726AD7E8489@VI1PR04MB5005.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/05/2023 12:22, Carlos Song wrote:
> Hi,
> 	Thanks for you reply. 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Tuesday, May 30, 2023 10:59 PM
>> To: Carlos Song <carlos.song@nxp.com>; Aisheng Dong
>> <aisheng.dong@nxp.com>; shawnguo@kernel.org; s.hauer@pengutronix.de;
>> kernel@pengutronix.de; festevam@gmail.com; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
>> Anson.Huang@nxp.com
>> Cc: Clark Wang <xiaoning.wang@nxp.com>; Bough Chen
>> <haibo.chen@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
>> linux-i2c@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: [EXT] Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus recovery
>> example
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report this
>> email' button
>>
>>
>> On 29/05/2023 09:43, carlos.song@nxp.com wrote:
>>> From: Clark Wang <xiaoning.wang@nxp.com>
>>>
>>> Add i2c bus recovery configuration example.
>>
>> Why? That's just example... also with coding style issue.
>>
>>>
>>> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
>>> Signed-off-by: Carlos Song <carlos.song@nxp.com>
>>> ---
>>>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml   | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
>>> index 4656f5112b84..62ee457496e4 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
>>> @@ -58,6 +58,16 @@ properties:
>>>    power-domains:
>>>      maxItems: 1
>>>
>>> +  pinctrl-names:
>>> +    minItems: 1
>>> +    maxItems: 3
>>
>> What's the benefit of this? Entries should be defined but without it is not really
>> helpful. Anyway not explained in commit msg.
>>
>>> +
>>> +  scl-gpios:
>>> +    maxItems: 1
>>> +
>>> +  sda-gpios:
>>> +    maxItems: 1
>>
>> You don't need these two. Anyway not explained in commit msg.
>>
> 
> Sorry for confusing you with the poor commit log and without
> full description.
> 
> The reason why we need sending the patch for dt-binding is :
> We sent out a patch for I.MX LPI2C bus support recovery function.
> When LPI2C use recovery function, lpi2c controller need to switch the 
> SCL pin and SDA pin to their GPIO function.  So I think the scl-gpio and
> sda-gpio property need to be added in the dt-bindings.

Why do you think they are not in the bindings already?

> 
> And alternative pinmux settings are described in a separate pinctrl state "gpio". 
> So maybe "gpio" pinctrl item need to be added.
> 
> I would like to know whether the above changes are really unnecessary according to above case?
> Or because of the vague commit log, you are misled and think that our patch is not necessary to add examples.


I claim your patch has zero effect. Can you prove otherwise?

Proof is with DTS example and result of dtbs_check.

> 
> Is there no need to add sda/scl-gpios property or no need to add maxItems: 1?

I think entire patch can be dropped.

> We also find the sci-gpio and sda-gpio have been defined in the ref: /schemas/i2c/i2c-controller.yaml. 
> So is this the root cause of no need to add these properties?

Yes.


Best regards,
Krzysztof

