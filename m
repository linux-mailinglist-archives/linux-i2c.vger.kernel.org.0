Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA426AAEDC
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Mar 2023 10:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjCEJtR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Mar 2023 04:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjCEJtQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Mar 2023 04:49:16 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C67D304
        for <linux-i2c@vger.kernel.org>; Sun,  5 Mar 2023 01:49:13 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id da10so27032553edb.3
        for <linux-i2c@vger.kernel.org>; Sun, 05 Mar 2023 01:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678009752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1NXWkshbGfkpUPFum76bHknO/vpxYG/pfk6G3wkE88=;
        b=f28fzSBPdgs5Vsb2eBhafb9P8Iqi42pAXvvHC7L57u9epmuuckD3RLBz/3lG9XnZIw
         lRCSB1mUeoyoY+ow1Ly0K8DoVHnaGj2t+J97AeLA1OT03/nn+Ddnb4p6YzfPOofKOYPI
         7bD8AfVZs1+YrbglfnVA04eIHswEP+EM7XPZlGBnoQbhA3rBDnpq7OfvXIScCwNCNgLz
         c3DzpW0+VMEzPbI4/HSMK7s9pV/IvSbJY1q0PIE9HXqn/lySdr81a9M6sOD4W51All0p
         i40QrQmFWlbaAnEpS3T0Jd6MDwxUu21YAIQKCJrv8XeMPeVzbE1Jj7pjWuopBgj+8N3J
         IamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678009752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1NXWkshbGfkpUPFum76bHknO/vpxYG/pfk6G3wkE88=;
        b=cBZ/tVtwcOVapTc7pPoh+fUA6NN7TNP8gT4yOQyaAikr7Zx398xPqhccJnWGo/kAWm
         A1n0XTCRRhh7dW99O+jm+8D/oHhIThaJE71g0TcppU2uAa4z0M+u1HoRERuPrDnxwsZg
         +HlptEtMYmJ5KKjSAIl7zqPJMWAsCKkWRE4795184njVfQcoUtUH31i8vwarckfc65pQ
         SagB4hCv0rDCf/cMT6P3m/PKaAat/tOm0mTsXPKD9sd+qtJ5BQncsNOjOyus1BB6FGEP
         s4E4fBP5gmAzbZf0Utvq0CqJ1GgQ7yZrwZV9ixEo0LavVCjswFNhc/SDoBKxGQa99ltQ
         gCwQ==
X-Gm-Message-State: AO0yUKW7k5moP6Ry1l+BJhGqko+Kl0s5GwmkYHOyKXt7nEvMn5pXz34s
        b2Mdu12CPjw5qela2piyaAnedg==
X-Google-Smtp-Source: AK7set/RzEpkk4lrGOln6MgcBlaSXb7zQQnXLiHe5Cc4QQ0OSXcLQu4ok9B1u/IwUOSEJ++kxYvapw==
X-Received: by 2002:a17:906:178f:b0:878:72d0:2817 with SMTP id t15-20020a170906178f00b0087872d02817mr7044006eje.29.1678009751796;
        Sun, 05 Mar 2023 01:49:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:71e7:13d:1c29:505f? ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id t16-20020a170906949000b008b30e2a450csm3058517ejx.144.2023.03.05.01.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 01:49:11 -0800 (PST)
Message-ID: <e59fe30a-75d1-eb59-52a3-014fe3c961a6@linaro.org>
Date:   Sun, 5 Mar 2023 10:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To:     Ryan Chen <ryan_chen@aspeedtech.com>, Wolfram Sang <wsa@kernel.org>
Cc:     Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
 <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
 <SEZPR06MB5269CB53B51B89C3CA039442F2B09@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269CB53B51B89C3CA039442F2B09@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/03/2023 02:33, Ryan Chen wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, March 3, 2023 6:41 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Wolfram Sang
