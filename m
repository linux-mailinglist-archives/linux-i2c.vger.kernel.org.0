Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 077EB132B38
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 17:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgAGQjd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 11:39:33 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43351 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgAGQjd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 11:39:33 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so215310ljm.10;
        Tue, 07 Jan 2020 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d1JorjA4nbH0lGG9FrDXthugW4FVJXUIKyRvstTpWmI=;
        b=Izu/226Uj2nozL8PXSGlrXpf2hZRBRTxs5rZYwlzW6HhfKCuWO9e+AfMKdG2+mvSoF
         WBDkzCkGmbuNM5N0wOKVBE+mSdLjHWhnINcwXRdq19861b5VHuBEBvJDmhoEAz42TRR1
         IrRLoLImN3X+vHMxsr4nz1PuLeNilTSfj99oc3gBbs8xVGICaD+FggSNaxCP+4+ev6cY
         78DVj4OPXggKK/CopKlmzev+qXCtbcahpYjv3WHqmUubvTN8Dzk/Ry3DPPEWkUOMLty3
         0/wS9W7JMx76zBLurZ6e3RyPGwZZi4wkof0yXbgA8FONrLLT9hVNnpzuhX9pYvc8hCd9
         9sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d1JorjA4nbH0lGG9FrDXthugW4FVJXUIKyRvstTpWmI=;
        b=aa+a3dvQG0xk18WMFWfm3kjeS2xI0kDRNkwgsVoHNP0ua+WYw8Gmkdxlf1uoPxEJZW
         nDRK2tcflThfkfq6Po2w2lISlwTkP326hSGjb9hQxmRqbv4qlj7zfybz9lt2iwydlbbf
         p5/oEf664hbrFswv6CLpSYNgnZwPdCV+vafHzQyTkqcluKpFNpNb4w5+zTZTj4mwLbLh
         ueK902+CDJghgsgwtsiA4Ic1FDiiqPNK1ftjSP1Su8FluZnwy1Ku452Lp9gMCY1NLJ1o
         fLOc/78LdNYHZ1mQd+uK/S7Y8/N2+J4utzp6O9yFSVfey1qLuYhmRQO+SQMBamdfGL2x
         C9nw==
X-Gm-Message-State: APjAAAUSVmQMy8tpZWKcn/C4GcRG6c2vphlNjPzATj7aTv2zfj6huUZU
        p84A6tpf9ZPeEHYiNGrqYT6OGUn/
X-Google-Smtp-Source: APXvYqxoZ5xmiwKrF/YUAXqOLZ0jl59xUJWsp4EMsAOVgddA0Tnrq4tuX5iXnkNYfFd2wrqPLUR6Tg==
X-Received: by 2002:a2e:9008:: with SMTP id h8mr202232ljg.217.1578415170023;
        Tue, 07 Jan 2020 08:39:30 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id a15sm100803lfi.60.2020.01.07.08.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 08:39:28 -0800 (PST)
Subject: Re: [PATCH v3 0/9] NVIDIA Tegra I2C driver fixes and improvements
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200106010423.5890-1-digetx@gmail.com>
 <20200107123837.GE1964183@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c830befd-ac96-04ca-4338-1ca33f0674c3@gmail.com>
Date:   Tue, 7 Jan 2020 19:39:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107123837.GE1964183@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Thierry,

