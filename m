Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFA3762B74
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 08:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjGZGcC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 02:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjGZGcB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 02:32:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3381BC2
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jul 2023 23:31:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52256241c66so1365832a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jul 2023 23:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690353117; x=1690957917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ldLrML6vgBXKyXyh78YQC1WMOnySmR4KEmHw8/G7es=;
        b=hxiRIiHX3IPTp13VhJ2zUgmjhfOx3uM0ozvIxbPN5lzVOv49jVGvsPwcUkrTJ/a5yY
         lbRGf0FW1B7lUE1snLH2ywYWHkTXDjhPTYRJtsN675jKZVSfiAknvWEwoyFjk1otJmaf
         R3n3zyQ+RXuO1QzTVK7ypFkJFT+/V5p9QXQbLexZRaI7/bMrrgAdNSlXiyUrBuCsx8rB
         bLbk9PGvILSrk3XCqj7WiYaBfp8Hvrw53GNYI5dGEhmX1UVG9KXRscRXXshObv/gD/y/
         pzS/DhpBE1UXP35XD6rNPxR8DlY9BEr85Re5gzPG1KYyKMSiU7ZhqwaPLjht/hi7VMZI
         mXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690353117; x=1690957917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ldLrML6vgBXKyXyh78YQC1WMOnySmR4KEmHw8/G7es=;
        b=NGdct9x+AtveHeT7iucNGQi1gActVM7sKoPsW5SpmoVK8FTswoA14WfL+60SCUCWxV
         mkQ6isuYNT3a+dLP0gXVTwDk9M3APQwS0wp8HPmun1oEpXsGqhOpIYYF4QeBfkZQ1J7d
         04VxcW6zEpIQPLQaOXIZy5OjwbYdlq0dPmKCFHeoXGAFuOaEGDut2RMsdAsw1MGl2kmx
         tC+J2RiAMMBdBcY92OzaO1dG2K1Tjt6GMrMcJ3CfdLIdEOgdafBhyV7sKWEPKYWZIyD8
         P9+JI/RhFx/m9aOoz71nUKX0OQiMR1IMRaclCnKCxYz/y9Xcu8Ihci9feLZiKZ8y4Mru
         M5vg==
X-Gm-Message-State: ABy/qLag26elLlPe+OCFxJk54OVlYOZ9Ym0boPF1BQma0hWDm5o2zExa
        jS7ur2GTNKaj94d/52YwaV7ukprIXb2mD5KClbs=
X-Google-Smtp-Source: APBJJlGP/jM5jLrGO0nptAexry6b5IdBGsnZaQ4NDlO6cRjUP70wp9glHqersDbmUu0TGoBiiLj8yA==
X-Received: by 2002:a05:6402:524f:b0:51d:cf7b:c9f0 with SMTP id t15-20020a056402524f00b0051dcf7bc9f0mr4911199edd.12.1690353117194;
        Tue, 25 Jul 2023 23:31:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y19-20020aa7ccd3000000b0051df54c6a27sm8363707edt.56.2023.07.25.23.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 23:31:56 -0700 (PDT)
Message-ID: <e7fbf15f-dec3-ecf1-849e-faf0b3f2bc94@linaro.org>
Date:   Wed, 26 Jul 2023 08:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
To:     Ryan Chen <ryan_chen@aspeedtech.com>,
        "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
 <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <674fed6f-36d6-bacb-d075-97bc355177a3@linaro.org>
 <SEZPR06MB5269568451406598F0D824F6F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <SEZPR06MB5269B31B3ADC4EDEA113BA99F200A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269B31B3ADC4EDEA113BA99F200A@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On 26/07/2023 05:38, Ryan Chen wrote:
>>> +
>>> +static int ast2600_i2c_remove(struct platform_device *pdev) {
>>> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
>>> +
>>> +	/* Disable everything. */
>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
>>> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
>>> +
>>> +	i2c_del_adapter(&i2c_bus->adap);
>>
>>> I have doubts that you tested this. I think you have here double free/del of the adapter.
>> Sorry, i can't catch your point for double free the adapter.
>> It should use i2c_del_adapter in driver remove function.
>> All the driver doing this
>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-n
>> pcm7xx.c#L2373
>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-a
>> ltera.c#L473
>>
>> Do you mean it is not necessary? 
> 
>> Instead of giving you the fish, I think much more learning experience is to teach you how to fish. Please unbind your driver (echo the device name to proper unbind file in sysfs). The best if you build your kernel with KASAN.
> 
>> Thanks, will do this test with unbind to understand your point. 
> I do my the test with enable kernel config KASAN.
> I don't see any error dump. You can see the following. It use i2c-0 bind/unbind.
> Did I miss some test ??
> 
> root@ast2600-default:/sys/bus/platform/drivers/i2c_ast2600# i2cdetect -l
> i2c-0   i2c             1e78a080.i2c-bus                        I2C adapter
> i2c-1   i2c             1e78a100.i2c-bus                        I2C adapter
> i2c-2   i2c             1e78a180.i2c-bus                        I2C adapter
> i2c-3   i2c             1e78a200.i2c-bus                        I2C adapter
> i2c-4   i2c             1e78a280.i2c-bus                        I2C adapter
> i2c-5   i2c             1e78a300.i2c-bus                        I2C adapter
> i2c-6   i2c             1e78a380.i2c-bus                        I2C adapter
> i2c-7   i2c             1e78a400.i2c-bus                        I2C adapter
> i2c-8   i2c             1e78a480.i2c-bus                        I2C adapter
> i2c-9   i2c             1e78a500.i2c-bus                        I2C adapter
> i2c-12  i2c             1e78a680.i2c-bus                        I2C adapter
> i2c-13  i2c             1e78a700.i2c-bus                        I2C adapter
> i2c-14  i2c             1e78a780.i2c-bus                        I2C adapter
> i2c-15  i2c             1e78a800.i2c-bus                        I2C adapter
> root@ast2600-default:/sys/bus/platform/drivers/i2c_ast2600# echo 1e78a080.i2c-bus > unbind

It should fail... if it doesn't, maybe you can tell why?

Best regards,
Krzysztof

