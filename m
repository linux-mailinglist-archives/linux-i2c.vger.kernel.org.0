Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66BC274E48
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 03:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgIWBTr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 21:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgIWBTq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 21:19:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C63C061755;
        Tue, 22 Sep 2020 18:19:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so15787814ljk.0;
        Tue, 22 Sep 2020 18:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=43E92mMKKqm350qbS0tkC8ppbpyQ1ogE1DNI690XDQo=;
        b=F4TWqojeUUwV4xUlEcbK2HUtBBlcaeb+hjKRgMtANQruHKIqBtwcuFjIq4Ckgzpjhc
         1EbNJtLUi9qEH0eB9xhbX6CT4xiXE5p7MgrQV8gJ/R1J9ez4xEUbYWp172h7nuHLLHas
         rHT7avePuDpE7k+OM0+DN1qLO9AUcTVjzcfyNCy8pgvNqNoeccENPN5QlcZX87fTog69
         3ervL5KuG+EsZ34nGOjpUy52X9CFnJmNLcy9oTYXGrK/xiFama362ERAqA8se9/gHkyR
         Lq01EjkHoe1/9G02amtQr3h0zlWJmh8/yF3+z0zNA1Bsa6RtsS2fTS35SjKnG8/7ew+s
         whdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=43E92mMKKqm350qbS0tkC8ppbpyQ1ogE1DNI690XDQo=;
        b=ifFqyTHcd3WYA52kBOdLOeRAzP/IwwxXHyiZhwaUyaBWF9qhd2LWHWn6xZnAXM1/xb
         PX6lJBm84tb9mDspynHFVgwVWc+uY8ivMJ+tPRTsuaiE6U9dWdFw1wgQu2xWSC3weiVk
         5UVWhIIMIWmqfC1xtzdq33PD/10DQmumUb8hDAN4uvVnxhbhiMdvYKeNUPRpvCOJ5YV0
         Jv593hmfpLhVzn9MdHcfvD85hZnn+FwmKd4NyJynEkBmUnIvfFDJXK06Tjax+eNi17oe
         vMBXiD/jJjx/vrO3I0dF9jagsxnR02DLaOROXqxRXGEVI0MsaG2U32m6ysFOrzKoCwAK
         FLtA==
X-Gm-Message-State: AOAM531iGfTe7bRb3HUlrtC8QtLXD/vhYMjOWjZ2CoG5e+pA9B6amRc1
        Pd5LiHMAiNj5zgi417SQXVTk49K1s1w=
X-Google-Smtp-Source: ABdhPJyUEVSoyHPDR9Vv0rAhihpV1feny1ozuubvHhqGdoY38ob5r6+8YP+gRA06IUvHblr1P6/g7Q==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr2381124ljj.268.1600823984457;
        Tue, 22 Sep 2020 18:19:44 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id c17sm4041750lfs.62.2020.09.22.18.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 18:19:43 -0700 (PDT)
