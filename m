Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7A56573CB
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Dec 2022 09:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiL1IBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 03:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiL1IBv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 03:01:51 -0500
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBD8FE4;
        Wed, 28 Dec 2022 00:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=M54YK/lBrrcKNhiCQEZFv8PIdYNMDYnBHr5xVOUNbFE=; b=BLgMakDscmJWzJ71VufH+VbiUh
        8KH18vQRX3o9wKxcdCMIieQyr8qMz6KPFLcJoFQzL/Y0GnqYoGYuSRLuwm07H/eKJzd8JwSHDPmcC
        LcAHXU0rm1I3cwpGxwCOLi8NM0EFdxvPGziDNTXJhmJLQUUQtuAPDwKYllk93agnAO7zp2OIoXYM1
        2gHFyneIt5ZUne6/s35tUrA/foWjqxmwmQFsRUkv1qDy+lQOm/mSfL1r2XA0ozZ9q7A8H+m/JpgPB
        TxVTAxYRjcIxxvXFn0//ruw86nj4GhmwAh/cvcQm0GxaM0Blq058KsWLcIDamHdzLrSYGC6Z4ho+G
        WChAZ7Hw==;
Received: from [89.212.21.243] (port=40670 helo=[192.168.69.116])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1pARNZ-004kGl-Eh;
        Wed, 28 Dec 2022 09:01:44 +0100
Message-ID: <41991ce2-3e88-5afc-6def-6e718d624768@norik.com>
Date:   Wed, 28 Dec 2022 09:01:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Content-Language: en-US
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        upstream@lists.phytec.de, Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        francesco.dolcini@toradex.com
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
 <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
 <20221216110227.GA12327@pengutronix.de>
 <20221216111308.wckibotr5d3q6ree@pengutronix.de>
 <5c2e0531-e7c3-1b37-35ed-c8e9795a0d18@norik.com>
 <Y5xpt6J01Boec6Xr@francesco-nb.int.toradex.com>
From:   Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <Y5xpt6J01Boec6Xr@francesco-nb.int.toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

On 16. 12. 22 13:51, Francesco Dolcini wrote:
> On Fri, Dec 16, 2022 at 01:23:29PM +0100, Primoz Fiser wrote:
>> Hi all,
>>
>> On 16. 12. 22 12:13, Uwe Kleine-König wrote:
>>> On Fri, Dec 16, 2022 at 12:02:27PM +0100, Oleksij Rempel wrote:
>>>> On Fri, Dec 16, 2022 at 11:41:08AM +0100, Primoz Fiser wrote:
>>>>> Hi Marco,
>>>>>
>>>>> On 16. 12. 22 10:45, Marco Felsch wrote:
>>>>>> Hi Primoz,
>>>>>>
>>>>>> On 22-12-16, Primoz Fiser wrote:
>>>>>>> By default, retries value is set to 0 (no retries). Set retries to more
>>>>>>> sensible value of 3 to allow i2c core to re-attempt transfer in case of
>>>>>>> i2c arbitration loss (i2c-imx returns -EAGAIN errno is such case).
>>>>>>
>>>>>> apart the fact that the number of retries vary a lot and so the client
>>>>>> driver behaviour can vary a lot which is not good IMHO, why do you think
>>>>>> that 3 is a sufficient number?
>>>>>
>>>>> IMHO it is better than leaving it at 0 (no retries)?
>>>>>
>>>>> Setting it to sensible value like 3 will at least attempt to make transfer
>>>>> in case arbitration-loss occurs.
>>>>>
>>>>>>
>>>>>> If an arbitration loss happen, why do you think that retrying it 3 times
>>>>>> changes that?
>>>>>
>>>>> I our case, setting retries to non-zero value solves issues with PMIC
>>>>> shutdown on phyboard-mira which in some rare cases fails with "Failed to
>>>>> shutdown (err =  -11)" (-EAGAIN).
>>>>>
>>>>> To me it makes common sense retries is set to non-zero value especially for
>>>>> such rare conditions/situations.
>>>>
>>>> https://lore.kernel.org/all/Ys1bw9zuIwWS+bqw@shikoro/
>>
>> Ohh I see.
>>
>> Reading through the thread I guess we aren't getting this mainlined at all
>> :)
>>
>> The only solid point in the thread seems to be that in that case we are not
>> covering up the potential i2c hardware issues?
> 
> I believe that in this case we should just have a warning in the kernel.
> The retry potentially work-around a transient issue and we do not hide any hardware
> issue at the same time. It seems an easy win-win solution.

I would agree about throwing a warning message in retry case.

Not sure how would it affect other i2c bus drivers using retries > 0. 
Retries might be pretty rare with i2c-imx but some other drivers set 
this to 5 for example. At least using _ratelimited printk is a must 
using this approach.

> 
>> Yeah fair point but on the other hand, goal of this patch would be to
>> improve robustness in case of otherwise good performing hardware. From user
>> perspective I just want it to work despite it retrying under the hood from
>> time to time. I think Francesco had the same idea.
> 
> Unfortunately I was missing the exact background that made us do this
> change, we just had it sitting in our fork for too long :-/
> This is one of the reason I gave up on it.
> 
> Quoting Uwe [1]
>> sometimes there is no practical way around such work arounds. I happens
>> from time to time that the reason for problem is known, but fixing the
>> hardware is no option, then you need such workrounds. (This applies to
>> both, retrying the transfers and resetting the bus.)

I wouldn't say this is exactly a workaround if "retries mechanism" is 
standard part of the i2c core. Other drivers use it as well. it is just 
a setting to improve bus robustness.

But OK, I guess we can live with this one-liner in the downstream kernel.

> 
> Francesco
> 
> [1] https://lore.kernel.org/all/20220715083400.q226rrwxsgt4eomp@pengutronix.de/
> 