07.01.2020 15:38, Thierry Reding пишет:
> On Mon, Jan 06, 2020 at 04:04:14AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This patchset adds support for atomic transfers which are required for
>> shutting down machine properly. Secondly, a (not)suspending I2C and some
>> other things are fixed/improved by this small series as well. Please review
>> and apply, thanks in advance!
>>
>> Changelog:
>>
>> v3: The "Prevent interrupt triggering after transfer timeout" and "Support
>>     atomic transfers" patches got extra very minor improvements. The
>>     completion now is passed directly to tegra_i2c_poll_completion_timeout(),
>>     for consistency.
>>
>>     Added two new patches that firm up DMA transfer handling:
>>
>>       i2c: tegra: Always terminate DMA transfer
>>       i2c: tegra: Check DMA completion status in addition to left time
>>
>> v2: The series is renamed from "Tegra I2C: Support atomic transfers and
>>     correct suspend/resume" to "NVIDIA Tegra I2C driver fixes and
>>     improvements" because it now contains some more various changes.
>>
>>     New patches in v2:
>>
>>       i2c: tegra: Correct unwinding order on driver's probe error
>>       i2c: tegra: Prevent interrupt triggering after transfer timeout
>>       i2c: tegra: Use relaxed versions of readl/writel
>>
>>     The "Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN" got an
>>     improved wording for the code's comment to I2C_PIO_MODE_PREFERRED_LEN.
>>
>>     The "Support atomic transfers" also got some very minor tuning, like
>>     s/in_interrupt()/i2c_dev->is_curr_atomic_xfer/ in dvc_writel() that was
>>     missed in v1.
>>
>> v1: The "i2c: tegra: Support atomic transfers" previously was sent out as
>>     a separate patch, but later I spotted that suspend/resume doesn't
>>     work properly. The "i2c: tegra: Fix suspending in active runtime PM
>>     state" patch depends on the atomic patch because there is a need to
>>     active IRQ-safe mode for the runtime PM by both patches.
>>
>>     I fixed a missed doc-comment of the newly added "is_curr_atomic_xfer"
>>     structure field and added additional comment that explains why IRQ needs
>>     to be disabled for the atomic transfer in the "Support atomic transfers"
>>     patch.
>>
>>     Lastly, I added a minor "i2c: tegra: Rename .." patch that helps to
>>     follow driver's code.
>>
>> Dmitry Osipenko (9):
>>   i2c: tegra: Fix suspending in active runtime PM state
>>   i2c: tegra: Properly disable runtime PM on driver's probe error
>>   i2c: tegra: Prevent interrupt triggering after transfer timeout
>>   i2c: tegra: Support atomic transfers
>>   i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
>>   i2c: tegra: Use relaxed versions of readl/writel
>>   clk: tegra: Fix double-free in tegra_clk_init()
>>   i2c: tegra: Always terminate DMA transfer
>>   i2c: tegra: Check DMA completion status in addition to left time
>>
>>  drivers/clk/tegra/clk.c        |   4 +-
>>  drivers/i2c/busses/i2c-tegra.c | 216 ++++++++++++++++++++++-----------
>>  2 files changed, 147 insertions(+), 73 deletions(-)
> 
> I'm still a bit on the fence about that second patch because I don't
> think force-suspend is the right thing to do.

Technically the force-suspend does absolutely the right thing. That's
what other drivers do, including some of the Tegra drivers. Personally
I'm feeling confident that it should be correct. Of course it would be
better to get a confirmation, unfortunately Rafael didn't answer
anything yet. We can always make another patch if it will turn out that
something is wrong.

> You should probably split the clk subsystem patch out of this series so
> that it can be picked up into the clk tree (or I can pick it up into the
> Tegra tree).

I made a mistake during rebase and didn't notice that, the clk patch is
already applied to the clk tree by Stephen Boyd. I'll fix the rebase and
send out v4, thanks!

> Other than that, I ran this through the testfarm and didn't see any
> regressions:
> 
>     Test results:
>       13 builds: 13 pass, 0 fail
>       11 boots:  11 pass, 0 fail
>       38 tests:  38 pass, 0 fail
> 
>     Linux version: 5.5.0-rc5-g258d134300af
>     Boards tested: tegra20-ventana, tegra30-cardhu-a04, tegra124-jetson-tk1,
>                    tegra186-p2771-0000, tegra194-p2972-0000,
>                    tegra210-p2371-2180
> 
> I'll reply to the individual patches with a Tested-by for patchwork to
> pick up.

Thanks!

