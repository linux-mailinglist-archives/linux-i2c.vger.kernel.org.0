Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D5128E49C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 18:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbgJNQkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 12:40:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41428 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgJNQkP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 12:40:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id n15so212659otl.8;
        Wed, 14 Oct 2020 09:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=awjbHZmaw2mEvGp1mgXDc8wUbmV5fwPzQ3ps5KMPm2k=;
        b=dIQYUIwoQZuAy5/qCFPM9JK+W2hP2Uxv/jC85VeJM39dk4Bx8Y2hiPwSPQtVYqxfzc
         n+TDMIXuMTiWq0NF7o9FgpLf5zJMtUz4Dn7zOTY/Cmmrwxjxc4u8ckpIICmNNSyuGjEr
         wOvWGMYu9MHks7JzrbNP5+VFi73sGSRepxtPG5K1yXeJMS7V0d9gpcgCz8/swibN66z4
         JBaUOWZhCmIhADaX1/wN/zC7xZnhfEex8kwAfHd0IOAC+vC8ZGDf2OqJQGmIxrUndGC0
         d6+vn3+iD665jWd+kqi6F7mCAGOlbjIqs84qGjSmnTAt9EzPgmbU2EriC7FhqDGiEw0u
         b7Og==
X-Gm-Message-State: AOAM5321G6h2lHuTBXVgf2NSRXp9oZ2MSaWHGmaXEF/8GJX93lHsHSV3
        oAoCqR7L4LTvQWBpYo9cWoOwmZbjUc1SpwoiJw+eZx3hovQ=
X-Google-Smtp-Source: ABdhPJyYK2BVffULinxkJTUaiKwHo3meDTY743HeDhNG3lORiwXgdZJDNH08E2bm6s/8cQMeFhZcrppTESI6pU154/Y=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr4108019otc.145.1602693612028;
 Wed, 14 Oct 2020 09:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com> <20201013095613.mbgmjwzojg5wxmau@vireshk-i7>
In-Reply-To: <20201013095613.mbgmjwzojg5wxmau@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Oct 2020 18:40:00 +0200
Message-ID: <CAMuHMdVAJdHVMtK3Sc4sJiJGAwz1J4dKODBFcNzgstaktyKkOw@mail.gmail.com>
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

