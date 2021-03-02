Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678F832B0BF
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhCCA4e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 19:56:34 -0500
Received: from mga05.intel.com ([192.55.52.43]:44177 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1443616AbhCBCWq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Mar 2021 21:22:46 -0500
IronPort-SDR: KZUDmuoTJWn47ozItwX1532o05MfIBX3NC0uIY+i2T7XD81QVs/u63CLMLlf4JI1e1nrBKSg6R
 ghz0kTLf9Jcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="271663820"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="271663820"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 18:22:06 -0800
IronPort-SDR: Sb5TjNiGTCmzYSMQV8Pa9AbbhcFfBgIoiLBKSTDcrCgSl9LbnlDIweQAFEbW6+oLBnibn6J8BW
 6t1wuJwl3n0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="444539717"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga001.jf.intel.com with ESMTP; 01 Mar 2021 18:22:00 -0800
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
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <16efea9f-d606-4cf9-9213-3c1cf9b1a906@intel.com>
Date:   Tue, 2 Mar 2021 10:21:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/1 19:54, Viresh Kumar wrote:
> On 01-03-21, 14:41, Jie Deng wrote:
>> +/**
>> + * struct virtio_i2c_req - the virtio I2C request structure
>> + * @out_hdr: the OUT header of the virtio I2C message
>> + * @write_buf: contains one I2C segment being written to the device
>> + * @read_buf: contains one I2C segment being read from the device
>> + * @in_hdr: the IN header of the virtio I2C message
>> + */
>> +struct virtio_i2c_req {
>> +	struct virtio_i2c_out_hdr out_hdr;
>> +	u8 *write_buf;
>> +	u8 *read_buf;
>> +	struct virtio_i2c_in_hdr in_hdr;
>> +};
> I am not able to appreciate the use of write/read bufs here as we
> aren't trying to read/write data in the same transaction. Why do we
> have two bufs here as well as in specs ?
>
> What about this on top of your patch ?
>
> ---
>   drivers/i2c/busses/i2c-virtio.c | 31 +++++++++++--------------------
>   include/uapi/linux/virtio_i2c.h |  3 +--
>   2 files changed, 12 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index 8c8bc9545418..e71ab1d2c83f 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -67,14 +67,13 @@ static int virtio_i2c_send_reqs(struct virtqueue *vq,
>   		if (!buf)
>   			break;
>   
> +		reqs[i].buf = buf;
> +		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
> +
>   		if (msgs[i].flags & I2C_M_RD) {
> -			reqs[i].read_buf = buf;
> -			sg_init_one(&msg_buf, reqs[i].read_buf, msgs[i].len);
>   			sgs[outcnt + incnt++] = &msg_buf;
>   		} else {
> -			reqs[i].write_buf = buf;
> -			memcpy(reqs[i].write_buf, msgs[i].buf, msgs[i].len);
> -			sg_init_one(&msg_buf, reqs[i].write_buf, msgs[i].len);
> +			memcpy(reqs[i].buf, msgs[i].buf, msgs[i].len);
>   			sgs[outcnt++] = &msg_buf;
>   		}
>   
> @@ -84,13 +83,8 @@ static int virtio_i2c_send_reqs(struct virtqueue *vq,
>   		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
>   		if (err < 0) {
>   			pr_err("failed to add msg[%d] to virtqueue.\n", i);
> -			if (msgs[i].flags & I2C_M_RD) {
> -				kfree(reqs[i].read_buf);
> -				reqs[i].read_buf = NULL;
> -			} else {
> -				kfree(reqs[i].write_buf);
> -				reqs[i].write_buf = NULL;
> -			}
> +			kfree(reqs[i].buf);
> +			reqs[i].buf = NULL;
>   			break;
>   		}
>   	}
> @@ -118,14 +112,11 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>   			break;
>   		}
>   
> -		if (msgs[i].flags & I2C_M_RD) {
> -			memcpy(msgs[i].buf, req->read_buf, msgs[i].len);
> -			kfree(req->read_buf);
> -			req->read_buf = NULL;
> -		} else {
> -			kfree(req->write_buf);
> -			req->write_buf = NULL;
> -		}
> +		if (msgs[i].flags & I2C_M_RD)
> +			memcpy(msgs[i].buf, req->buf, msgs[i].len);
> +
> +		kfree(req->buf);
> +		req->buf = NULL;
>   	}
>   
>   	return i;
> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
> index 92febf0c527e..61f0086ac75b 100644
> --- a/include/uapi/linux/virtio_i2c.h
> +++ b/include/uapi/linux/virtio_i2c.h
> @@ -48,8 +48,7 @@ struct virtio_i2c_in_hdr {
>    */
>   struct virtio_i2c_req {
>   	struct virtio_i2c_out_hdr out_hdr;
> -	u8 *write_buf;
> -	u8 *read_buf;
> +	u8 *buf;
>   	struct virtio_i2c_in_hdr in_hdr;
>   };
>   

That's my original proposal. I used to mirror this interface with 
"struct i2c_msg".

But the design philosophy of virtio TC is that VIRTIO devices are not 
specific to Linux
so the specs design should avoid the limitations of the current Linux 
driver behavior.

We had some discussion about this. You may check these links to learn 
the story.
https://lists.oasis-open.org/archives/virtio-comment/202010/msg00016.html
https://lists.oasis-open.org/archives/virtio-comment/202010/msg00033.html
https://lists.oasis-open.org/archives/virtio-comment/202011/msg00025.html
