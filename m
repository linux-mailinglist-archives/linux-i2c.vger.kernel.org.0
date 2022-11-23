Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AC763508A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 07:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236063AbiKWGg6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 01:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236097AbiKWGg4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 01:36:56 -0500
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D30BF41A0;
        Tue, 22 Nov 2022 22:36:55 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id l24so10990257edj.8;
        Tue, 22 Nov 2022 22:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulv6edlYlCjp0LG54r+aLHzcPkGe6DtDqBoJOOcicbo=;
        b=NhTXm2m2X1WHmRD5ZDw5SHZ9UcCAHRoV1HhA6UgYo05HR130SHyTpXs/S+xheeo067
         YTrDiQt82nsvRJ2FU6v8yyFyXaTv1p6aGEm6Tv1IH/nhT2z+uX2cbaGsWg2TPfL/U7f6
         QaQCJc98t0eH1CH6Sge6xlm8TitYP/GIhxAensekjotvJZC/ZIE15ug8VB3aLg9tGYDl
         cuHHf+ghiS6tZHgn+qv4mygjF4JTlzHzzEOEWIkloBy+ee0xgBQ8IA1OzQjHwB37EhWS
         QNXBccnyG5ZHQdGWAGzdBTBrtXZC1/7SpOslmQWLxMIwF7WpuQitstARxbpUI30ZxDUl
         uIPA==
X-Gm-Message-State: ANoB5pnxHyzeyRfUaPXiiGOhC3a1DWQW33utkDRhBJVc9ByGi4nuMNx7
        XUULh2GZEUpoH4DLuEib+io=
X-Google-Smtp-Source: AA0mqf4Dg8TPFknBTb46nP+hZVU9dnIIVJmPfq9gDz6Bkbp7NPi0+V6eg4HjVS0LNkQbEVYv61QXhA==
X-Received: by 2002:a05:6402:520a:b0:459:4c7b:e852 with SMTP id s10-20020a056402520a00b004594c7be852mr11384046edd.347.1669185414237;
        Tue, 22 Nov 2022 22:36:54 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id up30-20020a170907cc9e00b007ae0fde7a9asm6828545ejc.201.2022.11.22.22.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 22:36:53 -0800 (PST)
Message-ID: <0bfea903-5efd-a76d-5944-16a2c9362adb@kernel.org>
Date:   Wed, 23 Nov 2022 07:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 571/606] serial: sc16is7xx: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-572-uwe@kleine-koenig.org>
 <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
 <20221121070757.cqiybt5uk4qiczmr@pengutronix.de>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221121070757.cqiybt5uk4qiczmr@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 21. 11. 22, 8:07, Uwe Kleine-König wrote:
> Hello Jiri,
> 
> On Mon, Nov 21, 2022 at 07:03:41AM +0100, Jiri Slaby wrote:
>> On 18. 11. 22, 23:45, Uwe Kleine-König wrote:
>>> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>
>>> .probe_new() doesn't get the i2c_device_id * parameter, so determine
>>> that explicitly in the probe function.
>>
>> I wonder why -- is this a new approach to probe functions? Or is only i2c
>> affected? And why? Could you point to the commit introducing and describing
>> the change in the i2c core?
> 
> I didn't sent the cover letter to all recipents of the individual
> patches, so flow of information is a bit rough. Sorry about that.
> 
> You can find it at
> https://lore.kernel.org/lkml/20221118224540.619276-1-uwe@kleine-koenig.org/,
> it should answer your question.

Yes, I looked up that beforehand, but was no more clever after reading it.

> The short version is: The i2c framework does a more or less expensive
> lookup for each call to .probe() to provide the id parameter. A relevant
> part of the drivers however doesn't use this parameter, so the idea is
> to let the drivers who actually need it, determine it themselves.
> 
> Statistics for the current state of this series in my tree:
> Among the 602 converted drivers, 404 don't make use of the parameter.

So doesn't it make sense to provide both probe with no id and "probe_id" 
then? 200 is quite a few (a third to be precise).

BTW is this a performance issue? I.e. does it slow down the boot?

thanks,
-- 
js
suse labs

