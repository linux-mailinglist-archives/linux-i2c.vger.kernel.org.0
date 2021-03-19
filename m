Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD60C341628
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 07:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbhCSG46 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 02:56:58 -0400
Received: from mga02.intel.com ([134.134.136.20]:35805 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233946AbhCSG4o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 02:56:44 -0400
IronPort-SDR: NS7vM/VI3dzze2gGrMJTY7nMCBdcs82krzb/I0zooxLeap7rUm+sf1N/g4UL0d1c1gvr/RwopR
 x8x8MbqEwZEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="176972790"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="176972790"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 23:56:44 -0700
IronPort-SDR: 4XLjY1071ohxFYhhnhny34Lao8zBShsKovY4BIxPfFqwJ15K+l+6lMrmq2UM+QC0m+/gSkf93q
 60GYy2IGhDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="591765584"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2021 23:56:37 -0700
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7>
 <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
 <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
 <20210319035435.a4reve77hnvjdzwk@vireshk-i7>
 <b135b474-b167-67ad-588c-b0cfe8dc2998@intel.com>
 <20210319054035.47tn747lkagpip6v@vireshk-i7>
 <834186be-71b1-a67c-8dee-b90527b459c8@intel.com>
 <20210319063553.eq5aorcyiame6u2e@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <6df192ef-abc1-35a6-298d-e3e67655ac1f@intel.com>
Date:   Fri, 19 Mar 2021 14:56:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319063553.eq5aorcyiame6u2e@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/19 14:35, Viresh Kumar wrote:
> On 19-03-21, 14:29, Jie Deng wrote:
>> I also see example drivers/i2c/busses/i2c-xiic.c. Some people might think
>> this way is more clearer than
>>
>> updating each member in probe. Basically, I think it's just a matter of
>> personal preference which doesn't
> Memory used by one instance of struct i2c_adapter (on arm64):
>
> struct i2c_adapter {
>          struct module *            owner;                /*     0     8 */
>          unsigned int               class;                /*     8     4 */
>
>          /* XXX 4 bytes hole, try to pack */
>
>          const struct i2c_algorithm  * algo;              /*    16     8 */
>          void *                     algo_data;            /*    24     8 */
>          const struct i2c_lock_operations  * lock_ops;    /*    32     8 */
>          struct rt_mutex            bus_lock;             /*    40    32 */
>          /* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
>          struct rt_mutex            mux_lock;             /*    72    32 */
>          int                        timeout;              /*   104     4 */
>          int                        retries;              /*   108     4 */
>          struct device              dev;                  /*   112   744 */
>
>          /* XXX last struct has 7 bytes of padding */
>
>          /* --- cacheline 13 boundary (832 bytes) was 24 bytes ago --- */
>          long unsigned int          locked_flags;         /*   856     8 */
>          int                        nr;                   /*   864     4 */
>          char                       name[48];             /*   868    48 */
>
>          /* XXX 4 bytes hole, try to pack */
>
>          /* --- cacheline 14 boundary (896 bytes) was 24 bytes ago --- */
>          struct completion          dev_released;         /*   920    32 */
>          struct mutex               userspace_clients_lock; /*   952    32 */
>          /* --- cacheline 15 boundary (960 bytes) was 24 bytes ago --- */
>          struct list_head           userspace_clients;    /*   984    16 */
>          struct i2c_bus_recovery_info * bus_recovery_info; /*  1000     8 */
>          const struct i2c_adapter_quirks  * quirks;       /*  1008     8 */
>          struct irq_domain *        host_notify_domain;   /*  1016     8 */
>          /* --- cacheline 16 boundary (1024 bytes) --- */
>
>          /* size: 1024, cachelines: 16, members: 19 */
>          /* sum members: 1016, holes: 2, sum holes: 8 */
>          /* paddings: 1, sum paddings: 7 */
> };
>
> So, this extra instance that i2c-xiic.c is creating (and that you want to
> create) is going to waste 1KB of memory and it will never be used.
>
> This is bad coding practice IMHO and it is not really about personal preference.


I will remove that structure and update the members in probe.


