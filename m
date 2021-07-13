Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93C93C735E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 17:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237020AbhGMPlD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 11:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45051 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236992AbhGMPlD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 11:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626190693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PkpGjk3IAqUo4g2B+8cvDFjwsKJtxW8AwUw5KJ9QtHg=;
        b=eULWG48aeonhA9zmOaAyt1YaDOVA4c1Q5UTXRM/cdvrs+ip1aux5f442RgERISgF177kT8
        aHi6psaSLSDSff7IIS/FJxIgvWzGficjXNrJvxGTs7VrJILbMZSB2xVmSTT7xODuSLjXGS
        Kfxj64EST4KvYUFYq7TpKvx+lbFZ8+c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-x0ZT5TQvPJO-k5bVVwcTeQ-1; Tue, 13 Jul 2021 11:38:12 -0400
X-MC-Unique: x0ZT5TQvPJO-k5bVVwcTeQ-1
Received: by mail-wm1-f69.google.com with SMTP id m6-20020a05600c4f46b0290205f5e73b37so1626252wmq.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jul 2021 08:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PkpGjk3IAqUo4g2B+8cvDFjwsKJtxW8AwUw5KJ9QtHg=;
        b=SNDPbMYFSSRkdv8bmZ7qC+K1r59/RudLk2kzuBpC/4VyCkz3dyuOhaqe6Mopiqw+YU
         k9rPoDG2I//Awtejqvh+QMFdJiY+Ug8gyHqDOdNtO7zRWWfgOWKmPhgCPotqCn1HcN1c
         7m3V1wCMzrMoSVBw65sCsXhrtzSZblUR5BI8rWH9Q+GimDyE6v2wyqdNd6aSOVwoWLZJ
         bK3tK0BYqvXFdQrSxqa3WQHROh01VoeJFD86xWr3GHXqg9vPzaWw36+Yta4kr2abDD50
         DzJa+Q8CxOST/++awVkTsOrJB8mBdcjQtuCoTo59lCIBp78DdjqcbDcyPNkVxDJuzAQ+
         k+dw==
X-Gm-Message-State: AOAM533Krn3goHVHyBzAMD5meMvnQyV1JOv7peryWavLKCpsVhMLTyy3
        DBRIcQS5uarjck769K6flIteVCfOLS47C1/zEgmO55zYSq73UOhtPl32fr8fQ8dUON7R0r1D5QN
        gV0isQaD0swVW3bRBtYmy
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr6543708wri.261.1626190690801;
        Tue, 13 Jul 2021 08:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5gRYN/5Fm8EE9B9Q//aKvJjbg4Hmw8ae63wQji1dUg1u2RqchL2CD/ZfgcYIuPvVrzJ4zXg==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr6543680wri.261.1626190690558;
        Tue, 13 Jul 2021 08:38:10 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
        by smtp.gmail.com with ESMTPSA id y197sm1893726wmc.7.2021.07.13.08.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 08:38:09 -0700 (PDT)
