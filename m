Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6ACC768C71
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 08:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjGaG6V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 02:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjGaG6T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 02:58:19 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F189F184
        for <linux-i2c@vger.kernel.org>; Sun, 30 Jul 2023 23:58:17 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bdf08860dso750175266b.0
        for <linux-i2c@vger.kernel.org>; Sun, 30 Jul 2023 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690786696; x=1691391496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvJi1B6SKlzQ1LvbzrEi0ZzvZYawpeN9hQcKBS5Rfqc=;
        b=BKmNyRCpejCIerfUkMERrQdZqiNhA9Yh/vco9caloYmkQVgWhVgN9OvZr3OI2CIOi/
         jdsdUUO6Ma3cwFwhgf/RrPC9VZoDPrUI0IkuJdA+CSu3EthpExJ827siOaI3RNwmRV9h
         G3GPVmW4kjh3cc64CUzOwMBpDJmXCL1ItJLmO3Tc4ZlDauXS1w6UjyViBuizZHexVdCD
         emK4rwsoXP4ofEFWSIJ0WIYhHEUwX5ZEjmWQmZKlNBoBtpjmoH1tCcXlQ8d5XGa6mSAu
         JI/5gJvY1zwJUUYFeAuNwu7JnvZhROKPeMYT1pYftoTFLhRYG4PBZLNPy3buVzGHppgK
         9TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690786696; x=1691391496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvJi1B6SKlzQ1LvbzrEi0ZzvZYawpeN9hQcKBS5Rfqc=;
        b=gMb2WoEYFpc2bLDea1yFdDet1cs/7NeJ33VQF/yD/KE5xPYdVGwVCyxHuvWXTw8YeA
         am0Y7V+IKzmEqbO6BfVkupkBS18JK3brSEZIicvY5twSDXtJc5ftm4aB5w/rq/FLHLFU
         FspXxWYb8tMnJFTPKt8QTXSyE0hRJvYMJVKMXhnrp1bOv3ED11LX/r5san5tgFhRhNPt
         8ZY9eobw4ZR5r4NaFd9+kOuQIpAfHRfwb0hA9J/H7AjkOZ0zMn57/kn68Ff8+a2Rd/dP
         iM90OB+CJN4De+hjRG2iZLKOeCQfdx3Az5Gj3uYkpbcAEaQMzuqEzML3ut2PSzzIz0Px
         4+Qg==
X-Gm-Message-State: ABy/qLZtU6ooKTdBMOR3C8rho/KoXLXanusJpCQigNAPD7DbA1NykzPj
        8r2jWTiBLZVGtL4xxVhfCdbXWg==
X-Google-Smtp-Source: APBJJlHUe4q+Zfab2y/AmCUTWA3QzkU6SAznjHOA0UwORooy924a4e1ZAL+djMWbKsbjIH0JJIih0A==
X-Received: by 2002:a17:907:a063:b0:994:13c3:2f89 with SMTP id ia3-20020a170907a06300b0099413c32f89mr6423776ejc.27.1690786696488;
        Sun, 30 Jul 2023 23:58:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id y6-20020a1709064b0600b009932337747esm5711311eju.86.2023.07.30.23.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 23:58:16 -0700 (PDT)
Message-ID: <b9183dfc-8e8a-9602-f31c-5de9e27acb88@linaro.org>
Date:   Mon, 31 Jul 2023 08:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Content-Language: en-US
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <25858c22-ef92-2136-67ef-0d27364c1600@linaro.org>
 <ZMbcb0yuTz6l6BYh@qmqm.qmqm.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZMbcb0yuTz6l6BYh@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/07/2023 23:55, Michał Mirosław wrote:
> On Sun, Jul 30, 2023 at 10:30:56PM +0200, Krzysztof Kozlowski wrote:
>> On 29/07/2023 18:08, Svyatoslav Ryhel wrote:
>>> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>>>
>>> Implement driver for hot-plugged I2C busses, where some devices on
>>> a bus are hot-pluggable and their presence is indicated by GPIO line.
> [...] 
>>> +	priv->irq = platform_get_irq(pdev, 0);
>>> +	if (priv->irq < 0)
>>> +		return dev_err_probe(&pdev->dev, priv->irq,
>>> +				     "failed to get IRQ %d\n", priv->irq);
>>> +
>>> +	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
>>> +					i2c_hotplug_interrupt,
>>> +					IRQF_ONESHOT | IRQF_SHARED,
>>
>> Shared IRQ with devm is a recipe for disaster. Are you sure this is a
>> shared one? You have a remove() function which also points that it is
>> not safe. You can:
>> 1. investigate to be sure it is 100% safe (please document why do you
>> think it is safe)
> 
> Could you elaborate on what is unsafe in using devm with shared
> interrupts (as compared to non-shared or not devm-managed)?
> 
> The remove function is indeed reversing the order of cleanup. The
> shutdown path can be fixed by removing `remove()` and adding
> `devm_add_action_or_reset(...deactivate)` before the IRQ is registered.

Shared interrupt might be triggered easily by other device between
remove() and irq release function (devm_free_irq() or whatever it is
called).

Best regards,
Krzysztof

