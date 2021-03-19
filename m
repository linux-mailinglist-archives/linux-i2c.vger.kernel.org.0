Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31BD341517
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbhCSFxj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbhCSFx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 01:53:26 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A270C06174A
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 22:53:26 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id u19so2963997pgh.10
        for <linux-i2c@vger.kernel.org>; Thu, 18 Mar 2021 22:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HrcS5DvDvEhZWOL4skNMel1B6oLPKZtu3foGo7w1mPI=;
        b=G3MdP2vdCP3PgfU40CFhK8NZgNnVhfnpT/r7NV68fxNUslrDB5iwcQQ645gMs8itXD
         XgizU0hLKBRpz9JpJ6LzfA2kAhJIi1WHSRTdbx4sDFXUCjnDAlwNw3oYEWz9oGcksrtq
         3BvSzOLh0tP/b9IQRij69/d0ggjjPWNUEligdRGAz8pp6n2SQM6FhMgBNNcPgY38b1zn
         rWNMrTvSsIO5G7ZvaGzuZp5Emf2+GvhN4uhpPJZEfdBWJ0P1IzktMbB1q1pS+qIyDgGy
         wfS1gG4NukLqEDdnDybBLcTc9GnL8xs20vieIXPf7YcbqBS1WBky5LObje3kyGq5y8/V
         wTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HrcS5DvDvEhZWOL4skNMel1B6oLPKZtu3foGo7w1mPI=;
        b=njczfV1qINjoWXmJTxrxxavw5Um8JF3lRY50BUHnjyyhefojHdRgEptLUrXtB7hW9i
         qMQDP19fuODJ1TrWgQ5uYzLz/KJTVVubXS/HqqW5WphDgQl9ghW+GpXzT/anW1tgb7Gi
         ueSLQAeSHwuoSMbRdlzKfnSNOaCiox0Sre0JxbClaDrxN8hUOyhKNVrfHPSi2GI/xgqG
         SD5vtMIanBGtskySAQbpx/c9lRYuaWHm4orudgECfRToC76NxhBZnZKK3M08aIdhLS/7
         6Xy7bQK6gD+sgy0szAgvKxqQ7Ysa+cU4Up/v81zl98mVTEvs60trBfphH/5+MNiEXnuL
         NFbg==
X-Gm-Message-State: AOAM530hl375jjj97JndP9ryFnXqaj401fI73WZGP7svtUilLj1WXVy6
        nLo9U1N0OVK6HloxE2xdKU7amg==
X-Google-Smtp-Source: ABdhPJzWV5QBTvNNGyMvz7LJzHPqexfsBdnh6BJUOdlWlkojgUHIxQYG7Wx1gosQVIzTl71y+AHHiQ==
X-Received: by 2002:a62:1ad0:0:b029:1f2:c7b3:3039 with SMTP id a199-20020a621ad00000b02901f2c7b33039mr7958230pfa.30.1616133205650;
        Thu, 18 Mar 2021 22:53:25 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id b19sm3974164pfo.7.2021.03.18.22.53.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 22:53:25 -0700 (PDT)
Date:   Fri, 19 Mar 2021 11:23:22 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
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
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210319055322.lw4dhb2kwtrtd3qu@vireshk-i7>
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-03-21, 18:35, Jie Deng wrote:
> +++ b/drivers/i2c/busses/i2c-virtio.c
> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
> +				struct virtio_i2c_req *reqs,
> +				struct i2c_msg *msgs, int nr)
> +{
> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
> +	int i, outcnt, incnt, err = 0;
> +
> +	for (i = 0; i < nr; i++) {
> +		if (!msgs[i].len)
> +			break;
> +
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

You allocate a buffer here, lets see if they are freeing properly or not (I
remember that I gave same feedback earlier as well, but anyway).

> +		if (!reqs[i].buf)
> +			break;
> +
> +		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
> +
> +		if (msgs[i].flags & I2C_M_RD)
> +			sgs[outcnt + incnt++] = &msg_buf;
> +		else
> +			sgs[outcnt++] = &msg_buf;
> +
> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
> +		sgs[outcnt + incnt++] = &in_hdr;
> +
> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
> +		if (err < 0) {
> +			pr_err("failed to add msg[%d] to virtqueue.\n", i);
> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);

On failure here, you freed the buffers for request "i" but not others..

> +			break;
> +		}
> +	}
> +
> +	return i;
> +}
> +
> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> +					struct virtio_i2c_req *reqs,
> +					struct i2c_msg *msgs, int nr)
> +{
> +	struct virtio_i2c_req *req;
> +	unsigned int len;
> +	int i, j;
> +
> +	for (i = 0; i < nr; i++) {
> +		req = virtqueue_get_buf(vq, &len);
> +		if (!(req && req == &reqs[i])) {
> +			pr_err("msg[%d]: addr=0x%x is out of order.\n", i, msgs[i].addr);
> +			break;

Since you break here, what will happen to the buffer ? I thought
virtqueue_get_buf() will return a req only once and then you can't access it ?

> +		}
> +
> +		if (req->in_hdr.status != VIRTIO_I2C_MSG_OK) {
> +			pr_err("msg[%d]: addr=0x%x backend error.\n", i, msgs[i].addr);
> +			break;
> +		}
> +
> +		i2c_put_dma_safe_msg_buf(req->buf, &msgs[i], true);
> +	}
> +
> +	/*
> +	 * Detach all the used buffers from the vq and
> +	 * Release unused DMA safe buffer if any.
> +	 */
> +	for (j = i; j < nr; j++) {
> +		req = virtqueue_get_buf(vq, &len);
> +		if (req)
> +			i2c_put_dma_safe_msg_buf(req->buf, &msgs[j], false);

This will come in play only if something failed in the earlier loop ? Or my
understanding incorrect ? Also this should be merged with the above for loop
itself, it is just doing part of it.

> +	}
> +
> +	return i;
> +}
> +
> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> +	struct virtqueue *vq = vi->vq;
> +	struct virtio_i2c_req *reqs;
> +	unsigned long time_left;
> +	int ret, nr;
> +
> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> +	if (!reqs)
> +		return -ENOMEM;
> +
> +	mutex_lock(&vi->lock);
> +
> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> +	if (ret == 0)
> +		goto err_unlock_free;
> +
> +	nr = ret;
> +	reinit_completion(&vi->completion);
> +	virtqueue_kick(vq);
> +
> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +	if (!time_left) {

On error here, we will surely not free the buffers, isn't it ?

> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> +		ret = -ETIMEDOUT;
> +		goto err_unlock_free;
> +	}
> +
> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr);
> +
> +err_unlock_free:
> +	mutex_unlock(&vi->lock);
> +	kfree(reqs);
> +	return ret;
> +}
-- 
viresh
