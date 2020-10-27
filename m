Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFCA29BBFB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Oct 2020 17:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750994AbgJ0QaW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Oct 2020 12:30:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35354 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2902188AbgJ0QaK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Oct 2020 12:30:10 -0400
Received: by mail-ot1-f68.google.com with SMTP id n11so1666578ota.2;
        Tue, 27 Oct 2020 09:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CagJgZtTaB8++UeVjBskHyRZJt//T8zpxqMDcFRpWI=;
        b=P+deCNjKD8SOjemOLqpqiMUsPyzVzpfz8HWui1BGOG6Fy/loYXDmVnBzb+LRRoukqL
         qK0NwOuu8KR0Qj8h0aVthQKXhTDBUi/I5xO0VTDSJGz2Eti3+VkEQnJKsg+oPuk5j5jW
         NkWMH0ePt4yTvQHdIIr+OTis2nlRKK84+WKxnhn/3VyvYpVflZazNeHUStiBg5zecvyl
         N86EVONlIdPQ8J57VU+UX3QBM80gyfjmGb4DayZhCNDb7zVG70g1S+CWRMZcauJzx04u
         MCd9GHuorBwNW8bu2UNNOnSPCMkpH9D3m1wB+E5ukKANDb5iBYY8rvg7pATEKJxRq7dC
         UGSA==
X-Gm-Message-State: AOAM531KTHS6ICVqFaMdQzsX4jP2R+CtAxmDPdJl2apoYhhQRQP5cmCb
        AKwq745r/VpWqNno639KiNPVvYFcwZiafjCUaXI=
X-Google-Smtp-Source: ABdhPJwp9Lcl26ylkE+fNbHnE/DumFbax0axP9VE8V8nFuqxz+HXD33AlEUnIBc+qh6lB+wr+uDpS6yyVYdCfZUXOLY=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1941831oti.107.1603816208135;
 Tue, 27 Oct 2020 09:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
 <20201013095613.mbgmjwzojg5wxmau@vireshk-i7> <CAMuHMdVAJdHVMtK3Sc4sJiJGAwz1J4dKODBFcNzgstaktyKkOw@mail.gmail.com>
 <20201016050347.ers54itzmxgijzsy@vireshk-i7> <CAMuHMdUUzoFxbJts3gVC7i5A5daa_TYzKdrGEHho=3a1eeC_ww@mail.gmail.com>
 <20201016080730.h7u3jmlyjbyhqn3t@vireshk-i7>
In-Reply-To: <20201016080730.h7u3jmlyjbyhqn3t@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Oct 2020 17:29:56 +0100
Message-ID: <CAMuHMdV1pnE===53_8r596G=9ktw-UMqD3N=T_F34Yk9aw9wWA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] cpufreq: dt: Refactor initialization to handle
 probe deferral properly
To:     Viresh Kumar <viresh.kumar@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Viresh,

On Fri, Oct 16, 2020 at 10:07 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 16-10-20, 08:44, Geert Uytterhoeven wrote:
> > On Fri, Oct 16, 2020 at 7:03 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > On 14-10-20, 18:40, Geert Uytterhoeven wrote:
> > > > On this platform (r8a7791-koelsch.dts), there is no opp table in DT.
> >
> > I think you missed the clue above:
>
> I read it earlier as well.
>
> > this DTS does not have an opp-table
> > with operating-points-v2, but cpu0 does have the operating-points (v1)
> > property (note the latter is something I missed before).
>
> This is different than having no OPP table in DT.
>
> > > >
> > > >   Before:
> > >
> > > I assume this means before this patchset came in..
> >
> > Indeed.
> >
> > > >     boot:
> > > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
> > > >       cpu cpu0: resources_available:95
> > > >       cpu cpu0: resources_available:102: clk_get() returned z
> > > >       cpu cpu0: resources_available:120:
> > > > dev_pm_opp_of_find_icc_paths() returned 0
> > > >       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
> > > >       cpu cpu0: resources_available:132: regulator_get_optional()
> > > > returned -EPROBE_DEFER
> > > >       cpu cpu0: cpu0 regulator not ready, retry
> > > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> > > > resources_available() returned -517
> > >
> > > we deferred probe once.
> > >
> > > >       ...
> > > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
> > > >       cpu cpu0: resources_available:95
> > > >       cpu cpu0: resources_available:102: clk_get() returned z
> > > >       cpu cpu0: resources_available:120:
> > > > dev_pm_opp_of_find_icc_paths() returned 0
> > > >       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
> > > >       cpu cpu0: resources_available:132: regulator_get_optional()
> > > > returned (ptrval)
> > >
> > > found regulator next time.
> > >
> > > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> > > > resources_available() returned 0
> > > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:375
> > > >       cpufreq_dt: cpufreq_init:162
> > > >       cpu cpu0: cpufreq_init:170: clk_get() returned z
> > > >       cpu cpu0: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> > > >       cpu cpu0: cpufreq_init:198: find_supply_name() returned cpu0
> > > >       <i2c comm>
> > > >       cpu cpu0: cpufreq_init:201: dev_pm_opp_set_regulators() returned (ptrval)
> > > >       <i2c comm>
> > > >       cpu cpu0: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> > > >       cpu cpu0: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> > > >       cpu cpu0: OPP table is not ready, deferring probe
> > >
> > > This failed, as we couldn't have deferred probe from cpufreq_init.
> > > Which means that cpufreq didn't work here.
> >
> > No opp-table in DT.
>
> V1 is also an OPP table.

