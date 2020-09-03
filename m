Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E332725BEB6
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 11:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgICJ7B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 05:59:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59011 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726543AbgICJ66 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 05:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599127136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nNc60Gq5RK/C8kUq71+92jh70ccIAFs4rxIcS4CbeDM=;
        b=fYNXzAahsApgo1+ZAEFla6JdvdXknbsNpgYxsdJHgBwMs3e7QvBwdaFVgDsSdMFcampB2b
        8c8mIKjcS2cKv2zPhSIcqNEcyR1Iwxf+7yNBzXXGYD8jDQe0HTraOoz4ABDmzvn9/QacM1
        gICAkkit61gusdNq+eR7OvqkVxtfmoE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-I9g_5lKsNSiWQV2arLqPdg-1; Thu, 03 Sep 2020 05:58:51 -0400
X-MC-Unique: I9g_5lKsNSiWQV2arLqPdg-1
Received: by mail-wr1-f72.google.com with SMTP id r16so869551wrm.18
        for <linux-i2c@vger.kernel.org>; Thu, 03 Sep 2020 02:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nNc60Gq5RK/C8kUq71+92jh70ccIAFs4rxIcS4CbeDM=;
        b=OTY77ILU+t0SDYu4MO7/0ifKxViyE6bBGKCfnC+TGieHvynr0ePiQaL36aEHB3V0Ix
         6NxmhMFa5Zn2ajv0JK1Ci/MhgP9a+9C8WQYYC/viTvlIjGOQgN3LLD/hz6lTbMscIPHS
         S8okfNcxq2lP8Y/w8+sa8xmxmB7/Ial1sVsKPO1TnNrE7EJlkAeo5h4LqpaYBKfYitaA
         Tc2GV/O2gEyzTjVanEFElpokWlq9F8j+HQ2qrIgOHOHnhuYz7vIPC49lAUZoSohhRmgM
         Xzs+wcKARKR/nazUwEAWMtYA6T/MsOvx+J74qFvwDetcN1Cr4ft/aouWQkAB1kGve2Pu
         4haQ==
X-Gm-Message-State: AOAM53388Mw9oGhAUHb4JymfmdKDkojYF+8BdekyD3Wf0MtC0F8xL4GM
        /UjPzMQYn2l4K5phnWzScItvtVOrpkZbTZ3WlIrNjG08WQJIFcLG1+VXVkPaszqy4Dfex3UhLUk
        REbqT427OeuxB0GZdUkBB
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr1653257wmk.86.1599127130580;
        Thu, 03 Sep 2020 02:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxXFnoBeJakzQY/Rh5Q5iezZdoyOEuLybrZ/tH+WZUK0IZcoeOwidNoVsA8y6cyNY0mAnZZw==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr1653220wmk.86.1599127130287;
        Thu, 03 Sep 2020 02:58:50 -0700 (PDT)
Received: from redhat.com (bzq-79-177-107-202.red.bezeqint.net. [79.177.107.202])
        by smtp.gmail.com with ESMTPSA id z9sm3436337wma.4.2020.09.03.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 02:58:49 -0700 (PDT)
Date:   Thu, 3 Sep 2020 05:58:46 -0400
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
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20200903055633-mutt-send-email-mst@kernel.org>
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 03, 2020 at 01:34:45PM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> This driver communicates with the backend driver through a
> virtio I2C message structure which includes following parts:
> 
> - Header: i2c_msg addr, flags, len.
> - Data buffer: the pointer to the i2c msg data.
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

Please reserve the ID with the virtio tc so no one conflicts.


> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> Reviewed-by: Shuo Liu <shuo.a.liu@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/Kconfig      |  11 ++
>  drivers/i2c/busses/Makefile     |   3 +
>  drivers/i2c/busses/i2c-virtio.c | 276 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/virtio_ids.h |   1 +
>  4 files changed, 291 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-virtio.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 293e7a0..70c8e30 100644
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
> +	  i2c adapter driver. The hardware can be emulated by any device model
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
> index 0000000..47f9fd1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -0,0 +1,276 @@
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
> +	__virtio16 addr;
> +	__virtio16 flags;
> +	__virtio16 len;
> +} __packed;

