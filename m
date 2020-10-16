Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8237F28FD8A
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 07:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgJPFDv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 01:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgJPFDv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 01:03:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E8AC061755
        for <linux-i2c@vger.kernel.org>; Thu, 15 Oct 2020 22:03:51 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t18so631575plo.1
        for <linux-i2c@vger.kernel.org>; Thu, 15 Oct 2020 22:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qtvV026HLCzz5NoDCyozzqnf4hHRYfc35Oyit81StQ4=;
        b=Ite6O0sCdHz/TgSDObsypuRJ50z5WPXZKhRbHh9UISq6lAfUuYiP2/fxTwDz6y5Ybl
         FzmVDWhO8+7+s2AonNYSGfsZpkyHMN+ZMH1DpakymkuZQ40z2PCL6ii3HREtm5QOkOe7
         wUX1yTeE1uQKl9WSquqWA6niHRpgmmDLMngi0LALRWW/dMqvWdDcOEY7GgsyCy3Ck5S0
         Xdas5bG2RjXOEXQh60p7Jn+86jyRQ6rkeNwGudEH1KCJew9Qu9t4snMdGkBrFXPgINeF
         OAcPYABU9h8FTwtiUSsGsr7wIeaUyVzD7ppPGgkOUBACYyJyZk6vuk3380wzeTwDLdMX
         RP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qtvV026HLCzz5NoDCyozzqnf4hHRYfc35Oyit81StQ4=;
        b=jCOdbTnMegHK8ssHS57T2W36Y4cKllmY9f3Vi11Qws2wLPDdCwjp86Kjz6/n5d+LNe
         u5RZoCqp9AjZVqmNluO/A1WnyqeZuOFZThp6beBXXdkGZA8oXJ9UGBalcDtlZo0xL+yv
         uBVgd1sUMTSnnqkfEmDjBMQokgtDFg08TC9kg2U+ghGzh+OVTtQNUQ1T3+7DC3FsRtbO
         qHgkpVm5S0nahh5sek7aHGVJ1qiIOkPTLj89RyuGhWya94eI3JVO6Q6V4TNxVIZ2EEY0
         Er+0xvh7W8XJxqJB3kvI4j9vc23nSRxkOt0KO93KWVlPnV4rN1Gi9YiyrYaJHGhJTuPk
         DKfw==
X-Gm-Message-State: AOAM531J+At/E1G73HZXO6s3kqww+GwWDMj5+AaQOSDN4xsjHCMCjBuW
        v36Optn7nEo53XohRR6IC6oQhA==
X-Google-Smtp-Source: ABdhPJwS+WvqHaiufqyl/oZWHRdnnVMhUffeS+VlYpnK2fAPQP12O+6RzLoANUPd82bd045uDJtZDA==
X-Received: by 2002:a17:902:930c:b029:d3:b362:7939 with SMTP id bc12-20020a170902930cb02900d3b3627939mr2277168plb.54.1602824630725;
        Thu, 15 Oct 2020 22:03:50 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id e4sm1097611pgg.37.2020.10.15.22.03.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 22:03:49 -0700 (PDT)
Date:   Fri, 16 Oct 2020 10:33:47 +0530
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
Message-ID: <20201016050347.ers54itzmxgijzsy@vireshk-i7>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
 <20201013095613.mbgmjwzojg5wxmau@vireshk-i7>
 <CAMuHMdVAJdHVMtK3Sc4sJiJGAwz1J4dKODBFcNzgstaktyKkOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVAJdHVMtK3Sc4sJiJGAwz1J4dKODBFcNzgstaktyKkOw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14-10-20, 18:40, Geert Uytterhoeven wrote:
> On this platform (r8a7791-koelsch.dts), there is no opp table in DT.
> 
>   Before:

I assume this means before this patchset came in..

>     boot:
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
>       cpu cpu0: resources_available:95
>       cpu cpu0: resources_available:102: clk_get() returned z
>       cpu cpu0: resources_available:120:
> dev_pm_opp_of_find_icc_paths() returned 0
>       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
>       cpu cpu0: resources_available:132: regulator_get_optional()
> returned -EPROBE_DEFER
>       cpu cpu0: cpu0 regulator not ready, retry
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> resources_available() returned -517

we deferred probe once.

