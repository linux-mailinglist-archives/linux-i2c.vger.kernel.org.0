Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F7629DB04
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 00:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgJ1Xmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 19:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgJ1Xko (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 19:40:44 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA38C0613CF
        for <linux-i2c@vger.kernel.org>; Wed, 28 Oct 2020 16:40:43 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id w191so1434610oif.2
        for <linux-i2c@vger.kernel.org>; Wed, 28 Oct 2020 16:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yce2yiNewFI2iY/zOa+oQW9hS6ij7XHoRO2uiMEqpAc=;
        b=lMeN0+pZvj3P8r89g9GaQz5eQqKRRMGBpiztTu2ol7AgmAGqZ34/tBQ8enrP+4MZU9
         at8+QY3FIoq5xrMj4cpnWnQ+f8DM0aAxPOt3qkNAJr/5z6QivWpy+HWZT/U804aYa3Oc
         uaav2pE8L/m2ZR83px1u+m5EbphHspztdlVmDACWMnorkdChDcwgpTRDVqT84xWOFuQU
         VJEAE7b0YxxsoSw7qD7Avfx6/8BTgSi9LIp9iujJjbYnsVC/eI5FSI4BkypvUV4Zio+t
         YCtp3p/4GqZWeVeAq5h5Vx3a7sMJOhXcH1zr6M2VALCLd29VNmtMt+gSJwP1VP9vcrpC
         Ossg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yce2yiNewFI2iY/zOa+oQW9hS6ij7XHoRO2uiMEqpAc=;
        b=fVuWZuzEzb4NcOCsAi94bDuYDp5fzwR43i2UDZJFMlw0R75Zo88bI7khapiLZm6wDV
         EJvMCX/KLArW66S6JP3n9Ep6iiM6y01nkH3Vog/JO5cP4hOepVsmyJnm760ZyfVivgQL
         xzvOinnjoWv06vLvH2vpPY1DV3r1zF0VFdMx6RVn4a5I7+DSUwtZsXBgzHm0r5qUvqgM
         XpWN2qiqxduiRDuedt0tjMzpIxBD/ciPo9IdHVOOBvabC69e118ImBWuOyJ4P8PgkL/4
         2zWERj1ntPwp4WLs0LDaEBcV1xq3v9jPzmnfMKQS1nbzYLyTg7tvGqdpmvYLJmsO4qeO
         3a3w==
X-Gm-Message-State: AOAM531QcIQBWVUmkUYO85W2qM87AfvdiJu3syIhNpKPwFB61VtE1JiJ
        LtTfCDK1MyXxWNUFN85uPOSK6nFfn3fluQ==
X-Google-Smtp-Source: ABdhPJxpAd7uGcnRHNvggQC5XPdIIhFQntCLzZWllZAO7S6C3Rdb/go+r17medLMX9XsBOyG36hKmw==
X-Received: by 2002:a17:90b:111:: with SMTP id p17mr5475326pjz.159.1603864112455;
        Tue, 27 Oct 2020 22:48:32 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id z16sm4439446pfq.33.2020.10.27.22.48.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 22:48:31 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:18:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        nks@flawful.org, Georgi Djakov <georgi.djakov@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V2 2/2] cpufreq: dt: Refactor initialization to handle
 probe deferral properly
Message-ID: <20201028054829.42zckdtwvj67tcfl@vireshk-i7>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
 <20201013095613.mbgmjwzojg5wxmau@vireshk-i7>
 <CAMuHMdVAJdHVMtK3Sc4sJiJGAwz1J4dKODBFcNzgstaktyKkOw@mail.gmail.com>
 <20201016050347.ers54itzmxgijzsy@vireshk-i7>
 <CAMuHMdUUzoFxbJts3gVC7i5A5daa_TYzKdrGEHho=3a1eeC_ww@mail.gmail.com>
 <20201016080730.h7u3jmlyjbyhqn3t@vireshk-i7>
 <CAMuHMdV1pnE===53_8r596G=9ktw-UMqD3N=T_F34Yk9aw9wWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1pnE===53_8r596G=9ktw-UMqD3N=T_F34Yk9aw9wWA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27-10-20, 17:29, Geert Uytterhoeven wrote:
> On plain v5.9, with #define DEBUG and a few extra debug prints
> added, I get:
> 
>     cpufreq_dt: cpufreq_init:164: policy->cpu = 0
>     cpufreq_dt: cpufreq_init:165: policy->cpus = 0
>     cpufreq_dt: cpufreq_init:166: policy->related_cpus =
>     cpufreq_dt: cpufreq_init:167: policy->real_cpus =
>     cpu cpu0: dev_pm_opp_of_get_sharing_cpus: Couldn't find opp node.
>     of: dev_pm_opp_of_cpumask_add_table:1049
>     of: dev_pm_opp_of_cpumask_add_table:1054: cpu 0
>     cpu cpu0: dev_pm_opp_of_add_table:954
>     cpu cpu0: dev_pm_opp_of_add_table:956:
> dev_pm_opp_get_opp_table_indexed() returned (ptrval)
>     cpu cpu0: _of_add_opp_table_v1:891
>     cpu cpu0: _of_add_opp_table_v1:893: _find_opp_table() returned (ptrval)
>     cpu cpu0: _of_add_opp_table_v1:909: 6 entries
>     cpu cpu0: dev_pm_opp_get_opp_count:331
>     cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
>     cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 6
>     cpu cpu0: dev_pm_opp_get_opp_count:331
>     cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
>     cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 6
>     cpu cpu0: dev_pm_opp_get_opp_count:331
>     cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
>     cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 6
>     cpu cpu0: Couldn't find proper 'dynamic-power-coefficient' in DT
>     cpu cpu0: Couldn't register Energy Model -22
> 
> This happens quite late in the boot sequence, long after cpu1 has been
> brought online.
> So it finds the v1 opp table for cpu0, which has 6 entries.
> The last two messages should be harmless, right?

