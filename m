Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7236078AB45
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 12:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjH1K3l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 06:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbjH1K3j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 06:29:39 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1756E119;
        Mon, 28 Aug 2023 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1693218570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qV2IjtvaZJAM+hwgZA2tc0IkrXchGtInOl4pNs604ig=;
        b=rWrDRzE1RctQikFjbd8khMTlldjPateq9zfQ8AX1SjbrpGUfYVkqr2e5zHvlfz1ld+xefB
        28YApl/vMAUCE/Yqv6n633YsnaO0e/2UJl1HonqEjdNf0DcyhfhUbHKEzu2dqlZ+PgCNyx
        YAvLnwyTscoFdTfwxRRetDRL8Ztsj7g=
Received: from [192.168.1.18] (91-171-21-26.subs.proxad.net [91.171.21.26])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 034c5512 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Mon, 28 Aug 2023 10:29:30 +0000 (UTC)
Message-ID: <1bdcc4c9-fd48-c903-0d92-8aa24459c739@sionneau.net>
Date:   Mon, 28 Aug 2023 12:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] i2c: at91: Use dev_err_probe() instead of
 dev_err()
To:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230825143234.38336-1-yann@sionneau.net>
 <5c680292-bcfe-881a-1c23-299c05b377ee@microchip.com>
Content-Language: en-US
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <5c680292-bcfe-881a-1c23-299c05b377ee@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Le 28/08/2023 à 10:03, Nicolas Ferre a écrit :
> On 25/08/2023 at 16:32, Yann Sionneau wrote:
>> Change
>> if (IS_ERR(x)) { dev_err(...); return PTR_ERR(x); }
>> into
>> return dev_err_probe()
>>
>> Also, return the correct error instead of hardcoding -ENODEV
>> This change has also the advantage of handling the -EPROBE_DEFER 
>> situation.
>
> Is it found using a tool like Coccinelle or you just ran into it and 
> figured out it could be good to change?

I found it by reading the code, I took the time to read the probe 
functions of a few i2c controller driver to try to find improvements.

But I guess one could also find this sort of changes using tools.

Regards,

Yann

>
> Regards,
>   Nicolas
>
>> Signed-off-by: Yann Sionneau <yann@sionneau.net>
>> ---
>>   drivers/i2c/busses/i2c-at91-core.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-at91-core.c 
>> b/drivers/i2c/busses/i2c-at91-core.c
>> index 05ad3bc3578a..b7bc17b0e5f0 100644
>> --- a/drivers/i2c/busses/i2c-at91-core.c
>> +++ b/drivers/i2c/busses/i2c-at91-core.c
>> @@ -227,10 +227,9 @@ static int at91_twi_probe(struct platform_device 
>> *pdev)
>>          platform_set_drvdata(pdev, dev);
>>
>>          dev->clk = devm_clk_get(dev->dev, NULL);
>> -       if (IS_ERR(dev->clk)) {
>> -               dev_err(dev->dev, "no clock defined\n");
>> -               return -ENODEV;
>> -       }
>> +       if (IS_ERR(dev->clk))
>> +               return dev_err_probe(dev->dev, PTR_ERR(dev->clk), "no 
>> clock defined\n");
>> +
>>          clk_prepare_enable(dev->clk);
>>
>>          snprintf(dev->adapter.name, sizeof(dev->adapter.name), "AT91");
>> -- 
>> 2.34.1
>>
>
