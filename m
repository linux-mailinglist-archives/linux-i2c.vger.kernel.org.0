Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0A63BB88A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 10:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhGEIFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 04:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhGEIFZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 04:05:25 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA2FC061574
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jul 2021 01:02:47 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x3so1335630pll.5
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jul 2021 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7HFtrvl8Hp3RAM/FFfn+6kiIZNa9TUM0Rjxm9S07BYU=;
        b=wT20aR19P0l8+aXdUbQcBT2ncbwV7FLfcH5+V03YDNNqKv6/W87Yd4qmTk6DrcK30g
         DvdQhRcrJe9G3BFaoFV5p4WrmgUYKk3+u3X4UvHFL0rNEX3TkXe2iLY38CprPo955Xzk
         jXw1t1JN2FhA8XTxNXav8VU91f4SYPjClLB2etFbnaARMLCB1puhJz8RBotc77tIGNYG
         YqVZkWZTcmUltC94eZPNzm9ddh9ayqP2+UMdqYc/uXD+lDCeqntSEOoRDnRI80vOfihc
         4Rwft7IiiyvdBJHDpT7OmrenOGha/+t3Zh7rTwhzsLC3HMMBQmC6moV+GZbSHYxhWGsY
         5KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7HFtrvl8Hp3RAM/FFfn+6kiIZNa9TUM0Rjxm9S07BYU=;
        b=sazuHYqIYTJQ8Yr3f7Lfvmv8N8pfbcKEN/Y8EFkG0B1VIBr2NwGB02gRai+nPfe0y8
         zeSJyQJwtjDJTouq1o2Z4Lj9gdbQ0jJQ+ODGJr1CHveArha50Esx+Xd5wMltRKzwisWN
         zCc19LNN6ZojA3f/iUca+pMxxZeU/HatrZzcJu+G5+GHR7up6QOZtumSd36d2bnue5xz
         DSX++esy2rDJf3KRu2blFp6CH8iIYKMoKxPjDPUzITvSyizY1jEDid2caeotEz3vcTD7
         vtEve2mWGxdQHIRzg4M8DlEFE1qdeTLXoUsjqg/lFHEL7xeAB0ZU+KNapZ5SJUjtu8JO
         cYVw==
X-Gm-Message-State: AOAM531eja4pp7LhNGTUyJB/HyhkOogUpvf0XTRyvnSjRTKHUSiXMZPf
        keS8SF3NxIhrOS8YfJhoOzKeZQ==
X-Google-Smtp-Source: ABdhPJzpiH5Tj6rIdJ6BpWrt9yRBYxI8qI2sTP9njbWlR/EiBwQY+vKPW1G7o0sV6W/XsAOUrtBk/A==
X-Received: by 2002:a17:902:e848:b029:129:2e87:9944 with SMTP id t8-20020a170902e848b02901292e879944mr11397658plg.27.1625472167343;
        Mon, 05 Jul 2021 01:02:47 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id v14sm13323329pgo.89.2021.07.05.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 01:02:46 -0700 (PDT)
Date:   Mon, 5 Jul 2021 13:32:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v13] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705080245.yabjlrgje5l7vndt@vireshk-i7>
References: <8908f35a741e25a630d521e1012494e67d31ea64.1625466616.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8908f35a741e25a630d521e1012494e67d31ea64.1625466616.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jie.

On 05-07-21, 14:53, Jie Deng wrote:
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> +				    struct virtio_i2c_req *reqs,
> +				    struct i2c_msg *msgs, int nr,
> +				    bool fail)
> +{
> +	struct virtio_i2c_req *req;
> +	bool failed = fail;
> +	unsigned int len;
> +	int i, j = 0;
> +
> +	for (i = 0; i < nr; i++) {
> +		/* Detach the ith request from the vq */
> +		req = virtqueue_get_buf(vq, &len);

Calling this for cases where virtio_i2c_prepare_reqs() itself has failed will
always return NULL, should we even try to call this then ?

virtqueue_get_buf() returns the next used buffer only, i.e. returned by the host
?

> +
> +		/*
> +		 * Condition (req && req == &reqs[i]) should always meet since
> +		 * we have total nr requests in the vq.
> +		 */
> +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||

Mentioning again for completeness of the review, reqs[i] can never be NULL here
though req can be. And even in that case you never need to check req here.

Feel free to ignore it if you want, we can always send a fixup patch later and
discuss it further :)

> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> +			failed = true;
> +
> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> +		if (!failed)
> +			j++;
> +	}
> +
> +	return fail ? 0 : j;

Since you don't return ETIMEDOUT anymore, you can simply return j now. And so we
can work with a single failed argument and don't need both fail and failed.

> +}
> +
> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> +	struct virtqueue *vq = vi->vq;
> +	struct virtio_i2c_req *reqs;
> +	unsigned long time_left;
> +	int ret;
> +
> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> +	if (!reqs)
> +		return -ENOMEM;
> +
> +	ret = virtio_i2c_prepare_reqs(vq, reqs, msgs, num);
> +	if (ret != num) {
> +		ret = virtio_i2c_complete_reqs(vq, reqs, msgs, ret, true);
> +		goto err_free;
> +	}
> +
> +	reinit_completion(&vi->completion);
> +	virtqueue_kick(vq);
> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, num, !time_left);
> +
> +	if (!time_left) {
> +		ret = -ETIMEDOUT;
> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> +	}
> +
> +err_free:
> +	kfree(reqs);
> +	return ret;
> +}

> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
> new file mode 100644
> index 0000000..df936a2
> --- /dev/null
> +++ b/include/uapi/linux/virtio_i2c.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
> +/*
> + * Definitions for virtio I2C Adpter
> + *
> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> +#define _UAPI_LINUX_VIRTIO_I2C_H
> +
> +#include <linux/types.h>
> +#include <linux/const.h>

Both of these need to be the uapi headers as Andy said earlier and they better
be in alphabetical order.

#include <uapi/linux/const.h>
#include <uapi/linux/types.h>

Though in your support, I do see a lot of files in uapi/linux using the standard
types.h, which looks wrong as that types.h is not a userspace ABI.

-- 
viresh
