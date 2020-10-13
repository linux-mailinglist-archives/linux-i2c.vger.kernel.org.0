Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACF328CB41
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 11:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgJMJ4R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 05:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgJMJ4R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Oct 2020 05:56:17 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77952C0613D5
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 02:56:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id hk7so418237pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 02:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lOvbNuBRkRQie407GzVJVOf2n6wAAnp8oic0OTWh+Bc=;
        b=lHrWeRZPxXoqU43SOZ60EkCQVA9ID9koDOnGrYihX0JfAasRug/D75Fp2WXShcPH7g
         7gtZNOVqeA2CtpNWXdKdYeIO7W2uHciFwj64l4kZEO+5NatcXwlBD31s5XhsOMkqCcrD
         JFFoNiQHsglaPo43l9JFNkzxqWBMr2bKoOjSNUQF+kZLBdBx3fwVV4N8KWhHgYZ9szcx
         hp2aPzxCPcJzqTrpbnyY2qCZYHYXR/weB4dYgZsyL3kPuNKHItUBLMyELIapXU/vF24r
         BhhkbaIwODX9F7UipLf8xt5Gt6cD4MTM+A5d7HEZjRgYtKGyd83nszGQbCA1UkIMSWXr
         sfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lOvbNuBRkRQie407GzVJVOf2n6wAAnp8oic0OTWh+Bc=;
        b=X0vcJ9tWvgNU5JqkgciiMyxZYuLlHbVZczV7bg03+3/HCK2X1v4BoJdZaXvUETyEq2
         lzsWX0muZCBEAzx2DuQvexIlVR1nPHVc6w6GMfuobp2Rw6SQq8EHcSYdiOrfA+9gO0sV
         0RK/nDiH/v5ihoh03d2Ngwa98nEWr4msoIUZBnhUjUaKfJch+TlewMs6TVT2KBcGO7P0
         Qp+/Af7pyCKZyGyu5rC1AwhN/+jdG337CwfeWIwPol9yAYIf3UDHr+2o+vNtI/rnUJxa
         SSmm+t6qTBzvRWvllZ9aivMK783oLMLlWTdKXzU6i5eTSQsFKi0IDvRNGXuMZmtyfYXc
         uLlw==
X-Gm-Message-State: AOAM531k+wbMXs42jNf71E0OOqMxn82/OiXrLVoJvIggn8kzDN1ScG0Q
        NxPVbMykinD7Eey4qvPxf/mZ5Q==
X-Google-Smtp-Source: ABdhPJw4E0wMnWwjRC1sr2bzOYapBYmacXLeYKGrOtasp3/b5pfPVT06dgs++RnqLZtuoG+WVWrfyg==
X-Received: by 2002:a17:902:7882:b029:d3:b3bc:9d8a with SMTP id q2-20020a1709027882b02900d3b3bc9d8amr27137601pll.46.1602582976868;
        Tue, 13 Oct 2020 02:56:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id f9sm26770712pjq.26.2020.10.13.02.56.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2020 02:56:16 -0700 (PDT)
Date:   Tue, 13 Oct 2020 15:26:13 +0530
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
Message-ID: <20201013095613.mbgmjwzojg5wxmau@vireshk-i7>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <f75c61f193f396608d592ae2a9938264d582c038.1598260050.git.viresh.kumar@linaro.org>
 <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXLQKN5n58NvOp43vhc3ryLXWurBSsmcW9Q=oW502PYOQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13-10-20, 11:47, Geert Uytterhoeven wrote:
