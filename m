Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D971D32B240
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242027AbhCCBPG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:15:06 -0500
Received: from mga07.intel.com ([134.134.136.100]:40780 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1835941AbhCBG3E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Mar 2021 01:29:04 -0500
IronPort-SDR: HGl9bUtvDsbikKjEiRvFFuMr2O2s4an9eFVixOyJEDgPm1J5dNbUt54qnbN++kKmgGyZzbJEPh
 +bfwGWgEMU7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="250753309"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="250753309"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 22:28:16 -0800
IronPort-SDR: 4HEhIRxtLlBjbR5Mq0Pp6v5Wx40ez790z7ZwrTBe9T3G/JC2/2KZSjqbv1hsWgiGI5g7TMbXCP
 Y87wtZlJrYGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="444614627"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga001.jf.intel.com with ESMTP; 01 Mar 2021 22:28:09 -0800
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
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <664d590d-b43f-1829-3ea0-44a4054dfca6@intel.com>
Date:   Tue, 2 Mar 2021 14:28:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302034323.gkqymzngyqofrdsr@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/2 11:43, Viresh Kumar wrote:
> On 02-03-21, 10:21, Jie Deng wrote:
>> On 2021/3/1 19:54, Viresh Kumar wrote:
>> That's my original proposal. I used to mirror this interface with "struct
>> i2c_msg".
>>
>> But the design philosophy of virtio TC is that VIRTIO devices are not
>> specific to Linux
>> so the specs design should avoid the limitations of the current Linux driver
>> behavior.
> Right, I understand that.
>
>> We had some discussion about this. You may check these links to learn the
>> story.
>> https://lists.oasis-open.org/archives/virtio-comment/202010/msg00016.html
>> https://lists.oasis-open.org/archives/virtio-comment/202010/msg00033.html
>> https://lists.oasis-open.org/archives/virtio-comment/202011/msg00025.html
> So the thing is that we want to support full duplex mode, right ?
>
> How will that work protocol wise ? I mean how would we know if we are
> expecting both tx and rx buffers in a transfer ?

Not for the full duplex. As Paolo explained in those links.
We defined a combined request called "write-read request"

"
This is when a write is followed by a read: the master
starts off the transmission with a write, then sends a second START,
then continues with a read from the same address.

In theory there's no difference between one multi-segment transaction
and many single-segment transactions _in a single-master scenario_.

However, it is a plausible configuration to have multiple guests sharing
an I2C host device as if they were multiple master.

So the spec should provide a way at least to support for transactions with
1 write and 1 read segment in one request to the same address.

"

 From the perspective of specification design, it hopes to provide more 
choices
while from the perspective of specific implementation, we can choose 
what we need
as long as it does not violate the specification.

Since the current Linux driver doesn't use this mechanism. I'm 
considering to move
the "struct virtio_i2c_req" into the driver and use one "buf" instead.
