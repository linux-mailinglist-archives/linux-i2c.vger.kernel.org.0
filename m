Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A431B2FC8
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 21:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgDUTH7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 15:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725902AbgDUTH6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 15:07:58 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A284C0610D5;
        Tue, 21 Apr 2020 12:07:58 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m2so11997211lfo.6;
        Tue, 21 Apr 2020 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qYwBjMSRVv3C9c5/CO1vbBsMdHkPfVeO/WaQB5IXEdI=;
        b=l6fGuliGWJouW55mIF1TsEYCzpo0eq7/N0nHvmeHTy9KOJtxhi9wpuLvgJxIngRxok
         aXdWFJVVfthOlemUe+NYJEyZ0IbbUdp7rO6d2ee1gOkKyQxmwTQq7O2jQdd3PWWsEukM
         /DknuZUdWI0MSROedMYh30KUhcBpYO3cbMHB4e7rzEXzrfD9+m7+aCfvwDBRW3ye/iwv
         mW5R8rNwz4i/L3MGNXTRp1NBIQDTvCGptqgDK9hvQ7bXInJmjDNt5vYQ/VR7VtAGZOiO
         PXh0P44m+hlnxjb8Qu49PxWtNksHoZ7J6T3rdFiAr5ia/HMY9AF8D4TUKZXM50axvZ9p
         FCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qYwBjMSRVv3C9c5/CO1vbBsMdHkPfVeO/WaQB5IXEdI=;
        b=e/i0NHkpvCyHjyGF3sW6igxQZIWdHUGEhryVG+wwjBIfUQd5ZQ4JDzTLz7gqWonM2y
         yRDaNjfxdxsw/yhHMDms/Rg3NinbkX+gHfDEGHeqmuIff2+91UHKkoXlXFIYa7BSPl6x
         fRcbPQ2eT7hrQcOjqH11QsNEnVZPRZ3OM2wf1YjrEWNZTHbWclrV7q2LbMVaQJzHyynX
         uhqQwBL6pGx0xAjzTBaAVihowNTs7u6lZGbD9z6tyqSsQhsFK9rpK01THswxDyG4kldq
         UCDdV+DL1WsdAhPWk/Xi6gedvteD74niRiI2IlqhRrmCGVTT82cPbyCJ+ba8E2vsF6yz
         M6jg==
X-Gm-Message-State: AGi0PuaVo8Ycu/uAdlnsesyLeawrD+ikW/595oDtUyYjITXEgKpSm+Xs
        SKzbdcUSkU246Q5IXN32iLBQTltY
X-Google-Smtp-Source: APiQypIvjrukNgwYETiyLmzCUHffaGyhyA3i8/6dksguAdWoZm7jbSdE5xsWskwEsiGxXR+CuVR+jA==
X-Received: by 2002:a05:6512:686:: with SMTP id t6mr14963960lfe.163.1587496076465;
        Tue, 21 Apr 2020 12:07:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r20sm2509295ljj.44.2020.04.21.12.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 12:07:55 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
 <93b738f2-ccf2-68ed-3ca5-30945bd40521@gmail.com>
 <61c9f5a7-3a48-8200-1cfe-d5d0524511f7@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <07351901-a533-0319-b2fd-f49f6540c238@gmail.com>
Date:   Tue, 21 Apr 2020 22:07:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <61c9f5a7-3a48-8200-1cfe-d5d0524511f7@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.04.2020 18:34, Jon Hunter пишет:
> 
> On 21/04/2020 16:18, Dmitry Osipenko wrote:
>> 21.04.2020 17:40, Jon Hunter пишет:
>>>
>>> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>>>> 21.04.2020 12:49, Jon Hunter пишет:
>>>> ...
>>>>> I can try the above, but I agree it would be best to avoid messing with
>>>>> the suspend levels if possible.
>>>>
>>>> Will be awesome if you could try it and report back the result.
>>>>
>>>
>>> I gave it a try but suspend still fails.
>>
>> Is this regulator error gone with my changes?
>>
>> [   60.450346] WARNING: CPU: 0 PID: 653 at
>> /home/jonathanh/workdir/tegra/mlt-linux_next/kernel/drivers/regulator/core.c:2603
>> _regulator_disable+0xb8/0x1b4
>> [   60.463959] unbalanced disables for vdd_pexa,vdd_pexb
> 
> The above is still there with your changes.

Interesting, hopefully the PM logs will point out the source of the problem.
