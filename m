Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949443385A3
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 07:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhCLGKo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 01:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhCLGKP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Mar 2021 01:10:15 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32354C061761
        for <linux-i2c@vger.kernel.org>; Thu, 11 Mar 2021 22:10:15 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id 18so1139688pfo.6
        for <linux-i2c@vger.kernel.org>; Thu, 11 Mar 2021 22:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m7r/RJCM6QoWg40L4FyJZ3LSdVUh4G/Io/veSg6ux5M=;
        b=vW1v7xkxznEn3WzRjX2TnLD/M0/Dphy/gzNf4S7QHwGyfDTSzlOSCvWEhOdpHSJPU6
         oc5TiYinxAHGth+qqs9OazH6jqtq3+NsMSbqFZcBmxjwNNZk66N4+f56HeZ7dgxvCnEx
         krgYpROGAC8PYKda0pYCO8+FIpTg8HBZOg761Z1vzdcmvy4XQhQVl4Hxi94fmfvi3k0N
         EmhpPFLGF8blD/nKCQjmgF/s8dwbKMYLQYOOm2LI4FmP621Q+UXR3m0kDx+wdAgeZ4hV
         USqZcvN0aEUbbMAPYKsczznLGMekdy3hvmwxoUqUKRh2rr6HCR75dr/wrTM/Nzh/No+S
         Pluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m7r/RJCM6QoWg40L4FyJZ3LSdVUh4G/Io/veSg6ux5M=;
        b=kWfXCFn9youY8LFgVwxgIxlKUHpvgu3g6h4SFQyxe10oJUFAXGohAFxTZSK3pDUj64
         5HLomLtoYPxuDxVTMIY+A6+yImVI++GXS8QCMQ5DGPDx5dnC5nRn+Kkbu5rPBzOGoqwg
         sz9WpZl78DEEF8A1PL4BQSVC02jfbkLtgxWGBWiDHHrzNqOkfUA+SjuyGIGRswb07XFE
         nHQsRZtvR5ewtvpgsAP9pfRgNh99BCeZwVCa9qCCUlmeSQiRQRrEBHTxZKy/M/XUFAb+
         G8tOVNJ1ZuaXMJpU5Pzg120bHSzC5xWSs52PmiUcO/Nuyxla2/P7pWB6QmNnfOIX1SOU
         XKFA==
X-Gm-Message-State: AOAM533d1RUD+akmKfIFJC8SDmE8TkFNn7HqnD0StzrFsJVxMkAvQa9Y
        VrwVQVvNwmA3ZPAIZpPr6MIyog==
X-Google-Smtp-Source: ABdhPJwOYv9uCpxVqbhIJeBLh5CDZcgsgsSvM3qz5AfzTak0Ejwv+w/jqAApkdjxdFtkdrPQkvDnmA==
X-Received: by 2002:a63:9254:: with SMTP id s20mr10487884pgn.33.1615529414421;
        Thu, 11 Mar 2021 22:10:14 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id k10sm3984733pfk.49.2021.03.11.22.10.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 22:10:13 -0800 (PST)
Date:   Fri, 12 Mar 2021 11:40:12 +0530
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
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210312061012.slmfnhxe6y5kgrnv@vireshk-i7>
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I saw your email about wrong version being sent, I already wrote some
reviews. Sending them anyway for FWIW :)

