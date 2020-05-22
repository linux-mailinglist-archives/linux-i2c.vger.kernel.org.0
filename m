Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C196E1DDBC7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 02:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730725AbgEVAJs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 20:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730224AbgEVAJs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 20:09:48 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00063C05BD43
        for <linux-i2c@vger.kernel.org>; Thu, 21 May 2020 17:09:47 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id s19so7978080edt.12
        for <linux-i2c@vger.kernel.org>; Thu, 21 May 2020 17:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ShTiWXhFQZjS5cdCw5c5iEVmkBUXovNZWLuS1Cv7888=;
        b=ofqnPgic0A6d3snWFaSYqXR6bXBywTUnsOr918T7Vjsau2FfwafBcg2+BvbwupHpnK
         i8zIqwaU68LuAEvmeeb6p5FBg+YCsKTCxnBQxlTsuV7mdVv0zuDiCF+VHked8F7bTUZK
         5GiXwg8aW3OJ9v1FQ6LHwhFjFyYNnq6FLKf+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ShTiWXhFQZjS5cdCw5c5iEVmkBUXovNZWLuS1Cv7888=;
        b=lS1m5tHSOjLWmOFUjsaiCO2zKvcLl4jQ4Z2miKMBJnX69ibK5CYBt0nhoTKtnrsWjp
         3qq/SFH/BimWq8WInDnHGfAX09QD2mRUasbCJ01PizSPBICc3f5awaGzX1KdZ6qlSI/x
         LZbdARjBe+oIosZ/MjnVkYZceDsG1Kw+xErgfZC/COMqH/7H4PQnL1Jzxbl+cBt/M4y+
         D97RWd0Lle/GdZS+j22lDi3xTvpQ9y+q5k6nUGSs1sUXSQ+JuD8OXVyKlTrpzA+2WQ4i
         8RASiZS6PNcZpkVBD1a0+B/3PPLQI5LtYLvCciiL3ZdGk64bj2hHZ+S0fpjg+aRnM032
         jFqA==
X-Gm-Message-State: AOAM5303i6MsEM0cq22oDoT6XBtBEdwwJY/hiqtbl19aDawSrFHU/IoW
        oMICZD1Zy3tWK8j5QsvhKCWiTtU5ZmmwwQ==
X-Google-Smtp-Source: ABdhPJypgBq5u+tnUktNNHL0sAHii1OjLPik20xDccpduvloNJxeQ3/BPT9GIyC41IYQ9bxzrOOLoA==
X-Received: by 2002:a05:6402:cb1:: with SMTP id cn17mr1029459edb.382.1590106184759;
        Thu, 21 May 2020 17:09:44 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id m27sm6053101eja.83.2020.05.21.17.09.43
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 17:09:44 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id g12so7232415wrw.1
        for <linux-i2c@vger.kernel.org>; Thu, 21 May 2020 17:09:43 -0700 (PDT)
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr867242wrw.17.1590106183205;
 Thu, 21 May 2020 17:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <5ec71528.qSD3ljogzEHcLRXO%lkp@intel.com>
