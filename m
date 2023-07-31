Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B487696F1
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 14:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjGaM7r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 08:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbjGaM7r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 08:59:47 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D389610EB
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 05:59:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c0290f0a8so262386866b.1
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690808383; x=1691413183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjNUiGbK+r1sXqp9L+BG2Nwgnyi0n65xn60LuBTJ+Lo=;
        b=ipE2GeHmGakEq92kZfr0zFwxnvW8Bm1NtgHlVo+VScWEywfWmiDQZ30e6NG4kzr8Nf
         l0HE/lQrsj5Jw9gxLxsslNaqp3ue3LjUCFI3vNJ/mtEqCWHys0ED+BtfsA72/y3BZN1t
         5NsQiqcsJSsiyrQdFUOpbUGliSd8ViYY+SiE6hZhgqWiIxApRkzMzWxjSB/ZnkMBB6BB
         PvwHuEHVwhryClOh22M2lQ9jJHEeQYrDD0TzSFip7j8EyukgjkANeivDoC3zFJk9yYLn
         9IiFw18Gu7fwb/OswNV5n1JITJ2O+Ia054m+SwYrVGFaZauSsFthBZlaknIg+WZR/+3I
         dSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690808383; x=1691413183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjNUiGbK+r1sXqp9L+BG2Nwgnyi0n65xn60LuBTJ+Lo=;
        b=cWcOIGVE9qE4Tn9yGr6YKzzqDeSH+GRAlK9Dw1WW+DuPkVU37BXFRel3y6VS7X4ZgT
         uoWbo/p0hrAyw9dwrKTDE8Y3TDMLSVgu2u3JXtvCdwZqLSNNJoD3j5+L2sesqWAyI0tt
         Xdee0Adla8U4v/U9aEEzkw0hnDv5k99PjUlUi2NhmWwQxfJz4z/xppKHI3ClBjYOCVqq
         1yJexHyQSmztSycuipa9TN+dkB4XlmvqNgWtbRUqJAuRhRk9cCeOUih+PpVXKysGMcMD
         XWU2tIWG4hlAA2OVbuW+dOo2Dd4PK+TaB1h1WeVvST7djUmUFs/bGDLlRBx4z3DZ05d1
         9HFQ==
X-Gm-Message-State: ABy/qLaWm5gtRIDT8BLE1+Hnm/xU3MpPHh/xUyWgtpMeBQSXuXk8m/4G
        w2Ro6pdQLXW3UwjDQJ+k/cVHxQ==
X-Google-Smtp-Source: APBJJlH0RcpsHNdXqhQRW836eEcHu4DeD0tlvaSETRKyEWM2zSPKYNVvCssy+KLB5iMuHppPVtBekw==
X-Received: by 2002:a17:906:768d:b0:99b:cd0e:a805 with SMTP id o13-20020a170906768d00b0099bcd0ea805mr5645412ejm.37.1690808383337;
        Mon, 31 Jul 2023 05:59:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id um6-20020a170906cf8600b009930c61dc0esm6112815ejb.92.2023.07.31.05.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 05:59:42 -0700 (PDT)
Message-ID: <fdc513a3-c0e0-c57d-5c9a-8da6fa2f54e2@linaro.org>
Date:   Mon, 31 Jul 2023 14:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Content-Language: en-US
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <25858c22-ef92-2136-67ef-0d27364c1600@linaro.org>
 <ZMbcb0yuTz6l6BYh@qmqm.qmqm.pl>
 <b9183dfc-8e8a-9602-f31c-5de9e27acb88@linaro.org>
 <ZMd1qI7RjQhpI8zO@qmqm.qmqm.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZMd1qI7RjQhpI8zO@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/07/2023 10:49, Michał Mirosław wrote:
> On Mon, Jul 31, 2023 at 08:58:14AM +0200, Krzysztof Kozlowski wrote:
>> On 30/07/2023 23:55, Michał Mirosław wrote:
>>> On Sun, Jul 30, 2023 at 10:30:56PM +0200, Krzysztof Kozlowski wrote:
>>>> On 29/07/2023 18:08, Svyatoslav Ryhel wrote:
>>>>> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>>>>>
>>>>> Implement driver for hot-plugged I2C busses, where some devices on
>>>>> a bus are hot-pluggable and their presence is indicated by GPIO line.
>>> [...] 
>>>>> +	priv->irq = platform_get_irq(pdev, 0);
>>>>> +	if (priv->irq < 0)
>>>>> +		return dev_err_probe(&pdev->dev, priv->irq,
>>>>> +				     "failed to get IRQ %d\n", priv->irq);
>>>>> +
>>>>> +	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
>>>>> +					i2c_hotplug_interrupt,
>>>>> +					IRQF_ONESHOT | IRQF_SHARED,
>>>>
>>>> Shared IRQ with devm is a recipe for disaster. Are you sure this is a
>>>> shared one? You have a remove() function which also points that it is
>>>> not safe. You can:
>>>> 1. investigate to be sure it is 100% safe (please document why do you
>>>> think it is safe)
>>>
>>> Could you elaborate on what is unsafe in using devm with shared
>>> interrupts (as compared to non-shared or not devm-managed)?
>>>
>>> The remove function is indeed reversing the order of cleanup. The
>>> shutdown path can be fixed by removing `remove()` and adding
>>> `devm_add_action_or_reset(...deactivate)` before the IRQ is registered.
>> Shared interrupt might be triggered easily by other device between
>> remove() and irq release function (devm_free_irq() or whatever it is
>> called).
> 
> This is no different tham a non-shared interrupt that can be triggered
> by the device being removed. Since devres will release the IRQ first,
> before freeing the driver data, the interrupt hander will see consistent
> driver-internal state. (The difference between remove() and devres
> release phase is that for the latter sysfs files are already removed.)

True, therefore non-devm interrupts are recommended also in such case.
Maybe one of my solutions is actually not recommended.

However if done right, driver with non-shared interrupts, is expected to
disable interrupts in remove(), thus there is no risk. We have big
discussions in the past about it, so feel free to dig through LKML to
read more about. Anyway shared and devm is a clear no go.

Best regards,
Krzysztof

