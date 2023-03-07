Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313336AD8DC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 09:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjCGIML (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 03:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjCGIMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 03:12:08 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01AF2CFDC
        for <linux-i2c@vger.kernel.org>; Tue,  7 Mar 2023 00:11:39 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cy23so48796154edb.12
        for <linux-i2c@vger.kernel.org>; Tue, 07 Mar 2023 00:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678176698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gmLTaMxh+UgKG/kflrxb/f3sNJaZcDEgaX2MESY0eU=;
        b=q3PBcvB1zvsXE87gITbF/SzJQLo4Xx88B32/Tmw3dv2IrNfQYd8YbzJyVUtxwcFMDx
         rDtF1kRD/J5rUZPOvdQrEAbExMBQTrNf0mRJwrTD4e0RYlDjbmuEVLPhc59kpXOuBguq
         NyTY2kmk766MwbnpQMj2RcnYDPRvYilXFFVXrGGXa6GA9A20SUrpFbYn5+sC/xnzSEjE
         FKhWGUqha329de9TWzywrqVay3P5xsD6TFOP7FdCGyCFWBqV4svNe0CvcyDUW8zR9Ieu
         GkyggizmmZfQzDjfqt/w1nTLu3jfwmjXH29xP1JazPuuDhlWLd974oZW9quGhCvR2Jt1
         hokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678176698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gmLTaMxh+UgKG/kflrxb/f3sNJaZcDEgaX2MESY0eU=;
        b=nD5WP+nJKuVn61zQCfQ8EzvuDfOOs/LJiNI9w7hPJwOQzggAECJBXGCq48ZQ39nKDT
         n58nEwSo3m5NZdy71iSKorvv/pPsXd73XzR16qrVTxVzYosSWkPzlBCHLHVPLTN6J2sN
         PPt5A9dA1xro4G0JPKUiRCsae4HScOaNHzzqv8Rj8RCWce7pFUP0mZaHL89YUlO8CF2F
         UZF8ndLU1d6DzowbTRdRWqlNecmX2gXtTPOGrGzKE/i8eEWmAaUcPWajmwT0UU0hft2a
         Um5S/MTKG5mVhi5YRP8rtI+gnSCva6ACEUX2KhBLtg3/X/zOxSs1C8ixICLk2OdPPnkc
         MsBA==
X-Gm-Message-State: AO0yUKW3YUvvOf/laViD8uabdnFKNCF5EuUS0b9xks39uuIsmTl8n6R6
        uKYSIiWJrvP3qkoqLBmcEJA+aQ==
X-Google-Smtp-Source: AK7set8K0X83pfhJzpDlAHKtkhFREUYDfeXRLHVhI+OBX7UgwhDddxevyD4fRlkYHGhDqm65b0Wfbw==
X-Received: by 2002:a50:ed18:0:b0:4af:7bdc:1891 with SMTP id j24-20020a50ed18000000b004af7bdc1891mr12995254eds.11.1678176698410;
        Tue, 07 Mar 2023 00:11:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id u2-20020a50d502000000b004c0057b478bsm6341543edi.34.2023.03.07.00.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:11:38 -0800 (PST)
Message-ID: <d33145c3-e985-4d3c-a08c-6a249a8dc463@linaro.org>
Date:   Tue, 7 Mar 2023 09:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
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
 <e59fe30a-75d1-eb59-52a3-014fe3c961a6@linaro.org>
 <SEZPR06MB5269B541150855BF0DABFACFF2B69@SEZPR06MB5269.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269B541150855BF0DABFACFF2B69@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/03/2023 01:48, Ryan Chen wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Sunday, March 5, 2023 5:49 PM
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
>> On 04/03/2023 02:33, Ryan Chen wrote:
>>> Hello Krzysztof,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Friday, March 3, 2023 6:41 PM
>>>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Wolfram Sang
>>>> <wsa@kernel.org>
>>>> Cc: Joel Stanley <joel@jms.id.au>; Brendan Higgins
>>>> <brendan.higgins@linux.dev>; Krzysztof Kozlowski
>>>> <krzysztof.kozlowski+dt@linaro.org>; Andrew Jeffery
>>>> <andrew@aj.id.au>; devicetree@vger.kernel.org; Philipp Zabel
>>>> <p.zabel@pengutronix.de>; Rob Herring <robh+dt@kernel.org>; Benjamin
>>>> Herrenschmidt <benh@kernel.crashing.org>;
>>>> linux-aspeed@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>>>> linux-kernel@vger.kernel.org; openbmc@lists.ozlabs.org;
>>>> linux-i2c@vger.kernel.org
>>>> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
>>>> AST2600-i2cv2
>>>>
>>>> On 03/03/2023 11:16, Ryan Chen wrote:
>>>>>>>>>>> aspeed,timout properites:
>>>>>>>>>>> For example I2C controller as slave mode, and suddenly
>>>>>> disconnected.
>>>>>>>>>>> Slave state machine will keep waiting for master clock in for
>>>>>>>>>>> rx/tx
>>>>>>>> transmit.
>>>>>>>>>>> So it need timeout setting to enable timeout unlock controller
>> state.
>>>>>>>>>>> And in another side. In Master side also need avoid suddenly
>>>>>>>>>>> slave
>>>>>>>>>> miss(un-plug), Master will timeout and release the SDA/SCL.
>>>>>>>>>>>
>>>>>>>>>>> Do you mean add those description into ore aspeed,timout
>>>>>>>>>>> properites
>>>>>>>>>> description?
>>>>>>>>>>
>>>>>>>>>> You are describing here one particular feature you want to
>>>>>>>>>> enable in the driver which looks non-scalable and more
>>>>>>>>>> difficult to
>>>>>> configure/use.
>>>>>>>>>> What I was looking for is to describe the actual configuration
>>>>>>>>>> you have
>>>>>> (e.g.
>>>>>>>>>> multi-master) which leads to enable or disable such feature in
>>>>>>>>>> your
>>>>>>>> hardware.
>>>>>>>>>> Especially that bool value does not scale later to actual
>>>>>>>>>> timeout values in time (ms)...
>>>>>>>>>>
>>>>>>>>>> I don't know I2C that much, but I wonder - why this should be
>>>>>>>>>> specific to Aspeed I2C and no other I2C controllers implement it?
>>>>>>>>>> IOW, this looks quite generic and every I2C controller should
>>>>>>>>>> have it. Adding it specific to Aspeed suggests that either we
>>>>>>>>>> miss a generic property or this should not be in DT at all
>>>>>>>>>> (because no one else has
>>>>>>>> it...).
>>>>>>>>>>
>>>>>>>>>> Also I wonder, why you wouldn't enable timeout always...
>>>>>>>>>>
>>>>>>>>>> +Cc Wolfram,
>>>>>>>>>> Maybe you know whether bool "timeout" property for one
>>>>>>>>>> controller makes sense? Why we do not have it for all controllers?
>>>>>>>>>>
>>>>>>>>> Because, i2c bus didn’t specific timeout.
>>>>>>>>> But SMBus defines a clock low time-out, TIMEOUT of 35 ms.
>>>>>>>>>
>>>>>>>>> It have definition in SMBus specification.
>>>>>>>>> http://smbus.org/specs/SMBus_3_1_20180319.pdf
>>>>>>>>> You can check Page 18, Note3 that have timeout description.
>>>>>>>>
>>>>>>>> Then you have already property for this - "smbus"?
>>>>>>> To be a property "smbus", that would be a big topic, I saw fsl i2c
>>>>>>> also have this.
>>>>>>> https://github.com/torvalds/linux/blob/master/Documentation/device
>>>>>>> tr
>>>>>>> ee
>>>>>>> /bindings/i2c/i2c-mpc.yaml#L43-L47
>>>>>>> So, I just think the "timeout" property.
>>>>>>
>>>>>> Yeah and this is the only place. It also differs because it allows
>>>>>> actual timeout values.
>>>>> Thanks, So can I still keep the property "aspeed,timeout" here?
>>>>> It is the only place.
>>>>
>>>> No, because none of my concerns above are addressed.
>>>>
>>> Thanks, I realize your concerns.
>>>
>>> So, I modify it like i2c-mpc.yaml
>>> https://github.com/torvalds/linux/blob/master/Documentation/devicetree
>>> /bindings/i2c/i2c-mpc.yaml#L43-L47
>>>
>>>   aspeed,timeout:
>>>     $ref: /schemas/types.yaml#/definitions/uint32
>>>     description: |
>>>       I2C bus timeout in microseconds
>>> Is this way acceptable?
>>
>> So, let's repeat my last questions:
>>
>> 1. Why you wouldn't enable timeout always...
>>
>> You wrote:
>>> http://smbus.org/specs/SMBus_3_1_20180319.pdf
>>> You can check Page 18, Note3 that have timeout description.
>>
>> which indicates you should always use timeout, doesn't it?
> 
> Yes, if board design the bus is connected with SMBUS device, it should enable.
> But in my previous statement, the board design is two multi-master devices connected each other. 

For which you have the property, thus case is solved, isn't it? You want
timeout always except for multi-master?

> And both device is transfer with MCTP protocol. 
> That will not SMBUS protocol. 
> They need have timeout that prevent unexpected un-plug.
> I do the study with smbus in Linux, that will different slave call back. Compare with smbus slave and mctp slave.
> So in this scenario, that is only enable for timeout. 

And the driver knows which protocol it is going to talk and such choice
should not be in DT.

>  
>> 2. Why we do not have it for all controllers with SMBus v3? Why this one is
>> special?
> 
> Not all bus is connected with smbus. Most are i2c device connected in board.
> That will be specific statement for each bus.

That's not the answer to my question. Why other controllers which can be
connected to I2C or SMBus devices do not need this property?

Best regards,
Krzysztof

