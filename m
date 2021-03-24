Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FC434715E
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 07:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCXGFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 02:05:25 -0400
Received: from mga01.intel.com ([192.55.52.88]:20921 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233362AbhCXGFO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Mar 2021 02:05:14 -0400
IronPort-SDR: E4oOKEIjOmX8xOKKO/eBYOUUdTTLJLk/HGO/RNI8u7RgAKwp4Fwam9h9cQatRb3iLCp9GfEaEC
 1HWm167KZ3+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="210734963"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="210734963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 23:05:12 -0700
IronPort-SDR: ffBpDW2qAgf19Id2gs+eF8QreDYeQi7v+GUNT2JBW0osN7x1s0leWgZWgf8wiue88FhrwqVszp
 cHhKK5MjbhMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="442065548"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2021 23:05:07 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
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
        pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210324042046.idkctj2t7cxi53jf@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <70908366-c270-848e-0be3-c85fec7958ec@intel.com>
Date:   Wed, 24 Mar 2021 14:05:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324042046.idkctj2t7cxi53jf@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/24 12:20, Viresh Kumar wrote:
> On 23-03-21, 22:19, Jie Deng wrote:
>> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>> +{
>> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
>> +	struct virtqueue *vq = vi->vq;
>> +	struct virtio_i2c_req *reqs;
>> +	unsigned long time_left;
>> +	int ret, nr;
>> +
>> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
>> +	if (!reqs)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&vi->lock);
>> +
>> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>> +	if (ret == 0)
>> +		goto err_unlock_free;
>> +
>> +	nr = ret;
>> +	reinit_completion(&vi->completion);
>> +	virtqueue_kick(vq);
> Coming back to this again, what is the expectation from the other side for this
> ? I mean there is no obvious relation between the *msgs* which we are going to
> transfer (from the other side's or host's point of view). When should the host
> OS call its virtqueue_kick() counterpart ?
>
> Lemme give an example for this. Lets say that we need to transfer 3 messages
> here in this routine. What we did was we prepared virtqueue for all 3 messages
> together and then called virtqueue_kick().
>
> Now if the other side (host) processes the first message and sends its reply
> (with virtqueue_kick() counterpart) before processing the other two messages,
> then it will end up calling virtio_i2c_msg_done() here. That will make us call
> virtio_i2c_complete_reqs(), while only the first messages is processed until
> now and so we will fail for the other two messages straight away.
>
> Should we send only 1 message from i2c-virtio linux driver and then wait for
> virtio_i2c_msg_done() to be called, before sending the next message to make sure
> it doesn't break ?


For simplicity, the original patch sent only 1 message to vq each time . 
I changed the way to send

a batch of requests in one time in order to improve efficiency according 
to Jason' suggestion.

As we discussed in the previous emails, the device can raise interrupt 
when some requests are still not completed

though this is not a good operation.  In this case, the remaining 
requests in the vq will be ignored and

the i2c_algorithm. master_xfer will return 1 for your example. I will 
clarify this in the specs.



