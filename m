Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55986B1EBF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 09:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjCIIwJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 03:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbjCIIwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 03:52:04 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4358DF26E
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 00:51:42 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a25so4201811edb.0
        for <linux-i2c@vger.kernel.org>; Thu, 09 Mar 2023 00:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmFJIRnf7lhyyhe5HRvTIuznCSOkKRhfqAX4FxLgYRA=;
        b=H3Tihc36/HIhfTDJZ3dYkddDKuaeSLksPAwq/9dhmsndrEQs+ViDL3vRtWs1caWfTG
         PqErMfFzfAzUYvmx/R0UG5Xn4IjPuoIXs3VEOuWP9MbWdLEkjADF94GiK3DRWQZaCu3D
         Lu0sINGzMapoXRdCO5cFOP0Drf2O/fs7P1y8LKNl2+TDxULwPq5Sj0IkwM11njHbUNPo
         ES4lcicuDAqfhv2n/6sc9qISxcvvvo3wltjP3QgLIA61MpJtIrKu/TCGgVboU9K/pnKN
         04x+y81RewnWJg4qm8PpahDCqf0ZcdRi4kis+TNYYEGVpguzg/dgwFt7Lo3Sv4i851bL
         FGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmFJIRnf7lhyyhe5HRvTIuznCSOkKRhfqAX4FxLgYRA=;
        b=RVvQx0QdzN+G/go+VOX+a3bBIwj4kJPoxfmyJm1wRRQ9ZN7kkQaqY1dmSAAaXPBU12
         oMPYTF3bcqRyVz5bdn+whC0vPhiHyLEpag/uUuz7h5v8HaHGwgZo+GqqaJYJPapsIWSm
         3zHbNfhBMT26YKNkhGtW6AqmUljLx0Eb892QQpyj4JrFA8sV6JwZUFzYPAGGhTmxEKgU
         OZeNH2fcjU0qupZm24jnu8IYiblb8THDyGWMuk2Cjx+gVzzbf+KpPEv5W1HqQI8Y5UUa
         ZCfBw/txV9rsCFXU9Ta47yPHm4TSQOKL7x0kTwXA+ign1qTxBzheBQfse9VVMZaz2Xqs
         RETQ==
X-Gm-Message-State: AO0yUKUIow9oujPLWGMZ52TENARzm2/CTg5EXTxhuIuPIAdSdMT3fQa0
        2dbjDlFwSQyBMeBoCnj7s1DVOw==
X-Google-Smtp-Source: AK7set8P4LuLBe8BuDzP+8njsAdPqwic2GGX9ilJLhejchDRC2j40nO4EAjmm9ae6ixFJz/7FI/hKw==
X-Received: by 2002:a17:906:551:b0:8b1:7f87:8174 with SMTP id k17-20020a170906055100b008b17f878174mr20050787eja.65.1678351901284;
        Thu, 09 Mar 2023 00:51:41 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906504200b008f767c69421sm8573953ejk.44.2023.03.09.00.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:51:40 -0800 (PST)
Message-ID: <f17f09f9-ffd0-bd2b-7343-e468f83dd6e7@linaro.org>
Date:   Thu, 9 Mar 2023 09:51:39 +0100
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
 <d33145c3-e985-4d3c-a08c-6a249a8dc463@linaro.org>
 <SEZPR06MB5269CA376D572B6241FCAD4DF2B79@SEZPR06MB5269.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269CA376D572B6241FCAD4DF2B79@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/03/2023 11:09, Ryan Chen wrote:
>>>> 2. Why we do not have it for all controllers with SMBus v3? Why this
>>>> one is special?
>>>
>>> Not all bus is connected with smbus. Most are i2c device connected in board.
>>> That will be specific statement for each bus.
>>
>> That's not the answer to my question. Why other controllers which can be
>> connected to I2C or SMBus devices do not need this property?
> 
> For example following is the board specific connection.
> 
> Board A                                         Board B
> -------------------------                       ------------------------
> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> |i2c bus#2(master)-> tmp i2c device |          |                       |
> |i2c bus#3(master)-> adc i2c device |          |                       |
> -------------------------                       ------------------------
> 
> Bus#1 is mctp transfer for each BoardA/B. (Not smbus connected)
> Bus#2 is i2c device connected.
> Bus#3 is i2c device connected.

You are repeating the same stuff for my question. Where do you see on
this diagram here other I2C controller? How does it answer my question?
You keep repeating same and same, so it won't work.



Best regards,
Krzysztof

