Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919D633A93F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 02:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCOBOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Mar 2021 21:14:48 -0400
Received: from mga07.intel.com ([134.134.136.100]:23170 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhCOBOn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Mar 2021 21:14:43 -0400
IronPort-SDR: 45mmlxA4VBKJkn3x3gMLVvquQJQwS7XitgCE/93r+fvhR7YZcDeCneHhNNu+D0hS6Pdt+UY1ug
 tJcfw4twMgGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="253038255"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="253038255"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2021 18:14:42 -0700
IronPort-SDR: 6WehyGfaZkgN3csKE1b1b22pkbFj42af9jfpdGakLe0uNVVQ5rKAYCG99RlHI6oErO2bfhEPnz
 aGsgOE7aPyyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="601256882"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga006.fm.intel.com with ESMTP; 14 Mar 2021 18:14:38 -0700
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
 <CAK8P3a0zQG3pH91emqAUsaRx4AZeuOEvSrPzXP9w_XhjU6w3ng@mail.gmail.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <8070f03d-8233-636b-5ea9-395e723f7a2c@intel.com>
Date:   Mon, 15 Mar 2021 09:14:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0zQG3pH91emqAUsaRx4AZeuOEvSrPzXP9w_XhjU6w3ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/12 16:58, Arnd Bergmann wrote:
> On Fri, Mar 12, 2021 at 2:33 PM Jie Deng <jie.deng@intel.com> wrote:
>
>> +
>> +/**
>> + * struct virtio_i2c_req - the virtio I2C request structure
>> + * @out_hdr: the OUT header of the virtio I2C message
>> + * @buf: the buffer into which data is read, or from which it's written
>> + * @in_hdr: the IN header of the virtio I2C message
>> + */
>> +struct virtio_i2c_req {
>> +       struct virtio_i2c_out_hdr out_hdr;
>> +       uint8_t *buf;
>> +       struct virtio_i2c_in_hdr in_hdr;
>> +};
> The simpler request structure clearly looks better than the previous version,
> but I think I found another problem here, at least a theoretical one:
>
> When you map the headers into the DMA address space, they should
> be in separate cache lines, to allow the DMA mapping interfaces to
> perform cache management on each one without accidentally clobbering
> another member.
>
> So far I think there is an assumption that virtio buffers are always
> on cache-coherent devices, but if you ever have a virtio-i2c device
> backend on a physical interconnect that is not cache coherent (e.g. a
> microcontroller that shares the memory bus), this breaks down.
>
> You could avoid this by either allocating arrays of each type separately,
> or by marking each member that you pass to the device as
> ____cacheline_aligned.
>
>        Arnd
The virtio devices are software emulated. The backend software may need to
consider this since it may exchange data with physical devices. But I 
don't think
we need it for this interface, because no DMA operation is involved 
between the
frontend driver and backend driver.

Regards,

Jie


