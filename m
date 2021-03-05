Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660A132E2A9
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Mar 2021 08:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhCEHBC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Mar 2021 02:01:02 -0500
Received: from mga01.intel.com ([192.55.52.88]:40947 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229446AbhCEHBB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Mar 2021 02:01:01 -0500
IronPort-SDR: QJg8GTLdztgxUlZCZIhuHZbogzc9HaK+IZoCsY8L+68eePiokWXIEqVVsUY7tKe9zVjmdIXCgk
 fOf5ydK1GbGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="207321253"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="207321253"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 23:01:01 -0800
IronPort-SDR: /7nGj5Vjksw9JwiZXJVzVDqvU2I8GUq6xo6QwAbMNT25Wo/7ApPJscvq12vRqtu1a3k7zvAsu9
 nUrpCrTQVS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="597681840"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga006.fm.intel.com with ESMTP; 04 Mar 2021 23:00:52 -0800
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
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
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <20210304060638.7qes424vvdmptz5c@vireshk-i7>
 <f3f4aaf8-521c-3e9e-4757-97f2e33e44f6@intel.com>
 <20210305030916.trb35i53rzwf6kyn@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <669d3c4e-d69b-1e0d-6625-ce7d0832c108@intel.com>
Date:   Fri, 5 Mar 2021 15:00:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305030916.trb35i53rzwf6kyn@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/5 11:09, Viresh Kumar wrote:
> On 05-03-21, 09:46, Jie Deng wrote:
>> On 2021/3/4 14:06, Viresh Kumar wrote:
>>> depends on I2C as well ?
>> No need that. The dependency of I2C is included in the Kconfig in its parent
>> directory.
> Sorry about that, I must have figured that out myself.
>
> (Though a note on the way we reply to messages, please leave an empty line
> before and after your messages, it gets difficult to find the inline replies
> otherwise. )
>
>>>> +		if (!(req && req == &reqs[i])) {
>>> I find this less readable compared to:
>>> 		if (!req || req != &reqs[i]) {
>> Different people may have different tastes.
>>
>> Please check Andy's comment in this link.
>>
>> https://lists.linuxfoundation.org/pipermail/virtualization/2020-September/049933.html
> Heh, everyone wants you to do it differently :)
>
> If we leave compilers optimizations aside (because it will generate the exact
> same code for both the cases, I tested it as well to be doubly sure), The
> original statement used in this patch has 3 conditional statements in it and the
> way I suggested has only two.
>
> Andy, thoughts ?
>
> And anyway, this isn't biggest of my worries, just that I had to notice it
> somehow :)
>
>>> For all the above errors where you simply break out, you still need to free the
>>> memory for buf, right ?
>> Will try to use reqs[i].buf = msgs[i].buf to avoid allocation.
> I think it would be better to have all such deallocations done at a single
> place, i.e. after the completion callback is finished.. Trying to solve this
> everywhere is going to make this more messy.


I think there is no need to have allocations/deallocations/memcpy for 
reqs[i].buf any more
if using msgs[i].buf directly.


>>>> +	mutex_lock(&vi->i2c_lock);
>>> I have never worked with i2c stuff earlier, but I don't think you need a lock
>>> here. The transactions seem to be serialized by the i2c-core by itself (look at
>>> i2c_transfer() in i2c-core-base.c), though there is another exported version
>>> __i2c_transfer() but the comment over it says the callers must take adapter lock
>>> before calling it.
>> Lock is needed since no "lock_ops" is registered in this i2c_adapter.
> drivers/i2c/i2c-core-base.c:
>
> static int i2c_register_adapter(struct i2c_adapter *adap)
> {
>          ...
>
>          if (!adap->lock_ops)
>                  adap->lock_ops = &i2c_adapter_lock_ops;
>
>          ...
> }
>
> This should take care of it ?


The problem is that you can't guarantee that adap->algo->master_xfer is 
only called
from i2c_transfer. Any function who holds the adapter can call 
adap->algo->master_xfer
directly. So I think it is safer to have a lock in virtio_i2c_xfer.


>>>> +
>>>> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>>>> +	if (ret == 0)
>>>> +		goto err_unlock_free;
>>>> +
>>>> +	nr = ret;
>>>> +
>>>> +	virtqueue_kick(vq);
>>>> +
>>>> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
>>>> +	if (!time_left) {
>>>> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>>>> +		ret = -ETIMEDOUT;
>>> You need to free bufs of the requests here as well..
> Just want to make sure you didn't miss this comment.


Will try to use msgs[i].buf directly. So it should be no free bufs any more.


>>>> +static struct i2c_adapter virtio_adapter = {
>>>> +	.owner = THIS_MODULE,
>>>> +	.name = "Virtio I2C Adapter",
>>>> +	.class = I2C_CLASS_DEPRECATED,
>>> Why are we using something that is deprecated here ?
>> Warn users that the adapter doesn't support classes anymore.
> So this is the right thing to do? Or this is what we expect from new drivers?
> Sorry, I am just new to this stuff and so...


https://patchwork.ozlabs.org/project/linux-i2c/patch/20170729121143.3980-1-wsa@the-dreams.de/


>>>> +struct virtio_i2c_out_hdr {
>>>> +	__le16 addr;
>>>> +	__le16 padding;
>>>> +	__le32 flags;
>>>> +};
>>> It might be worth setting __packed for the structures here, even when we have
>>> taken care of padding ourselves, for both the structures..
>> Please check Michael's comment https://lkml.org/lkml/2020/9/3/339.
>> I agreed to remove "__packed" .
> When Michael commented the structure looked like this:
>
> Actually it can be ignored as the compiler isn't going to add any padding by
> itself in this case (since you already took care of it) as the structure will be
> aligned to the size of the biggest element here. I generally consider it to be a
> good coding-style to make sure we don't add any unwanted stuff in there by
> mistake.
>
> Anyway, we can see it in future if this is going to be required or not, if and
> when we add new fields here.
>
