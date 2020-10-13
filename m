Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D359C28CB2D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 11:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404082AbgJMJri (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 05:47:38 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45914 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbgJMJri (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Oct 2020 05:47:38 -0400
Received: by mail-oi1-f195.google.com with SMTP id j7so4276541oie.12;
        Tue, 13 Oct 2020 02:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=66uxKBaPY4Ovk1ktUOH3jIWixK/5hRqlez704bXhJTo=;
        b=gWGapRkLGR6bqyc2vCXxbhYwE209Hs8DI6fgs4gIhU9S5KM+522qE2cCd+PrzMybvO
         f3mmyBzakj6HKspZMwLMLQJPPwr978Q/2enYlZp4fkqEMao+P29wxILUld732Qgocc8B
         GHKhZwee8JwnZW7jZuzvZ9Osv+f1Z5ErMlfzfIHarxYdkbpMXVhJiNZkyPxVAs5vZsty
         /1UCjWMAUTaqmXbI+tzuAVqZjjxuWenlpjqlomJUZzWLiYdaQriqhTgxj7QBVvx8bxGX
         YmtbKp9BZsPTLhxMyWX7321VFPkthaP97/Qfsewvx09F63AWGHFIM/hllW3IsOHygIbB
         4UDA==
X-Gm-Message-State: AOAM530OvqcZ0R5HNUANCpTX/aYeiOQR6YWm/4oI38XRfdovVnp7mwah
        AtumV+D6cCIphkQGqex510tPDF3gBJ81jNURL1g=
X-Google-Smtp-Source: ABdhPJwLN64T/gaMyS/i1LmR6BIkbfw+eTtQ5cF87nW2VWME3lCQ/eIpJO7UTvEJTaK46HDjetiRlRzz1vnmwuQ0rpY=
X-Received: by 2002:aca:4441:: with SMTP id r62mr12567647oia.153.1602582456648;
 Tue, 13 Oct 2020 02:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
In-Reply-To: <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Oct 2020 11:47:25 +0200
Message-ID: <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] cpufreq: dt: Refactor initialization to handle
 probe deferral properly
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
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

Hi Viresh, Stephan,

On Mon, Aug 24, 2020 at 11:12 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
>
> cpufreq-dt is currently unable to handle -EPROBE_DEFER properly
> because the error code is not propagated for the cpufreq_driver->init()
> callback. Instead, it attempts to avoid the situation by temporarily
> requesting all resources within resources_available() and releasing them
> again immediately after. This has several disadvantages:
>
>   - Whenever we add something like interconnect handling to the OPP core
>     we need to patch cpufreq-dt to request these resources early.
>
>   - resources_available() is only run for CPU0, but other clusters may
>     eventually depend on other resources that are not available yet.
>     (See FIXME comment removed by this commit...)
>
>   - All resources need to be looked up several times.
>
> Now that the OPP core can propagate -EPROBE_DEFER during initialization,
> it would be nice to avoid all that trouble and just propagate its error
> code when necessary.
>
> This commit refactors the cpufreq-dt driver to initialize private_data
> before registering the cpufreq driver. We do this by iterating over
> all possible CPUs and ensure that all resources are initialized:
>
>   1. dev_pm_opp_get_opp_table() ensures the OPP table is allocated
>      and initialized with clock and interconnects.
>
>   2. dev_pm_opp_set_regulators() requests the regulators and assigns
>      them to the OPP table.
>
>   3. We call dev_pm_opp_of_get_sharing_cpus() early so that we only
>      initialize the OPP table once for each shared policy.
>
> With these changes, we actually end up saving a few lines of code,
> the resources are no longer looked up multiple times and everything
> should be much more robust.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [ Viresh: Use list_head structure for maintaining the list and minor
>           changes ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks for your patch, which is now commit dc279ac6e5b4e06e ("cpufreq:
dt: Refactor initialization to handle probe deferral properly") in
pm/linux-next, and to which I bisected a regression.
Reverting this commit fixes the issue.

On r8a7791/koelsch, during resume from s2ram:

     PM: suspend entry (deep)
     Filesystems sync: 0.000 seconds
     Freezing user space processes ... (elapsed 0.003 seconds) done.
     OOM killer disabled.
     Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
     Disabling non-boot CPUs ...
     Enabling non-boot CPUs ...
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
    +cpu cpu0: OPP table can't be empty
     CPU1 is up
     rcar-pcie fe000000.pcie: PCIe x1: link up

The cpufreq code tries to talk to the PMIC, while the I2C controller
that hosts the PMIC is suspended, and thus any communication attempt
times out.  __i2c_check_suspended() fails to notice that, as the
i2c_shmobile_i2c driver doesn't have a suspend callback calling
i2c_mark_adapter_suspended() yet.  After fixing that (will send a patch
soon), the I2C core rightfully complains with:

    WARNING: CPU: 1 PID: 13 at drivers/i2c/i2c-core.h:54
__i2c_transfer+0x4a4/0x4e4
    i2c i2c-6: Transfer while suspended
    CPU: 1 PID: 13 Comm: cpuhp/1 Not tainted
5.9.0-shmobile-09581-g05a3e5886c7615b1-dirty #718
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    [<c010dcec>] (unwind_backtrace) from [<c0109b18>] (show_stack+0x10/0x14)
    [<c0109b18>] (show_stack) from [<c075e928>] (dump_stack+0x8c/0xac)
    [<c075e928>] (dump_stack) from [<c011c23c>] (__warn+0xd0/0xe8)
    [<c011c23c>] (__warn) from [<c011c2c4>] (warn_slowpath_fmt+0x70/0x9c)
    [<c011c2c4>] (warn_slowpath_fmt) from [<c0548be8>]
(__i2c_transfer+0x4a4/0x4e4)
    [<c0548be8>] (__i2c_transfer) from [<c0548cd8>] (i2c_transfer+0xb0/0xf8)
    [<c0548cd8>] (i2c_transfer) from [<c046f884>] (regmap_i2c_read+0x54/0x88)
    [<c046f884>] (regmap_i2c_read) from [<c046b69c>]
(_regmap_raw_read+0x118/0x1f0)
    [<c046b69c>] (_regmap_raw_read) from [<c046b7b8>]
(_regmap_bus_read+0x44/0x68)
    [<c046b7b8>] (_regmap_bus_read) from [<c04698a0>] (_regmap_read+0x84/0x110)
    [<c04698a0>] (_regmap_read) from [<c046c10c>] (regmap_read+0x40/0x58)
    [<c046c10c>] (regmap_read) from [<c03cf0a8>]
(regulator_get_voltage_sel_regmap+0x28/0x74)
    [<c03cf0a8>] (regulator_get_voltage_sel_regmap) from [<c03cb29c>]
(regulator_get_voltage_rdev+0xa4/0x14c)
    [<c03cb29c>] (regulator_get_voltage_rdev) from [<c03cc658>]
(regulator_get_voltage+0x2c/0x60)
    [<c03cc658>] (regulator_get_voltage) from [<c03cd994>]
(regulator_is_supported_voltage+0x30/0xd8)
    [<c03cd994>] (regulator_is_supported_voltage) from [<c05a32b4>]
(_opp_add+0x164/0x1b8)
    [<c05a32b4>] (_opp_add) from [<c05a3388>] (_opp_add_v1+0x80/0xb8)
    [<c05a3388>] (_opp_add_v1) from [<c05a5220>]
(dev_pm_opp_of_add_table+0x130/0x168)
    [<c05a5220>] (dev_pm_opp_of_add_table) from [<c05a5330>]
(dev_pm_opp_of_cpumask_add_table+0x60/0xac)
    [<c05a5330>] (dev_pm_opp_of_cpumask_add_table) from [<c05ab88c>]
(cpufreq_init+0x94/0x1c4)
    [<c05ab88c>] (cpufreq_init) from [<c05a8190>] (cpufreq_online+0x148/0x7ac)
    [<c05a8190>] (cpufreq_online) from [<c05a87fc>]
(cpuhp_cpufreq_online+0x8/0x10)
    [<c05a87fc>] (cpuhp_cpufreq_online) from [<c011d088>]
(cpuhp_invoke_callback+0xf8/0x2e4)
    [<c011d088>] (cpuhp_invoke_callback) from [<c011d418>]
(cpuhp_thread_fun+0xac/0x244)
    [<c011d418>] (cpuhp_thread_fun) from [<c013c090>]
(smpboot_thread_fn+0x19c/0x1a8)
    [<c013c090>] (smpboot_thread_fn) from [<c0138408>] (kthread+0x104/0x110)
    [<c0138408>] (kthread) from [<c0100148>] (ret_from_fork+0x14/0x2c)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