In-Reply-To: <5ec71528.qSD3ljogzEHcLRXO%lkp@intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 22 May 2020 02:09:29 +0200
X-Gmail-Original-Message-ID: <CAAFQd5C20_iOMaXOF+4MoUAVyzVR4VfD1iiPhFaHkCv16srebg@mail.gmail.com>
Message-ID: <CAAFQd5C20_iOMaXOF+4MoUAVyzVR4VfD1iiPhFaHkCv16srebg@mail.gmail.com>
Subject: Re: 6fe12cdbcf ("i2c: core: support bus regulator controlling in
 .."): BUG: sleeping function called from invalid context at kernel/locking/mutex.c:935
To:     kernel test robot <lkp@intel.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>, LKP <lkp@lists.01.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        philip.li@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 22, 2020 at 1:57 AM kernel test robot <lkp@intel.com> wrote:
>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> commit 6fe12cdbcfe35ad4726a619a9546822d34fc934c
> Author:     Bibby Hsieh <bibby.hsieh@mediatek.com>
> AuthorDate: Tue May 19 15:27:29 2020 +0800
> Commit:     Wolfram Sang <wsa@kernel.org>
> CommitDate: Wed May 20 15:25:55 2020 +0200
>
>     i2c: core: support bus regulator controlling in adapter
>
>     Although in the most platforms, the bus power of i2c
>     are alway on, some platforms disable the i2c bus power
>     in order to meet low power request.
>
>     We get and enable bulk regulator in i2c adapter device.
>
>     Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
>     Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>     Signed-off-by: Wolfram Sang <wsa@kernel.org>
>
> 6aab46bc52  dt-binding: i2c: add bus-supply property
> 6fe12cdbcf  i2c: core: support bus regulator controlling in adapter
> +-----------------------------------------------------------------------------+------------+------------+
> |                                                                             | 6aab46bc52 | 6fe12cdbcf |
> +-----------------------------------------------------------------------------+------------+------------+
> | boot_successes                                                              | 33         | 0          |
> | boot_failures                                                               | 2          | 16         |
> | WARNING:at_lib/kobject_uevent.c:#add_uevent_var                             | 1          |            |
> | EIP:add_uevent_var                                                          | 1          |            |
> | BUG:kernel_hang_in_boot_stage                                               | 1          |            |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mutex.c | 0          | 16         |
> +-----------------------------------------------------------------------------+------------+------------+
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
>
> [  105.730065] ### dt-test ### EXPECT / : OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest13/status
> [  105.730071] ### dt-test ### EXPECT \ : i2c i2c-1: Added multiplexed i2c bus 3
> [  105.747587] i2c i2c-3: supply bus not found, using dummy regulator
> [  105.754529] i2c i2c-1: Added multiplexed i2c bus 3
> [  105.756092] ### dt-test ### EXPECT / : i2c i2c-1: Added multiplexed i2c bus 3
> [  105.773831] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:935
> [  105.777468] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 189, name: kworker/0:2
> [  105.778995] 2 locks held by kworker/0:2/189:
> [  105.779775]  #0: f48249a4 ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x3ac/0x1050
> [  105.781743]  #1: f4145f34 ((work_completion)(&sdp->work)){+.+.}-{0:0}, at: process_one_work+0x3ac/0x1050
> [  105.783485] Preemption disabled at:
> [  105.783509] [<cdbb653d>] srcu_invoke_callbacks+0x14d/0x280
> [  105.785397] CPU: 0 PID: 189 Comm: kworker/0:2 Not tainted 5.7.0-rc1-00058-g6fe12cdbcfe35 #1
> [  105.786961] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [  105.788608] Workqueue: rcu_gp srcu_invoke_callbacks
> [  105.789777] Call Trace:
> [  105.790308]  dump_stack+0x32/0x4a
> [  105.790914]  ___might_sleep+0x3dc/0x4b0
> [  105.791659]  ? srcu_invoke_callbacks+0x14d/0x280
> [  105.792574]  ? srcu_invoke_callbacks+0x14d/0x280
> [  105.793677]  ? srcu_invoke_callbacks+0x14d/0x280
> [  105.794480]  __might_sleep+0x10e/0x210
> [  105.795186]  __mutex_lock+0x34/0x12f0
> [  105.795838]  ? mark_held_locks+0xb3/0x100
> [  105.796561]  ? _raw_spin_unlock_irqrestore+0x13b/0x190
> [  105.797694]  ? _raw_spin_unlock_irqrestore+0x13b/0x190
> [  105.798653]  ? lockdep_hardirqs_on+0x1bb/0x420
> [  105.799462]  mutex_lock_nested+0x41/0x60
> [  105.800155]  ? regulator_put+0x25/0x70
> [  105.800839]  regulator_put+0x25/0x70
> [  105.801641]  devm_regulator_release+0x1d/0x30
> [  105.802415]  release_nodes+0x326/0x500
> [  105.803126]  devres_release_all+0xb9/0x130
> [  105.803873]  device_release+0x25/0x1b0

This is entirely my guess for now, but isn't it suspicious that
device_release() has been called with interrupts disabled?

Is it possible that something else introduced a bug that causes
device_release() to be called in an atomic context and it only
triggered with this patch, because the affected struct device now has
a mutex lock in the release path?

> [  105.804548]  ? srcu_invoke_callbacks+0xfa/0x280
> [  105.805591]  kobject_put+0x33e/0x800
> [  105.806244]  ? refcount_dec_not_one+0x107/0x2f0
> [  105.807050]  ? srcu_invoke_callbacks+0x14d/0x280
> [  105.807918]  __device_link_free_srcu+0x79/0xe0
> [  105.808685]  srcu_invoke_callbacks+0x160/0x280
> [  105.809729]  process_one_work+0x594/0x1050
> [  105.810535]  ? process_one_work+0x3ac/0x1050
> [  105.811314]  ? _raw_spin_lock_irq+0x56/0xe0
> [  105.812113]  worker_thread+0x4a3/0xc00
> [  105.812823]  kthread+0x31f/0x3b0
> [  105.813537]  ? rescuer_thread+0x720/0x720
> [  105.814227]  ? kthread_bind+0x30/0x30
> [  105.814920]  ret_from_fork+0x19/0x24
> [  105.866663] ### dt-test ### EXPECT \ : GPIO line <<int>> (line-B-input) hogged as input
> [  105.868134] ### dt-test ### EXPECT \ : GPIO line <<int>> (line-A-input) hogged as input
> [  105.870372] GPIO line 509 (line-B-input) hogged as input
> [  105.872524] GPIO line 503 (line-A-input) hogged as input
> [  105.874446] ### dt-test ### EXPECT / : GPIO line <<int>> (line-A-input) hogged as input
>
>                                                           # HH:MM RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start d0edf98c01ebe0790295cf888a2976d2d04377b1 b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce --
> git bisect  bad 4fde3f7c56e653e1d62102a4a77534f4bfec9689  # 07:04  B      0    17   33   0  Merge 'linux-review/Anson-Huang/ARM-dts-imx-Make-tempmon-node-as-child-of-anatop-node/20200520-230948' into devel-hourly-2020052107
> git bisect  bad e8344c6f4e6b7a7318fa46dd6fd5418f3e36d010  # 07:04  B      0    17   33   0  Merge 'linux-review/Gabriel-Krisman-Bertazi/iscsi-Fix-deadlock-on-recovery-path-during-GFP_IO-reclaim/20200520-220836' into devel-hourly-2020052107
> git bisect good 6332b5a106b02909b3ac673832d1e36a901d81fa  # 07:04  G     11     0    0   0  Merge 'stericsson/ux500-dts' into devel-hourly-2020052107
> git bisect  bad 05c599fa08c02ea883075d05cc544f5e133dad15  # 07:04  B      0    11   27   0  Merge 'ras/edac-misc' into devel-hourly-2020052107
> git bisect good 25ef63dabd6b9567bd3d7870c5e8595b6b87c678  # 07:05  G     11     0    0   0  Merge 'linux-review/Maulik-Shah/arm64-dts-qcom-sc7180-Correct-the-pdc-interrupt-ranges/20200518-202257' into devel-hourly-2020052107
> git bisect good 0db2ae8dfea89b3541eb5ffb6e0aed13d921b277  # 07:05  G     11     0    0   0  Merge 'linux-review/Geert-Uytterhoeven/ARM-dts-r9a06g032-Correct-GIC-compatible-value-order/20200519-204708' into devel-hourly-2020052107
> git bisect good aeee233deb1c06fcf7630402c1f15208aa3d723a  # 07:05  G     11     0    0   0  Merge 'linux-review/Lubomir-Rintel/media-marvell-ccic-Add-support-for-runtime-PM/20200521-053250' into devel-hourly-2020052107
> git bisect  bad 6872daa8abed0e8bd8447d56cfca80c4d29d6243  # 07:05  B      0    10   27   1  Merge 'linux-review/Dinghao-Liu/i2c-imx-lpi2c-fix-runtime-pm-imbalance-on-error/20200521-033738' into devel-hourly-2020052107
> git bisect good f23da43a58d09dc6ea58837a45374e15de36537e  # 07:05  G     10     0    0   1  Merge branch 'i2c/for-current' into i2c/for-next
> git bisect good fadb47fca1f132c123395bca26c69007e816988f  # 07:05  G     11     0    0   0  Merge branch 'i2c/for-5.8' into i2c/for-next
> git bisect  bad 4f118a7e4686062bd4df4a37e24c22cd71495b5f  # 07:05  B      0    11   27   0  Merge tag 'for-5.8-i2c' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into i2c/for-5.8
> git bisect good c73178b93754edd8449dccd3faf05baafd4d3f0e  # 07:05  G     11     0    0   0  i2c: tegra: Add support for the VI I2C on Tegra210
> git bisect good 6aab46bc52a8f579879d491c9d8062e03caa5c61  # 07:05  G     30     0    0   3  dt-binding: i2c: add bus-supply property
> git bisect  bad f89c326dcaa0cb8c3af7764e75eeed4e3f3c879a  # 07:05  B      0    15   31   0  Merge branch 'i2c/for-current-fixed' into i2c/for-5.8
> git bisect  bad 6fe12cdbcfe35ad4726a619a9546822d34fc934c  # 07:05  B      0    15   45   0  i2c: core: support bus regulator controlling in adapter
> # first bad commit: [6fe12cdbcfe35ad4726a619a9546822d34fc934c] i2c: core: support bus regulator controlling in adapter
> git bisect good 6aab46bc52a8f579879d491c9d8062e03caa5c61  # 07:06  G     30     0    0   3  dt-binding: i2c: add bus-supply property
> # extra tests with debug options
> git bisect  bad 6fe12cdbcfe35ad4726a619a9546822d34fc934c  # 07:06  B      0    14   30   0  i2c: core: support bus regulator controlling in adapter
> # extra tests on revert first bad commit
> git bisect good 3788bb973ab542fcf623106a1cef5d8b1e237f7c  # 07:56  G     10     0    0   0  Revert "i2c: core: support bus regulator controlling in adapter"
> # good: [3788bb973ab542fcf623106a1cef5d8b1e237f7c] Revert "i2c: core: support bus regulator controlling in adapter"
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/lkp@lists.01.org