Date:   Tue, 13 Jul 2021 11:38:05 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210713113607-mutt-send-email-mst@kernel.org>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 09, 2021 at 10:25:30AM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
> 
> By following the specification, people may implement different
> backend drivers to emulate different controllers according to
> their needs.
> 
> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> ---
> Changes v13 -> v14
> 	- Put the headers in virtio_i2c.h in alphabetical order.
> 	- Dropped I2C_FUNC_SMBUS_QUICK support.
> 	- Dropped few unnecessary variables and checks.
> 	- Use "num" everywhere instead of num or nr, to be consistent.
> 	- Added few comments which make the design more clear. 
>  
> Changes v12 -> v13
> 	- Use _BITUL() instead of BIT().
> 	- Rename "virtio_i2c_send_reqs" to "virtio_i2c_prepare_reqs".
> 	- Optimize the return value of "virtio_i2c_complete_reqs".
> 
> Changes v11 -> v12
> 	- Do not sent msg_buf for zero-length request.
> 	- Send requests to host only if all the number of transfers requested prepared successfully.
> 	- Remove the line #include <linux/bits.h> in virtio_i2c.h.
> 
> Changes v10 -> v11
> 	- Remove vi->adap.class = I2C_CLASS_DEPRECATED.
> 	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".
> 	- Remove "struct mutex lock" in "struct virtio_i2c".
> 	- Support zero-length request.
> 	- Remove unnecessary logs.
> 	- Remove vi->adap.timeout = HZ / 10, just use the default value.
> 	- Use BIT(0) to define VIRTIO_I2C_FLAGS_FAIL_NEXT.
> 	- Add the virtio_device index to adapter's naming mechanism.
> 
>  drivers/i2c/busses/Kconfig      |  11 ++
>  drivers/i2c/busses/Makefile     |   3 +
>  drivers/i2c/busses/i2c-virtio.c | 285 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/virtio_i2c.h |  41 ++++++
>  include/uapi/linux/virtio_ids.h |   1 +
>  5 files changed, 341 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-virtio.c
>  create mode 100644 include/uapi/linux/virtio_i2c.h
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 10acece..e47616a 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -21,6 +21,17 @@ config I2C_ALI1535
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-ali1535.
>  
> +config I2C_VIRTIO
> +	tristate "Virtio I2C Adapter"
> +	select VIRTIO
> +	help
> +	  If you say yes to this option, support will be included for the virtio
> +	  I2C adapter driver. The hardware can be emulated by any device model
> +	  software according to the virtio protocol.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-virtio.
> +
>  config I2C_ALI1563
>  	tristate "ALI 1563"
>  	depends on PCI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 69e9963..9843756 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -147,4 +147,7 @@ obj-$(CONFIG_I2C_XGENE_SLIMPRO) += i2c-xgene-slimpro.o
>  obj-$(CONFIG_SCx200_ACB)	+= scx200_acb.o
>  obj-$(CONFIG_I2C_FSI)		+= i2c-fsi.o
>  
> +# VIRTIO I2C host controller driver
> +obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
> +
>  ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> new file mode 100644
> index 0000000..0139cdc
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,285 @@
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
> + * @vq: the virtio virtqueue for communication
> + */
> +struct virtio_i2c {
> +	struct virtio_device *vdev;
> +	struct completion completion;
> +	struct i2c_adapter adap;
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
> +	struct virtio_i2c_out_hdr out_hdr	____cacheline_aligned;
> +	uint8_t *buf				____cacheline_aligned;
> +	struct virtio_i2c_in_hdr in_hdr		____cacheline_aligned;
> +};
> +
> +static void virtio_i2c_msg_done(struct virtqueue *vq)
> +{
> +	struct virtio_i2c *vi = vq->vdev->priv;
> +
> +	complete(&vi->completion);
> +}
> +
> +static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
> +				   struct virtio_i2c_req *reqs,
> +				   struct i2c_msg *msgs, int num)
> +{
> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
> +	int i;
> +
> +	for (i = 0; i < num; i++) {
> +		int outcnt = 0, incnt = 0;
> +
> +		/*
> +		 * We don't support 0 length messages and so masked out
> +		 * I2C_FUNC_SMBUS_QUICK in virtio_i2c_func().
> +		 */
> +		if (!msgs[i].len)
> +			break;
> +
> +		/*
> +		 * Only 7-bit mode supported for this moment. For the address
> +		 * format, Please check the Virtio I2C Specification.
> +		 */
> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
> +
> +		if (i != num - 1)
> +			reqs[i].out_hdr.flags = cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT);
> +
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
> +		if (virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL)) {
> +			i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], false);
> +			break;
> +		}


I think we should tweak this such that we add multiple buffers but
only make them visible to host after all add commands were successful.
With split this is possible by deffering avail idx update,
with packed by deferring update of the avail bit in the descriptor.
I'll write a patch to add an API like that to virtio, then we
can switch to that.


