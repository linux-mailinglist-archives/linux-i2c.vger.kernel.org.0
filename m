Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6EC1BA9A2
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 18:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgD0QCK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 12:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726539AbgD0QCJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 12:02:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325C6C0610D5;
        Mon, 27 Apr 2020 09:02:09 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g4so18185901ljl.2;
        Mon, 27 Apr 2020 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UC4nurrRf3udrQTojIPA4rnIYQOFVwae7To0mJBT8fY=;
        b=dEfOb1A9rszXfQ+Gl8DHgEKY28a1ukFvgJsqw2TDFDTAzkvl0TzJROMBfv7KHOA9Bq
         ECJhx+6UwixpV7KO9N17Pg/IwsuYhqs8kFba/OdMJxhs/iyJK0eTZ8qqhCF0bIRFGH47
         WNcgHxHeWL7NBULWgtD9PSgBD1asKMr8JWRzuNt4j9HA/6SbhHbz3V1Za1IwZQOAjHFZ
         jrNvbo1w3flFlnTq+M7bhPhZFvhGLu22HXt+p5kL6ljZTMSAC4uSYykuIF1P8oTsjy4O
         pvn+ZL7m+WWDTL60tsn+EV8rJgM/f2nxPRuG/re4uDfqH5ybJWy8qDzXdlqz7mxmdos/
         PBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UC4nurrRf3udrQTojIPA4rnIYQOFVwae7To0mJBT8fY=;
        b=TFSds8NzEpa1vOFOsrsF2mLUHjQ+q7jchs623YQxV3rnGZZvH7e7Koa9a+aeJMvETu
         p9qR2PpAPiUbTuNDxvw3qzBu+Lx8Nj0fRXvlX9KhHGvV+jGVN3LSHBRCWTRFkWkuVyxc
         rddhcm6cZkSVHs4s9sa1Hw7SLft+P+RZsGyJaeWvSBwo3lh6s+zIs7qgy0pqs2qEcmTI
         4nkhmLIlRe3TCdtrU4gCg4Nv9m06uVjdQoli0/+o420cK5xoMTYItKbOXSg1+SqkaNZL
         z6lm4hwC2vJ8Auw1/KgV3XBw4Rt7KRD+l+/pjvL+Yy9mb9cHUEZCi9e/ywtUm1gnE6Dy
         sgpw==
X-Gm-Message-State: AGi0PubIdhjQcu3QL9qLqQyzkGtt0qrZHvuAFbZq3PIeNavuFiU/fqJD
        wO3YQk3K0K8MBCY0nN4DOVOn3tl2
X-Google-Smtp-Source: APiQypL5znxvymWbmggY0tfM0ZWAlsQInR3g+byT1vkk+SyFdtfKGG+UkYD5WzOhbUAxPKxtFjnRBw==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr15083373ljk.134.1588003327236;
        Mon, 27 Apr 2020 09:02:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id t16sm10271884ljg.41.2020.04.27.09.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 09:02:06 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo> <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
 <20200427103553.GA24446@kunai> <20200427105029.GB3464906@ulmo>
 <20200427153244.GF3464906@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <127a2c32-e5fb-2944-3062-361b276490c0@gmail.com>
Date:   Mon, 27 Apr 2020 19:02:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427153244.GF3464906@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 18:32, Thierry Reding пишет:
> On Mon, Apr 27, 2020 at 12:50:29PM +0200, Thierry Reding wrote:
>> On Mon, Apr 27, 2020 at 12:35:53PM +0200, Wolfram Sang wrote:
>>> On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
>>>> 27.04.2020 11:44, Wolfram Sang пишет:
>>>>>
>>>>>> Wolfram, can you revert the following two patches for v5.7, please?
>>>>>>
>>>>>> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
>>>>
>>>> This patch has nothing to do with your trouble, why do you want to
>>>> revert it?
>>>
>>> I'll wait some more before pushing out, so you can discuss it.
>>
>> Okay, let me run a quick test with that second patch still applied to
>> make sure it really is harmless.
> 
> Alright, I tested v5.7-rc3 with this patch reverted:
> 
> 	a900aeac2537 i2c: tegra: Better handle case where CPU0 is busy for a long time
> 
> and the results came back positive, so I think we can leave patch:
> 
> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> 
> in. But then again, I see that Dmitry posted this yesterday:
> 
> 	https://lkml.org/lkml/2020/4/26/481
> 
> which seems like it would be related to this and potentially be a
> follow-up fix for some corner cases?

This is a follow-up to my previous message in this thread:

https://lkml.org/lkml/2020/4/23/792

> So I'm not sure how well this whole set has been tested yet.

It depends on what you're meaning by the testing. We have some
yet-out-of-tree real-world devices that are using APBDMA for Bluetooth,
Audio, I2C (touchscreens) and etc peripherals. These devices were using
the DMA patches before they were posted to the ML.

> Maybe a better solution would be for the DMA synchronization patch to go
> into the 5.8 queue instead to make sure we get more testing cycles.

It should be fine to re-queue the patches for 5.8. I'm just a bit afraid
that if patches are simply dropped now, then you won't get back to it
for a year or so ;)
