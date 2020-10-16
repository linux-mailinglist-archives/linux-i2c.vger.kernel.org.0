Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D620E28FE70
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 08:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394358AbgJPGoT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 02:44:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41251 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394351AbgJPGoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 02:44:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id q136so1284109oic.8;
        Thu, 15 Oct 2020 23:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RkFduFMrGwyaSeoS6TqSKCjkY3T0GJL3SQt6o1KyRoE=;
        b=dXHEb+q+EvG7W0fU05kZTbUgqPHKeZSxX4x8QE3wQGF/2gPp2mud2fRz4Fan1h2AkK
         gWlZo+Bx6v8AGoN2sm0S5rLSvmx+vUraJp+bADHA/9UlJrfCRG3l8epchiHU5oAnav37
         O7Ye17H7hh7fl7V726nYQIz3hFkkqP4d29RyaVl1IsXlO+/BtdCsI8OAcV5VxK4e9zTK
         9yUSOFn+bT7Y0BUwhJTkLw7nGdhcOmC93jYd8L27dXlsZXdFlE9L7Pv2f8g5U2xrvIoi
         gD0u1uvgWE2bJWk4n6F4C50vEik5pghGpFDWB9m6qSi5x98Uy372R8JQYTLllHH6ZcGa
         623w==
X-Gm-Message-State: AOAM530bksy1CkrYbk0XBaFwXhSAeSCajdD+FgMPOoLBtIMpckJDwFkv
        /lHrjkPL/WzqZ6u6Nak95/ZRZZ9Bzg/ySDvH2vU=
X-Google-Smtp-Source: ABdhPJxrCQuMJsP6AUBMeH7WwGTe4EQg2hvyPohuV6TMhb/s79sy1WnwFsYbiJZjZQAInFKiaTIXNJICdYRa+W2cKYg=
X-Received: by 2002:aca:f203:: with SMTP id q3mr1406344oih.148.1602830657213;
 Thu, 15 Oct 2020 23:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
 <20201013095613.mbgmjwzojg5wxmau@vireshk-i7> <CAMuHMdVAJdHVMtK3Sc4sJiJGAwz1J4dKODBFcNzgstaktyKkOw@mail.gmail.com>
 <20201016050347.ers54itzmxgijzsy@vireshk-i7>
In-Reply-To: <20201016050347.ers54itzmxgijzsy@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 08:44:05 +0200
Message-ID: <CAMuHMdUUzoFxbJts3gVC7i5A5daa_TYzKdrGEHho=3a1eeC_ww@mail.gmail.com>
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

On Fri, Oct 16, 2020 at 7:03 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 14-10-20, 18:40, Geert Uytterhoeven wrote:
> > On this platform (r8a7791-koelsch.dts), there is no opp table in DT.

I think you missed the clue above: this DTS does not have an opp-table
with operating-points-v2, but cpu0 does have the operating-points (v1)
property (note the latter is something I missed before).

> >
> >   Before:
>
> I assume this means before this patchset came in..

Indeed.

> >     boot:
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
> >       cpu cpu0: resources_available:95
> >       cpu cpu0: resources_available:102: clk_get() returned z
> >       cpu cpu0: resources_available:120:
> > dev_pm_opp_of_find_icc_paths() returned 0
> >       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
> >       cpu cpu0: resources_available:132: regulator_get_optional()
> > returned -EPROBE_DEFER
> >       cpu cpu0: cpu0 regulator not ready, retry
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> > resources_available() returned -517
>
> we deferred probe once.
>
> >       ...
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
> >       cpu cpu0: resources_available:95
> >       cpu cpu0: resources_available:102: clk_get() returned z
> >       cpu cpu0: resources_available:120:
> > dev_pm_opp_of_find_icc_paths() returned 0
> >       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
> >       cpu cpu0: resources_available:132: regulator_get_optional()
> > returned (ptrval)
>
> found regulator next time.
>
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> > resources_available() returned 0
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:375
> >       cpufreq_dt: cpufreq_init:162
> >       cpu cpu0: cpufreq_init:170: clk_get() returned z
> >       cpu cpu0: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> >       cpu cpu0: cpufreq_init:198: find_supply_name() returned cpu0
> >       <i2c comm>
> >       cpu cpu0: cpufreq_init:201: dev_pm_opp_set_regulators() returned (ptrval)
> >       <i2c comm>
> >       cpu cpu0: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> >       cpu cpu0: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> >       cpu cpu0: OPP table is not ready, deferring probe
>
> This failed, as we couldn't have deferred probe from cpufreq_init.
> Which means that cpufreq didn't work here.

No opp-table in DT.
Shouldn't it use operating-points v1 instead?

> >       cpufreq_dt: cpufreq_init:162
> >       cpu cpu1: cpufreq_init:170: clk_get() returned z
> >       cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> >       cpu cpu1: no regulator for cpu1
> >       cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
> >       cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> >       cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> >       cpu cpu1: OPP table is not ready, deferring probe
>
> Same for CPU1.

Note that only CPU0 has operating-points v1.

>
> >
> >     s2ram:
> >       cpufreq_dt: cpufreq_init:162
> >       cpu cpu1: cpufreq_init:170: clk_get() returned z
> >       cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> >       cpu cpu1: no regulator for cpu1
> >       cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
> >       cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> >       cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> >       cpu cpu1: OPP table is not ready, deferring probe
>
> And same here.
>
> >       CPU1 is up
> >
> >   After:
> >     boot:
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
> >       cpufreq_dt: dt_cpufreq_early_init:251
> >       cpu cpu0: dt_cpufreq_early_init:256
> >       cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
> > returned (ptrval)
> >       cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
> >       cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
> > returned -EPROBE_DEFER
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> > dt_cpufreq_early_init() returned -517
> >       ...
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
> >       cpufreq_dt: dt_cpufreq_early_init:251
> >       cpu cpu0: dt_cpufreq_early_init:256
> >       cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
> > returned (ptrval)
> >       cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
> >       cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
> > returned (ptrval)
> >       cpu cpu0: dt_cpufreq_early_init:301:
> > dev_pm_opp_of_get_sharing_cpus() returned -2
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> > dt_cpufreq_early_init() returned 0
> >       cpufreq_dt: dt_cpufreq_early_init:251
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> > dt_cpufreq_early_init() returned 0
> >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:365
> >       cpufreq_dt: cpufreq_init:114
> >       cpu cpu0: cpufreq_init:124: clk_get() returned z
> >       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
> >       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
> >       cpu cpu0: OPP table can't be empty
>
> Same issue here.
>
> >       cpufreq_dt: cpufreq_init:114
> >       cpu cpu0: cpufreq_init:124: clk_get() returned z
> >       <i2c comm>
> >       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
> >       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
> >
> >     s2ram:
> >
> >       cpufreq_dt: cpufreq_init:114
> >       cpu cpu0: cpufreq_init:124: clk_get() returned z
> >       WARNING: CPU: 1 PID: 14 at drivers/i2c/i2c-core.h:54
> > __i2c_transfer+0x2d8/0x310
> >       i2c i2c-6: Transfer while suspended
> >       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
> >       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
> >       cpu cpu0: OPP table can't be empty
> >       CPU1 is up
> >
> > I hope this helps.
>
> Unfortunately it raised more questions than what it answered :(

Before, it bailed out before talking to the regulator during s2ram,
After, it talks to the regulator before bailing out, triggering the WARN().

1. Why is it bailing out without an opp-table, as operating-points (v1)
   is present?
2. Even in the presence of an opp-table, the code would talk to the
   PMIC while the I2C controller is suspended.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
