Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4107A2C3C40
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Nov 2020 10:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgKYJfU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Nov 2020 04:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49332 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726039AbgKYJfT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Nov 2020 04:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606296916;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pwNmN2CPDqtDA/hh/EG7Lb7u72HnkbvU+HhgkZVizPM=;
        b=TzO3SXDQBbomooMfTjiKsQSwcxFpXM0QtgNWe3uq2Ys2gAjInGVN/LfE4Fc+5qRo2RUGCy
        EflgzbqBOPafzwSWKEvZI6zMu9uSJWJ+W/b2gu4McLhifrjbr1PiWgo++ghWK16HJ4z2Xd
        a8s2ROQdYlVcxYMrJQ17Tb5l83OTN9o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-Pg6QCm2lNAiiUUqaEuGCGg-1; Wed, 25 Nov 2020 04:35:12 -0500
X-MC-Unique: Pg6QCm2lNAiiUUqaEuGCGg-1
Received: by mail-wr1-f70.google.com with SMTP id i7so561651wro.6
        for <linux-i2c@vger.kernel.org>; Wed, 25 Nov 2020 01:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pwNmN2CPDqtDA/hh/EG7Lb7u72HnkbvU+HhgkZVizPM=;
        b=KtgwzQyK9dTMKVeIPG+L/tVl5DVmipTwx0itSLXHt28MeOmS9ENua4EjKRcFF+sEaL
         4pKezASgiI8R6B+d50X+QDokRedlJjlxV6Q68u33iDwi5Mx2oYwqPDIhYctKSNdt22jy
         6hVxwuOPrmt5XdSixFYydLl3D8xRWTj4HlsNTgOv/+JJS/JNjhnPnna5D1u9XbyiXC/m
         mctQoAmmcA0fIKNZWHjw0JlEkZ0uHstTtKsLt19JIw+rzaJ2DP6mtuA64qrUNjRhapZ7
         RT7zX0s362pfN/UNxCNFQw9ZU/dRr3kNgtqgB4XDN8tDzw/3G2XlSiP0JFlxxZtZDW7H
         H6FA==
X-Gm-Message-State: AOAM532Iu0zHUmKFlkmTs2XwSxNxd5XF4vQ1plgA76vAgEXlzl5izwog
        nqNDfSnja/9OibBXPzp7T/ERizL6FqNh/oSnaaTb79kfsxBX9/2CcfUrl2VGg85p/LeStjdbfs3
        SoRBFvr5dAmxXJ9UFoUm+
X-Received: by 2002:a1c:7719:: with SMTP id t25mr2834297wmi.59.1606296911605;
        Wed, 25 Nov 2020 01:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVYPtrIA7igYROsuEPeVUWGafRAf5uVYdn9uHl0nWRkgmXgdA+scQNnRfd57Pu9bTZtsnduA==
X-Received: by 2002:a1c:7719:: with SMTP id t25mr2834257wmi.59.1606296911240;
        Wed, 25 Nov 2020 01:35:11 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
        by smtp.gmail.com with ESMTPSA id l24sm3690799wrb.28.2020.11.25.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 01:35:10 -0800 (PST)
Date:   Wed, 25 Nov 2020 04:35:07 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
Subject: Re: [PATCH v4] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20201125043422-mutt-send-email-mst@kernel.org>
References: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 12, 2020 at 09:55:55AM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> This driver communicates with the backend driver through a
> virtio I2C message structure which includes following parts:
> 
> - Header: i2c_msg addr, flags, len.
> - Data buffer: the pointer to the I2C msg data.
> - Status: the processing result from the backend.
> 
> People may implement different backend drivers to emulate
> different controllers according to their needs. A backend
> example can be found in the device model of the open source
> project ACRN. For more information, please refer to
> https://projectacrn.org.
> 
> The virtio device ID 34 is used for this I2C adpter since IDs
> before 34 have been reserved by other virtio devices.
> 
> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> Reviewed-by: Shuo Liu <shuo.a.liu@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I assume this will be updated once the specification is acked
by the virtio tc. Holding off on this one for now since
we know there will be host/guest ABI changes.

