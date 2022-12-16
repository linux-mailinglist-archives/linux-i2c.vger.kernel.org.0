Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBA464E998
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 11:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiLPKlP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 05:41:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbiLPKlO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 05:41:14 -0500
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A132F09;
        Fri, 16 Dec 2022 02:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QkE6cvAGTPArZRIQb5KHMBKk1af+ie9psS4oH/B3U4Q=; b=GhspP+XWxgi6fXsKUhROMbA1yF
        v/jCVu02cfZOHjib/20VZ5E+IahOs27Baj9nQBkRvDwRRWwGNpbgYWnq5rRXSTUtghLV5afZkyw9o
        gik7t7DIhRVsNO5ewNcWMzrZj/JsvBD60/svyssBij/qFGVdD1z8bhsRfRakOkskVlNmJyZt9ZMWv
        70p4LqLMKUo3BT26cQRT8mFY7mQ++AbPJQjQu/kLetQeEOLGhIRjoyxJDNK19qfNn6aadkqzpt9qv
        OGLXn9lfjkgPWpl/qE9TUXM1eiRfUO58+KgjKzlme/MQvLQX9HMYWEIyyWreybjmxaIpIkiVHUWEW
        unojokkw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:49226 helo=[192.168.69.116])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1p689C-005DG8-32;
        Fri, 16 Dec 2022 11:41:05 +0100
Message-ID: <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
Date:   Fri, 16 Dec 2022 11:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
From:   Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marco,

On 16. 12. 22 10:45, Marco Felsch wrote:
> Hi Primoz,
> 
> On 22-12-16, Primoz Fiser wrote:
>> By default, retries value is set to 0 (no retries). Set retries to more
>> sensible value of 3 to allow i2c core to re-attempt transfer in case of
>> i2c arbitration loss (i2c-imx returns -EAGAIN errno is such case).
> 
> apart the fact that the number of retries vary a lot and so the client
> driver behaviour can vary a lot which is not good IMHO, why do you think
> that 3 is a sufficient number?

IMHO it is better than leaving it at 0 (no retries)?

Setting it to sensible value like 3 will at least attempt to make 
transfer in case arbitration-loss occurs.

> 
> If an arbitration loss happen, why do you think that retrying it 3 times
> changes that?

I our case, setting retries to non-zero value solves issues with PMIC 
shutdown on phyboard-mira which in some rare cases fails with "Failed to
shutdown (err =  -11)" (-EAGAIN).

To me it makes common sense retries is set to non-zero value especially 
for such rare conditions/situations.

BR,
Primoz

> 
> Regards,
>    Marco
> 
> 
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>   drivers/i2c/busses/i2c-imx.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index cf5bacf3a488..6a5694cfe1cc 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -1478,6 +1478,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>>   	i2c_imx->adapter.dev.parent	= &pdev->dev;
>>   	i2c_imx->adapter.nr		= pdev->id;
>>   	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
>> +	i2c_imx->adapter.retries	= 3;
>>   	i2c_imx->base			= base;
>>   	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>>   
>> -- 
>> 2.25.1
>>
>>
>>

