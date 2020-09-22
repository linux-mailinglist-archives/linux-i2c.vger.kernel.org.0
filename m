Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAE82740C3
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 13:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgIVL0K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 07:26:10 -0400
Received: from mga02.intel.com ([134.134.136.20]:49095 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbgIVL0K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 07:26:10 -0400
IronPort-SDR: hdqCU9MayGCXVdeuAb8qY/c58sHaymGA3Igs+U6CI60SRVGYAThK/fwNTHsy6j/tX4CDeTeh0T
 VbOpyaHerVog==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148245091"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="148245091"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 04:26:07 -0700
IronPort-SDR: Kur+dhn17MHtUpo7n7moW7dCFudSWJ1VAoW3vMO3W/uHyiiLHpzDK2zTraAFDE5/LGH6SCYJ32
 I7Ff5NJQeQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="338261909"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 22 Sep 2020 04:26:03 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kKgOi-0014sL-V4; Tue, 22 Sep 2020 14:23:48 +0300
Date:   Tue, 22 Sep 2020 14:23:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        Sergey.Semin@baikalelectronics.ru, krzk@kernel.org,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        bjorn.andersson@linaro.org, shuo.a.liu@intel.com,
        conghui.chen@intel.com, yu1.wang@intel.com
Subject: Re: [PATCH v3] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20200922112348.GL3956970@smile.fi.intel.com>
References: <1350309657ab0c7b9f97e7a5c71d084f88caa549.1600743079.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350309657ab0c7b9f97e7a5c71d084f88caa549.1600743079.git.jie.deng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 22, 2020 at 10:58:43AM +0800, Jie Deng wrote:
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
> ---
> The device ID request:
>         https://github.com/oasis-tcs/virtio-spec/issues/85
> 
> The specification:
> 	https://lists.oasis-open.org/archives/virtio-comment/202009/msg00021.html
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
> index 0000000..48fd780
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

> +		if ((!vmsg) || (vmsg != &vi->vmsg)) {

This is a bit difficult to read (esp. taking into account the above comment)
besides the fact of redundant parentheses. Why not simply:

		if (!(vmsg && vmsg == &vi->vmsg)) {

?

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
> 

-- 
With Best Regards,
Andy Shevchenko