On Tue, Oct 13, 2020 at 11:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 13-10-20, 11:47, Geert Uytterhoeven wrote:
> > Thanks for your patch, which is now commit dc279ac6e5b4e06e ("cpufreq:
> > dt: Refactor initialization to handle probe deferral properly") in
> > pm/linux-next, and to which I bisected a regression.
> > Reverting this commit fixes the issue.
>
> Strange. I had a look again and I failed to understand why it would
> happen this way.
>
> > On r8a7791/koelsch, during resume from s2ram:
> >
> >      PM: suspend entry (deep)
> >      Filesystems sync: 0.000 seconds
> >      Freezing user space processes ... (elapsed 0.003 seconds) done.
> >      OOM killer disabled.
> >      Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
> >      Disabling non-boot CPUs ...
> >      Enabling non-boot CPUs ...
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
> >     +cpu cpu0: OPP table can't be empty
> >      CPU1 is up
> >      rcar-pcie fe000000.pcie: PCIe x1: link up
> >
> > The cpufreq code tries to talk to the PMIC, while the I2C controller
> > that hosts the PMIC is suspended, and thus any communication attempt
> > times out.  __i2c_check_suspended() fails to notice that, as the
> > i2c_shmobile_i2c driver doesn't have a suspend callback calling
> > i2c_mark_adapter_suspended() yet.  After fixing that (will send a patch
> > soon), the I2C core rightfully complains with:
> >
> >     WARNING: CPU: 1 PID: 13 at drivers/i2c/i2c-core.h:54
> > __i2c_transfer+0x4a4/0x4e4
> >     i2c i2c-6: Transfer while suspended
> >     CPU: 1 PID: 13 Comm: cpuhp/1 Not tainted
> > 5.9.0-shmobile-09581-g05a3e5886c7615b1-dirty #718
> >     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> >     [<c010dcec>] (unwind_backtrace) from [<c0109b18>] (show_stack+0x10/0x14)
> >     [<c0109b18>] (show_stack) from [<c075e928>] (dump_stack+0x8c/0xac)
> >     [<c075e928>] (dump_stack) from [<c011c23c>] (__warn+0xd0/0xe8)
> >     [<c011c23c>] (__warn) from [<c011c2c4>] (warn_slowpath_fmt+0x70/0x9c)
> >     [<c011c2c4>] (warn_slowpath_fmt) from [<c0548be8>]
> > (__i2c_transfer+0x4a4/0x4e4)
> >     [<c0548be8>] (__i2c_transfer) from [<c0548cd8>] (i2c_transfer+0xb0/0xf8)
> >     [<c0548cd8>] (i2c_transfer) from [<c046f884>] (regmap_i2c_read+0x54/0x88)
> >     [<c046f884>] (regmap_i2c_read) from [<c046b69c>]
> > (_regmap_raw_read+0x118/0x1f0)
> >     [<c046b69c>] (_regmap_raw_read) from [<c046b7b8>]
> > (_regmap_bus_read+0x44/0x68)
> >     [<c046b7b8>] (_regmap_bus_read) from [<c04698a0>] (_regmap_read+0x84/0x110)
> >     [<c04698a0>] (_regmap_read) from [<c046c10c>] (regmap_read+0x40/0x58)
> >     [<c046c10c>] (regmap_read) from [<c03cf0a8>]
> > (regulator_get_voltage_sel_regmap+0x28/0x74)
> >     [<c03cf0a8>] (regulator_get_voltage_sel_regmap) from [<c03cb29c>]
> > (regulator_get_voltage_rdev+0xa4/0x14c)
> >     [<c03cb29c>] (regulator_get_voltage_rdev) from [<c03cc658>]
> > (regulator_get_voltage+0x2c/0x60)
> >     [<c03cc658>] (regulator_get_voltage) from [<c03cd994>]
> > (regulator_is_supported_voltage+0x30/0xd8)
> >     [<c03cd994>] (regulator_is_supported_voltage) from [<c05a32b4>]
> > (_opp_add+0x164/0x1b8)
> >     [<c05a32b4>] (_opp_add) from [<c05a3388>] (_opp_add_v1+0x80/0xb8)
> >     [<c05a3388>] (_opp_add_v1) from [<c05a5220>]
> > (dev_pm_opp_of_add_table+0x130/0x168)
> >     [<c05a5220>] (dev_pm_opp_of_add_table) from [<c05a5330>]
> > (dev_pm_opp_of_cpumask_add_table+0x60/0xac)
> >     [<c05a5330>] (dev_pm_opp_of_cpumask_add_table) from [<c05ab88c>]
> > (cpufreq_init+0x94/0x1c4)
> >     [<c05ab88c>] (cpufreq_init) from [<c05a8190>] (cpufreq_online+0x148/0x7ac)
> >     [<c05a8190>] (cpufreq_online) from [<c05a87fc>]
> > (cpuhp_cpufreq_online+0x8/0x10)
> >     [<c05a87fc>] (cpuhp_cpufreq_online) from [<c011d088>]
> > (cpuhp_invoke_callback+0xf8/0x2e4)
> >     [<c011d088>] (cpuhp_invoke_callback) from [<c011d418>]
> > (cpuhp_thread_fun+0xac/0x244)
> >     [<c011d418>] (cpuhp_thread_fun) from [<c013c090>]
> > (smpboot_thread_fn+0x19c/0x1a8)
> >     [<c013c090>] (smpboot_thread_fn) from [<c0138408>] (kthread+0x104/0x110)
> >     [<c0138408>] (kthread) from [<c0100148>] (ret_from_fork+0x14/0x2c)
>
> So there is a dependency chain here. cpufreq->regulator->i2c,
> specially with the patch you pointed out, we handle defer-probing in a
> better way and so I would expect i2c driver to get in first and
> cpufreq should get registered later only. And I would have expected
> the same during suspend/resume.
>
> Can you see why this happens ?

On this platform (r8a7791-koelsch.dts), there is no opp table in DT.

  Before:
    boot:
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
      cpu cpu0: resources_available:95
      cpu cpu0: resources_available:102: clk_get() returned z
      cpu cpu0: resources_available:120:
dev_pm_opp_of_find_icc_paths() returned 0
      cpu cpu0: resources_available:125: find_supply_name() returned cpu0
      cpu cpu0: resources_available:132: regulator_get_optional()
returned -EPROBE_DEFER
      cpu cpu0: cpu0 regulator not ready, retry
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
resources_available() returned -517
      ...
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
      cpu cpu0: resources_available:95
      cpu cpu0: resources_available:102: clk_get() returned z
      cpu cpu0: resources_available:120:
dev_pm_opp_of_find_icc_paths() returned 0
      cpu cpu0: resources_available:125: find_supply_name() returned cpu0
      cpu cpu0: resources_available:132: regulator_get_optional()
returned (ptrval)
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
resources_available() returned 0
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:375
      cpufreq_dt: cpufreq_init:162
      cpu cpu0: cpufreq_init:170: clk_get() returned z
      cpu cpu0: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
      cpu cpu0: cpufreq_init:198: find_supply_name() returned cpu0
      <i2c comm>
      cpu cpu0: cpufreq_init:201: dev_pm_opp_set_regulators() returned (ptrval)
      <i2c comm>
      cpu cpu0: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
      cpu cpu0: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
      cpu cpu0: OPP table is not ready, deferring probe
      cpufreq_dt: cpufreq_init:162
      cpu cpu1: cpufreq_init:170: clk_get() returned z
      cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
      cpu cpu1: no regulator for cpu1
      cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
      cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
      cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
      cpu cpu1: OPP table is not ready, deferring probe

    s2ram:
      cpufreq_dt: cpufreq_init:162
      cpu cpu1: cpufreq_init:170: clk_get() returned z
      cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
      cpu cpu1: no regulator for cpu1
      cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
      cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
      cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
      cpu cpu1: OPP table is not ready, deferring probe
      CPU1 is up

  After:
    boot:
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
      cpufreq_dt: dt_cpufreq_early_init:251
      cpu cpu0: dt_cpufreq_early_init:256
      cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
returned (ptrval)
      cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
      cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
returned -EPROBE_DEFER
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
dt_cpufreq_early_init() returned -517
      ...
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
      cpufreq_dt: dt_cpufreq_early_init:251
      cpu cpu0: dt_cpufreq_early_init:256
      cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
returned (ptrval)
      cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
      cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
returned (ptrval)
      cpu cpu0: dt_cpufreq_early_init:301:
dev_pm_opp_of_get_sharing_cpus() returned -2
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
dt_cpufreq_early_init() returned 0
      cpufreq_dt: dt_cpufreq_early_init:251
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
dt_cpufreq_early_init() returned 0
      cpufreq-dt cpufreq-dt: dt_cpufreq_probe:365
      cpufreq_dt: cpufreq_init:114
      cpu cpu0: cpufreq_init:124: clk_get() returned z
      cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
      cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
      cpu cpu0: OPP table can't be empty
      cpufreq_dt: cpufreq_init:114
      cpu cpu0: cpufreq_init:124: clk_get() returned z
      <i2c comm>
      cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
      cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0

    s2ram:

      cpufreq_dt: cpufreq_init:114
      cpu cpu0: cpufreq_init:124: clk_get() returned z
      WARNING: CPU: 1 PID: 14 at drivers/i2c/i2c-core.h:54
__i2c_transfer+0x2d8/0x310
      i2c i2c-6: Transfer while suspended
      cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
      cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
      cpu cpu0: OPP table can't be empty
      CPU1 is up

I hope this helps.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