virtio16 is for legacy devices, modern ones should be __le.
and  we don't really need to pack it I think.

> +
> +/**
> + * struct virtio_i2c_msg - the virtio I2C message structure
> + * @hdr: the virtio I2C message header
> + * @buf: virtio I2C message data buffer
> + * @status: the processing result from the backend
> + */
> +struct virtio_i2c_msg {
> +	struct virtio_i2c_hdr hdr;
> +	char *buf;
> +	u8 status;
> +};
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
> +	vmsg->hdr.addr = msg->addr;
> +	vmsg->hdr.flags = msg->flags;
> +	vmsg->hdr.len = msg->len;
> +
> +	vmsg->buf = kzalloc(vmsg->hdr.len, GFP_KERNEL);
> +	if (!vmsg->buf)
> +		return -ENOMEM;
> +
> +	sg_init_one(&hdr, &vmsg->hdr, sizeof(struct virtio_i2c_hdr));
> +	sgs[outcnt++] = &hdr;
> +	if (vmsg->hdr.flags & I2C_M_RD) {
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
> +	struct virtio_i2c_msg *vmsg_o, *vmsg_i;
> +	struct virtqueue *vq = vi->vq;
> +	unsigned long time_left;
> +	int len, i, ret = 0;
> +
> +	vmsg_o = kzalloc(sizeof(*vmsg_o), GFP_KERNEL);
> +	if (!vmsg_o)
> +		return -ENOMEM;
> +
> +	mutex_lock(&vi->i2c_lock);
> +	vmsg_o->buf = NULL;
> +	for (i = 0; i < num; i++) {
> +		ret = virtio_i2c_add_msg(vq, vmsg_o, &msgs[i]);
> +		if (ret) {
> +			dev_err(&adap->dev, "failed to add msg[%d] to virtqueue.\n", i);
> +			goto err_unlock_free;
> +		}
> +
> +		virtqueue_kick(vq);
> +
> +		time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +		if (!time_left) {
> +			dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", i, msgs[i].addr);
> +			ret = i;
> +			goto err_unlock_free;
> +		}
> +
> +		vmsg_i = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
> +		if (vmsg_i) {
> +			/* vmsg_i should point to the same address with vmsg_o */
> +			if (vmsg_i != vmsg_o) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue error.\n",
> +					i, vmsg_i->hdr.addr);
> +				ret = i;
> +				goto err_unlock_free;
> +			}
> +			if (vmsg_i->status != VIRTIO_I2C_MSG_OK) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x error=%d.\n",
> +					i, vmsg_i->hdr.addr, vmsg_i->status);
> +				ret = i;
> +				goto err_unlock_free;
> +			}
> +			if ((vmsg_i->hdr.flags & I2C_M_RD) && vmsg_i->hdr.len)
> +				memcpy(msgs[i].buf, vmsg_i->buf, vmsg_i->hdr.len);
> +
> +			kfree(vmsg_i->buf);
> +			vmsg_i->buf = NULL;
> +		}
> +		reinit_completion(&vi->completion);
> +	}
> +	if (i == num)
> +		ret = num;
> +
> +err_unlock_free:
> +	mutex_unlock(&vi->i2c_lock);
> +	kfree(vmsg_o->buf);
> +	kfree(vmsg_o);
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
> +	vi->vq = virtio_find_single_vq(vdev, virtio_i2c_msg_done, "i2c-msg");
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
> +	ret = i2c_add_adapter(&vi->adap);
> +	if (ret) {
> +		dev_err(&vdev->dev, "failed to add virtio-i2c adapter.\n");
> +		virtio_i2c_del_vqs(vdev);
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
>  #define VIRTIO_ID_FS           26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADPTER   34 /* virtio i2c adpter */
>  
>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.7.4