> +	}
> +
> +	return i;
> +}
> +
> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> +				    struct virtio_i2c_req *reqs,
> +				    struct i2c_msg *msgs, int num,
> +				    bool timedout)
> +{
> +	struct virtio_i2c_req *req;
> +	bool failed = timedout;
> +	unsigned int len;
> +	int i, j = 0;
> +
> +	for (i = 0; i < num; i++) {
> +		/* Detach the ith request from the vq */
> +		req = virtqueue_get_buf(vq, &len);
> +
> +		/*
> +		 * Condition req == &reqs[i] should always meet since we have
> +		 * total num requests in the vq. reqs[i] can never be NULL here.
> +		 */
> +		if (!failed && (WARN_ON(req != &reqs[i]) ||
> +				req->in_hdr.status != VIRTIO_I2C_MSG_OK))
> +			failed = true;
> +
> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> +
> +		if (!failed)
> +			j++;
> +	}
> +
> +	return timedout ? -ETIMEDOUT : j;
> +}
> +
> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			   int num)
> +{
> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> +	struct virtqueue *vq = vi->vq;
> +	struct virtio_i2c_req *reqs;
> +	unsigned long time_left;
> +	int count;
> +
> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> +	if (!reqs)
> +		return -ENOMEM;
> +
> +	count = virtio_i2c_prepare_reqs(vq, reqs, msgs, num);
> +	if (!count)
> +		goto err_free;
> +
> +	/*
> +	 * For the case where count < num, i.e. we weren't able to queue all the
> +	 * msgs, ideally we should abort right away and return early, but some
> +	 * of the messages are already sent to the remote I2C controller and the
> +	 * virtqueue will be left in undefined state in that case. We kick the
> +	 * remote here to clear the virtqueue, so we can try another set of
> +	 * messages later on.
> +	 */
> +
> +	reinit_completion(&vi->completion);
> +	virtqueue_kick(vq);
> +
> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +	if (!time_left)
> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> +
> +	count = virtio_i2c_complete_reqs(vq, reqs, msgs, count, !time_left);
> +
> +err_free:
> +	kfree(reqs);
> +	return count;
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
> +	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> +}
> +
> +static struct i2c_algorithm virtio_algorithm = {
> +	.master_xfer = virtio_i2c_xfer,
> +	.functionality = virtio_i2c_func,
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
> +	init_completion(&vi->completion);
> +
> +	ret = virtio_i2c_setup_vqs(vi);
> +	if (ret)
> +		return ret;
> +
> +	vi->adap.owner = THIS_MODULE;
> +	snprintf(vi->adap.name, sizeof(vi->adap.name),
> +		 "i2c_virtio at virtio bus %d", vdev->index);
> +	vi->adap.algo = &virtio_algorithm;
> +	vi->adap.dev.parent = &vdev->dev;
> +	i2c_set_adapdata(&vi->adap, vi);
> +
> +	/*
> +	 * Setup ACPI node for controlled devices which will be probed through
> +	 * ACPI.
> +	 */
> +	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> +
> +	ret = i2c_add_adapter(&vi->adap);
> +	if (ret)
> +		virtio_i2c_del_vqs(vdev);
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
> +	{ VIRTIO_ID_I2C_ADAPTER, VIRTIO_DEV_ANY_ID },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +
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
> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
> new file mode 100644
> index 0000000..7c6a6fc
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
> +#include <linux/const.h>
> +#include <linux/types.h>
> +
> +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
> +#define VIRTIO_I2C_FLAGS_FAIL_NEXT	_BITUL(0)
> +
> +/**
> + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
> + * @addr: the controlled device address
> + * @padding: used to pad to full dword
> + * @flags: used for feature extensibility
> + */
> +struct virtio_i2c_out_hdr {
> +	__le16 addr;
> +	__le16 padding;
> +	__le32 flags;
> +};
> +
> +/**
> + * struct virtio_i2c_in_hdr - the virtio I2C message IN header
> + * @status: the processing result from the backend
> + */
> +struct virtio_i2c_in_hdr {
> +	__u8 status;
> +};
> +
> +/* The final status written by the device */
> +#define VIRTIO_I2C_MSG_OK	0
> +#define VIRTIO_I2C_MSG_ERR	1
> +
> +#endif /* _UAPI_LINUX_VIRTIO_I2C_H */
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index 4fe842c..3b5f05a 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -55,6 +55,7 @@
>  #define VIRTIO_ID_FS			26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
>  #define VIRTIO_ID_BT			40 /* virtio bluetooth */
>  
>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.7.4

