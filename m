Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4053E4F1D01
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Apr 2022 23:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382436AbiDDV3t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Apr 2022 17:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379787AbiDDSIL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Apr 2022 14:08:11 -0400
X-Greylist: delayed 348 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Apr 2022 11:06:14 PDT
Received: from mx.msync.work (mx.msync.work [51.91.38.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F036237BCE
        for <linux-i2c@vger.kernel.org>; Mon,  4 Apr 2022 11:06:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC3A73B01F;
        Mon,  4 Apr 2022 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
        t=1649095223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-transfer-encoding:content-language:in-reply-to:references;
        bh=e4rEEW1CHNAO9Rw05pMKLdvrOaRjn2nB0lWvqsJB/YE=;
        b=AGxfBeyUsX2CJvgiIWm9xFYwWlrarsTY0GIWhYZj3CYvlEOgR/Gnws76052KycThOR4h14
        wuwBMur/eJ80gpveFSKQ7w1BktIOziBXSN3lkTYY1RiqxaSubjGpKDzcTL9bWxxGne/dZ5
        N0J4K+Zrf/lJzIQqlmNDohShl1c6I2+EveF4ikgLmfWrAUpJ4ktvniMl9PJwY30VEqI/zf
        lUEJctuhA3h2WDs3q2rJ+nyu5x/Iaz9KjCxUg+G0YW5/8uc3I099BtVMke8n5hKlRloAtk
        Rd0cThQGLCujPT7NYNy0lcv+3Hz7Rt+ZE/W2C5hFk5wb9rDU5BTH8+9ooAIlwA==
Message-ID: <d4ebfe84-2948-8270-32f4-6cfc55047600@lexina.in>
Date:   Mon, 4 Apr 2022 21:00:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
Content-Language: ru
To:     Neil Armstrong <narmstrong@baylibre.com>, tanure@linux.com,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
 <8986ec34-616b-d497-29d1-6f7896c26e37@baylibre.com>
From:   Vyacheslav <adeep@lexina.in>
In-Reply-To: <8986ec34-616b-d497-29d1-6f7896c26e37@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



04.04.2022 11:01, Neil Armstrong wrote:
> Hi,
> 
> On 29/03/2022 00:31, Lucas Tanure wrote:
>> On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com> wrote:
>>>
>>> Hi Lucas,
>>>
>>> Lucas Tanure <tanure@linux.com> writes:
>>>
>>>> The default duty cycle of 33% is less than the required
>>>> by the I2C specs for the LOW period of the SCL clock.
>>>>
>>>> So, for 100Khz or less, use 50%H/50%L duty cycle, and
>>>> for the clock above 100Khz, use 40%H/60%L duty cycle.
>>>> That ensures the low period of SCL is always more than
>>>> the minimum required by the specs at any given frequency.
>>>
>>> Thanks for the fixes!
>>>
>>> This is going to affect all SoCs, so ould you please summarize how your
>>> changes were tested, and on which SoCs & boards?
>>>
>>> Thanks,
>>>
>>> Kevin
>>
>> Hi,
>>
>> I only tested against the vim3 board, measured the bus with a Saleae
>> logic pro 16.
>> The measurements were with 100k, 400k, and a few in-between frequencies.
> 
> Thanks, it's a great addition to have !
> 
>>
>> Is that enough?
> 
> A test on GXL/GXM (VIM1 or VIM2) & GXBB (Odroid-C2) devices is lacking 
> before we
> can merge this.
> 
> If I find some time, I'll have a try, but everyone is welcome testing 
> this serie
> and report if it still works fine for them.
> 
> Vyacheslav, do you think you can test on your JetHub devices ? it would 
> validate GXL & AXG.

It builds ok on 5.17. JetHub H1/D1 has only rtc clock (pcf8563) and 
1-wire controller (ds2482) on i2c bus. I did't see any difference with 
or without patches. all works at first look.

Vyacheslav