>> <wsa@kernel.org>
>> Cc: Joel Stanley <joel@jms.id.au>; Brendan Higgins
>> <brendan.higgins@linux.dev>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Andrew Jeffery <andrew@aj.id.au>;
>> devicetree@vger.kernel.org; Philipp Zabel <p.zabel@pengutronix.de>; Rob
>> Herring <robh+dt@kernel.org>; Benjamin Herrenschmidt
>> <benh@kernel.crashing.org>; linux-aspeed@lists.ozlabs.org;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> openbmc@lists.ozlabs.org; linux-i2c@vger.kernel.org
>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for AST2600-i2cv2
>>
>> On 03/03/2023 11:16, Ryan Chen wrote:
>>>>>>>>> aspeed,timout properites:
>>>>>>>>> For example I2C controller as slave mode, and suddenly
>>>> disconnected.
>>>>>>>>> Slave state machine will keep waiting for master clock in for
>>>>>>>>> rx/tx
>>>>>> transmit.
>>>>>>>>> So it need timeout setting to enable timeout unlock controller state.
>>>>>>>>> And in another side. In Master side also need avoid suddenly
>>>>>>>>> slave
>>>>>>>> miss(un-plug), Master will timeout and release the SDA/SCL.
>>>>>>>>>
>>>>>>>>> Do you mean add those description into ore aspeed,timout
>>>>>>>>> properites
>>>>>>>> description?
>>>>>>>>
>>>>>>>> You are describing here one particular feature you want to enable
>>>>>>>> in the driver which looks non-scalable and more difficult to
>>>> configure/use.
>>>>>>>> What I was looking for is to describe the actual configuration
>>>>>>>> you have
>>>> (e.g.
>>>>>>>> multi-master) which leads to enable or disable such feature in
>>>>>>>> your
>>>>>> hardware.
>>>>>>>> Especially that bool value does not scale later to actual timeout
>>>>>>>> values in time (ms)...
>>>>>>>>
>>>>>>>> I don't know I2C that much, but I wonder - why this should be
>>>>>>>> specific to Aspeed I2C and no other I2C controllers implement it?
>>>>>>>> IOW, this looks quite generic and every I2C controller should
>>>>>>>> have it. Adding it specific to Aspeed suggests that either we
>>>>>>>> miss a generic property or this should not be in DT at all
>>>>>>>> (because no one else has
>>>>>> it...).
>>>>>>>>
>>>>>>>> Also I wonder, why you wouldn't enable timeout always...
>>>>>>>>
>>>>>>>> +Cc Wolfram,
>>>>>>>> Maybe you know whether bool "timeout" property for one controller
>>>>>>>> makes sense? Why we do not have it for all controllers?
>>>>>>>>
>>>>>>> Because, i2c bus didn’t specific timeout.
>>>>>>> But SMBus defines a clock low time-out, TIMEOUT of 35 ms.
>>>>>>>
>>>>>>> It have definition in SMBus specification.
>>>>>>> http://smbus.org/specs/SMBus_3_1_20180319.pdf
>>>>>>> You can check Page 18, Note3 that have timeout description.
>>>>>>
>>>>>> Then you have already property for this - "smbus"?
>>>>> To be a property "smbus", that would be a big topic, I saw fsl i2c
>>>>> also have this.
>>>>> https://github.com/torvalds/linux/blob/master/Documentation/devicetr
>>>>> ee
>>>>> /bindings/i2c/i2c-mpc.yaml#L43-L47
>>>>> So, I just think the "timeout" property.
>>>>
>>>> Yeah and this is the only place. It also differs because it allows
>>>> actual timeout values.
>>> Thanks, So can I still keep the property "aspeed,timeout" here?
>>> It is the only place.
>>
>> No, because none of my concerns above are addressed.
>>
> Thanks, I realize your concerns.
> 
> So, I modify it like i2c-mpc.yaml 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml#L43-L47
> 
>   aspeed,timeout:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description: |
>       I2C bus timeout in microseconds
> Is this way acceptable? 

So, let's repeat my last questions:

1. Why you wouldn't enable timeout always...

You wrote:
> http://smbus.org/specs/SMBus_3_1_20180319.pdf
> You can check Page 18, Note3 that have timeout description.

which indicates you should always use timeout, doesn't it?

2. Why we do not have it for all controllers with SMBus v3? Why this one
is special?

Best regards,
Krzysztof