Subject: Re: [PATCH v8 00/32] Improvements for Tegra I2C driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200922225155.10798-1-digetx@gmail.com>
Message-ID: <aee6c548-241d-2cc5-415e-9f0b60177d67@gmail.com>
Date:   Wed, 23 Sep 2020 04:19:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.09.2020 01:51, Dmitry Osipenko пишет:
> Hello!
> 
> This series performs refactoring of the Tegra I2C driver code and hardens
> the atomic-transfer mode.
> 
> Changelog:
> 
> v8: - Dropped these patches:
> 
>         i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
>         i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
> 
>     - The "Use clk-bulk helpers" patch now uses clk_bulk_get() instead of
>       clk_bulk_get_all().
> 
>     - Updated these patches:
> 
>         i2c: tegra: Improve formatting of variables
>         i2c: tegra: Clean up variable names
>         i2c: tegra: Clean up and improve comments
> 
>       All the changes are made in response to comments from Thierry Reding
>       that he gave to v7.
> 
>       I kept the "Check errors for both positive and negative values"
>       patch because me and Andy Shevchenko are thinking that it's a good
>       improvement.
> 
>     - Added t-b and r-b from Thierry Reding.
> 
> v7: - Reworked the "Clean up probe function" patch by moving out all
>       variable renamings into the "Clean up variable names" patch.
>       This results in a nicer diff, which was asked by Andy Shevchenko.
> 
>     - Squashed "Improve coding style of tegra_i2c_wait_for_config_load()"
>       patch into "Factor out register polling into separate function" in
>       order avoid unnecessary ping-pong changes, which was asked by
>       Andy Shevchenko.
> 
>     - Added more indentation improvements, it should be ideal now.
> 
>     - I haven't changed order of the "Clean up variable types" patch,
>       which was suggested by Andy Shevchenko, because I already moved
>       that patch multiple times and we decided to sort patches starting
>       with more important cleanups and down to less important. The type
>       changes are more important than shuffling code around, IMO.
> 
> v6: - Added new patch that adds missing RPM puts, thanks to Andy Shevchenko
>       for the suggestion.
> 
>     - Improved commit messages by extending them with more a more detailed
>       explanation of the changes.
> 
>     - Added clarifying comment to the "Use reset_control_reset()" change,
>       which was asked by Andy Shevchenko.
> 
>     - Refactored the "Clean up probe function" patch by moving the
>       dev_err_probe() change into the "Use clk-bulk helpers" patch,
>       which was suggested by Andy Shevchenko.
> 
>     - Improved ordering of the patches like it was suggested by
>       Andy Shevchenko.
> 
>     - Added Andy Shevchenko to suggested-by of the "Use clk-bulk helpers"
>       patch.
> 
>     - Improved "Remove i2c_dev.clk_divisor_non_hs_mode member" patch by
>       making the case-switch to use "fast plus mode" timing if clock rate
>       is out-of-range. Just to make it more consistent.
> 
>     - The "Improve tegra_i2c_dev structure" patch is squashed into
>      "Improve formatting of variables" and "Clean up types/names" patches.
> 
>     - All variable-renaming changes are squashed into a single "Clean up
>       variable names" patch.
> 
>     - Made extra minor improvement to various patches, like more comments
>       and indentations improved.
> 
> v5: - Dropped the "Factor out runtime PM and hardware initialization"
>       patch, like it was suggested by Michał Mirosław. Instead a less
>       invasive "Factor out hardware initialization into separate function"
>       patch added, it doesn't touch the RPM initialization.
> 
>     - The "Remove outdated barrier()" patch now removes outdated comments.
> 
>     - Updated commit description of the "Remove "dma" variable" patch,
>       saying that the transfer mode may be changed by a callee. This was
>       suggested by Michał Mirosław.
> 
>     - Reworked the "Clean up and improve comments" patch. Couple more
>       comments are corrected and reworded now.
> 
>     - Added r-b's from Michał Mirosław.
> 
>     - New patches:
> 
>         i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
>         i2c: tegra: Clean up variable types
>         i2c: tegra: Improve tegra_i2c_dev structure
> 
> v4: - Reordered patches in the fixes/features/cleanups order like it was
>       suggested by Andy Shevchenko.
> 
>     - Now using clk-bulk API, which was suggested by Andy Shevchenko.
> 
>     - Reworked "Make tegra_i2c_flush_fifos() usable in atomic transfer"
>       patch to use iopoll API, which was suggested by Andy Shevchenko.
> 
>     - Separated "Clean up probe function" into several smaller patches.
> 
>     - Squashed "Add missing newline before returns" patch into
>       "Clean up whitespaces, newlines and indentation".
> 
>     - The "Drop '_timeout' from wait/poll function names" is renamed to
>       "Rename wait/poll functions".
> 
>     - The "Use reset_control_reset()" is changed to not fail tegra_i2c_init(),
>       but only emit warning. This should be more friendly behaviour in oppose
>       to having a non-bootable machine if reset-control fails.
> 
>     - New patches:
> 
>         i2c: tegra: Remove error message used for devm_request_irq() failure
>         i2c: tegra: Use devm_platform_get_and_ioremap_resource()
>         i2c: tegra: Use platform_get_irq()
>         i2c: tegra: Use clk-bulk helpers
>         i2c: tegra: Remove bogus barrier()
>         i2c: tegra: Factor out register polling into separate function
>         i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
>         i2c: tegra: Clean up and improve comments
>         i2c: tegra: Rename couple "ret" variables to "err"
> 
> v3: - Optimized "Make tegra_i2c_flush_fifos() usable in atomic transfer"
>       patch by pre-checking FIFO state before starting to poll using
>       ktime API, which may be expensive under some circumstances.
> 
>     - The "Clean up messages in the code" patch now makes all messages
>       to use proper capitalization of abbreviations. Thanks to Andy Shevchenko
>       and Michał Mirosław for the suggestion.
> 
>     - The "Remove unnecessary whitespaces and newlines" patch is transformed
>       into "Clean up whitespaces and newlines", it now also adds missing
>       newlines and spaces.
> 
>     - Reworked the "Clean up probe function" patch in accordance to
>       suggestion from Michał Mirosław by factoring out only parts of
>       the code that make error unwinding cleaner.
> 
>     - Added r-b from Michał Mirosław.
> 
>     - Added more patches:
> 
>         i2c: tegra: Reorder location of functions in the code
>         i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
>         i2c: tegra: Remove "dma" variable
>         i2c: tegra: Initialization div-clk rate unconditionally
>         i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
> 
> v2: - Cleaned more messages in the "Clean up messages in the code" patch.
> 
>     - The error code of reset_control_reset() is checked now.
> 
>     - Added these new patches to clean up couple more things:
> 
>         i2c: tegra: Check errors for both positive and negative values
>         i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
>         i2c: tegra: Remove unnecessary whitespaces and newlines
>         i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Improve driver module description
> 
> Dmitry Osipenko (32):
>   i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
>   i2c: tegra: Add missing pm_runtime_put()
>   i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
>   i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
>   i2c: tegra: Initialize div-clk rate unconditionally
>   i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
>   i2c: tegra: Runtime PM always available on Tegra
>   i2c: tegra: Remove error message used for devm_request_irq() failure
>   i2c: tegra: Use reset_control_reset()
>   i2c: tegra: Use devm_platform_get_and_ioremap_resource()
>   i2c: tegra: Use platform_get_irq()
>   i2c: tegra: Use clk-bulk helpers
>   i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
>   i2c: tegra: Clean up probe function
>   i2c: tegra: Reorder location of functions in the code
>   i2c: tegra: Clean up variable types
>   i2c: tegra: Remove outdated barrier()
>   i2c: tegra: Remove likely/unlikely from the code
>   i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
>   i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
>   i2c: tegra: Rename wait/poll functions
>   i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
>   i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
>   i2c: tegra: Factor out register polling into separate function
>   i2c: tegra: Factor out hardware initialization into separate function
>   i2c: tegra: Check errors for both positive and negative values
>   i2c: tegra: Improve formatting of variables
>   i2c: tegra: Clean up variable names
>   i2c: tegra: Clean up printk messages
>   i2c: tegra: Clean up and improve comments
>   i2c: tegra: Clean up whitespaces, newlines and indentation
>   i2c: tegra: Improve driver module description
> 
>  drivers/i2c/busses/i2c-tegra.c | 1417 ++++++++++++++++----------------
>  1 file changed, 692 insertions(+), 725 deletions(-)
> 

Ahh, I missed to add Andy's r-b to all patches.

Hope it's okay if I'll add it here like this:

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