>       ...
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:362
>       cpu cpu0: resources_available:95
>       cpu cpu0: resources_available:102: clk_get() returned z
>       cpu cpu0: resources_available:120:
> dev_pm_opp_of_find_icc_paths() returned 0
>       cpu cpu0: resources_available:125: find_supply_name() returned cpu0
>       cpu cpu0: resources_available:132: regulator_get_optional()
> returned (ptrval)

found regulator next time.

>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:371:
> resources_available() returned 0
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:375
>       cpufreq_dt: cpufreq_init:162
>       cpu cpu0: cpufreq_init:170: clk_get() returned z
>       cpu cpu0: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
>       cpu cpu0: cpufreq_init:198: find_supply_name() returned cpu0
>       <i2c comm>
>       cpu cpu0: cpufreq_init:201: dev_pm_opp_set_regulators() returned (ptrval)
>       <i2c comm>
>       cpu cpu0: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
>       cpu cpu0: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
>       cpu cpu0: OPP table is not ready, deferring probe

This failed, as we couldn't have deferred probe from cpufreq_init.
Which means that cpufreq didn't work here.

>       cpufreq_dt: cpufreq_init:162
>       cpu cpu1: cpufreq_init:170: clk_get() returned z
>       cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
>       cpu cpu1: no regulator for cpu1
>       cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
>       cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
>       cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
>       cpu cpu1: OPP table is not ready, deferring probe

Same for CPU1.

> 
>     s2ram:
>       cpufreq_dt: cpufreq_init:162
>       cpu cpu1: cpufreq_init:170: clk_get() returned z
>       cpu cpu1: cpufreq_init:179: dev_pm_opp_of_get_sharing_cpus() returned -2
>       cpu cpu1: no regulator for cpu1
>       cpu cpu1: cpufreq_init:198: find_supply_name() returned (null)
>       cpu cpu1: cpufreq_init:230: dev_pm_opp_of_cpumask_add_table() returned 0
>       cpu cpu1: cpufreq_init:239: dev_pm_opp_get_opp_count() returned 0
>       cpu cpu1: OPP table is not ready, deferring probe

And same here.

>       CPU1 is up
> 
>   After:
>     boot:
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
>       cpufreq_dt: dt_cpufreq_early_init:251
>       cpu cpu0: dt_cpufreq_early_init:256
>       cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
> returned (ptrval)
>       cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
>       cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
> returned -EPROBE_DEFER
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> dt_cpufreq_early_init() returned -517
>       ...
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:356
>       cpufreq_dt: dt_cpufreq_early_init:251
>       cpu cpu0: dt_cpufreq_early_init:256
>       cpu cpu0: dt_cpufreq_early_init:271: dev_pm_opp_get_opp_table()
> returned (ptrval)
>       cpu cpu0: dt_cpufreq_early_init:284: find_supply_name() returned cpu0
>       cpu cpu0: dt_cpufreq_early_init:288: dev_pm_opp_set_regulators()
> returned (ptrval)
>       cpu cpu0: dt_cpufreq_early_init:301:
> dev_pm_opp_of_get_sharing_cpus() returned -2
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> dt_cpufreq_early_init() returned 0
>       cpufreq_dt: dt_cpufreq_early_init:251
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:360:
> dt_cpufreq_early_init() returned 0
>       cpufreq-dt cpufreq-dt: dt_cpufreq_probe:365
>       cpufreq_dt: cpufreq_init:114
>       cpu cpu0: cpufreq_init:124: clk_get() returned z
>       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
>       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
>       cpu cpu0: OPP table can't be empty

Same issue here.

>       cpufreq_dt: cpufreq_init:114
>       cpu cpu0: cpufreq_init:124: clk_get() returned z
>       <i2c comm>
>       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
>       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
> 
>     s2ram:
> 
>       cpufreq_dt: cpufreq_init:114
>       cpu cpu0: cpufreq_init:124: clk_get() returned z
>       WARNING: CPU: 1 PID: 14 at drivers/i2c/i2c-core.h:54
> __i2c_transfer+0x2d8/0x310
>       i2c i2c-6: Transfer while suspended
>       cpu cpu0: cpufreq_init:142: dev_pm_opp_of_cpumask_add_table() returned 0
>       cpu cpu0: cpufreq_init:151: dev_pm_opp_get_opp_count() returned 0
>       cpu cpu0: OPP table can't be empty
>       CPU1 is up
> 
> I hope this helps.

Unfortunately it raised more questions than what it answered :(

-- 
viresh
