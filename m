Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D15E69355E
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 01:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBLALT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Feb 2023 19:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjBLALT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Feb 2023 19:11:19 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F9C12F1A;
        Sat, 11 Feb 2023 16:11:18 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bx13so7518021oib.13;
        Sat, 11 Feb 2023 16:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1zU6Phm1FTRvseyENRr0vXRmLlXapBPUbQLCge6x8WU=;
        b=iH2KZl5xYGeNwb/9KS23/NNaspSuJ3hfMnFva1Z5DpmIHciMwXUsvi/XGlLDZtMLs6
         5g1y1pn/OsY0BG7UMjRNB40cgw4k1FXTbwsjE52pWf8cVmjQDVZYV8QQKE+hDyYbq81j
         kVvegusr0Hl8o3FMHW6RDNh8jCpzjHRFUsKzyuYV0w4M72N25bdHiyk0NPfTVsbgOF3l
         U3j+I0R7e8C3KRiUJ5N3ZZ3+4fiqWOyDxXmvp76KqBfCsFA0023lyk98gxKIxGDxwCyW
         jwqJtQ1+0abgjctE2by3NZz9IoG02Y0tylOPegvzD5UemAwfmEtran0nAAYvRMb4JeCB
         tEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zU6Phm1FTRvseyENRr0vXRmLlXapBPUbQLCge6x8WU=;
        b=DAEYBI+Emm6+7htHzmSVhNjRnoo6lOOHOttIZAq4FcvJ310TzujFgPmPx3ddugZr/w
         bA6nXLsXwg0Fkv8gL2TqzvTr8mUzI6zikXemEtRy4Dp4BjXEaLwUVtdB/XdgxixS/Gy5
         8hz9+EPxZCZ7bU3p57NZFxzsuC6N+/AMEgS80OtAWzvUyjZWcqTKNZZlFqPJHpCp5VWM
         P8NowOEjO6ApWoMllZgXMBHvHGn84Iud6wSRasoOC92t2vhJUIzhjnoC53wSCS3UxQ5W
         EvR2AFHJ0qdJUtr/9E82GyLy+5C2wvPPLiRbGCl1RhXy5My3lNEs28oiIRud4tC7h1BE
         zn8w==
X-Gm-Message-State: AO0yUKWKwSqcQxMNX+QsA8qAJLFmMzC99wiz8vZK7vvEzV3i775McaJq
        kFWKWUuhopHa1rl9ze39HmY=
X-Google-Smtp-Source: AK7set9aUtIH1M58O4yyZnAd4T04QSmAv36j4bSzkLJMp/2MJZRfRgW9oS7/cRi/Tucuui3VMK/P6A==
X-Received: by 2002:a05:6808:438f:b0:364:cef2:dfd0 with SMTP id dz15-20020a056808438f00b00364cef2dfd0mr9687274oib.29.1676160676885;
        Sat, 11 Feb 2023 16:11:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dq3-20020a056808428300b0037d8148cf04sm738636oib.46.2023.02.11.16.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 16:11:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <573e5ffb-cd3f-4811-972e-a1540c17820c@roeck-us.net>
Date:   Sat, 11 Feb 2023 16:11:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 596/606] watchdog: ziirave_wdt: Convert to i2c's
 .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-597-uwe@kleine-koenig.org>
 <20221118225747.GF686528@roeck-us.net>
 <20230127103204.t3k53rqaygxdlvyl@pengutronix.de>
 <20230211230127.gsaixwtfd6squ7ce@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230211230127.gsaixwtfd6squ7ce@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/11/23 15:01, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Jan 27, 2023 at 11:32:04AM +0100, Uwe Kleine-König wrote:
>> On Fri, Nov 18, 2022 at 02:57:47PM -0800, Guenter Roeck wrote:
>>> On Fri, Nov 18, 2022 at 11:45:30PM +0100, Uwe Kleine-König wrote:
>>>> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>
>>>> The probe function doesn't make use of the i2c_device_id * parameter so it
>>>> can be trivially converted.
>>>>
>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> This patch hasn't made it into next yet. Is it still on your radar?
>>
>> My plans for this series is to complete the conversion after the next
>> merge window which should include most patches from this series.
>>
>> So I ask you to either take this patch during the next merge window or
>> accept that it will be applied together with the i2c core conversion
>> that drops .probe() with the i2c_device_id parameter.
> 
> This got Guenter's R-b tag twice now, but the patch didn't appear yet in
> next. I'll prepare a series for Wolfram to apply via his i2c tree based
> on what is in next during the merge window with the idea to get the
> change early into next with an immutable tag. If you get this patch in
> during the merge window that would be ideal, but if not, I will take
> care of it and as announced will send it together with the i2c change.
> 

It is in my watchdog-next tree, and we can only hope that Wim
will pick it up from there.

Guenter