> Thanks for your patch, which is now commit dc279ac6e5b4e06e ("cpufreq:
> dt: Refactor initialization to handle probe deferral properly") in
> pm/linux-next, and to which I bisected a regression.
> Reverting this commit fixes the issue.

Strange. I had a look again and I failed to understand why it would
happen this way.

> On r8a7791/koelsch, during resume from s2ram:
> 
>      PM: suspend entry (deep)
>      Filesystems sync: 0.000 seconds
>      Freezing user space processes ... (elapsed 0.003 seconds) done.
>      OOM killer disabled.
>      Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
>      Disabling non-boot CPUs ...
>      Enabling non-boot CPUs ...
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +i2c-sh_mobile e60b0000.i2c: Transfer request timed out
>     +cpu cpu0: OPP table can't be empty
>      CPU1 is up
>      rcar-pcie fe000000.pcie: PCIe x1: link up
> 
> The cpufreq code tries to talk to the PMIC, while the I2C controller
> that hosts the PMIC is suspended, and thus any communication attempt
> times out.  __i2c_check_suspended() fails to notice that, as the
> i2c_shmobile_i2c driver doesn't have a suspend callback calling
> i2c_mark_adapter_suspended() yet.  After fixing that (will send a patch
> soon), the I2C core rightfully complains with:
> 
>     WARNING: CPU: 1 PID: 13 at drivers/i2c/i2c-core.h:54
> __i2c_transfer+0x4a4/0x4e4
>     i2c i2c-6: Transfer while suspended
>     CPU: 1 PID: 13 Comm: cpuhp/1 Not tainted
> 5.9.0-shmobile-09581-g05a3e5886c7615b1-dirty #718
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     [<c010dcec>] (unwind_backtrace) from [<c0109b18>] (show_stack+0x10/0x14)
>     [<c0109b18>] (show_stack) from [<c075e928>] (dump_stack+0x8c/0xac)
>     [<c075e928>] (dump_stack) from [<c011c23c>] (__warn+0xd0/0xe8)
>     [<c011c23c>] (__warn) from [<c011c2c4>] (warn_slowpath_fmt+0x70/0x9c)
>     [<c011c2c4>] (warn_slowpath_fmt) from [<c0548be8>]
> (__i2c_transfer+0x4a4/0x4e4)
>     [<c0548be8>] (__i2c_transfer) from [<c0548cd8>] (i2c_transfer+0xb0/0xf8)
>     [<c0548cd8>] (i2c_transfer) from [<c046f884>] (regmap_i2c_read+0x54/0x88)
>     [<c046f884>] (regmap_i2c_read) from [<c046b69c>]
> (_regmap_raw_read+0x118/0x1f0)
>     [<c046b69c>] (_regmap_raw_read) from [<c046b7b8>]
> (_regmap_bus_read+0x44/0x68)
>     [<c046b7b8>] (_regmap_bus_read) from [<c04698a0>] (_regmap_read+0x84/0x110)
>     [<c04698a0>] (_regmap_read) from [<c046c10c>] (regmap_read+0x40/0x58)
>     [<c046c10c>] (regmap_read) from [<c03cf0a8>]
> (regulator_get_voltage_sel_regmap+0x28/0x74)
>     [<c03cf0a8>] (regulator_get_voltage_sel_regmap) from [<c03cb29c>]
> (regulator_get_voltage_rdev+0xa4/0x14c)
>     [<c03cb29c>] (regulator_get_voltage_rdev) from [<c03cc658>]
> (regulator_get_voltage+0x2c/0x60)
>     [<c03cc658>] (regulator_get_voltage) from [<c03cd994>]
> (regulator_is_supported_voltage+0x30/0xd8)
>     [<c03cd994>] (regulator_is_supported_voltage) from [<c05a32b4>]
> (_opp_add+0x164/0x1b8)
>     [<c05a32b4>] (_opp_add) from [<c05a3388>] (_opp_add_v1+0x80/0xb8)
>     [<c05a3388>] (_opp_add_v1) from [<c05a5220>]
> (dev_pm_opp_of_add_table+0x130/0x168)
>     [<c05a5220>] (dev_pm_opp_of_add_table) from [<c05a5330>]
> (dev_pm_opp_of_cpumask_add_table+0x60/0xac)
>     [<c05a5330>] (dev_pm_opp_of_cpumask_add_table) from [<c05ab88c>]
> (cpufreq_init+0x94/0x1c4)
>     [<c05ab88c>] (cpufreq_init) from [<c05a8190>] (cpufreq_online+0x148/0x7ac)
>     [<c05a8190>] (cpufreq_online) from [<c05a87fc>]
> (cpuhp_cpufreq_online+0x8/0x10)
>     [<c05a87fc>] (cpuhp_cpufreq_online) from [<c011d088>]
> (cpuhp_invoke_callback+0xf8/0x2e4)
>     [<c011d088>] (cpuhp_invoke_callback) from [<c011d418>]
> (cpuhp_thread_fun+0xac/0x244)
>     [<c011d418>] (cpuhp_thread_fun) from [<c013c090>]
> (smpboot_thread_fn+0x19c/0x1a8)
>     [<c013c090>] (smpboot_thread_fn) from [<c0138408>] (kthread+0x104/0x110)
>     [<c0138408>] (kthread) from [<c0100148>] (ret_from_fork+0x14/0x2c)

So there is a dependency chain here. cpufreq->regulator->i2c,
specially with the patch you pointed out, we handle defer-probing in a
better way and so I would expect i2c driver to get in first and
cpufreq should get registered later only. And I would have expected
the same during suspend/resume.

Can you see why this happens ?

-- 
viresh
