Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8543BB5E8
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 05:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGEDsV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 23:48:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:52719 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhGEDsV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 4 Jul 2021 23:48:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="270040841"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="270040841"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2021 20:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="562383925"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2021 20:45:40 -0700
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <20210705024056.ndth2bwn2itii5g3@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <332af2be-0fb0-a846-8092-49d496fe8b6b@intel.com>
Date:   Mon, 5 Jul 2021 11:45:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210705024056.ndth2bwn2itii5g3@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/5 10:40, Viresh Kumar wrote:
> I think we missed the first deadline for 5.14-rc1 as Wolfram should be out of
> office now. Anyway lets make sure we fix all the pending bits before he is back
> and see if we can still pull it off by rc2.
>
> On 02-07-21, 16:46, Jie Deng wrote:
>> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
>> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
> It would be better to rename this to virtio_i2c_prepare_reqs instead, as this
> doesn't send anything.


That's a better name. I'm OK with that.


>
>> +				struct virtio_i2c_req *reqs,
>> +				struct i2c_msg *msgs, int nr)
>> +{
>> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
>> +	int i, outcnt, incnt, err = 0;
>> +
>> +	for (i = 0; i < nr; i++) {
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
>> +		if (msgs[i].len) {
>> +			reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
>> +			if (!reqs[i].buf)
>> +				break;
>> +
>> +			sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
>> +
>> +			if (msgs[i].flags & I2C_M_RD)
>> +				sgs[outcnt + incnt++] = &msg_buf;
>> +			else
>> +				sgs[outcnt++] = &msg_buf;
>> +		}
>> +
>> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
>> +		sgs[outcnt + incnt++] = &in_hdr;
>> +
>> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
>> +		if (err < 0) {
>> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
>> +			break;
>> +		}
>> +	}
>> +
>> +	return i;
>> +}
> The right way of doing this is is making this function return - Error on failure
> and 0 on success. There is no point returning number of successful additions
> here.


We need the number for virtio_i2c_complete_reqs to do cleanup. We don't 
have to

do cleanup "num" times every time. Just do it as needed.


>
> Moreover, on failures this needs to clean up (free the dmabufs) itself, just
> like you did i2c_put_dma_safe_msg_buf() at the end. The caller shouldn't be
> required to handle the error cases by freeing up resources.


This function will return the number of requests being successfully 
prepared and make sure

resources of the failed request being freed. And 
virtio_i2c_complete_reqs will free the

resources of those successful request.


>> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>> +				    struct virtio_i2c_req *reqs,
>> +				    struct i2c_msg *msgs, int nr,
>> +				    bool fail)
>> +{
>> +	struct virtio_i2c_req *req;
>> +	bool failed = fail;
>> +	unsigned int len;
>> +	int i, j = 0;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		/* Detach the ith request from the vq */
>> +		req = virtqueue_get_buf(vq, &len);
>> +
>> +		/*
>> +		 * Condition (req && req == &reqs[i]) should always meet since
>> +		 * we have total nr requests in the vq.
>> +		 */
>> +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
>> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> What about writing this as:
>
> 		if (!failed && (WARN_ON(req != &reqs[i]) ||
> 		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
>
> We don't need to check req here since if req is NULL, we will not do req->in_hdr
> at all.


It's right here just because the &reqs[i] will never be NULL in our 
case. But if you see

"virtio_i2c_complete_reqs" as an independent function, you need to check the

req. From the perspective of the callee, you can't ask the caller always 
give you

the non-NULL parameters. And some tools may give warnings.


>> +			failed = true;
>> +
>> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
>> +		if (!failed)
>> +			++j;
>> +	}
>> +
>> +	return (fail ? -ETIMEDOUT : j);
>> +}
>> +
