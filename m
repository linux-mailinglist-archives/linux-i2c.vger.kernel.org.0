Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F37773F3F
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 18:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbjHHQov (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 12:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjHHQoF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 12:44:05 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A766C1654B
        for <linux-i2c@vger.kernel.org>; Tue,  8 Aug 2023 08:56:00 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so4835035f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 08 Aug 2023 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510133; x=1692114933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVTTn1AZhgKJEPeBZ7tIT6HQycZWcyfVoqPDmg5RGC4=;
        b=EaQGXIPQ3j4vzWDTfWQhmgqY1GD88nEnrxhRrg/4Gcf1jwlXlMQP9aWomOPdrM5nFO
         RywJRevD93f+VhA3MQgZVVeX52fNMrDqIjKGpvfCdNVB7tSg58HtAylh4APPhM27zoot
         i2anFqi87KoD0B0O+1uXw/s9SAYWTcqHf8sTtSQdMu+N6cy6CGbvIfhNblx821NkAiIu
         uyU1INw92dwgLUIZvBdm0Nvha7P0ylmMZfNmLVGtj3K9YohfsSOHa5BOoT45m89pujHg
         jlhTLBUP64tjeWoJI7D+4M69Ge5l1zyiKZMFhL1uUyV2pUZwz2OglZkp5U/ZDnNJa8D/
         FvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510133; x=1692114933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVTTn1AZhgKJEPeBZ7tIT6HQycZWcyfVoqPDmg5RGC4=;
        b=e/9x7JHZ2ZfWSYY9QoBfTHDH7anmc1gKmtvut+0RybMWLBELgMLfN97VnzNOaF3Arb
         0fedVWRUBVIjMXt1ga4JYG72V//YyHUw+TczVEy2thLsXKLFijcYIgiFXNRwS0c77x9U
         +ECEWJOjvvn3CF7IMsiakMUh1o/TNHbdWlnlMaBNnEwYw43AsMXye6NSA4JMZT3l9fsE
         zm6Pnox/tLRq8WvoL35Lb9zHnJC4LD1DTeCUEvci3Ut8IjNzzMdTSroD5ZACdNC+05KT
         VHzHdDadsQeimjaKFHtNxjS3cnaEh5Lt/B7zOtNNQX5ODnqme9TnW9V8C8/8LhKbfX1f
         DVkg==
X-Gm-Message-State: AOJu0YwbEj4GxCpgQENjXrqKwzSgWHzinfXPVatfrkvemSPA6LH9wqbS
        f44xscXFJXXpP/vkEU10GtoXbg==
X-Google-Smtp-Source: AGHT+IGpiD830YQ5k6d6CQ5DckWiWf96jV+8KhexPtwkxYkpVDql5DrULb/UEUFZH/jZ/IltlIY3WQ==
X-Received: by 2002:a5d:4d8a:0:b0:314:15b7:1fb5 with SMTP id b10-20020a5d4d8a000000b0031415b71fb5mr8767362wru.34.1691510133363;
        Tue, 08 Aug 2023 08:55:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c21d500b003fe18d03188sm14189615wmj.17.2023.08.08.08.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 08:55:32 -0700 (PDT)
Message-ID: <7698ce68-c393-d566-25b9-7b2a08dd8274@linaro.org>
Date:   Tue, 8 Aug 2023 17:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/9] i2c: mlxbf: Use dev_err_probe in probe function
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Liao Chang <liaochang1@huawei.com>, florian.fainelli@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-3-liaochang1@huawei.com>
 <a5b2f1a2-d509-0949-fc1d-929476c2618b@linaro.org>
 <20230808112907.4rnvmyha4v6cg5ds@intel.intel>
 <29e20953-5660-079e-2136-0962eec9cab5@linaro.org>
 <20230808114706.g27gy3rajqvjykce@intel.intel>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808114706.g27gy3rajqvjykce@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/08/2023 13:47, Andi Shyti wrote:
> Hi Krzysztof,
> 
> On Tue, Aug 08, 2023 at 01:31:31PM +0200, Krzysztof Kozlowski wrote:
>> On 08/08/2023 13:29, Andi Shyti wrote:
>>> Hi Krzysztof,
>>>
>>> On Tue, Aug 08, 2023 at 10:36:40AM +0200, Krzysztof Kozlowski wrote:
>>>> On 08/08/2023 03:29, Liao Chang wrote:
>>>>> Use the dev_err_probe function instead of dev_err in the probe function
>>>>> so that the printed messge includes the return value and also handles
>>>>> -EPROBE_DEFER nicely.
>>>>>
>>>>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>>>>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>>>>
>>>> ...
>>>>
>>>>> @@ -2413,10 +2399,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
>>>>>  	ret = devm_request_irq(dev, irq, mlxbf_i2c_irq,
>>>>>  			       IRQF_SHARED | IRQF_PROBE_SHARED,
>>>>>  			       dev_name(dev), priv);
>>>>> -	if (ret < 0) {
>>>>> -		dev_err(dev, "Cannot get irq %d\n", irq);
>>>>> -		return ret;
>>>>> -	}
>>>>> +	if (ret < 0)
>>>>> +		return dev_err_probe(dev, ret, "Cannot get irq %d\n", irq);
>>>>
>>>> I don't think this is needed:
>>>> https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/
>>>
>>> Hmm, that's a bit borderline, I'd say. The change to
>>
>> What's borderline exactly? devm_request_threaded_irq_probe() is coming,
>> right? If it is accepted this hunk is useless and soon should be
>> replaced with proper one.
> 
> Such change is out of the scope of this series, there are two
> options that I'd prefer (in the listed order):
> 
>  1. accept the patch as it is, this patch is not sent today the
>     first time and at the current state it's correct.
>  2. not accept a change on this line

The 2 is what I commented here. This change should not be made and
instead we should just switch all such users to new API, because this is
preferred for all error messages, when applicable and does not result in
lost context. If there was no such API, sure, but we have this API coming.

> 
> Replacing devm_request_irq belongs to another series and,
> besides, I don't want to ask Liao to hold on this series for such
> trivialities.

So the comment about this redundant and unneeded change, thus switching
to new API you call 'triviality' but a comment of yours of changing the
tone of error message to 'please' is appropriate.
https://lore.kernel.org/all/20230807231320.svssge6uymw3jiho@intel.intel/

That's double standards.

Best regards,
Krzysztof

