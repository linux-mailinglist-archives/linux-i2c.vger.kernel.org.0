Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6EF63415B2
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 07:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234118AbhCSGaU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 02:30:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:53277 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234204AbhCSG35 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 02:29:57 -0400
IronPort-SDR: Trhw8bq3cHXVsrDYu9+YUHl0cpJaHV+5zIpoarC93WSfmShgV72ef97JYdvRHOZb+JGcxDrHAv
 7Q/SbMWATwMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177425814"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="177425814"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 23:29:57 -0700
IronPort-SDR: Z+iU2LMcXO03I1DkvriMCElufQFjcq3JHzhwAtDue0CFb74BoeLOj/mXV8+dztJsWfySujgFT2
 YdDwv2g0MmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="591759461"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2021 23:29:51 -0700
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
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <834186be-71b1-a67c-8dee-b90527b459c8@intel.com>
Date:   Fri, 19 Mar 2021 14:29:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319054035.47tn747lkagpip6v@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/19 13:40, Viresh Kumar wrote:
> On 19-03-21, 13:31, Jie Deng wrote:
>> On 2021/3/19 11:54, Viresh Kumar wrote:
>>> On 18-03-21, 15:52, Arnd Bergmann wrote:
>>>> Allowing multiple virtio-i2c controllers in one system, and multiple i2c
>>>> devices attached to each controller is clearly something that has to work.
>>> Good.
>>>
>>>> I don't actually see a limitation though. Viresh, what is the problem
>>>> you see for having multiple controllers?
>>> I thought this would be a problem in that case as we are using the global
>>> virtio_adapter here.
>>>
>>> +       vi->adap = &virtio_adapter;
>>> +       i2c_set_adapdata(vi->adap, vi);
>>>
>>> Multiple calls to probe() will end up updating the same pointer inside adap.
>>>
>>> +       vi->adap->dev.parent = &vdev->dev;
>>>
>>> Same here, overwrite.
>>>
>>> +       /* Setup ACPI node for controlled devices which will be probed through ACPI */
>>> +       ACPI_COMPANION_SET(&vi->adap->dev, ACPI_COMPANION(pdev));
>>> +       vi->adap->timeout = HZ / 10;
>>>
>>> These may be fine, but still not ideal I believe.
>>>
>>> +       ret = i2c_add_adapter(vi->adap);
>>> i
>>> This should be a problem as well, we must be adding this to some sort of list,
>>> doing some RPM stuff, etc ?
>>>
>>> Jie, the solution is to allocate memory for adap at runtime in probe and remove
>>> the virtio_adapter structure completely.
>>
>> If you want to support that. Then I think we don't need to change the
>> following at all.
>>
>>> +    .algo = &virtio_algorithm,
>>> +
>>> +        return ret;
>>> +
>>> +    vi->adap = virtio_adapter;
>> This is strange, why are you allocating memory for adapter twice ?
>> Once for virtio_adapter and once for vi->adap ? Either fill the fields
>> directly for v->adap here and remove virtio_adapter or make vi->adap a
>> pointer.
> Yes, your previous version was partly okay but you don't need the
> virtio_algorithm structure to be allocated. There are only 4 fields you are
> updating here, just fill them directly in vi->adap.
>
> (FWIW, I also suggested the same when I said
> "Either fill the fields directly for v->adap here and remove virtio_adapter".
> )
>
> See how drivers/i2c/busses/i2c-versatile.c and most of the other drivers have
> done it.
I also see example drivers/i2c/busses/i2c-xiic.c. Some people might 
think this way is more clearer than

updating each member in probe. Basically, I think it's just a matter of 
personal preference which doesn't

solve any problems.


