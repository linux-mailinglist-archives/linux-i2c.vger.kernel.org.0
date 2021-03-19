Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D263415EF
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 07:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbhCSGgI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 02:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234062AbhCSGf6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 02:35:58 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D039DC06175F
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 23:35:57 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id o2so2494025plg.1
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 23:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q74zS7MVCJ6+mtqeFREbaTe1MM1sTAChPdcOZcYNJoc=;
        b=hAASVLc1qaPFBkm0SOus4f8qd39kCnEk0PbdJZ3TQPitcWEIcMlolwES9ZKoYwElP6
         gyV61PlzPUTxGPh6WLqK2dxUEwap82S9tFnJmQDpiDzH6QTCDFIQeDPhIhNZ8SHBJDu6
         Xo2qWse7VIxNUqT9I+JMbOvRCyI8crMEKoUgbs8Gak5y8fDjL09vgiCbAjM2ptbtEBXc
         vwYAEN5BGOW2d/V2l2C88P/YHD5GrR5lvfhmnpi1gFpQ1ADCfynkoJ/BRhY3JMuqEZ+7
         bVSdhmx+3QBGsTOaMHcjfKBMMfmd2J6I6DpsnjMCxj4rbL+WIRFA9BPIr+yLs7Iul1Aw
         wEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q74zS7MVCJ6+mtqeFREbaTe1MM1sTAChPdcOZcYNJoc=;
        b=B6py5Mq7V6w77ZEpga2HWKjeu6I/hKWTCIWwMNLCOzMr0WYRK7ZrSwVbZTQg5OZ9PA
         ZitPD80eMtF289gSA+Det39WEmivL/O3K7C+t8jZinH/yQIixf9PA0khHn4I9bZzxVLy
         ywrjV1sNhOKXWRtQmeYUTC9xGadUI5kMI5VHFX1/p06mKbgEjaN00t/qGhnnAmxGU8oM
         42HZWXZUWfW6cqTK/rNKFFILv4k9yCfFPIxCDHYeT8sQr+FS+4klWQhu2fWFiPmBIJob
         Faww/Y+gSKYBE/iK4sZ+8Aa0eHOsRWj8mnPnVj95yzDXdMw3IQkzdgo0v44fd07wqH28
         56qg==
X-Gm-Message-State: AOAM532rcWusTm7zvccaLZTHg9kkh2BC0su5XdbhEjf6liCnkQ94eU7Y
        XJwXrLn/N3FzwtMwU0o+aB34Wg==
X-Google-Smtp-Source: ABdhPJxhWhEcSy/4JhxjBSwe7tT4AekOp57Xk7YkyHMyTD/IvvgAbZZ+HBwcQDuefnhUVwgYsNUcow==
X-Received: by 2002:a17:90b:4a8b:: with SMTP id lp11mr8190251pjb.141.1616135757148;
        Thu, 18 Mar 2021 23:35:57 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id u2sm4057031pjy.14.2021.03.18.23.35.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 23:35:55 -0700 (PDT)
Date:   Fri, 19 Mar 2021 12:05:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
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
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210319063553.eq5aorcyiame6u2e@vireshk-i7>
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7>
 <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
 <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
 <20210319035435.a4reve77hnvjdzwk@vireshk-i7>
 <b135b474-b167-67ad-588c-b0cfe8dc2998@intel.com>
 <20210319054035.47tn747lkagpip6v@vireshk-i7>
 <834186be-71b1-a67c-8dee-b90527b459c8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <834186be-71b1-a67c-8dee-b90527b459c8@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19-03-21, 14:29, Jie Deng wrote:
> I also see example drivers/i2c/busses/i2c-xiic.c. Some people might think
> this way is more clearer than
> 
> updating each member in probe. Basically, I think it's just a matter of
> personal preference which doesn't

Memory used by one instance of struct i2c_adapter (on arm64):

struct i2c_adapter {
        struct module *            owner;                /*     0     8 */
        unsigned int               class;                /*     8     4 */

        /* XXX 4 bytes hole, try to pack */

        const struct i2c_algorithm  * algo;              /*    16     8 */
        void *                     algo_data;            /*    24     8 */
        const struct i2c_lock_operations  * lock_ops;    /*    32     8 */
        struct rt_mutex            bus_lock;             /*    40    32 */
        /* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
        struct rt_mutex            mux_lock;             /*    72    32 */
        int                        timeout;              /*   104     4 */
        int                        retries;              /*   108     4 */
        struct device              dev;                  /*   112   744 */

        /* XXX last struct has 7 bytes of padding */

        /* --- cacheline 13 boundary (832 bytes) was 24 bytes ago --- */
        long unsigned int          locked_flags;         /*   856     8 */
        int                        nr;                   /*   864     4 */
        char                       name[48];             /*   868    48 */

        /* XXX 4 bytes hole, try to pack */

        /* --- cacheline 14 boundary (896 bytes) was 24 bytes ago --- */
        struct completion          dev_released;         /*   920    32 */
        struct mutex               userspace_clients_lock; /*   952    32 */
        /* --- cacheline 15 boundary (960 bytes) was 24 bytes ago --- */
        struct list_head           userspace_clients;    /*   984    16 */
        struct i2c_bus_recovery_info * bus_recovery_info; /*  1000     8 */
        const struct i2c_adapter_quirks  * quirks;       /*  1008     8 */
        struct irq_domain *        host_notify_domain;   /*  1016     8 */
        /* --- cacheline 16 boundary (1024 bytes) --- */

        /* size: 1024, cachelines: 16, members: 19 */
        /* sum members: 1016, holes: 2, sum holes: 8 */
        /* paddings: 1, sum paddings: 7 */
};

So, this extra instance that i2c-xiic.c is creating (and that you want to
create) is going to waste 1KB of memory and it will never be used.

This is bad coding practice IMHO and it is not really about personal preference.

-- 
viresh
