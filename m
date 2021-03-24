Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77D3346E5A
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 01:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbhCXAxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 20:53:47 -0400
Received: from mga02.intel.com ([134.134.136.20]:7887 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230475AbhCXAxm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Mar 2021 20:53:42 -0400
IronPort-SDR: CYMrWmbvxZy44HCxByZFaFBFSK5TdUB6DCDzcrLsMx5nlihYx5GryCzUqslKOZJUr5Y+mKUeir
 JSjYNQbvcZUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="177716282"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="177716282"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 17:53:41 -0700
IronPort-SDR: AYUOOpG1XUognPuZnimdo4CPPCLZYHUifyfk2hiTiY9LSTG4F2iUFi/YfSHAzbNwsVCNuobBS5
 8XOkYFitOEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="441963415"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2021 17:53:35 -0700
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
 <20210323090108.ygx76exdgzudeeqi@vireshk-i7>
 <20210323093839.n7cq7f5poebqdwit@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <5a415dbe-8e3b-2731-cc52-19aeadda1a17@intel.com>
Date:   Wed, 24 Mar 2021 08:53:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323093839.n7cq7f5poebqdwit@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/23 17:38, Viresh Kumar wrote:
> On 23-03-21, 14:31, Viresh Kumar wrote:
>> On 23-03-21, 22:19, Jie Deng wrote:
>>> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>>> +{
>>> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
>>> +	struct virtqueue *vq = vi->vq;
>>> +	struct virtio_i2c_req *reqs;
>>> +	unsigned long time_left;
>>> +	int ret, nr;
>>> +
>>> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
>>> +	if (!reqs)
>>> +		return -ENOMEM;
>>> +
>>> +	mutex_lock(&vi->lock);
>>> +
>>> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>>> +	if (ret == 0)
>>> +		goto err_unlock_free;
>>> +
>>> +	nr = ret;
>>> +	reinit_completion(&vi->completion);
>> I think I may have found a possible bug here. This reinit_completion() must
>> happen before we call virtio_i2c_send_reqs(). It is certainly possible (surely
>> in corner cases) that virtio_i2c_msg_done() may get called right after
>> virtio_i2c_send_reqs() and before we were able to call reinit_completion(). And
>> in that case we will never see the completion happen at all.
>>
>>> +	virtqueue_kick(vq);
> I may have misread this. Can the actually start before virtqueue_kick() is
> called ?


No. It starts when wait_for_completion_timeout is called.

So it should be fine here.


>   If not, then completion may be fine where it is.
>
