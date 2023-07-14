Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F038A7535D5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jul 2023 10:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbjGNI6L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jul 2023 04:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235704AbjGNI6K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jul 2023 04:58:10 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CFC271F
        for <linux-i2c@vger.kernel.org>; Fri, 14 Jul 2023 01:58:01 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso16352465e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 14 Jul 2023 01:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689325080; x=1691917080;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBpOTioWYQ0j3N4IeyzzrOG0jNZw8LOuQH6eognekMo=;
        b=lJioJo16+7QTE7Bv1v30mC6kDQwB6sjuQLlFQxjbX0kYJfb+BaDMwo02Nj2POJt4xY
         ambqevCTL5CSJWOnpOk/OJreCBaEEI5wVbio9co7f48RjJVEFR+8p50+ml0F0XMC4uaC
         RpY/UKB12QgKXXpZIh0klXGHKIhu4WeQpPPCt5afugIx9U3m7rVnLA6PTbnX4b9bFfUd
         MI2IkL/H6GGpJfkaW88G1MauywFlFnKHa/4RLDC61tkiv55fdJ2Q7NamtOEvukybNZSE
         3h5karzbM988g7c5xQwM25OJhW0u8F4Bprv7hzOmqrq8J6sIPRpKI8vMnPPyMvazZh2C
         pe1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689325080; x=1691917080;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBpOTioWYQ0j3N4IeyzzrOG0jNZw8LOuQH6eognekMo=;
        b=bL4U8IDOmn5Nxyf2KExlf0s3PSr4cYioFp9KpIAa/MrhwaCjvr7/HIq7GmyaHJMDoy
         F06lWkSPIP6PbIqkmtmnWzI6WSykWD+tFtFYhGz5CLmsBo7HB3LG9c8JGoz+EB5G13Jq
         IGaGsyXuBlfC3HYZggmZAsMTeiGu49QEvgKQMguAPphFnKYihBaohXQvf5LbMFAXK7OJ
         feSPHbinweMi5YvgpyCECBdhHQzbb869QmzzhbSAtIkxQfJGfNjM5DtIPNx9GG34XIp8
         LWpHQ5wnwKrcTJqrdk2n5tIypA0gR2P2anBxewHi1JY5HJi3UttmEydOHJ7YukFieW9c
         erDg==
X-Gm-Message-State: ABy/qLbPPX7ehI0QEBBmy/jKrDU9S5EdZWJjtnxAgYSygl75iKbESS2c
        Z01NoaavqLskV4Oryj345wk4YA==
X-Google-Smtp-Source: APBJJlGGcOQKIlJR/8CU0pXiIjp31q3MTr1cXmxwyy1mOcTI2kPigEceKALeRcgV1pbT/hDgdf652A==
X-Received: by 2002:a05:600c:214d:b0:3fb:b1fd:4183 with SMTP id v13-20020a05600c214d00b003fbb1fd4183mr3701240wml.12.1689325080318;
        Fri, 14 Jul 2023 01:58:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c228900b003fba92fad35sm924257wmf.26.2023.07.14.01.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 01:57:59 -0700 (PDT)
Message-ID: <674fed6f-36d6-bacb-d075-97bc355177a3@linaro.org>
Date:   Fri, 14 Jul 2023 10:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Content-Language: en-US
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14/07/2023 10:08, Ryan Chen wrote:
> Hello,
> 
> On 14/07/2023 09:45, Ryan Chen wrote:
>> Add i2c new register mode driver to support AST2600 i2c new register 
>> mode. AST2600 i2c controller have legacy and new register mode. The 
>> new register mode have global register support 4 base clock for scl 
>> clock selection, and new clock divider mode. The i2c new register mode 
>> have separate register set to control i2c master and slave.
>>
>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>> ---
> 
> ...
> 
>> +	ret = devm_i2c_add_adapter(dev, &i2c_bus->adap);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ast2600_i2c_remove(struct platform_device *pdev) {
>> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
>> +
>> +	/* Disable everything. */
>> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
>> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
>> +
>> +	i2c_del_adapter(&i2c_bus->adap);
> 
>> I have doubts that you tested this. I think you have here double free/del of the adapter.
> Sorry, i can't catch your point for double free the adapter.
> It should use i2c_del_adapter in driver remove function.
> All the driver doing this 
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L2373
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-altera.c#L473
> 
> Do you mean it is not necessary? 

Instead of giving you the fish, I think much more learning experience is
to teach you how to fish. Please unbind your driver (echo the device
name to proper unbind file in sysfs). The best if you build your kernel
with KASAN.

Best regards,
Krzysztof