OK.

> > Shouldn't it use operating-points v1 instead?
>
> Both v1 and v2 are considered as OPP tables. When we say that the
> opp-count is 0, it means that it failed to find any of them.

Interestingly, first the v1 table is found, later opp-count is 0 (see below).

> > > >       cpufreq_dt: cpufreq_init:162
> > > >       cpu cpu1: cpufreq_init:170: clk_get() returned z
> > > >       cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> > > >       cpu cpu1: no regulator for cpu1
> > > >       cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
> > > >       cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> > > >       cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> > > >       cpu cpu1: OPP table is not ready, deferring probe
> > >
> > > Same for CPU1.
> >
> > Note that only CPU0 has operating-points v1.
>
> Both should have it ideally, though it works if CPU0 gets probed
> first. But if CPU0 is hotplugged out and we try to probe CPU1, then it
> will fail.
>
> The fact that cpufreq core tried to probe CPU1 means that it failed
> for CPU0. And this is before the patchset in question came in.
>
> I don't think cpufreq was working earlier for your platform, please
> check why.

[...]

> I think someone needs to see why it wasn't working earlier and then we
> can see if we have pending issues.

On plain v5.9, with #define DEBUG and a few extra debug prints
added, I get:

    cpufreq_dt: cpufreq_init:164: policy->cpu = 0
    cpufreq_dt: cpufreq_init:165: policy->cpus = 0
    cpufreq_dt: cpufreq_init:166: policy->related_cpus =
    cpufreq_dt: cpufreq_init:167: policy->real_cpus =
    cpu cpu0: dev_pm_opp_of_get_sharing_cpus: Couldn't find opp node.
    of: dev_pm_opp_of_cpumask_add_table:1049
    of: dev_pm_opp_of_cpumask_add_table:1054: cpu 0
    cpu cpu0: dev_pm_opp_of_add_table:954
    cpu cpu0: dev_pm_opp_of_add_table:956:
dev_pm_opp_get_opp_table_indexed() returned (ptrval)
    cpu cpu0: _of_add_opp_table_v1:891
    cpu cpu0: _of_add_opp_table_v1:893: _find_opp_table() returned (ptrval)
    cpu cpu0: _of_add_opp_table_v1:909: 6 entries
    cpu cpu0: dev_pm_opp_get_opp_count:331
    cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
    cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 6
    cpu cpu0: dev_pm_opp_get_opp_count:331
    cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
    cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 6
    cpu cpu0: dev_pm_opp_get_opp_count:331
    cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
    cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 6
    cpu cpu0: Couldn't find proper 'dynamic-power-coefficient' in DT
    cpu cpu0: Couldn't register Energy Model -22

This happens quite late in the boot sequence, long after cpu1 has been
brought online.
So it finds the v1 opp table for cpu0, which has 6 entries.
The last two messages should be harmless, right?
So you say cpufreq is not working? How can I verify that?

Note that it never tries to do anything for cpu1.
Note that during s2ram, nothing related is printed.

On v5.10, with similar debug code, things are different. During boot:

    cpu cpu0: dev_pm_opp_of_get_sharing_cpus: Couldn't find opp node.
    cpufreq_dt: cpufreq_init:112: policy->cpu = 0
    cpufreq_dt: cpufreq_init:113: policy->cpus = 0
    cpufreq_dt: cpufreq_init:114: policy->related_cpus =
    cpufreq_dt: cpufreq_init:115: policy->real_cpus =
    of: dev_pm_opp_of_cpumask_add_table:1075
    of: dev_pm_opp_of_cpumask_add_table:1080: cpu 0
    cpu cpu0: dev_pm_opp_of_add_table:980
    cpu cpu0: dev_pm_opp_of_add_table:982:
dev_pm_opp_get_opp_table_indexed() returned (ptrval)
    cpu cpu0: _of_add_opp_table_v1:914
    cpu cpu0: _of_add_opp_table_v1:916: _find_opp_table() returned (ptrval)
    cpu cpu0: _of_add_opp_table_v1:937: 6 entries

