Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE823B8D9F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 08:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbhGAGNZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 02:13:25 -0400
Received: from mga02.intel.com ([134.134.136.20]:1867 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232797AbhGAGNZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Jul 2021 02:13:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="195638111"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; 
   d="scan'208";a="195638111"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2021 23:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; 
   d="scan'208";a="420285841"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2021 23:10:48 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <cb35472d-f79e-f3f8-405f-35c699d897a1@intel.com>
Date:   Thu, 1 Jul 2021 14:10:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/1 12:04, Viresh Kumar wrote:
> On 01-07-21, 11:24, Jie Deng wrote:
>> Changes v10 -> v11
>> 	- Remove vi->adap.class = I2C_CLASS_DEPRECATED.
>> 	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".
>> 	- Remove "struct mutex lock" in "struct virtio_i2c".
>> 	- Support zero-length request.
>> 	- Remove unnecessary logs.
>> 	- Remove vi->adap.timeout = HZ / 10, just use the default value.
>> 	- Use BIT(0) to define VIRTIO_I2C_FLAGS_FAIL_NEXT.
>> 	- Add the virtio_device index to adapter's naming mechanism.
> Thanks Jie.
>
> I hope you are going to send a fix for specification as well (for the
> zero-length request) ?


Yes. I will send that fix once this patch get merged.


>
>> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
>> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
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
>> +		reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
>> +		if (!reqs[i].buf)
>> +			break;
>> +
>> +		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
> The len can be zero here for zero-length transfers.
>
>> +
>> +		if (msgs[i].flags & I2C_M_RD)
>> +			sgs[outcnt + incnt++] = &msg_buf;
>> +		else
>> +			sgs[outcnt++] = &msg_buf;
>> +
>> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
>> +		sgs[outcnt + incnt++] = &in_hdr;
> Why are we still sending the msg_buf if the length is 0? Sending the
> buffer makes sense if you have some data to send, but otherwise it is
> just an extra sg element, which isn't required to be sent.


I think a fixed number of sgs will make things easier to develop backend.

If you prefer to parse the number of descriptors instead of using the 
msg length to

distinguish the zero-length request from other requests, I'm OK to set a 
limit.

if (!msgs[i].len) {
     sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);

     if (msgs[i].flags & I2C_M_RD)
         sgs[outcnt + incnt++] = &msg_buf;
     else
         sgs[outcnt++] = &msg_buf;
}



>
>> +#ifdef CONFIG_PM_SLEEP
>> +static int virtio_i2c_freeze(struct virtio_device *vdev)
>> +{
>> +	virtio_i2c_del_vqs(vdev);
>> +	return 0;
>> +}
>> +
>> +static int virtio_i2c_restore(struct virtio_device *vdev)
>> +{
>> +	return virtio_i2c_setup_vqs(vdev->priv);
>> +}
>> +#endif
>> +
>> +static struct virtio_driver virtio_i2c_driver = {
>> +	.id_table	= id_table,
>> +	.probe		= virtio_i2c_probe,
>> +	.remove		= virtio_i2c_remove,
>> +	.driver	= {
>> +		.name	= "i2c_virtio",
>> +	},
>> +#ifdef CONFIG_PM_SLEEP
> You could avoid this pair of ifdef by creating dummy versions of below
> routines for !CONFIG_PM_SLEEP case. Up to you.


Thank you. I'd like to keep the same.

