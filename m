Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D2936042D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 10:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhDOIVk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 04:21:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:40204 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231518AbhDOIVk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 04:21:40 -0400
IronPort-SDR: vLJQUkkVU4UnMXOO4aH9YLwwxslpLorRIsDT95wfQB7Dakfg2ux4x78x+5QmmK7iITM5NnC8yc
 V6iiuz3Q7kBg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="181935151"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="181935151"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 01:20:52 -0700
IronPort-SDR: 1lU7OEfzIb1pcf5QGGkQIq6NSWFeXJshxPIiKQv7zc0HQF052LS/JhAZBIYs638sShagaId8DW
 sSRCMj1iK0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="421622671"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2021 01:20:47 -0700
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
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
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
Message-ID: <bf672e9b-85ba-e234-8a4e-d562ae7fb7a3@intel.com>
Date:   Thu, 15 Apr 2021 16:20:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
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


Sure. Thank you.


>>>> - Use of I2C_CLASS_DEPRECATED flag, I don't think it is required for
>>>>     new drivers.
>>> This is definately correct :)
>> Do you mean a new driver doesn't need to set the following ?
>>
>> vi->adap.class = I2C_CLASS_DEPRECATED;
>>
>> Just leave the class to be 0 ?
> Yes. DEPRECATED is only for drivers which used to have a class and then
> chose to remove it.


Got it. Thanks for your clarification.


