Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AF332B263
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242122AbhCCBP1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:15:27 -0500
Received: from mga17.intel.com ([192.55.52.151]:40586 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377246AbhCBISi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Mar 2021 03:18:38 -0500
IronPort-SDR: N6kvv+IgM9DU2Mpz7OC5g4OEpxsVZP9ralCx60D2yhEcfChcTfgBKZT5uY+pHkCUDe+H7Xc6ar
 vJvl5YEdfcag==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="166609999"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="166609999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 00:17:56 -0800
IronPort-SDR: Zk/qHBoeVuRAu6KOKJGR9bqTbUrVEs9uQYZ5/TOXES1oPZbRbHVpCa6l/96qY+eBWB24cU8XmB
 cSSzrX/ee9/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="444649690"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2021 00:17:49 -0800
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Paolo Bonzini <pbonzini@redhat.com>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
 <16efea9f-d606-4cf9-9213-3c1cf9b1a906@intel.com>
 <20210302034323.gkqymzngyqofrdsr@vireshk-i7>
 <b99b18e1-06a5-f526-a885-dc663da3612b@intel.com>
 <20210302072431.ml4veczbelyjbhkt@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <720f5c0a-032c-b7af-4ca6-cd5adca77c37@intel.com>
Date:   Tue, 2 Mar 2021 16:17:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302072431.ml4veczbelyjbhkt@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/2 15:24, Viresh Kumar wrote:
> On 02-03-21, 14:24, Jie Deng wrote:
>> Not for the full duplex. As Paolo explained in those links.
>> We defined a combined request called "write-read request"
>>
>> "
>> This is when a write is followed by a read: the master
>> starts off the transmission with a write, then sends a second START,
>> then continues with a read from the same address.
> I think above talks about the real I2C protocol at bus level ?
>
>> In theory there's no difference between one multi-segment transaction
>> and many single-segment transactions _in a single-master scenario_.
>>
>> However, it is a plausible configuration to have multiple guests sharing
>> an I2C host device as if they were multiple master.
>>
>> So the spec should provide a way at least to support for transactions with
>> 1 write and 1 read segment in one request to the same address.
>> "
>>  From the perspective of specification design, it hopes to provide more
>> choices
>> while from the perspective of specific implementation, we can choose what we
>> need
>> as long as it does not violate the specification.
> That is fine, but what I was not able to understand was how do we get
> to know if we should expect both write and read bufs after the out
> header or only one of them ?
>
> I think I have understood that part now, we need to look at incnt and
> outcnt and make out what kind of transfer we need to do.
>
> - If outcnt == 1 and incnt == 2, then it is read operation.
> - If outcnt == 2 and incnt == 1, then it is write operation.
> - If outcnt == 2 and incnt == 2, then it is read-write operation.
>
> Anything else is invalid. Is my understanding correct here ?
Correct.  By checking the sequences of descriptor's R/W in the virtqueue,
You can know the type of request. A simple state machine can be used to
classify in this case.

O I  I   : read request.

O O I  : write request.

O O I I : read-write request.

But if only using the first two types like in this driver, the backend 
will be much easier to
implement since the request is fixed to 3 descriptors and we only need 
to check the second
descriptor to know the type.
>
>> Since the current Linux driver doesn't use this mechanism. I'm considering
>> to move
>> the "struct virtio_i2c_req" into the driver and use one "buf" instead.
> Linux can very much have its own definition of the structure and so I
> am not in favor of any such structure in the spec as well, it confuses
> people (like me) :).
>
