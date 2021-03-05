Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4260332DF37
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Mar 2021 02:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhCEBqc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Mar 2021 20:46:32 -0500
Received: from mga09.intel.com ([134.134.136.24]:40784 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhCEBqc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Mar 2021 20:46:32 -0500
IronPort-SDR: zQkeYeFnjzmFpiVZIMIFPMC0tAtVeFbrFMZZuWW/Ddv/GxBWE8Cg0FN140ONFhJqhwx7ZQ9czi
 bJacHSEY7c4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187653101"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187653101"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 17:46:31 -0800
IronPort-SDR: hTV/ErBcs8L/B4TAeMfl2pMMEaabemYgrU/M8iFYi/n8rFLHGpqBcQdi5zY2hwkdSrVzEIYoCe
 pDCJIk4ix1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="384711461"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2021 17:46:25 -0800
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
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
        pbonzini@redhat.com,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <20210304060638.7qes424vvdmptz5c@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <f3f4aaf8-521c-3e9e-4757-97f2e33e44f6@intel.com>
Date:   Fri, 5 Mar 2021 09:46:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304060638.7qes424vvdmptz5c@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/4 14:06, Viresh Kumar wrote:
> Please always supply version history, it makes it difficult to review otherwise.
I will add the history.
>>   drivers/i2c/busses/Kconfig      |  11 ++
>>   drivers/i2c/busses/Makefile     |   3 +
>>   drivers/i2c/busses/i2c-virtio.c | 289 ++++++++++++++++++++++++++++++++++++++++
>>   include/uapi/linux/virtio_i2c.h |  42 ++++++
>>   include/uapi/linux/virtio_ids.h |   1 +
>>   5 files changed, 346 insertions(+)
>>   create mode 100644 drivers/i2c/busses/i2c-virtio.c
>>   create mode 100644 include/uapi/linux/virtio_i2c.h
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 05ebf75..0860395 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -21,6 +21,17 @@ config I2C_ALI1535
>>   	  This driver can also be built as a module.  If so, the module
>>   	  will be called i2c-ali1535.
>>   
>> +config I2C_VIRTIO
>> +	tristate "Virtio I2C Adapter"
>> +	depends on VIRTIO
> depends on I2C as well ?
No need that. The dependency of I2C is included in the Kconfig in its 
parent directory.
>
>> +	help
>> +	  If you say yes to this option, support will be included for the virtio
>> +	  I2C adapter driver. The hardware can be emulated by any device model
>> +	  software according to the virtio protocol.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called i2c-virtio.
>> +
>>   config I2C_ALI1563
>>   	tristate "ALI 1563"
>>   	depends on PCI
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 615f35e..b88da08 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -6,6 +6,9 @@
>>   # ACPI drivers
>>   obj-$(CONFIG_I2C_SCMI)		+= i2c-scmi.o
>>   
>> +# VIRTIO I2C host controller driver
>> +obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
>> +
> Not that it is important but I would have added it towards the end instead of at
> the top of the file..
I'm OK to add it to the end.
>
>>   # PC SMBus host controller drivers
>>   obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535.o
>>   obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
>> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
>> new file mode 100644
>> index 0000000..98c0fcc
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-virtio.c
>> @@ -0,0 +1,289 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Virtio I2C Bus Driver
>> + *
>> + * The Virtio I2C Specification:
>> + * https://raw.githubusercontent.com/oasis-tcs/virtio-spec/master/virtio-i2c.tex
>> + *
>> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/completion.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/io.h>
>> +#include <linux/jiffies.h>
> I don't think above two are required here..
>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> same here.
>
>> +#include <linux/wait.h>
> same here.
Will confirm and remove them if they are not required. Thank you.
>> +
> And this blank line as well, since all are standard linux headers.
>> +#include <linux/virtio.h>
>> +#include <linux/virtio_i2c.h>
>> +
>> +/**
>> + * struct virtio_i2c - virtio I2C data
>> + * @vdev: virtio device for this controller
>> + * @completion: completion of virtio I2C message
>> + * @adap: I2C adapter for this controller
>> + * @i2c_lock: lock for virtqueue processing
>> + * @vq: the virtio virtqueue for communication
>> + */
>> +struct virtio_i2c {
>> +	struct virtio_device *vdev;
>> +	struct completion completion;
>> +	struct i2c_adapter adap;
>> +	struct mutex i2c_lock;
> i2c_ is redundant here. "lock" sounds good enough.
OK.
>> +	struct virtqueue *vq;
>> +};
>> +
>> +/**
>> + * struct virtio_i2c_req - the virtio I2C request structure
>> + * @out_hdr: the OUT header of the virtio I2C message
>> + * @buf: the buffer into which data is read, or from which it's written
>> + * @in_hdr: the IN header of the virtio I2C message
>> + */
>> +struct virtio_i2c_req {
>> +	struct virtio_i2c_out_hdr out_hdr;
>> +	u8 *buf;
>> +	struct virtio_i2c_in_hdr in_hdr;
>> +};
>> +
>> +static void virtio_i2c_msg_done(struct virtqueue *vq)
>> +{
>> +	struct virtio_i2c *vi = vq->vdev->priv;
>> +
>> +	complete(&vi->completion);
>> +}
>> +
>> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
>> +				struct virtio_i2c_req *reqs,
>> +				struct i2c_msg *msgs, int nr)
>> +{
>> +	struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
>> +	int i, outcnt, incnt, err = 0;
>> +	u8 *buf;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		if (!msgs[i].len)
>> +			break;
>> +
>> +		/* Only 7-bit mode supported for this moment. For the address format,
>> +		 * Please check the Virtio I2C Specification.
>> +		 */
> Please use proper comment style.
will fix it.
>
>                  /*
>                   * Only 7-bit mode supported for now, check Virtio I2C
>                   * specification for format of "addr" field.
>                   */
>
>> +		reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
>> +
>> +		if (i != nr - 1)
>> +			reqs[i].out_hdr.flags |= VIRTIO_I2C_FLAGS_FAIL_NEXT;
> Since flags field hasn't been touched anywhere, directly assigning it may be
> better instead of |=, it makes it more readable.
OK.
>> +
>> +		outcnt = incnt = 0;
>> +		sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
>> +		sgs[outcnt++] = &out_hdr;
>> +
>> +		buf = kzalloc(msgs[i].len, GFP_KERNEL);
>> +		if (!buf)
>> +			break;
>> +
>> +		reqs[i].buf = buf;
>> +		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
>> +
>> +		if (msgs[i].flags & I2C_M_RD) {
>> +			sgs[outcnt + incnt++] = &msg_buf;
>> +		} else {
>> +			memcpy(reqs[i].buf, msgs[i].buf, msgs[i].len);
>> +			sgs[outcnt++] = &msg_buf;
>> +		}
>> +
>> +		sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
>> +		sgs[outcnt + incnt++] = &in_hdr;
>> +
>> +		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
>> +		if (err < 0) {
>> +			pr_err("failed to add msg[%d] to virtqueue.\n", i);
>> +			kfree(reqs[i].buf);
>> +			reqs[i].buf = NULL;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return i;
>> +}
>> +
>> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>> +					struct virtio_i2c_req *reqs,
>> +					struct i2c_msg *msgs, int nr)
>> +{
>> +	struct virtio_i2c_req *req;
>> +	unsigned int len;
>> +	int i;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		req = (struct virtio_i2c_req *)virtqueue_get_buf(vq, &len);
> No need of cast here since return type is void *.
Right. Thank you.
>
>> +		if (!(req && req == &reqs[i])) {
> I find this less readable compared to:
> 		if (!req || req != &reqs[i]) {

Different people may have different tastes.

Please check Andy's comment in this link.

https://lists.linuxfoundation.org/pipermail/virtualization/2020-September/049933.html

>
>> +			pr_err("msg[%d]: addr=0x%x virtqueue error.\n", i, msgs[i].addr);
>> +			break;
>> +		}
>> +
>> +		if (req->in_hdr.status != VIRTIO_I2C_MSG_OK) {
>> +			pr_err("msg[%d]: addr=0x%x backend error.\n", i, msgs[i].addr);
>> +			break;
>> +		}
> For all the above errors where you simply break out, you still need to free the
> memory for buf, right ?
Will try to use reqs[i].buf = msgs[i].buf to avoid allocation.
>> +
>> +		if (msgs[i].flags & I2C_M_RD)
>> +			memcpy(msgs[i].buf, req->buf, msgs[i].len);
>> +
>> +		kfree(req->buf);
>> +		req->buf = NULL;
>> +	}
>> +
>> +	return i;
>> +}
>> +
>> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>> +{
>> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
>> +	struct virtqueue *vq = vi->vq;
>> +	struct virtio_i2c_req *reqs;
>> +	unsigned long time_left;
>> +	int ret, nr;
>> +
>> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
>> +	if (!reqs)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&vi->i2c_lock);
> I have never worked with i2c stuff earlier, but I don't think you need a lock
> here. The transactions seem to be serialized by the i2c-core by itself (look at
> i2c_transfer() in i2c-core-base.c), though there is another exported version
> __i2c_transfer() but the comment over it says the callers must take adapter lock
> before calling it.
Lock is needed since no "lock_ops" is registered in this i2c_adapter.
>
>> +
>> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>> +	if (ret == 0)
>> +		goto err_unlock_free;
>> +
>> +	nr = ret;
>> +
>> +	virtqueue_kick(vq);
>> +
>> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
>> +	if (!time_left) {
>> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>> +		ret = -ETIMEDOUT;
> You need to free bufs of the requests here as well..
>
>> +		goto err_unlock_free;
>> +	}
>> +
>> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr);
>> +
>> +	reinit_completion(&vi->completion);
>> +
>> +err_unlock_free:
>> +	mutex_unlock(&vi->i2c_lock);
>> +	kfree(reqs);
>> +	return ret;
>> +}
>> +
>> +static void virtio_i2c_del_vqs(struct virtio_device *vdev)
>> +{
>> +	vdev->config->reset(vdev);
>> +	vdev->config->del_vqs(vdev);
>> +}
>> +
>> +static int virtio_i2c_setup_vqs(struct virtio_i2c *vi)
>> +{
>> +	struct virtio_device *vdev = vi->vdev;
>> +
>> +	vi->vq = virtio_find_single_vq(vdev, virtio_i2c_msg_done, "msg");
>> +	return PTR_ERR_OR_ZERO(vi->vq);
>> +}
>> +
>> +static u32 virtio_i2c_func(struct i2c_adapter *adap)
>> +{
>> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> +}
>> +
>> +static struct i2c_algorithm virtio_algorithm = {
>> +	.master_xfer = virtio_i2c_xfer,
>> +	.functionality = virtio_i2c_func,
>> +};
>> +
>> +static struct i2c_adapter virtio_adapter = {
>> +	.owner = THIS_MODULE,
>> +	.name = "Virtio I2C Adapter",
>> +	.class = I2C_CLASS_DEPRECATED,
> Why are we using something that is deprecated here ?
Warn users that the adapter doesn't support classes anymore.
>
>> +	.algo = &virtio_algorithm,
>> +};
>> +
>> +static int virtio_i2c_probe(struct virtio_device *vdev)
>> +{
>> +	struct device *pdev = vdev->dev.parent;
>> +	struct virtio_i2c *vi;
>> +	int ret;
>> +
>> +	vi = devm_kzalloc(&vdev->dev, sizeof(*vi), GFP_KERNEL);
>> +	if (!vi)
>> +		return -ENOMEM;
>> +
>> +	vdev->priv = vi;
>> +	vi->vdev = vdev;
>> +
>> +	mutex_init(&vi->i2c_lock);
>> +	init_completion(&vi->completion);
>> +
>> +	ret = virtio_i2c_setup_vqs(vi);
>> +	if (ret)
>> +		return ret;
>> +
>> +	vi->adap = virtio_adapter;
>> +	i2c_set_adapdata(&vi->adap, vi);
>> +	vi->adap.dev.parent = &vdev->dev;
> better add a blank line here.
OK.
>> +	/* Setup ACPI node for controlled devices which will be probed through ACPI */
>> +	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
>> +	vi->adap.timeout = HZ / 10;
>> +
>> +	ret = i2c_add_adapter(&vi->adap);
>> +	if (ret) {
>> +		virtio_i2c_del_vqs(vdev);
>> +		dev_err(&vdev->dev, "failed to add virtio-i2c adapter.\n");
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void virtio_i2c_remove(struct virtio_device *vdev)
>> +{
>> +	struct virtio_i2c *vi = vdev->priv;
>> +
>> +	i2c_del_adapter(&vi->adap);
>> +	virtio_i2c_del_vqs(vdev);
>> +}
>> +
>> +static struct virtio_device_id id_table[] = {
>> +	{ VIRTIO_ID_I2C_ADPTER, VIRTIO_DEV_ANY_ID },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(virtio, id_table);
>> +
>> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
>> +{
>> +	virtio_i2c_del_vqs(vdev);
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
>> +{
>> +	return virtio_i2c_setup_vqs(vdev->priv);
>> +}
>> +
>> +static struct virtio_driver virtio_i2c_driver = {
>> +	.id_table	= id_table,
>> +	.probe		= virtio_i2c_probe,
>> +	.remove		= virtio_i2c_remove,
>> +	.driver	= {
>> +		.name	= "i2c_virtio",
>> +	},
>> +#ifdef CONFIG_PM_SLEEP
>> +	.freeze = virtio_i2c_freeze,
>> +	.restore = virtio_i2c_restore,
>> +#endif
>> +};
>> +module_virtio_driver(virtio_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("Virtio i2c bus driver");
> You can add module-author as well here.
Sure. I'm glad to do that.
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
>> new file mode 100644
>> index 0000000..00f4508
>> --- /dev/null
>> +++ b/include/uapi/linux/virtio_i2c.h
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
>> +/*
>> + * Definitions for virtio I2C Adpter
>> + *
>> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/virtio_ids.h>
>> +#include <linux/virtio_config.h>
> Any file (header or c) should only include what it directly needs and nothing
> else. And so you should need only types.h here and nothing else.
OK.
>> +
>> +/**
>> + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
>> + * @addr: the controlled device address
>> + * @padding: used to pad to full dword
>> + * @flags: used for feature extensibility
>> + */
>> +struct virtio_i2c_out_hdr {
>> +	__le16 addr;
>> +	__le16 padding;
>> +	__le32 flags;
>> +};
> It might be worth setting __packed for the structures here, even when we have
> taken care of padding ourselves, for both the structures..
Please check Michael's comment https://lkml.org/lkml/2020/9/3/339.
I agreed to remove "__packed" .
>> +
>> +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
>> +#define VIRTIO_I2C_FLAGS_FAIL_NEXT	0x00000001
>> +
> I would define this before the above structure.
OK.
>> +/**
>> + * struct virtio_i2c_in_hdr - the virtio I2C message IN header
>> + * @status: the processing result from the backend
>> + */
>> +struct virtio_i2c_in_hdr {
>> +	u8 status;
>> +};
>> +
>> +/* The final status written by the device */
>> +#define VIRTIO_I2C_MSG_OK	0
>> +#define VIRTIO_I2C_MSG_ERR	1
>> +
>> +#endif /* _UAPI_LINUX_VIRTIO_I2C_H */
>> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
>> index bc1c062..6ae32db 100644
>> --- a/include/uapi/linux/virtio_ids.h
>> +++ b/include/uapi/linux/virtio_ids.h
>> @@ -54,5 +54,6 @@
>>   #define VIRTIO_ID_FS			26 /* virtio filesystem */
>>   #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>>   #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
>> +#define VIRTIO_ID_I2C_ADPTER		34 /* virtio i2c adpter */
>>   
>>   #endif /* _LINUX_VIRTIO_IDS_H */
> Thanks for yet another version Jie.
>
