Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5ED3416E2
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 08:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbhCSHwb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 03:52:31 -0400
Received: from mga18.intel.com ([134.134.136.126]:42592 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234219AbhCSHwM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 03:52:12 -0400
IronPort-SDR: mnyaeRxkHKq4Q3yoSFWEYdq6knL+vA01SugPujhMfqyX90BumAqIqaD4KPk0lV8w6nf3MQ69Y7
 Q0H08Rpbz8HA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177435365"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="177435365"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 00:52:12 -0700
IronPort-SDR: zjPrexRqxtCYtRmHSXN7LMBzQIpIurWqPudlUyZdovv25pEGo65DEw15rZi79Jkq9SEiI2HO/Z
 mJQSmrk8TaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="591782733"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga005.jf.intel.com with ESMTP; 19 Mar 2021 00:52:06 -0700
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
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
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210319055322.lw4dhb2kwtrtd3qu@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <3eedeab5-04e6-885a-20f2-3ff2f05cf7d0@intel.com>
Date:   Fri, 19 Mar 2021 15:52:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319055322.lw4dhb2kwtrtd3qu@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/19 13:53, Viresh Kumar wrote:
> On 16-03-21, 18:35, Jie Deng wrote:
>> +++ b/drivers/i2c/busses/i2c-virtio.c
>> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
>> +				struct virtio_i2c_req *reqs,
>> +				struct i2c_msg *msgs, int nr)
>> +{
>> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
>> +	int i, outcnt, incnt, err = 0;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		if (!msgs[i].len)
>> +			break;
>> +
>> +		/*
>> +		 * Only 7-bit mode supported for this moment. For the address format,
>> +		 * Please check the Virtio I2C Specification.
>> +		 */
>> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
>> +
>> +		if (i != nr - 1)
>> +			reqs[i].out_hdr.flags = cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT);
>> +
>> +		outcnt = incnt = 0;
>> +		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
>> +		sgs[outcnt++] = &out_hdr;
>> +
>> +		reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
> You allocate a buffer here, lets see if they are freeing properly or not (I
> remember that I gave same feedback earlier as well, but anyway).


"MAY" allocate a buffer here.


>
>> +		if (!reqs[i].buf)
>> +			break;
>> +
>> +		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
>> +
>> +		if (msgs[i].flags & I2C_M_RD)
>> +			sgs[outcnt + incnt++] = &msg_buf;
>> +		else
>> +			sgs[outcnt++] = &msg_buf;
>> +
>> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
>> +		sgs[outcnt + incnt++] = &in_hdr;
>> +
>> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
>> +		if (err < 0) {
>> +			pr_err("failed to add msg[%d] to virtqueue.\n", i);
>> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
> On failure here, you freed the buffers for request "i" but not others..


Others still need to be sent and then be freed.


>
>> +			break;
>> +		}
>> +	}
>> +
>> +	return i;
>> +}
>> +
>> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>> +					struct virtio_i2c_req *reqs,
>> +					struct i2c_msg *msgs, int nr)
>> +{
>> +	struct virtio_i2c_req *req;
>> +	unsigned int len;
>> +	int i, j;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		req = virtqueue_get_buf(vq, &len);
>> +		if (!(req && req == &reqs[i])) {
>> +			pr_err("msg[%d]: addr=0x%x is out of order.\n", i, msgs[i].addr);
>> +			break;
> Since you break here, what will happen to the buffer ? I thought
> virtqueue_get_buf() will return a req only once and then you can't access it ?


Will refine it along with the latter loop.


>
>> +		}
>> +
>> +		if (req->in_hdr.status != VIRTIO_I2C_MSG_OK) {
>> +			pr_err("msg[%d]: addr=0x%x backend error.\n", i, msgs[i].addr);
>> +			break;
>> +		}
>> +
>> +		i2c_put_dma_safe_msg_buf(req->buf, &msgs[i], true);
>> +	}
>> +
>> +	/*
>> +	 * Detach all the used buffers from the vq and
>> +	 * Release unused DMA safe buffer if any.
>> +	 */
>> +	for (j = i; j < nr; j++) {
>> +		req = virtqueue_get_buf(vq, &len);
>> +		if (req)
>> +			i2c_put_dma_safe_msg_buf(req->buf, &msgs[j], false);
> This will come in play only if something failed in the earlier loop ? Or my
> understanding incorrect ? Also this should be merged with the above for loop
> itself, it is just doing part of it.


Will refine it along with the earlier loop.


>
>> +	}
>> +
>> +	return i;
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
> On error here, we will surely not free the buffers, isn't it ?


Right. Will fix it. Thank you.


>> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>> +		ret = -ETIMEDOUT;
>> +		goto err_unlock_free;
>> +	}
>> +
>> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr);
>> +
>> +err_unlock_free:
>> +	mutex_unlock(&vi->lock);
>> +	kfree(reqs);
>> +	return ret;
>> +}
