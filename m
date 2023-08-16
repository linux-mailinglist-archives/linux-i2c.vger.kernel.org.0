Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C464277DDA6
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 11:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbjHPJqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 05:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243543AbjHPJqK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 05:46:10 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597E2E74;
        Wed, 16 Aug 2023 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692179164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mRCEFKwx/2j2MnXJTRWsju404KtQoZROl0rEb/btkc8=;
        b=AQiUCLa6aYqr9Stk6+Z3tb1JxL6bH/6aptFWrxVHsTrhacid568VyHPlkH8j40TPM/KX9B
        0XECvgUQGJUPvvVvoMQXD+B/6eEvO9pmFaGnBU4oWyrwp0oqGCRwFeEL5c1ZsdlJ8xFrO4
        QPPi4upRUvo7JRRW+/EHjXtEkfGVPmo=
Received: from [10.125.4.51] (<unknown> [109.190.253.11])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id fc590364 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 16 Aug 2023 09:46:04 +0000 (UTC)
Message-ID: <8f3e12e2-7e0f-3c25-2c7a-7cc7c32b5f36@sionneau.net>
Date:   Wed, 16 Aug 2023 11:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] i2c: designware: add support for pinctrl for recovery
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
References: <20230811135201.23046-1-yann@sionneau.net>
 <ZNZHfPCMg1Js28iF@smile.fi.intel.com>
Content-Language: en-US
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <ZNZHfPCMg1Js28iF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 11/08/2023 à 16:36, Andy Shevchenko a écrit :

> On Fri, Aug 11, 2023 at 03:52:01PM +0200, Yann Sionneau wrote:
>> From: Yann Sionneau <ysionneau@kalray.eu>
>>
>> Currently if the SoC needs pinctrl to switch the scl and sda
> SCL
> SDA
ack
>
>> from hw function to gpio function, the recovery won't work.
> from the I2C
>
> GPIO
ack
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>>   #include <linux/reset.h>
>> +#include <linux/pinctrl/consumer.h>
> Keep this in order.
Ok
>
> ...
>
>> +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
>> +	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
> It's not possible to have it NULL, why a dead code?

Woops, I thought NULL was possible, you are right: it's impossible.

I will also add handling of -EPROBE_DEFER error.

Thanks for the review.

Regards,

-- 

Yann