> ---
> The device ID request:
>         https://github.com/oasis-tcs/virtio-spec/issues/85
> 
> The specification:
> 	https://lists.oasis-open.org/archives/virtio-comment/202009/msg00021.html
> 
> Changes in v4:
> 	- Use (!(vmsg && vmsg == &vi->vmsg)) instead of ((!vmsg) || (vmsg != &vi->vmsg))
> 
> Changes in v3:
>         - Move the interface into uAPI according to Jason.
>         - Fix issues reported by Dan Carpenter.
> 	- Fix typo reported by Randy.
> 
> Changes in v2:
>         - Addressed comments received from Michael, Andy and Jason.
> 
>  drivers/i2c/busses/Kconfig      |  11 ++
>  drivers/i2c/busses/Makefile     |   3 +
>  drivers/i2c/busses/i2c-virtio.c | 256 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/virtio_i2c.h |  31 +++++
>  include/uapi/linux/virtio_ids.h |   1 +
>  5 files changed, 302 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-virtio.c
>  create mode 100644 include/uapi/linux/virtio_i2c.h
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 293e7a0..f2f6543 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -21,6 +21,17 @@ config I2C_ALI1535
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-ali1535.
>  
> +config I2C_VIRTIO
> +	tristate "Virtio I2C Adapter"
> +	depends on VIRTIO
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
> index 19aff0e..821acfa 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -6,6 +6,9 @@
>  # ACPI drivers
>  obj-$(CONFIG_I2C_SCMI)		+= i2c-scmi.o
>  
> +# VIRTIO I2C host controller driver
> +obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
> +
>  # PC SMBus host controller drivers
>  obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535.o
>  obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> new file mode 100644
> index 0000000..36d8c68
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Virtio I2C Bus Driver
> + *
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/wait.h>
> +
> +#include <linux/virtio.h>
> +#include <linux/virtio_i2c.h>
> +
> +/**
> + * struct virtio_i2c_msg - the virtio I2C message structure
> + * @hdr: the virtio I2C message header
> + * @buf: virtio I2C message data buffer
> + * @status: the processing result from the backend
> + */
> +struct virtio_i2c_msg {
> +	struct virtio_i2c_hdr hdr;
> +	u8 *buf;
> +	u8 status;
> +};
> +
> +/**
> + * struct virtio_i2c - virtio I2C data
> + * @vdev: virtio device for this controller
> + * @completion: completion of virtio I2C message
> + * @vmsg: the virtio I2C message for communication
> + * @adap: I2C adapter for this controller
> + * @i2c_lock: lock for virtqueue processing
> + * @vq: the virtio virtqueue for communication
> + */
> +struct virtio_i2c {
> +	struct virtio_device *vdev;
> +	struct completion completion;
> +	struct virtio_i2c_msg vmsg;
> +	struct i2c_adapter adap;
> +	struct mutex i2c_lock;
> +	struct virtqueue *vq;
> +};
> +
> +static void virtio_i2c_msg_done(struct virtqueue *vq)
> +{
> +	struct virtio_i2c *vi = vq->vdev->priv;
> +
> +	complete(&vi->completion);
> +}
> +
> +static int virtio_i2c_add_msg(struct virtqueue *vq,
> +			      struct virtio_i2c_msg *vmsg,
> +			      struct i2c_msg *msg)
> +{
> +	struct scatterlist *sgs[3], hdr, bout, bin, status;
> +	int outcnt = 0, incnt = 0;
> +
> +	if (!msg->len)
> +		return -EINVAL;
> +
> +	vmsg->hdr.addr = cpu_to_le16(msg->addr);
> +	vmsg->hdr.flags = cpu_to_le16(msg->flags);
> +	vmsg->hdr.len = cpu_to_le16(msg->len);
> +
> +	vmsg->buf = kzalloc(msg->len, GFP_KERNEL);
> +	if (!vmsg->buf)
> +		return -ENOMEM;
> +
> +	sg_init_one(&hdr, &vmsg->hdr, sizeof(struct virtio_i2c_hdr));
> +	sgs[outcnt++] = &hdr;
> +	if (msg->flags & I2C_M_RD) {
> +		sg_init_one(&bin, vmsg->buf, msg->len);
> +		sgs[outcnt + incnt++] = &bin;
> +	} else {
> +		memcpy(vmsg->buf, msg->buf, msg->len);
> +		sg_init_one(&bout, vmsg->buf, msg->len);
> +		sgs[outcnt++] = &bout;
> +	}
> +	sg_init_one(&status, &vmsg->status, sizeof(vmsg->status));
> +	sgs[outcnt + incnt++] = &status;
> +
> +	return virtqueue_add_sgs(vq, sgs, outcnt, incnt, vmsg, GFP_KERNEL);
> +}
> +
> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> +	struct virtqueue *vq = vi->vq;
> +	struct virtio_i2c_msg *vmsg;
> +	unsigned long time_left;
> +	int len, i, ret = 0;
> +
> +	mutex_lock(&vi->i2c_lock);
> +	vmsg = &vi->vmsg;
> +	vmsg->buf = NULL;
> +
> +	for (i = 0; i < num; i++) {
> +		ret = virtio_i2c_add_msg(vq, vmsg, &msgs[i]);
> +		if (ret) {
> +			dev_err(&adap->dev, "failed to add msg[%d] to virtqueue.\n", i);
> +			break;
> +		}
> +
> +		virtqueue_kick(vq);
> +
> +		time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +		if (!time_left) {
> +			dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", i, msgs[i].addr);
> +			break;
> +		}
> +
> +		vmsg = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
> +		/* vmsg should point to the same address with &vi->vmsg */
> +		if (!(vmsg && vmsg == &vi->vmsg)) {
> +			dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue error.\n",
> +				i, msgs[i].addr);
> +			break;
> +		}
> +
> +		if (vmsg->status != VIRTIO_I2C_MSG_OK) {
> +			dev_err(&adap->dev, "msg[%d]: addr=0x%x error=%d.\n",
> +				i, msgs[i].addr, vmsg->status);
> +			break;
> +		}
> +
> +		if ((msgs[i].flags & I2C_M_RD) && msgs[i].len)
> +			memcpy(msgs[i].buf, vmsg->buf, msgs[i].len);
> +
> +		kfree(vmsg->buf);
> +		vmsg->buf = NULL;
> +
> +		reinit_completion(&vi->completion);
> +	}
> +
> +	mutex_unlock(&vi->i2c_lock);
> +	kfree(vi->vmsg.buf);
> +	vi->vmsg.buf = NULL;
> +	return ((ret < 0) ? ret : i);
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
> +	mutex_init(&vi->i2c_lock);
> +	init_completion(&vi->completion);
> +
> +	ret = virtio_i2c_setup_vqs(vi);
> +	if (ret)
> +		return ret;
> +
> +	vi->adap = virtio_adapter;
> +	i2c_set_adapdata(&vi->adap, vi);
> +	vi->adap.dev.parent = &vdev->dev;
> +	/* Setup ACPI node for slave devices which will be probed through ACPI */
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
> +MODULE_DESCRIPTION("Virtio i2c bus driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
> new file mode 100644
> index 0000000..7413e45
> --- /dev/null
> +++ b/include/uapi/linux/virtio_i2c.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
> +/*
> + * Definitions for virtio I2C Adpter
> + *
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
> +#define _UAPI_LINUX_VIRTIO_I2C_H
> +
> +#include <linux/types.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +
> +/**
> + * struct virtio_i2c_hdr - the virtio I2C message header structure
> + * @addr: i2c_msg addr, the slave address
> + * @flags: i2c_msg flags
> + * @len: i2c_msg len
> + */
> +struct virtio_i2c_hdr {
> +	__le16 addr;
> +	__le16 flags;
> +	__le16 len;
> +};
> +
> +/* The final status written by the device */
> +#define VIRTIO_I2C_MSG_OK	0
> +#define VIRTIO_I2C_MSG_ERR	1
> +
> +#endif /* _UAPI_LINUX_VIRTIO_I2C_H */
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index b052355..398ef2d 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -48,5 +48,6 @@
>  #define VIRTIO_ID_FS           26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADPTER   34 /* virtio i2c adpter */
>  
>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.7.4

