Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346393B8CC5
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 06:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhGAEHK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 00:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhGAEHJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jul 2021 00:07:09 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DA4C0617A8
        for <linux-i2c@vger.kernel.org>; Wed, 30 Jun 2021 21:04:39 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l11so3442569pji.5
        for <linux-i2c@vger.kernel.org>; Wed, 30 Jun 2021 21:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tlLiC0/suIzFL9Kc0HiGXCJ9guNpwuTifmDbO7ccBmk=;
        b=GjsPDXLqMMYdUtQ04S9QypWLzNfxSIdZN+wtJfxqs98oJc5FP3ISRbX2vsRPb4PlIW
         vEvCOlQb4NcDvwQh5ovIc6R2cKiIg/jsRX7gUTseHHRA8lYhQejsePqoDy5Z3Rh8pXKc
         z4Yt71s9d61EOaJklZX8BRcv2MrKq67YrL/S19LYhy4+A9066tuu43r7Efu/+SjFbuBy
         3TYYVI/ZhG/3Sguxn9jXBA6u9DqiuKUwNnHi7164E4LbbRuHY8X8qHTZMPCIBcLjAdDs
         FIXOytssI5Ir/j4ocrqCrh8rXPlWkphvsLk6m2qOpsh/vq3gA0a1sW2PmFdFyjEF63Am
         VofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tlLiC0/suIzFL9Kc0HiGXCJ9guNpwuTifmDbO7ccBmk=;
        b=aDpCS3RG8WGU1VjNMlLQIEcKbWNJBHI72wqJR4YeLU1bandAIUdONjBfw+AbQzfQnC
         Ku/ykZiXx/DPId21bIpco2WuUlhMvCaIWNiJA6QGkqh6MqW8zi5jj4dtKl6DELIIvUCC
         FMFN4xT4ALUv+AfSbvXxdCYBdvCwmRCZ3PWCq/zCyonE9iTf4HzSwe4t6NORl1hHWvMF
         4Njhay0icEKUAaNfMzvMalNsWkvcGXCHLyxoQWS6+T1EGoKP8FIZRdhPJmoMg+HBWsgd
         m2aTFw1YURX5RcDrR+T497eK+yfuUPGyxqv91MYjrGAFjZOMQYvTeIaV3sS1XxXd9A/U
         u14w==
X-Gm-Message-State: AOAM531sRFebCAsFfFSUwV2ydaCoiJLkIbLOrgBEYL/DeZv/cAmZEFmb
        XG17YifsYySLt7BT5gtlRUlJDA==
X-Google-Smtp-Source: ABdhPJxC8zqchwOE8jWRaqXwN4H0BnWwhHXMQTOWPNq3iG1fMlPMEl10tro8es2vXM0pEV3FpN+w/A==
X-Received: by 2002:a17:90b:2504:: with SMTP id ns4mr8022103pjb.140.1625112278476;
        Wed, 30 Jun 2021 21:04:38 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id q7sm17404549pfk.192.2021.06.30.21.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 21:04:38 -0700 (PDT)
Date:   Thu, 1 Jul 2021 09:34:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-07-21, 11:24, Jie Deng wrote:
> Changes v10 -> v11
> 	- Remove vi->adap.class = I2C_CLASS_DEPRECATED.
> 	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".
> 	- Remove "struct mutex lock" in "struct virtio_i2c".
> 	- Support zero-length request.
> 	- Remove unnecessary logs.
> 	- Remove vi->adap.timeout = HZ / 10, just use the default value.
> 	- Use BIT(0) to define VIRTIO_I2C_FLAGS_FAIL_NEXT.
> 	- Add the virtio_device index to adapter's naming mechanism.

Thanks Jie.

I hope you are going to send a fix for specification as well (for the
zero-length request) ?

> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
> +				struct virtio_i2c_req *reqs,
> +				struct i2c_msg *msgs, int nr)
> +{
> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
> +	int i, outcnt, incnt, err = 0;
> +
> +	for (i = 0; i < nr; i++) {
> +		/*
> +		 * Only 7-bit mode supported for this moment. For the address format,
> +		 * Please check the Virtio I2C Specification.
> +		 */
> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
> +
> +		if (i != nr - 1)
> +			reqs[i].out_hdr.flags = cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT);
> +
> +		outcnt = incnt = 0;
> +		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
> +		sgs[outcnt++] = &out_hdr;
> +
> +		reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
> +		if (!reqs[i].buf)
> +			break;
> +
> +		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);

The len can be zero here for zero-length transfers.

> +
> +		if (msgs[i].flags & I2C_M_RD)
> +			sgs[outcnt + incnt++] = &msg_buf;
> +		else
> +			sgs[outcnt++] = &msg_buf;
> +
> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
> +		sgs[outcnt + incnt++] = &in_hdr;

Why are we still sending the msg_buf if the length is 0? Sending the
buffer makes sense if you have some data to send, but otherwise it is
just an extra sg element, which isn't required to be sent.

> +
> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
> +		if (err < 0) {
> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
> +			break;
> +		}
> +	}
> +
> +	return i;

I just noticed this now, but this function even tries to send data
partially, which isn't right. If the caller (i2c device's driver)
calls this for 5 struct i2c_msg instances, then all 5 need to get
through or none.. where as we try to send as many as possible here.

This looks broken to me. Rather return an error value here on success,
or make it complete failure.

Though to be fair I see i2c-core also returns number of messages
processed from i2c_transfer().

Wolfram, what's expected here ? Shouldn't all message transfer or
none?

> +#ifdef CONFIG_PM_SLEEP
> +static int virtio_i2c_freeze(struct virtio_device *vdev)
> +{
> +	virtio_i2c_del_vqs(vdev);
> +	return 0;
> +}
> +
> +static int virtio_i2c_restore(struct virtio_device *vdev)
> +{
> +	return virtio_i2c_setup_vqs(vdev->priv);
> +}
> +#endif
> +
> +static struct virtio_driver virtio_i2c_driver = {
> +	.id_table	= id_table,
> +	.probe		= virtio_i2c_probe,
> +	.remove		= virtio_i2c_remove,
> +	.driver	= {
> +		.name	= "i2c_virtio",
> +	},
> +#ifdef CONFIG_PM_SLEEP

You could avoid this pair of ifdef by creating dummy versions of below
routines for !CONFIG_PM_SLEEP case. Up to you.

> +	.freeze = virtio_i2c_freeze,
> +	.restore = virtio_i2c_restore,
> +#endif
> +};

-- 
viresh
