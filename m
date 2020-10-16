Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95C128FFBC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 10:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405042AbgJPIHg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 04:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404996AbgJPIHg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 04:07:36 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBAFC0613D3
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 01:07:35 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p11so848541pld.5
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DlwW+fcfTWBNvcnVu7Sv80xFknbWTFutzwDIk9gaJjE=;
        b=LUk9zq96kNpGkHO/ADwxoe55gSIsO56LL+guLwbM2CXIRklwg/6JMCduPgun4K2lL4
         SQO0QTieKgx69/9XRT8N/YF46aidklbIyD5rkzZ7NZBLUl8VFw1EzhrZtUtggf0Iurou
         Y0vWoVIpb2O4YfNX8uFxS1Z09YQHcvqKFXQOo0L/NXecKisBafRsY8v+RJ3GlhFz0gNs
         S6xEPf+HQBte/gEkPQl/W77cYzwIfYnx/dUKEG19m+lLJc2yA0TdSlbDmpI2Hjbu2lmj
         +rBrYweFXEhvy2qE8pdq/pKWMMwlaSrUfTiYE/d000SDJb2/o0UQpCV+GvQAHPzL0vrw
         he/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DlwW+fcfTWBNvcnVu7Sv80xFknbWTFutzwDIk9gaJjE=;
        b=GgH+C/ixhedH9I36sKXOHso9LCGibkxYAzyUke0aMjNvjYjnDbz2kM9LUNyFsiQE58
         DCdcGX1WSEzskWRsZeXul6tvDA/zDWmS9OBmCw29694GVlrK1qcal83oXrpHaPPoKc2F
         HC3qw7l1SVzwbOFmIV+GAGLkvD2ASnA/StIygWbAXiw0iMUceqoxsva0ofM6Q2js93zG
         WdTNpKEaLz4MG+MseErD9fyQTpOsp7/edsSAionxvfwqW4EGB2dlhQYddrxtyzPvwgN6
         vWc8IhZCvUQF7GazgUzcNFrN+QP+Z45Zedu8vV1tZpDayvVn08IJY+ZBuqbkWwvHa6xk
         TcbA==
X-Gm-Message-State: AOAM532y6JpIwvZoh03fwtzfqZTHSsgSlvXvdJmiVj2GGOku2ZKziAOA
        KypmLRLWqcliYaRHctMkC1e+zw==
X-Google-Smtp-Source: ABdhPJxAlUjMkrXQRc67VkrTCWmyjbtdtJMb9iHzky/anOb+gSL7iwG+IcTfGyhEIhk+gfXsZZMDhw==
X-Received: by 2002:a17:902:8ec7:b029:d2:42fe:37de with SMTP id x7-20020a1709028ec7b02900d242fe37demr2624044plo.23.1602835655145;
        Fri, 16 Oct 2020 01:07:35 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id k3sm1750426pff.71.2020.10.16.01.07.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2020 01:07:33 -0700 (PDT)
Date:   Fri, 16 Oct 2020 13:37:30 +0530
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
Message-ID: <20201016080730.h7u3jmlyjbyhqn3t@vireshk-i7>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
 <20201013095613.mbgmjwzojg5wxmau@vireshk-i7>
 <CAMuHMdVAJdHVMtK3Sc4sJiJGAwz1J4dKODBFcNzgstaktyKkOw@mail.gmail.com>
 <20201016050347.ers54itzmxgijzsy@vireshk-i7>
 <CAMuHMdUUzoFxbJts3gVC7i5A5daa_TYzKdrGEHho=3a1eeC_ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUzoFxbJts3gVC7i5A5daa_TYzKdrGEHho=3a1eeC_ww@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-10-20, 08:44, Geert Uytterhoeven wrote:
> On Fri, Oct 16, 2020 at 7:03 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 14-10-20, 18:40, Geert Uytterhoeven wrote:
> > > On this platform (r8a7791-koelsch.dts), there is no opp table in DT.
> 
> I think you missed the clue above:

I read it earlier as well.

> this DTS does not have an opp-table
> with operating-points-v2, but cpu0 does have the operating-points (v1)
> property (note the latter is something I missed before).

This is different than having no OPP table in DT.

