Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2ECF490B86
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 16:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbiAQPhS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 10:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240516AbiAQPhQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 10:37:16 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1B4C061574;
        Mon, 17 Jan 2022 07:37:16 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id x22so59000338lfd.10;
        Mon, 17 Jan 2022 07:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OL7Y+hrIynkrqQt6obRsxcKwMEddn/APo3kKvBE1hy0=;
        b=D0MmIgPKLNGF0PNzm0QWbFHV7P80RcAkUYHSs+OGOZECTww3hV82/aB7v+N8QtWPDw
         ToP9IYGDRW5fQwApZRK2wONbpfTaI67OrOp3MQ+ZJuQoeoOVYRnkuK4JsCn9kM/uo5xf
         vRgJLCMH2xqggaWMKMgmxExoQi3GbljwB9gsbyjDv3bmWdFYU40yWhxyvQ2+cRUj9ydb
         MhjrxJI3IvvJ/gM8Epg6hNn8fPhXw5Z1gAG5TgVqYPdy+8UF3m+DhTMZ4mRCk0mfTF+D
         1t3eYNuHtA057tpW6HW4h2exSCHGZ130eCPSS1HOkmSLCCg/oDEiyEykmXiNP8St6Yoj
         nN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OL7Y+hrIynkrqQt6obRsxcKwMEddn/APo3kKvBE1hy0=;
        b=Hm5uWCdt683eX2zKvsSO2UoE1WkeSy2bMuLsL/A+dOhX4OhTeBpK2PV+wYq5NfdR+a
         jlSObsYkPJOpIl12jrTA6Ydy987zN+7mEQw/QHnHgWKu2i1xFOHc8vQH2cAKbImGeayF
         R89V/1sVgEFQpltTo0/LJFAoiGdfN5HeYigbmE83CkDZnBlu6PSdki3oksmcd+9Ml/ph
         CLmCUtpExG0bzx3+Gf8IFEw4phYdUy5mTHv1h7fuZZsic2yQhsH9X11UEEne54CTR+fU
         UZx5vHwK0NLq/NZBf6bxZ9yOITC1asYqDHyvc9hLE1WuXucOSwDZKWK1Di1u1/e4DxfT
         SLWQ==
X-Gm-Message-State: AOAM533+9rYyynUyTg4eXjIah7uJ9rZb5F+yRMylwS/veUbRjOlx/JdJ
        yzpHGjx3XNZpTPk2dAofgXA=
X-Google-Smtp-Source: ABdhPJyvCIHIxihGy//3IJnSQB5nqEhHeefHDn4ChkAdTLzcGWZY60C8xhndAUwjPYK8/6+1fXR55A==
X-Received: by 2002:a05:6512:c1f:: with SMTP id z31mr17465053lfu.613.1642433834710;
        Mon, 17 Jan 2022 07:37:14 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id r14sm355385lfp.59.2022.01.17.07.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 07:37:14 -0800 (PST)
Message-ID: <9ca5caed-a68f-f131-dfb6-d187614ff9ee@gmail.com>
Date:   Mon, 17 Jan 2022 18:37:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] i2c: tegra: allow compiling out support for Tegra's
 special constrollers
Content-Language: en-US
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
 <ea9ab0b7-022b-93e2-ed7d-dccfa95bd900@gmail.com>
 <YeRd90gLqtsz2zVV@qmqm.qmqm.pl>
 <e7a9a48b-e924-9e14-a4ff-b13853c5033e@gmail.com>
 <YeSQj/f94IH4SAQ/@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <YeSQj/f94IH4SAQ/@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.01.2022 00:39, Michał Mirosław пишет:
> On Sun, Jan 16, 2022 at 09:34:42PM +0300, Dmitry Osipenko wrote:
>> 16.01.2022 21:03, Michał Mirosław пишет:
>>> On Sun, Jan 16, 2022 at 08:54:08PM +0300, Dmitry Osipenko wrote:
>>>> 16.01.2022 19:02, Michał Mirosław пишет:
>>>>> To patches that, combined, reduce I2C driver's code by ~2kB and a bit
>>>>> from runtime overhead for non-Tegra20 or non-Tegra210 builds.
>>>>>
>>>>> Michał Mirosław (2):
>>>>>   i2c: tegra: allow DVC support to be compiled out
>>>>>   i2c: tegra: allow VI support to be compiled out
>>>>>
>>>>>  drivers/i2c/busses/Kconfig     | 16 ++++++++++++++++
>>>>>  drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
>>>>>  2 files changed, 38 insertions(+), 13 deletions(-)
>>>>>
>>>>
>>>> 2KB is a too small difference to justify the ifdefs and Kconfig entries,
>>>> IMO.
>>>
>>> Maybe I should have mentioned that it's ~20%? With my "embedded" hat on:
>>> I think it might be small, but sometimes it is the difference between
>>> bootable kernel or one too big.
>>
>> 10KB is a small size too. I'm very doubtful that such changes make any
>> real difference in practice.
>>
>> Much more practical should be to modularize more kernel code. You should
>> be able to squeeze zImage down to 3MB without any code changes by
>> toggling more kernel config options to =m. Try to use grate_defconfig
>> [1] for the base, that is what postmarketOS kernel build uses.
> 
> For normal system this solution is workable. But for recovery, where you
> have to fit kernel+initrd in whatever small partition is provided (like
> eg. in Transformers 8MiB), it becomes a problem from time to time.
> (In this case, modules make it worse due to additional overhead in
> kernel and userspace).

My point is that 2KB very likely won't change anything for you. I'd
suggest to take a look at a more "fat" drivers, like DRM/host1x for
example. I suppose it should be possible to save at least couple
hundreds KB by trimming those fat drivers.
