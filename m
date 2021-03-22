Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28137343AF8
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 08:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCVHyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 03:54:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:39597 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhCVHxn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 03:53:43 -0400
IronPort-SDR: B0Bs9BaNQquaNQIb9rsWegplVZnRs3+itUBgvDmWvA7kj9rUqEpw8u3Hzoa6TIkirehTTlIeXQ
 LGphizkpeOYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="177352916"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="177352916"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 00:53:42 -0700
IronPort-SDR: zgU0rmsxDry5X4QjX4pUlRJvBNvqDip4gkVX7iBQef89oRvoq8EmDs7cC4K5N8zrCNJ1v6z/jT
 UnakFcneIGkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="414378048"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga008.jf.intel.com with ESMTP; 22 Mar 2021 00:53:37 -0700
Subject: Re: [PATCH v9] i2c: virtio: add a virtio i2c frontend driver
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
References: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
 <20210322064144.y6kpajolwh2kd3lj@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <dbb5dfe9-8ee6-e3f8-3681-d0ec83282930@intel.com>
Date:   Mon, 22 Mar 2021 15:53:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322064144.y6kpajolwh2kd3lj@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/22 14:41, Viresh Kumar wrote:
>
>> +/**
>> + * struct virtio_i2c - virtio I2C data
>> + * @vdev: virtio device for this controller
>> + * @completion: completion of virtio I2C message
>> + * @adap: I2C adapter for this controller
>> + * @i2c_lock: lock for virtqueue processing
> Name mismatch here.


Will fix this typo. Thank you.


>> + * @vq: the virtio virtqueue for communication
>> + */
>> +struct virtio_i2c {
>> +	struct virtio_device *vdev;
>> +	struct completion completion;
>> +	struct i2c_adapter adap;
>> +	struct mutex lock;
>> +	struct virtqueue *vq;
>> +};
>
>> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>> +					struct virtio_i2c_req *reqs,
>> +					struct i2c_msg *msgs, int nr,
>> +					bool timeout)
>> +{
>> +	struct virtio_i2c_req *req;
>> +	bool err_found = false;
>> +	unsigned int len;
>> +	int i, j = 0;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		/* Detach the ith request from the vq */
>> +		req = virtqueue_get_buf(vq, &len);
>> +
>> +		if (timeout || err_found)  {
>> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * Condition (req && req == &reqs[i]) should always meet since
>> +		 * we have total nr requests in the vq.
>> +		 */
>> +		if (WARN_ON(!(req && req == &reqs[i])) ||
>> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)) {
>> +			err_found = true;
>> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
>> +			continue;
>> +		}
>> +
>> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], true);
>> +		++j;
>> +	}
> I think you can simplify the code like this here:


I think your optimization has problems...


> 	bool err_found = timeout;
>
> 	for (i = 0; i < nr; i++) {
> 		/* Detach the ith request from the vq */
> 		req = virtqueue_get_buf(vq, &len);
>
> 		/*
> 		 * Condition (req && req == &reqs[i]) should always meet since
> 		 * we have total nr requests in the vq.
> 		 */
> 		if (!err_found &&
>                      (WARN_ON(!(req && req == &reqs[i])) ||
> 		     (req->in_hdr.status != VIRTIO_I2C_MSG_OK))) {
> 			err_found = true;
> 			continue;


Just continue here, the ith buf leaks ?


> 		}
>
> 		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], err_found);


i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !err_found); ?


>                  if (!err_found)
>                          ++j;
>
>> +
>> +	return (timeout ? -ETIMEDOUT : j);
>> +}
>> +
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
>> +
>> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
>> +	if (!time_left) {
>> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>> +		ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr, true);
>> +		goto err_unlock_free;
>> +	}
>> +
>> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr, false);
> And this can be optimized as well:
>
> 	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> 	if (!time_left)
> 		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>
>          ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr, !time_left);


Good optimization here.