On 12-03-21, 21:33, Jie Deng wrote:
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> new file mode 100644
> index 0000000..bbde8de
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,287 @@
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
> + * @vq: the virtio virtqueue for communication
> + */
> +struct virtio_i2c {
> +	struct virtio_device *vdev;
> +	struct completion completion;
> +	struct i2c_adapter adap;
> +	struct mutex lock;

As I said in the previous version (Yes, we were both waiting for
Wolfram to answer that), this lock shouldn't be required at all.

And since none of us have a use-case at hand where we will have a
problem without this lock, we should really skip it. We can always
come back and add it if we find an issue somewhere. Until then, better
to keep it simple.

> +	struct virtqueue *vq;
> +};
> +
> +/**
> + * struct virtio_i2c_req - the virtio I2C request structure
> + * @out_hdr: the OUT header of the virtio I2C message
> + * @buf: the buffer into which data is read, or from which it's written
> + * @in_hdr: the IN header of the virtio I2C message
> + */
> +struct virtio_i2c_req {
> +	struct virtio_i2c_out_hdr out_hdr;
> +	uint8_t *buf;
> +	struct virtio_i2c_in_hdr in_hdr;
> +};
> +
> +static void virtio_i2c_msg_done(struct virtqueue *vq)
> +{
> +	struct virtio_i2c *vi = vq->vdev->priv;
> +
> +	complete(&vi->completion);
> +}
> +
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
> +	unsigned int len, unused;
> +	int i, j;
> +
> +	for (i = 0; i < nr; i++) {
> +		req = virtqueue_get_buf(vq, &len);
> +		if (!(req && req == &reqs[i])) {
> +			pr_err("msg[%d]: addr=0x%x is out of order.\n", i, msgs[i].addr);
> +			break;
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
> +	/* Release unused DMA safe buffer if any */
> +	for (j = i; j < nr; j++)
> +		i2c_put_dma_safe_msg_buf(req->buf, &msgs[j], false);
> +
> +	/* Detach all the used buffers from the vq */
> +	while (virtqueue_get_buf(vq, &unused))
> +		;
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
> +
> +static void virtio_i2c_del_vqs(struct virtio_device *vdev)
> +{
> +	vdev->config->reset(vdev);
> +	vdev->config->del_vqs(vdev);
> +}
> +
> +static int virtio_i2c_setup_vqs(struct virtio_i2c *vi)
> +{
> +	struct virtio_device *vdev = vi->vdev;
> +
> +	vi->vq = virtio_find_single_vq(vdev, virtio_i2c_msg_done, "msg");
> +	return PTR_ERR_OR_ZERO(vi->vq);
> +}
> +
> +static u32 virtio_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static struct i2c_algorithm virtio_algorithm = {
> +	.master_xfer = virtio_i2c_xfer,
> +	.functionality = virtio_i2c_func,
> +};
> +
> +static struct i2c_adapter virtio_adapter = {
> +	.owner = THIS_MODULE,
> +	.name = "Virtio I2C Adapter",
> +	.class = I2C_CLASS_DEPRECATED,

What happened to this discussion ?

https://lore.kernel.org/lkml/20210305072903.wtw645rukmqr5hx5@vireshk-i7/

> +	.algo = &virtio_algorithm,
> +};
> +
> +static int virtio_i2c_probe(struct virtio_device *vdev)
> +{
> +	struct device *pdev = vdev->dev.parent;
> +	struct virtio_i2c *vi;
> +	int ret;
> +
> +	vi = devm_kzalloc(&vdev->dev, sizeof(*vi), GFP_KERNEL);
> +	if (!vi)
> +		return -ENOMEM;
> +
> +	vdev->priv = vi;
> +	vi->vdev = vdev;
> +
> +	mutex_init(&vi->lock);
> +	init_completion(&vi->completion);
> +
> +	ret = virtio_i2c_setup_vqs(vi);
> +	if (ret)
> +		return ret;
> +
> +	vi->adap = virtio_adapter;

This is strange, why are you allocating memory for adapter twice ?
Once for virtio_adapter and once for vi->adap ? Either fill the fields
directly for v->adap here and remove virtio_adapter or make vi->adap a
pointer.

> +	i2c_set_adapdata(&vi->adap, vi);
> +	vi->adap.dev.parent = &vdev->dev;
> +
> +	/* Setup ACPI node for controlled devices which will be probed through ACPI */
> +	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> +	vi->adap.timeout = HZ / 10;
> +
> +	ret = i2c_add_adapter(&vi->adap);
> +	if (ret) {
> +		virtio_i2c_del_vqs(vdev);
> +		dev_err(&vdev->dev, "failed to add virtio-i2c adapter.\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static void virtio_i2c_remove(struct virtio_device *vdev)
> +{
> +	struct virtio_i2c *vi = vdev->priv;
> +
> +	i2c_del_adapter(&vi->adap);
> +	virtio_i2c_del_vqs(vdev);
> +}
> +
> +static struct virtio_device_id id_table[] = {
> +	{ VIRTIO_ID_I2C_ADPTER, VIRTIO_DEV_ANY_ID },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +
> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
> +{
> +	virtio_i2c_del_vqs(vdev);
> +	return 0;
> +}
> +
> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
> +{
> +	return virtio_i2c_setup_vqs(vdev->priv);
> +}
> +
> +static struct virtio_driver virtio_i2c_driver = {
> +	.id_table	= id_table,
> +	.probe		= virtio_i2c_probe,
> +	.remove		= virtio_i2c_remove,
> +	.driver	= {
> +		.name	= "i2c_virtio",
> +	},
> +#ifdef CONFIG_PM_SLEEP
> +	.freeze = virtio_i2c_freeze,
> +	.restore = virtio_i2c_restore,
> +#endif
> +};
> +module_virtio_driver(virtio_i2c_driver);
> +
> +MODULE_AUTHOR("Jie Deng <jie.deng@intel.com>");
> +MODULE_AUTHOR("Conghui Chen <conghui.chen@intel.com>");
> +MODULE_DESCRIPTION("Virtio i2c bus driver");
> +MODULE_LICENSE("GPL");
-- 
viresh