> > >
> > >   Before:
> >
> > I assume this means before this patchset came in..
> 
> Indeed.
> 
> > >     boot:
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
> > >       cpu cpu0: resources_available:95
> > >       cpu cpu0: resources_available:102: clk_get() returned z
> > >       cpu cpu0: resources_available:120:
> > > dev_pm_opp_of_find_icc_paths() returned 0
> > >       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
> > >       cpu cpu0: resources_available:132: regulator_get_optional()
> > > returned -EPROBE_DEFER
> > >       cpu cpu0: cpu0 regulator not ready, retry
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> > > resources_available() returned -517
> >
> > we deferred probe once.
> >
> > >       ...
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
> > >       cpu cpu0: resources_available:95
> > >       cpu cpu0: resources_available:102: clk_get() returned z
> > >       cpu cpu0: resources_available:120:
> > > dev_pm_opp_of_find_icc_paths() returned 0
> > >       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
> > >       cpu cpu0: resources_available:132: regulator_get_optional()
> > > returned (ptrval)
> >
> > found regulator next time.
> >
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> > > resources_available() returned 0
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:375
> > >       cpufreq_dt: cpufreq_init:162
> > >       cpu cpu0: cpufreq_init:170: clk_get() returned z
> > >       cpu cpu0: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> > >       cpu cpu0: cpufreq_init:198: find_supply_name() returned cpu0
> > >       <i2c comm>
> > >       cpu cpu0: cpufreq_init:201: dev_pm_opp_set_regulators() returned (ptrval)
> > >       <i2c comm>
> > >       cpu cpu0: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> > >       cpu cpu0: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> > >       cpu cpu0: OPP table is not ready, deferring probe
> >
> > This failed, as we couldn't have deferred probe from cpufreq_init.
> > Which means that cpufreq didn't work here.
> 
> No opp-table in DT.

V1 is also an OPP table.

> Shouldn't it use operating-points v1 instead?

Both v1 and v2 are considered as OPP tables. When we say that the
opp-count is 0, it means that it failed to find any of them.

> > >       cpufreq_dt: cpufreq_init:162
> > >       cpu cpu1: cpufreq_init:170: clk_get() returned z
> > >       cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> > >       cpu cpu1: no regulator for cpu1
> > >       cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
> > >       cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> > >       cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> > >       cpu cpu1: OPP table is not ready, deferring probe
> >
> > Same for CPU1.
> 
> Note that only CPU0 has operating-points v1.

Both should have it ideally, though it works if CPU0 gets probed
first. But if CPU0 is hotplugged out and we try to probe CPU1, then it
will fail.

The fact that cpufreq core tried to probe CPU1 means that it failed
for CPU0. And this is before the patchset in question came in.

I don't think cpufreq was working earlier for your platform, please
check why.

> >
> > >
> > >     s2ram:
> > >       cpufreq_dt: cpufreq_init:162
> > >       cpu cpu1: cpufreq_init:170: clk_get() returned z
> > >       cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
> > >       cpu cpu1: no regulator for cpu1
> > >       cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
> > >       cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
> > >       cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
> > >       cpu cpu1: OPP table is not ready, deferring probe
> >
> > And same here.
> >
> > >       CPU1 is up
> > >
> > >   After:
> > >     boot:
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
> > >       cpufreq_dt: dt_cpufreq_early_init:251
> > >       cpu cpu0: dt_cpufreq_early_init:256
> > >       cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
> > > returned (ptrval)
> > >       cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
> > >       cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
> > > returned -EPROBE_DEFER
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> > > dt_cpufreq_early_init() returned -517
> > >       ...
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
> > >       cpufreq_dt: dt_cpufreq_early_init:251
> > >       cpu cpu0: dt_cpufreq_early_init:256
> > >       cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
> > > returned (ptrval)
> > >       cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
> > >       cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
> > > returned (ptrval)
> > >       cpu cpu0: dt_cpufreq_early_init:301:
> > > dev_pm_opp_of_get_sharing_cpus() returned -2
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> > > dt_cpufreq_early_init() returned 0
> > >       cpufreq_dt: dt_cpufreq_early_init:251
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> > > dt_cpufreq_early_init() returned 0
> > >       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:365
> > >       cpufreq_dt: cpufreq_init:114
> > >       cpu cpu0: cpufreq_init:124: clk_get() returned z
> > >       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
> > >       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
> > >       cpu cpu0: OPP table can't be empty
> >
> > Same issue here.
> >
> > >       cpufreq_dt: cpufreq_init:114
> > >       cpu cpu0: cpufreq_init:124: clk_get() returned z
> > >       <i2c comm>
> > >       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
> > >       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
> > >
> > >     s2ram:
> > >
> > >       cpufreq_dt: cpufreq_init:114
> > >       cpu cpu0: cpufreq_init:124: clk_get() returned z
> > >       WARNING: CPU: 1 PID: 14 at drivers/i2c/i2c-core.h:54
> > > __i2c_transfer+0x2d8/0x310
> > >       i2c i2c-6: Transfer while suspended
> > >       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
> > >       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
> > >       cpu cpu0: OPP table can't be empty
> > >       CPU1 is up
> > >
> > > I hope this helps.
> >
> > Unfortunately it raised more questions than what it answered :(
> 
> Before, it bailed out before talking to the regulator during s2ram,
> After, it talks to the regulator before bailing out, triggering the WARN().

It wasn't working before and it isn't working now. Though I do see a
problem with cpufreq core where it tries suspend/resume even though
->init() failed for all CPUs earlier. I will fix that separately.

I think someone needs to see why it wasn't working earlier and then we
can see if we have pending issues.

-- 
viresh