Good, found the table with 6 entries.

    of: dev_pm_opp_of_cpumask_add_table:1080: cpu 1
    cpu cpu1: dev_pm_opp_of_add_table:980
    cpu cpu1: dev_pm_opp_of_add_table:982:
dev_pm_opp_get_opp_table_indexed() returned (ptrval)
    cpu cpu1: _of_add_opp_table_v1:914
    cpu cpu1: _of_add_opp_table_v1:916: _find_opp_table() returned (ptrval)
    cpu cpu1: _of_add_opp_table_v1:937: 6 entries

Oh, this time it checked cpu1, too (why?), and found 6 entries, good.

    cpu cpu0: dev_pm_opp_get_opp_count:331
    cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
    cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 0
    cpu cpu0: OPP table can't be empty

Wait, _get_opp_count() returns 0?

    cpufreq_dt: cpufreq_init:112: policy->cpu = 1
    cpufreq_dt: cpufreq_init:113: policy->cpus = 1
    cpufreq_dt: cpufreq_init:114: policy->related_cpus =
    cpufreq_dt: cpufreq_init:115: policy->real_cpus =

Oh, this time cpufreq_init() is called for cpu1, too.

    of: dev_pm_opp_of_cpumask_add_table:1075
    of: dev_pm_opp_of_cpumask_add_table:1080: cpu 0
    cpu cpu0: dev_pm_opp_of_add_table:980
    cpu cpu0: dev_pm_opp_of_add_table:982:
dev_pm_opp_get_opp_table_indexed() returned (ptrval)
    cpu cpu0: _of_add_opp_table_v1:914
    cpu cpu0: _of_add_opp_table_v1:916: _find_opp_table() returned (ptrval)
    cpu cpu0: _of_add_opp_table_v1:937: 6 entries

Checking cpu0 again (why?), 6 entries.

    of: dev_pm_opp_of_cpumask_add_table:1080: cpu 1
    cpu cpu1: dev_pm_opp_of_add_table:980
    cpu cpu1: dev_pm_opp_of_add_table:982:
dev_pm_opp_get_opp_table_indexed() returned (ptrval)
    cpu cpu1: _of_add_opp_table_v1:914
    cpu cpu1: _of_add_opp_table_v1:916: _find_opp_table() returned (ptrval)
    cpu cpu1: _of_add_opp_table_v1:937: 6 entries

Checking cpu1 again, 6 entries.

    cpu cpu0: dev_pm_opp_get_opp_count:331
    cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned (ptrval)
    cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 0
    cpu cpu0: OPP table can't be empty

Huh, cpu0 again, not cpu1? And _get_opp_count() returns 0?

During s2ram, v5.10-rc1, it redoes most of the above, incl. touching the
PMIC, which it shouldn't due in this phase of system resume:

    Disabling non-boot CPUs ...
    Enabling non-boot CPUs ...
    cpufreq_dt: cpufreq_init:112: policy->cpu = 1
    cpufreq_dt: cpufreq_init:113: policy->cpus = 1
    cpufreq_dt: cpufreq_init:114: policy->related_cpus =
    cpufreq_dt: cpufreq_init:115: policy->real_cpus =
    of: dev_pm_opp_of_cpumask_add_table:1075
    of: dev_pm_opp_of_cpumask_add_table:1080: cpu 0
    cpu cpu0: dev_pm_opp_of_add_table:980
    cpu cpu0: dev_pm_opp_of_add_table:982:
dev_pm_opp_get_opp_table_indexed() returned f680980b
    cpu cpu0: _of_add_opp_table_v1:914
    cpu cpu0: _of_add_opp_table_v1:916: _find_opp_table() returned a4afd426
    cpu cpu0: _of_add_opp_table_v1:937: 6 entries
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out

The i2c controller is suspended, this could go boom...

    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    of: dev_pm_opp_of_cpumask_add_table:1080: cpu 1
    cpu cpu1: dev_pm_opp_of_add_table:980
    cpu cpu1: dev_pm_opp_of_add_table:982:
dev_pm_opp_get_opp_table_indexed() returned f680980b
    cpu cpu1: _of_add_opp_table_v1:914
    cpu cpu1: _of_add_opp_table_v1:916: _find_opp_table() returned 9087c76d
    cpu cpu1: _of_add_opp_table_v1:937: 6 entries
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    cpu cpu0: dev_pm_opp_get_opp_count:331
    cpu cpu0: dev_pm_opp_get_opp_count:333: _find_opp_table() returned f680980b
    cpu cpu0: dev_pm_opp_get_opp_count:342: _get_opp_count() returned 0
    cpu cpu0: OPP table can't be empty
    CPU1 is up

Thanks for your comments!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
