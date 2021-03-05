Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF5E32E36E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Mar 2021 09:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCEINE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Mar 2021 03:13:04 -0500
Received: from mga12.intel.com ([192.55.52.136]:13733 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhCEIMv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Mar 2021 03:12:51 -0500
IronPort-SDR: xIjIGXCsTMqPQY8M22lwwS81msckS/WRZDrwpP9oL7mUfrEIJMaB/QsxHcJZlK4O56u8o8ef/2
 S2ay84/H83MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="166863983"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="166863983"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 00:12:51 -0800
IronPort-SDR: gOM/RV1MGFF6djhiCzZwd71anEmVTMnJCG2twRD5Am2DSoCo9aEygW3cGFIEUahEX4KzpyYu8z
 HmXiSROUba8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="597700002"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga006.fm.intel.com with ESMTP; 05 Mar 2021 00:12:45 -0800
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa@kernel.org, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
 <76554717-fc77-1c63-58d2-58aa04f7af9b@intel.com>
 <7aa23b71-01eb-5824-b1db-892ede690fce@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <b1b66c2a-beec-c864-77a0-3bd0c6842e2e@intel.com>
Date:   Fri, 5 Mar 2021 16:12:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7aa23b71-01eb-5824-b1db-892ede690fce@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/5 15:23, Jason Wang wrote:

>
>>>> +    virtqueue_kick(vq);
>>>> +
>>>> +    time_left = wait_for_completion_timeout(&vi->completion, 
>>>> adap->timeout);
>>>> +    if (!time_left) {
>>>> +        dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>>>> +        ret = -ETIMEDOUT;
>>>> +        goto err_unlock_free;
>>>
>>>
>>> So if the request is finished after the timerout, all the following 
>>> request will fail, is this expected?
>>>
>>>
>> This is an expected behavior. If timeout happens, we don't need to 
>> care about the requests whether
>> really completed by "HW" or not. Just return error and let the i2c 
>> core to decide whether to resend.
>
>
> So you need at least reinit the completion at least?
>

Right. Will fix it. Thank you.


>
>>>> +    }
>>>> +
>>>> +    ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr);
>>>
>>>
>>> So consider driver queue N requests, can device raise interrupt if 
>>> it completes the first request? If yes, the code break, if not it 
>>> need to be clarified in the spec.
>> The device can raise interrupt when some requests are still not 
>> completed though this is not a good operation.
>
>
> Then you need forbid this in the spec.
>

Yeah, but I think we can add some description to explain this clearly 
instead of forbid it directly.


>
>> In this case, the remaining requests in the vq will be ignored and 
>> the i2c_algorithm. master_xfer will return 1 for
>> your example. And let the i2c core to decide whether to resend.
>>>
>>> Acaultly I remember there's no VIRTIO_I2C_FLAGS_FAIL_NEXT in 
>>> previous versions, and after reading the spec I still don't get the 
>>> motivation for that (it may complicates both driver and device 
>>> actually).
>>>
>> This flag is introduced by Stefan. Please check following link for 
>> the details
>> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00075.html. 
>>
>
>
> > We just need to make sure that once the driver adds some requests to 
> the
> > virtqueue,
> > it should complete them (either success or fail) before adding new 
> requests.
> > I think this
> > is a behavior of physical I2C adapter drivers and we can follow.
>
>
> Is this a driver requirement or device? If it's the driver, the code 
> have already did something like this. E.g you wait for the completion 
> of the request and forbid new request via i2c_lock.
>
> Thanks
>

The driver.  VIRTIO_I2C_FLAGS_FAIL_NEXT doesn't help in Linux driver. 
But I agree with Stefan that
VIRTIO is not specific to Linux so the specs design should avoid the 
limitations of the current
Linux driver behavior.


>
>>
>
