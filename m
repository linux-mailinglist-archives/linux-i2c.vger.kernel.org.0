Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786CC3439C5
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 07:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbhCVGmO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 02:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhCVGlt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 02:41:49 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3B0C061574
        for <linux-i2c@vger.kernel.org>; Sun, 21 Mar 2021 23:41:48 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id q11so6022202pld.11
        for <linux-i2c@vger.kernel.org>; Sun, 21 Mar 2021 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=25e+rVTq6nmYhuAojcLUW2P+GB1w8LaJw5ypKr+Sczk=;
        b=TYnfM7XE1Qa3Iq7SmsE5a3/MRZynV+7j2355zKZn59b3S9bf6mc17sC7eAtLoA89JM
         pC0M8j3adQ667VwrgSt37BBW8ghKfVgzrTBXvhmfg9uUBnfMjzbxUfn5fur9A9as8ASX
         UH6pYiB8nD5WOUsneqY5gS3n8Y3spSFi+ta6+TnmyUNUQyZLO0XOnExj8UIBaLICZS0A
         DIk9AGqHH/4cXHyOQCtdzfs5id7ZUIq/84fMm7c28cHhN6ZuEfwGyZmRLf/+mhWbDkj7
         sDpkkEdg7i4qAZP8nZV7Vov4FWwRJplCEkjgbLK9ciSFOK/iIATi8/MDQESlE+IoTkSs
         dIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=25e+rVTq6nmYhuAojcLUW2P+GB1w8LaJw5ypKr+Sczk=;
        b=D5dRdS+aTp9iISAg9dnb3IsTEDccSwklr2N1xx2UIklyt90YAY8bQ1K+7AcIvQrrth
         qNu2LMnmYkeb5cvqaH74tRUJr1iXXiXiOvaRLwazpCv/D6RaLXlWhC6cmckMRct5+KVR
         G+8pApu8v2PNe+GWocSjdhKDKreDvV/Mw8I+hsurWNg9CEyWyDuQ5elA2XiyMpomVHC/
         ATLojugx3qNcHQJrgTGU6Zz3TyPmLz4Rds8qKtBbbi06/+BESrK57c2DteMekbSo9oRs
         HuL/1ebfnknfD9/zfAc3qM+zRDg22bOF2yrwzIAPifedK1ELzk0OQBGHJT2Ol9dQjbuc
         Z+/w==
X-Gm-Message-State: AOAM531ONvHvvcpj3SSI6GBgkzVfjfQ4qQlEGgs6JRRR9QTj10u8rOrA
        rpt2MDjpRlEzbnco1DGPDTrZUR4tOGCKCQ==
X-Google-Smtp-Source: ABdhPJyBTNNi7bloWfXEusU8O8X8CG45cGV4ObEvWP9owpM0MwmKw5Se9MbbIJ2HwAkXsSi3oChc4A==
X-Received: by 2002:a17:90a:b115:: with SMTP id z21mr11884479pjq.162.1616395307719;
        Sun, 21 Mar 2021 23:41:47 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id n16sm12356347pff.119.2021.03.21.23.41.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Mar 2021 23:41:46 -0700 (PDT)
Date:   Mon, 22 Mar 2021 12:11:44 +0530
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
Subject: Re: [PATCH v9] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210322064144.y6kpajolwh2kd3lj@vireshk-i7>
References: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e09c07532f5456816eb91ef4176bf910284df4ff.1616418890.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-03-21, 21:35, Jie Deng wrote:
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> new file mode 100644
> index 0000000..316986e
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Virtio I2C Bus Driver
> + *
> + * The Virtio I2C Specification:
> + * https://raw.githubusercontent.com/oasis-tcs/virtio-spec/master/virtio-i2c.tex
> + *
> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_i2c.h>
> +
> +/**
> + * struct virtio_i2c - virtio I2C data
> + * @vdev: virtio device for this controller
> + * @completion: completion of virtio I2C message
> + * @adap: I2C adapter for this controller
> + * @i2c_lock: lock for virtqueue processing

Name mismatch here.

> + * @vq: the virtio virtqueue for communication
> + */
> +struct virtio_i2c {
> +	struct virtio_device *vdev;
> +	struct completion completion;
> +	struct i2c_adapter adap;
> +	struct mutex lock;
> +	struct virtqueue *vq;
> +};


> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> +					struct virtio_i2c_req *reqs,
> +					struct i2c_msg *msgs, int nr,
> +					bool timeout)
> +{
> +	struct virtio_i2c_req *req;
> +	bool err_found = false;
> +	unsigned int len;
> +	int i, j = 0;
> +
> +	for (i = 0; i < nr; i++) {
> +		/* Detach the ith request from the vq */
> +		req = virtqueue_get_buf(vq, &len);
> +
> +		if (timeout || err_found)  {
> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
> +			continue;
> +		}
> +
> +		/*
> +		 * Condition (req && req == &reqs[i]) should always meet since
> +		 * we have total nr requests in the vq.
> +		 */
> +		if (WARN_ON(!(req && req == &reqs[i])) ||
> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)) {
> +			err_found = true;
> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
> +			continue;
> +		}
> +
> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], true);
> +		++j;
> +	}

I think you can simplify the code like this here:

	bool err_found = timeout;

	for (i = 0; i < nr; i++) {
		/* Detach the ith request from the vq */
		req = virtqueue_get_buf(vq, &len);

		/*
		 * Condition (req && req == &reqs[i]) should always meet since
		 * we have total nr requests in the vq.
		 */
		if (!err_found &&
                    (WARN_ON(!(req && req == &reqs[i])) ||
		     (req->in_hdr.status != VIRTIO_I2C_MSG_OK))) {
			err_found = true;
			continue;
		}

		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], err_found);
                if (!err_found)
                        ++j;

> +
> +	return (timeout ? -ETIMEDOUT : j);
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
> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> +		ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr, true);
> +		goto err_unlock_free;
> +	}
> +
> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr, false);

And this can be optimized as well:

	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
	if (!time_left)
		dev_err(&adap->dev, "virtio i2c backend timeout.\n");

        ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr, !time_left);

-- 
viresh
