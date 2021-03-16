Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190C133CB4C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 03:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbhCPCQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 22:16:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:26012 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230080AbhCPCPz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Mar 2021 22:15:55 -0400
IronPort-SDR: g/oOyX9GElpCtkKe1HaS/o7G3xOnkHEChrM/Lf3N0/fKAQhqSg/MVTx9xYbE/UC7Ac/vPGcvY7
 n9Dbm1MIMVaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="250550829"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="250550829"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 19:15:54 -0700
IronPort-SDR: oTD9KtMZ1jjPn6HxxlOF7zsOZemh5Z32NM5g4Up6ZSwF7Ji3sjGKsLHH8syDq4M9M9HH0NvotD
 zELrdGYi2vyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="432855368"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2021 19:15:49 -0700
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jason Wang <jasowang@redhat.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
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
 <8070f03d-8233-636b-5ea9-395e723f7a2c@intel.com>
 <503b88c9-1e82-a3a3-0536-d710ddc834a5@redhat.com>
 <e388b344-a815-aed3-c076-3651b18c39d1@intel.com>
 <CAK8P3a0LjcSs7gvU-jRdZJCFrfxQcSUWqL_fgH_71VjC027M0w@mail.gmail.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <770332a7-f34d-fe26-f708-830b587a98d5@intel.com>
Date:   Tue, 16 Mar 2021 10:15:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0LjcSs7gvU-jRdZJCFrfxQcSUWqL_fgH_71VjC027M0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/15 15:52, Arnd Bergmann wrote:
> On Mon, Mar 15, 2021 at 6:54 AM Jie Deng <jie.deng@intel.com> wrote:
>> On 2021/3/15 11:13, Jason Wang wrote:
>>> On 2021/3/15 9:14 上午, Jie Deng wrote:
>>>> On 2021/3/12 16:58, Arnd Bergmann wrote:
>> Then do you think it is necessary to mark the virtio bufs with
>> ____cacheline_aligned ?
> I think so, yes.
>
>> I haven't seen any virtio interface being marked yet. If this is a
>> problem, I believe it should  be common for all virtio devices, right ?
> Yes, but it's not a problem if the buffers are allocated separately
> because kmalloc provinces a cachelinen aligned buffer on architectures
> that need it.
>
> It's only a problem here because there is a single allocation for three
> objects that have different ownership states during the DMA (device
> owned to-device, cpu-owned, device owned to-cpu).
>
>         Arnd
I'm not sure if this will actually cause a problem. But I'm OK to mark 
the items
in struct virtio_i2c_req with  ____cacheline_aligned to avoid potential 
problem
as you said.

Thank you.