Yes.

> So you say cpufreq is not working? How can I verify that?

I said it because your earlier logs showed that we defered probed
again or the count was 0 and we failed. Something like that.

Give output of this to verify if cpufreq is working or not:

grep . /sys/devices/system/cpu/cpufreq/policy*/*

This will be empty if there is no cpufreq.

> Note that it never tries to do anything for cpu1.

Yes, because we set policy->cpus to both CPU0 and CPU1.

> Note that during s2ram, nothing related is printed.
> 
> On v5.10, with similar debug code, things are different. During boot:
> 
>     cpu cpu0: dev_pm_opp_of_get_sharing_cpus: Couldn't find opp node.
>     cpufreq_dt: cpufreq_init:112: policy->cpu = 0
>     cpufreq_dt: cpufreq_init:113: policy->cpus = 0
>     cpufreq_dt: cpufreq_init:114: policy->related_cpus =
>     cpufreq_dt: cpufreq_init:115: policy->real_cpus =
>     of: dev_pm_opp_of_cpumask_add_table:1075
>     of: dev_pm_opp_of_cpumask_add_table:1080: cpu 0
>     cpu cpu0: dev_pm_opp_of_add_table:980
>     cpu cpu0: dev_pm_opp_of_add_table:982:
> dev_pm_opp_get_opp_table_indexed() returned (ptrval)
>     cpu cpu0: _of_add_opp_table_v1:914
>     cpu cpu0: _of_add_opp_table_v1:916: _find_opp_table() returned (ptrval)
>     cpu cpu0: _of_add_opp_table_v1:937: 6 entries
> 
> Good, found the table with 6 entries.

Good.

>     of: dev_pm_opp_of_cpumask_add_table:1080: cpu 1
>     cpu cpu1: dev_pm_opp_of_add_table:980
>     cpu cpu1: dev_pm_opp_of_add_table:982:
> dev_pm_opp_get_opp_table_indexed() returned (ptrval)
>     cpu cpu1: _of_add_opp_table_v1:914
>     cpu cpu1: _of_add_opp_table_v1:916: _find_opp_table() returned (ptrval)
>     cpu cpu1: _of_add_opp_table_v1:937: 6 entries
> 
> Oh, this time it checked cpu1, too (why?), and found 6 entries, good.

Yeah, because of some changes in cpufreq-dt.c, it shouldn't cause any
issues though.

>     cpu cpu0: dev_pm_opp_get_opp_count:331
>     cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
>     cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 0
>     cpu cpu0: OPP table can't be empty
> 
> Wait, _get_opp_count() returns 0?

Does this fix it for you as well ?

https://lore.kernel.org/lkml/2c73ab54717ef358b118ea0cfb727b1427e7730a.1602648719.git.viresh.kumar@linaro.org/

I didn't point you to this earlier as your logs said something else.

This is already there in linux-next now.

>     cpufreq_dt: cpufreq_init:112: policy->cpu = 1
>     cpufreq_dt: cpufreq_init:113: policy->cpus = 1
>     cpufreq_dt: cpufreq_init:114: policy->related_cpus =
>     cpufreq_dt: cpufreq_init:115: policy->real_cpus =
> 
> Oh, this time cpufreq_init() is called for cpu1, too.

Because we failed for CPU0.

> During s2ram, v5.10-rc1, it redoes most of the above, incl. touching the
> PMIC, which it shouldn't due in this phase of system resume:
> 
>     Disabling non-boot CPUs ...
>     Enabling non-boot CPUs ...
>     cpufreq_dt: cpufreq_init:112: policy->cpu = 1
>     cpufreq_dt: cpufreq_init:113: policy->cpus = 1
>     cpufreq_dt: cpufreq_init:114: policy->related_cpus =
>     cpufreq_dt: cpufreq_init:115: policy->real_cpus =
>     of: dev_pm_opp_of_cpumask_add_table:1075
>     of: dev_pm_opp_of_cpumask_add_table:1080: cpu 0
>     cpu cpu0: dev_pm_opp_of_add_table:980
>     cpu cpu0: dev_pm_opp_of_add_table:982:
> dev_pm_opp_get_opp_table_indexed() returned f680980b
>     cpu cpu0: _of_add_opp_table_v1:914
>     cpu cpu0: _of_add_opp_table_v1:916: _find_opp_table() returned a4afd426
>     cpu cpu0: _of_add_opp_table_v1:937: 6 entries
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> 
> The i2c controller is suspended, this could go boom...
> 
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     of: dev_pm_opp_of_cpumask_add_table:1080: cpu 1
>     cpu cpu1: dev_pm_opp_of_add_table:980
>     cpu cpu1: dev_pm_opp_of_add_table:982:
> dev_pm_opp_get_opp_table_indexed() returned f680980b
>     cpu cpu1: _of_add_opp_table_v1:914
>     cpu cpu1: _of_add_opp_table_v1:916: _find_opp_table() returned 9087c76d
>     cpu cpu1: _of_add_opp_table_v1:937: 6 entries
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     cpu cpu0: dev_pm_opp_get_opp_count:331
>     cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned f680980b
>     cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 0
>     cpu cpu0: OPP table can't be empty
>     CPU1 is up

Lets make the normal boot work first and see about this later.

Also for your next version of debug prints, use %px while printing
addresses, that way the kernel doesn't hide them anymore and we can
see which OPP table pointer is getting used at different places. That
also means that you need to print the opp table's address at different
places.

-- 
viresh
