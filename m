Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8080632C874
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 02:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhCDAtc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Mar 2021 19:49:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:57992 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356400AbhCCKre (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Mar 2021 05:47:34 -0500
IronPort-SDR: x2a0KYVChUViuk9b5bTCQK/q0aH1oMApDkCUal7ba+LexK88Ys62+Ekj1rxz82AN+AYeNhIr2G
 lgUuz4UGGtOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="248547790"
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="248547790"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 00:46:50 -0800
IronPort-SDR: fo7GEBrPHClrg6sm9qWvWgOFfNt8oKmYBf6F6DJn/Vcx0giiN4b6Xku6joiQUGPABD54MAPymk
 qprYiRrOxC1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="445169948"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2021 00:46:44 -0800
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
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
        Stefan Hajnoczi <stefanha@redhat.com>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210303075430.n7ewkots6cgbbabi@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <876371c3-ba9a-5176-493b-5a883cba3b07@intel.com>
Date:   Wed, 3 Mar 2021 16:46:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303075430.n7ewkots6cgbbabi@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/3 15:54, Viresh Kumar wrote:

> On 01-03-21, 14:41, Jie Deng wrote:
>> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
>> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
>> +				struct virtio_i2c_req *reqs,
>> +				struct i2c_msg *msgs, int nr)
>> +{
>> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
>> +	int i, outcnt, incnt, err = 0;
>> +	u8 *buf;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		if (!msgs[i].len)
>> +			break;
>> +
>> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
>> +
>> +		if (i != nr - 1)
>> +			reqs[i].out_hdr.flags |= VIRTIO_I2C_FLAGS_FAIL_NEXT;
>> +
>> +		outcnt = incnt = 0;
>> +		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
>> +		sgs[outcnt++] = &out_hdr;
>> +
>> +		buf = kzalloc(msgs[i].len, GFP_KERNEL);
>> +		if (!buf)
>> +			break;
>> +
>> +		if (msgs[i].flags & I2C_M_RD) {
>> +			reqs[i].read_buf = buf;
>> +			sg_init_one(&msg_buf, reqs[i].read_buf, msgs[i].len);
>> +			sgs[outcnt + incnt++] = &msg_buf;
>> +		} else {
>> +			reqs[i].write_buf = buf;
>> +			memcpy(reqs[i].write_buf, msgs[i].buf, msgs[i].len);
>> +			sg_init_one(&msg_buf, reqs[i].write_buf, msgs[i].len);
>> +			sgs[outcnt++] = &msg_buf;
>> +		}
>> +
>> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
>> +		sgs[outcnt + incnt++] = &in_hdr;
>> +
>> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
>> +		if (err < 0) {
>> +			pr_err("failed to add msg[%d] to virtqueue.\n", i);
>> +			if (msgs[i].flags & I2C_M_RD) {
>> +				kfree(reqs[i].read_buf);
>> +				reqs[i].read_buf = NULL;
>> +			} else {
>> +				kfree(reqs[i].write_buf);
>> +				reqs[i].write_buf = NULL;
>> +			}
>> +			break;
>> +		}
>> +	}
>> +
>> +	return i;
>> +}
>> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
>> +/**
>> + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
>> + * @addr: the controlled device address
>> + * @padding: used to pad to full dword
>> + * @flags: used for feature extensibility
>> + */
>> +struct virtio_i2c_out_hdr {
>> +	__le16 addr;
>> +	__le16 padding;
>> +	__le32 flags;
>> +};
> Both this code and the virtio spec (which is already merged) are
> missing msgs[i].flags and they are never sent to backend. The only
> flags available here are the ones defined by virtio spec and these are
> not i2c flags.
>
> I also looked at your i2c backend for acrn and it mistakenly copies
> the hdr.flag, which is the virtio flag and not i2c flag.
>
> https://github.com/projectacrn/acrn-hypervisor/blob/master/devicemodel/hw/pci/virtio/virtio_i2c.c#L539
>
> I will send a fix for the specs if you agree that there is a problem
> here.
>
> what am I missing here ? This should have been caught in your testing
> and so I feel I must be missing something.
This is not a problem. My original proposal was to mirror the struct 
i2c_msg.
The code you looked at was based on that.
However, the virtio TC prefer not to mirror it. They have some concerns.
For example, there is a bit I2C_M_RD in i2c_msg.flag which has the same 
meaning with
the R/W in virtio descriptor. This is a repetition which may cause problems.
So the virtio_i2c_out_hdr.flags is used to instead of i2c_msg.flags for 
extension.

You can check this link 
https://github.com/oasis-tcs/virtio-spec/issues/88 to learn the whole story.
There are discussions about the spec (v1 ~ v7).

I'm updating these drivers step by step to make sure they finally follow 
the spec.

