Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322BD392800
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 08:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhE0GvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 02:51:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:29272 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhE0GvE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 02:51:04 -0400
IronPort-SDR: JXnUHM/qNB1gHTDYhRx7oCrE2R/totQ9B/YK4Rcd8vyEX1+fCDzo6JZ/pXYuRssC7ZvUJr0r63
 LsVR8FM0aPvg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="189783144"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="189783144"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 23:49:31 -0700
IronPort-SDR: JfprkGlafku4ogdusz3p4L1MW8Y58pPf0ZTIzntLxSROntVCtCRzbr6y4tBl0Vz5h0mJ6W04SU
 DVSs3ObhFQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="477353474"
Received: from unknown (HELO [10.239.154.58]) ([10.239.154.58])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2021 23:49:26 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
 <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
 <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
 <20210415072131.GA1006@kunai> <20210415072431.apntpcwrk5hp6zg4@vireshk-i7>
 <20210415072823.GB1006@kunai>
 <6849a8f0-204a-362a-ed97-e910065ab14f@intel.com>
 <20210415081828.GD1006@kunai>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <e6523755-b0ac-c31f-d640-dd016fb8eff1@intel.com>
Date:   Thu, 27 May 2021 14:49:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210415081828.GD1006@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/4/15 16:18, Wolfram Sang wrote:
> On Thu, Apr 15, 2021 at 04:15:07PM +0800, Jie Deng wrote:
>> On 2021/4/15 15:28, Wolfram Sang wrote:
>>
>>>> Now that we were able to catch you, I will use the opportunity to
>>>> clarify the doubts I had.
>>>>
>>>> - struct mutex lock in struct virtio_i2c, I don't think this is
>>>>     required since the core takes care of locking in absence of this.
>>> This is likely correct.
>> OK. Then I will remove the lock.
> Let me have a look first, please.


Hi Wolfram,

I didn't receive your feedback yet. Do you have any more comments ?

Thanks.


