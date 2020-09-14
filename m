Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B41E2682C4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 04:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgINCqu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 22:46:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21646 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725995AbgINCqr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Sep 2020 22:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600051604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eYcfQIQ9vK5qWod5h+wvbrMiB5bVEFWtbXWv1EAsPmY=;
        b=akkLdbFPdRtYR2JRFgc8avCX00v9P4VAMyRWdlixb0Js3QSMCQCAVV98stbvG2md2i+Ff2
        TxJsKSGrQKLN3fBo3p6rQQU+EJp8L+Rh2p3vsh9ttDeUgsoVhKCHkq+mUC1BpTLOg+QRjO
        H+K6HuKXw3Jv7g6+22FOiNgmE68VgzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-P_mbxGKDNOGwhY_2P96hYA-1; Sun, 13 Sep 2020 22:46:38 -0400
X-MC-Unique: P_mbxGKDNOGwhY_2P96hYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 577541007C83;
        Mon, 14 Sep 2020 02:46:35 +0000 (UTC)
Received: from [10.72.13.25] (ovpn-13-25.pek2.redhat.com [10.72.13.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A54CA1002D41;
        Mon, 14 Sep 2020 02:46:22 +0000 (UTC)
Subject: Re: [PATCH v2] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <c4bd4fd56df36864ed34d3572f00b2b838fd833a.1599795029.git.jie.deng@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <ce6b55d9-dfda-4387-0e04-0d50437355f0@redhat.com>
Date:   Mon, 14 Sep 2020 10:46:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c4bd4fd56df36864ed34d3572f00b2b838fd833a.1599795029.git.jie.deng@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/11 上午11:48, Jie Deng wrote:
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
> 	https://github.com/oasis-tcs/virtio-spec/issues/85
>
> Changes in v2:
> 	- Addressed comments received from Michael, Andy and Jason.
>
>   drivers/i2c/busses/Kconfig      |  11 ++
>   drivers/i2c/busses/Makefile     |   3 +
>   drivers/i2c/busses/i2c-virtio.c | 271 ++++++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/virtio_ids.h |   1 +
>   4 files changed, 286 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-virtio.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 293e7a0..70c8e30 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -21,6 +21,17 @@ config I2C_ALI1535
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-ali1535.
>   
> +config I2C_VIRTIO
> +	tristate "Virtio I2C Adapter"
> +	depends on VIRTIO
> +	help
> +	  If you say yes to this option, support will be included for the virtio
> +	  i2c adapter driver. The hardware can be emulated by any device model
> +	  software according to the virtio protocol.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-virtio.
> +
>   config I2C_ALI1563
>   	tristate "ALI 1563"
>   	depends on PCI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 19aff0e..821acfa 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -6,6 +6,9 @@
>   # ACPI drivers
>   obj-$(CONFIG_I2C_SCMI)		+= i2c-scmi.o
>   
> +# VIRTIO I2C host controller driver
> +obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
> +
>   # PC SMBus host controller drivers
>   obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535.o
>   obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> new file mode 100644
> index 0000000..aff1a9a
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,271 @@
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
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +
> +#define VIRTIO_I2C_MSG_OK	0
> +#define VIRTIO_I2C_MSG_ERR	1
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


As said in v1, this should belong to uapi.


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


I'm not quite sure this is the best layout.

E.g virtio scsi differ in buffer out of out one:

structvirtio_scsi_req_cmd{
...
u8 dataout[];
...
u8 datain[];

}

And I would like to have a look at the spec patch.

Thanks


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
> +		if (vmsg) {
> +			/* vmsg should point to the same address with &vi->vmsg */
> +			if (vmsg != &vi->vmsg) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue error.\n",
> +					i, le16_to_cpu(vmsg->hdr.addr));
> +				break;
> +			}
> +			if (vmsg->status != VIRTIO_I2C_MSG_OK) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x error=%d.\n",
> +					i, le16_to_cpu(vmsg->hdr.addr), vmsg->status);
> +				break;
> +			}
> +			if ((msgs[i].flags & I2C_M_RD) && msgs[i].len)
> +				memcpy(msgs[i].buf, vmsg->buf, msgs[i].len);
> +
> +			kfree(vmsg->buf);
> +			vmsg->buf = NULL;
> +		}
> +
> +		reinit_completion(&vi->completion);
> +	}
> +
> +	mutex_unlock(&vi->i2c_lock);
> +	kfree(vmsg->buf);
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
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index b052355..398ef2d 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -48,5 +48,6 @@
>   #define VIRTIO_ID_FS           26 /* virtio filesystem */
>   #define VIRTIO_ID_PMEM         27 /* virtio pmem */
>   #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADPTER   34 /* virtio i2c adpter */
>   
>   #endif /* _LINUX_VIRTIO_IDS_H */

