Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC73178ECAF
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 14:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345016AbjHaMBh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 08:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbjHaMBg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 08:01:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D722DC5
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 05:01:33 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so146505566b.0
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693483292; x=1694088092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1hWfPnTaYiDGzQWbm7h7EGtwXK/30+yuix+xBw0jQ4=;
        b=wvj3LQwNA6YDzPPOhf0PO6FAm8ObP4IXPQ1RAmpOIMIMPbNjisG/6vusCtIjsCBI/c
         sF3uW9WnpSsOk8CBBPCqZp/k1fDjTJCgd+Y1+vzmOg9H7/LQ6SIqRnIbFDCkWWxZe+E9
         UtMl4avZPpYOB8aAwNuzmSRTsHE3SByxQ4CE/DfFj/rvbd2EjLcXPiedDHjArzsT9P2V
         GK/3/nRHyXsc/1F97YygK5mHIQGdFxnxbPhGvlNPaxOIeNzNVh8M8mIyOBiuclHKPagq
         rUlX6UFni3mLDQCkShltgFUec/YjkYoXO6eo2O5Oyyxf7VboTMWpICF04jDDQBUsYrqJ
         J+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693483292; x=1694088092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1hWfPnTaYiDGzQWbm7h7EGtwXK/30+yuix+xBw0jQ4=;
        b=kYwZL5Qrvcb2ygopr0r4IiKsQJAAO28mUi7zroQafJVYnxC8roA7fkJiAdsZdHYDhD
         mHqxZnaews6pjVi7quZFgafMclyIfguZQbfb73SAxcAQ5kJF5yVpZr6tDZ42E4no+9kK
         idrotD0+OKHVsj4BtUFt2MYER0MH5dIUTVGhj6+I3MxhUP56sEsI7tlItunh/GQZklk8
         uElPCxN++631/LUIJXh/Tjy2XilzpKxXJwb3uuHDvE3P6k3kW9tH5JQGrT3UHKpM0bFS
         yEqcONt+/DHiPh/o8aAGZLAsogRGgpLs867doB73HXqBqPwBDa+n5z86cD4GhXFP+/12
         7Bbw==
X-Gm-Message-State: AOJu0YwWVC31IVo29Sht1/78JGg/DKBvnBid5w5suEQecWPJl4/sn1Xi
        Qw8VtPnJm4sYpic6jXSMi9dtvV4a5VPhHU7EctM=
X-Google-Smtp-Source: AGHT+IHAKOqgfeXOn8vIiw1D0PnVLOyxf4Ka4diEYQmxfjyZVB4gmwGWTLG6UsiByQJ5TCVnVGxaMQ==
X-Received: by 2002:a17:906:53d4:b0:9a1:b33a:e464 with SMTP id p20-20020a17090653d400b009a1b33ae464mr3149812ejo.31.1693483292230;
        Thu, 31 Aug 2023 05:01:32 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id f27-20020a170906391b00b0099cd1c0cb21sm668087eje.129.2023.08.31.05.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 05:01:30 -0700 (PDT)
Message-ID: <9100e41b-291e-9723-4188-b4d3e5adb6f8@linaro.org>
Date:   Thu, 31 Aug 2023 14:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-binding: Add custom property for MAX7357
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230830115744.4102929-1-Naresh.Solanki@9elements.com>
 <b467c423-dbd4-8a14-8fa4-169658e21693@linaro.org>
 <CABqG17hB_GvQ56ZB+wjhSrDtZLreZ4vPc+3AfUj6AdA3Btd1+Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABqG17hB_GvQ56ZB+wjhSrDtZLreZ4vPc+3AfUj6AdA3Btd1+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/08/2023 11:45, Naresh Solanki wrote:
> Hi
> 
> On Wed, 30 Aug 2023 at 20:08, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 30/08/2023 13:57, Naresh Solanki wrote:
>>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>
>>> Add a custom property "maxim,bus-lockup-fix" to enable proprietary
>>> features on MAX7357. The driver configures MAX7357 to isolate the
>>> failing channel and trigger a flush-out sequence for bus lock-up
>>> resolution.
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching.
> Ack
>>
>> It is "dt-bindings" not binding and several other fields are needed.
> Ack
>>
>> Also "add custom property" is quite generic. When you add next custom
>> property you are going to have two commits with the same subject. Just
>> make it descriptive - "Add foobar for MAX7357"
> Missed Properties in this Patch Series, Will Be Addressed in V2.
> So in that case I guess the below title should be fine?
> dt-bindings: i2c: Add custom properties for MAX7357/MAX7358

No, because you do not solve that part of my feedback:

>> Also "add custom property" is quite generic. When you add next custom
>> property you are going to have two commits with the same subject.

I said, everything will be now "add custom properties", right?

The prefix is dt-bindings: i2c: pca954x:



> 
>>
>>
>>
>>>
>>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>>> ---
>>>  .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml  | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>> index 2d7bb998b0e9..984d4614a270 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>>> @@ -71,6 +71,11 @@ properties:
>>>      description: A voltage regulator supplying power to the chip. On PCA9846
>>>        the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
>>>
>>> +  maxim,bus-lockup-fix:
>>> +    type: boolean
>>> +    description: Isolates only the stuck channel and generates a flush-out sequence
>>> +      to attempt to clear the bus lock-up.
>>
>> Why wouldn't you want it to be enabled all the time? Why should it be
>> configurable per-board?
> The chip doesn't enable these features by default & it is left to
> discretion of board designer to enable the same.


That does not explain anything. Enable them by default in such case or
come with some argument.

Best regards,
Krzysztof

