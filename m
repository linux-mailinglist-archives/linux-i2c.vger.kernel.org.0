Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A651B32E2DE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Mar 2021 08:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhCEHXl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Mar 2021 02:23:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39651 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229446AbhCEHXl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Mar 2021 02:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614929020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a98feOudvA9eVDUI/p5fdjIVH7gvcLp2zycuZp+r/kY=;
        b=F2moEGWP4sf5dsueztQjQypX6lcsAsb3FPudVIBbCV3U8xJ3xhSbqaXhzk9pbj3qdtQWyT
        TAzlbtDVkZ0obaulSJfZuRMM+D6dD/TMa9E7vVSjkpjMk7gfR9+XLqxD7EGkaCwXpB/2dM
        0M0QJFS8SqCYt9ap/x0NTTAbMOxbWPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-1e4itmIFPFG6PWy1mg5tNA-1; Fri, 05 Mar 2021 02:23:36 -0500
X-MC-Unique: 1e4itmIFPFG6PWy1mg5tNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE3F1108BD0C;
        Fri,  5 Mar 2021 07:23:33 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-165.pek2.redhat.com [10.72.12.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D985E60C5F;
        Fri,  5 Mar 2021 07:23:11 +0000 (UTC)
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa@kernel.org, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
 <76554717-fc77-1c63-58d2-58aa04f7af9b@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <7aa23b71-01eb-5824-b1db-892ede690fce@redhat.com>
Date:   Fri, 5 Mar 2021 15:23:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <76554717-fc77-1c63-58d2-58aa04f7af9b@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/5 1:47 下午, Jie Deng wrote:
>
> On 2021/3/4 17:15, Jason Wang wrote:
>>
>> On 2021/3/4 9:59 上午, Jie Deng wrote:
>>> Add an I2C bus driver for virtio para-virtualization.
>>>
>>> The controller can be emulated by the backend driver in
>>> any device model software by following the virtio protocol.
>>>
>>> The device specification can be found on
>>> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html. 
>>>
>>>
>>> By following the specification, people may implement different
>>> backend drivers to emulate different controllers according to
>>> their needs.
>>>
>>> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
>>> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
>>> Signed-off-by: Jie Deng <jie.deng@intel.com>
>>> ---
>>>   drivers/i2c/busses/Kconfig      |  11 ++
>>>   drivers/i2c/busses/Makefile     |   3 +
>>>   drivers/i2c/busses/i2c-virtio.c | 289 
>>> ++++++++++++++++++++++++++++++++++++++++
>>>   include/uapi/linux/virtio_i2c.h |  42 ++++++
>>>   include/uapi/linux/virtio_ids.h |   1 +
>>>   5 files changed, 346 insertions(+)
>>>   create mode 100644 drivers/i2c/busses/i2c-virtio.c
>>>   create mode 100644 include/uapi/linux/virtio_i2c.h
>>>
>>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>>> index 05ebf75..0860395 100644
>>> --- a/drivers/i2c/busses/Kconfig
>>> +++ b/drivers/i2c/busses/Kconfig
>>> @@ -21,6 +21,17 @@ config I2C_ALI1535
>>>         This driver can also be built as a module.  If so, the module
>>>         will be called i2c-ali1535.
>>>   +config I2C_VIRTIO
>>> +    tristate "Virtio I2C Adapter"
>>> +    depends on VIRTIO
>>
>>
>> Please use select here. There's no prompt for VIRTIO.
>>
> OK.
>>
>>> +    help
>>> +      If you say yes to this option, support will be included for 
>>> the virtio
>>> +      I2C adapter driver. The hardware can be emulated by any 
>>> device model
>>> +      software according to the virtio protocol.
>>> +
>>> +      This driver can also be built as a module. If so, the module
>>> +      will be called i2c-virtio.
>>> +
>>>   config I2C_ALI1563
>>>       tristate "ALI 1563"
>>>       depends on PCI
>>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>>> index 615f35e..b88da08 100644
>>> --- a/drivers/i2c/busses/Makefile
>>> +++ b/drivers/i2c/busses/Makefile
>>> @@ -6,6 +6,9 @@
>>>   # ACPI drivers
>>>   obj-$(CONFIG_I2C_SCMI)        += i2c-scmi.o
>>>   +# VIRTIO I2C host controller driver
>>> +obj-$(CONFIG_I2C_VIRTIO)    += i2c-virtio.o
>>> +
>>>   # PC SMBus host controller drivers
>>>   obj-$(CONFIG_I2C_ALI1535)    += i2c-ali1535.o
>>>   obj-$(CONFIG_I2C_ALI1563)    += i2c-ali1563.o
>>> diff --git a/drivers/i2c/busses/i2c-virtio.c 
>>> b/drivers/i2c/busses/i2c-virtio.c
>>> new file mode 100644
>>> index 0000000..98c0fcc
>>> --- /dev/null
>>> +++ b/drivers/i2c/busses/i2c-virtio.c
>>> @@ -0,0 +1,289 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Virtio I2C Bus Driver
>>> + *
>>> + * The Virtio I2C Specification:
>>> + * 
>>> https://raw.githubusercontent.com/oasis-tcs/virtio-spec/master/virtio-i2c.tex
>>> + *
>>> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/completion.h>
>>> +#include <linux/err.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/io.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/wait.h>
>>> +
>>> +#include <linux/virtio.h>
>>> +#include <linux/virtio_i2c.h>
>>> +
>>> +/**
>>> + * struct virtio_i2c - virtio I2C data
>>> + * @vdev: virtio device for this controller
>>> + * @completion: completion of virtio I2C message
>>> + * @adap: I2C adapter for this controller
>>> + * @i2c_lock: lock for virtqueue processing
>>> + * @vq: the virtio virtqueue for communication
>>> + */
>>> +struct virtio_i2c {
>>> +    struct virtio_device *vdev;
>>> +    struct completion completion;
>>> +    struct i2c_adapter adap;
>>> +    struct mutex i2c_lock;
>>> +    struct virtqueue *vq;
>>> +};
>>> +
>>> +/**
>>> + * struct virtio_i2c_req - the virtio I2C request structure
>>> + * @out_hdr: the OUT header of the virtio I2C message
>>> + * @buf: the buffer into which data is read, or from which it's 
>>> written
>>> + * @in_hdr: the IN header of the virtio I2C message
>>> + */
>>> +struct virtio_i2c_req {
>>> +    struct virtio_i2c_out_hdr out_hdr;
>>> +    u8 *buf;
>>> +    struct virtio_i2c_in_hdr in_hdr;
>>> +};
>>> +
>>> +static void virtio_i2c_msg_done(struct virtqueue *vq)
>>> +{
>>> +    struct virtio_i2c *vi = vq->vdev->priv;
>>> +
>>> +    complete(&vi->completion);
>>> +}
>>> +
>>> +static int virtio_i2c_send_reqs(struct virtqueue *vq,
>>> +                struct virtio_i2c_req *reqs,
>>> +                struct i2c_msg *msgs, int nr)
>>> +{
>>> +    struct scatterlist *sgs[3], out_hdr, msg_buf, in_hdr;
>>> +    int i, outcnt, incnt, err = 0;
>>> +    u8 *buf;
>>> +
>>> +    for (i = 0; i < nr; i++) {
>>> +        if (!msgs[i].len)
>>> +            break;
>>> +
>>> +        /* Only 7-bit mode supported for this moment. For the 
>>> address format,
>>> +         * Please check the Virtio I2C Specification.
>>> +         */
>>> +        reqs[i].out_hdr.addr = cpu_to_le16(msgs[i].addr << 1);
>>> +
>>> +        if (i != nr - 1)
>>> +            reqs[i].out_hdr.flags |= VIRTIO_I2C_FLAGS_FAIL_NEXT;
>>> +
>>> +        outcnt = incnt = 0;
>>> +        sg_init_one(&out_hdr, &reqs[i].out_hdr, 
>>> sizeof(reqs[i].out_hdr));
>>> +        sgs[outcnt++] = &out_hdr;
>>> +
>>> +        buf = kzalloc(msgs[i].len, GFP_KERNEL);
>>> +        if (!buf)
>>> +            break;
>>> +
>>> +        reqs[i].buf = buf;
>>> +        sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
>>> +
>>> +        if (msgs[i].flags & I2C_M_RD) {
>>> +            sgs[outcnt + incnt++] = &msg_buf;
>>> +        } else {
>>> +            memcpy(reqs[i].buf, msgs[i].buf, msgs[i].len);
>>> +            sgs[outcnt++] = &msg_buf;
>>> +        }
>>> +
>>> +        sg_init_one(&in_hdr, &reqs[i].in_hdr, sizeof(reqs[i].in_hdr));
>>> +        sgs[outcnt + incnt++] = &in_hdr;
>>> +
>>> +        err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], 
>>> GFP_KERNEL);
>>> +        if (err < 0) {
>>> +            pr_err("failed to add msg[%d] to virtqueue.\n", i);
>>> +            kfree(reqs[i].buf);
>>> +            reqs[i].buf = NULL;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    return i;
>>> +}
>>> +
>>> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>>> +                    struct virtio_i2c_req *reqs,
>>> +                    struct i2c_msg *msgs, int nr)
>>> +{
>>> +    struct virtio_i2c_req *req;
>>> +    unsigned int len;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < nr; i++) {
>>> +        req = (struct virtio_i2c_req *)virtqueue_get_buf(vq, &len);
>>
>>
>> The case is unnecessary.
>>
> Right. Will remove the conversion.
>>
>>> +        if (!(req && req == &reqs[i])) {
>>> +            pr_err("msg[%d]: addr=0x%x virtqueue error.\n", i, 
>>> msgs[i].addr);
>>> +            break;
>>> +        }
>>
>>
>> It's better to be more specific here, e.g we can say we saw out of 
>> order completion here.
>>
> OK.
>>
>>> +
>>> +        if (req->in_hdr.status != VIRTIO_I2C_MSG_OK) {
>>> +            pr_err("msg[%d]: addr=0x%x backend error.\n", i, 
>>> msgs[i].addr);
>>> +            break;
>>
>>
>> Don't we need to clean used ring by keeping calling 
>> virtqueue_get_buf() here?
>>
> You are right. Need to detach all the used buffers from the vq before 
> queuing new buffers.
>
>>> +        }
>>> +
>>> +        if (msgs[i].flags & I2C_M_RD)
>>> +            memcpy(msgs[i].buf, req->buf, msgs[i].len);
>>
>>
>> Sorry if I had asked this before but any rason not to use msg[i].buf 
>> directly?
>>
> Will try to use msg[i].buf.
>>
>>> +
>>> +        kfree(req->buf);
>>> +        req->buf = NULL;
>>> +    }
>>> +
>>> +    return i;
>>> +}
>>> +
>>> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg 
>>> *msgs, int num)
>>> +{
>>> +    struct virtio_i2c *vi = i2c_get_adapdata(adap);
>>> +    struct virtqueue *vq = vi->vq;
>>> +    struct virtio_i2c_req *reqs;
>>> +    unsigned long time_left;
>>> +    int ret, nr;
>>> +
>>> +    reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
>>> +    if (!reqs)
>>> +        return -ENOMEM;
>>> +
>>> +    mutex_lock(&vi->i2c_lock);
>>> +
>>> +    ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>>> +    if (ret == 0)
>>> +        goto err_unlock_free;
>>> +
>>> +    nr = ret;
>>> +
>>> +    virtqueue_kick(vq);
>>> +
>>> +    time_left = wait_for_completion_timeout(&vi->completion, 
>>> adap->timeout);
>>> +    if (!time_left) {
>>> +        dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>>> +        ret = -ETIMEDOUT;
>>> +        goto err_unlock_free;
>>
>>
>> So if the request is finished after the timerout, all the following 
>> request will fail, is this expected?
>>
>>
> This is an expected behavior. If timeout happens, we don't need to 
> care about the requests whether
> really completed by "HW" or not. Just return error and let the i2c 
> core to decide whether to resend.


So you need at least reinit the completion at least?


>>> +    }
>>> +
>>> +    ret = virtio_i2c_complete_reqs(vq, reqs, msgs, nr);
>>
>>
>> So consider driver queue N requests, can device raise interrupt if it 
>> completes the first request? If yes, the code break, if not it need 
>> to be clarified in the spec.
> The device can raise interrupt when some requests are still not 
> completed though this is not a good operation.


Then you need forbid this in the spec.


> In this case, the remaining requests in the vq will be ignored and the 
> i2c_algorithm. master_xfer will return 1 for
> your example. And let the i2c core to decide whether to resend.
>>
>> Acaultly I remember there's no VIRTIO_I2C_FLAGS_FAIL_NEXT in previous 
>> versions, and after reading the spec I still don't get the motivation 
>> for that (it may complicates both driver and device actually).
>>
> This flag is introduced by Stefan. Please check following link for the 
> details
> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00075.html. 
>


 > We just need to make sure that once the driver adds some requests to the
 > virtqueue,
 > it should complete them (either success or fail) before adding new 
requests.
 > I think this
 > is a behavior of physical I2C adapter drivers and we can follow.


Is this a driver requirement or device? If it's the driver, the code 
have already did something like this. E.g you wait for the completion of 
the request and forbid new request via i2c_lock.

Thanks


>>
>>> +
>>> +    reinit_completion(&vi->completion);
>>
>>
>> So if a request it timeout but interrupt is raised here, everything 
>> is broken.
>>
>> Thanks
>>
> If interrupt is raised after timeout, those requests in the vq will be 
> ignored.
> No need to care about them being handled or not. Just let the i2c core to
> decide whether need to resend or not.
>>
>>> +
>>> +err_unlock_free:
>>> +    mutex_unlock(&vi->i2c_lock);
>>> +    kfree(reqs);
>>> +    return ret;
>>> +}
>>> +
>>> +static void virtio_i2c_del_vqs(struct virtio_device *vdev)
>>> +{
>>> +    vdev->config->reset(vdev);
>>> +    vdev->config->del_vqs(vdev);
>>> +}
>>> +
>>> +static int virtio_i2c_setup_vqs(struct virtio_i2c *vi)
>>> +{
>>> +    struct virtio_device *vdev = vi->vdev;
>>> +
>>> +    vi->vq = virtio_find_single_vq(vdev, virtio_i2c_msg_done, "msg");
>>> +    return PTR_ERR_OR_ZERO(vi->vq);
>>> +}
>>> +
>>> +static u32 virtio_i2c_func(struct i2c_adapter *adap)
>>> +{
>>> +    return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>>> +}
>>> +
>>> +static struct i2c_algorithm virtio_algorithm = {
>>> +    .master_xfer = virtio_i2c_xfer,
>>> +    .functionality = virtio_i2c_func,
>>> +};
>>> +
>>> +static struct i2c_adapter virtio_adapter = {
>>> +    .owner = THIS_MODULE,
>>> +    .name = "Virtio I2C Adapter",
>>> +    .class = I2C_CLASS_DEPRECATED,
>>> +    .algo = &virtio_algorithm,
>>> +};
>>> +
>>> +static int virtio_i2c_probe(struct virtio_device *vdev)
>>> +{
>>> +    struct device *pdev = vdev->dev.parent;
>>> +    struct virtio_i2c *vi;
>>> +    int ret;
>>> +
>>> +    vi = devm_kzalloc(&vdev->dev, sizeof(*vi), GFP_KERNEL);
>>> +    if (!vi)
>>> +        return -ENOMEM;
>>> +
>>> +    vdev->priv = vi;
>>> +    vi->vdev = vdev;
>>> +
>>> +    mutex_init(&vi->i2c_lock);
>>> +    init_completion(&vi->completion);
>>> +
>>> +    ret = virtio_i2c_setup_vqs(vi);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    vi->adap = virtio_adapter;
>>> +    i2c_set_adapdata(&vi->adap, vi);
>>> +    vi->adap.dev.parent = &vdev->dev;
>>> +    /* Setup ACPI node for controlled devices which will be probed 
>>> through ACPI */
>>> +    ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
>>> +    vi->adap.timeout = HZ / 10;
>>> +
>>> +    ret = i2c_add_adapter(&vi->adap);
>>> +    if (ret) {
>>> +        virtio_i2c_del_vqs(vdev);
>>> +        dev_err(&vdev->dev, "failed to add virtio-i2c adapter.\n");
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void virtio_i2c_remove(struct virtio_device *vdev)
>>> +{
>>> +    struct virtio_i2c *vi = vdev->priv;
>>> +
>>> +    i2c_del_adapter(&vi->adap);
>>> +    virtio_i2c_del_vqs(vdev);
>>> +}
>>> +
>>> +static struct virtio_device_id id_table[] = {
>>> +    { VIRTIO_ID_I2C_ADPTER, VIRTIO_DEV_ANY_ID },
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(virtio, id_table);
>>> +
>>> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device 
>>> *vdev)
>>> +{
>>> +    virtio_i2c_del_vqs(vdev);
>>> +    return 0;
>>> +}
>>> +
>>> +static int __maybe_unused virtio_i2c_restore(struct virtio_device 
>>> *vdev)
>>> +{
>>> +    return virtio_i2c_setup_vqs(vdev->priv);
>>> +}
>>> +
>>> +static struct virtio_driver virtio_i2c_driver = {
>>> +    .id_table    = id_table,
>>> +    .probe        = virtio_i2c_probe,
>>> +    .remove        = virtio_i2c_remove,
>>> +    .driver    = {
>>> +        .name    = "i2c_virtio",
>>> +    },
>>> +#ifdef CONFIG_PM_SLEEP
>>> +    .freeze = virtio_i2c_freeze,
>>> +    .restore = virtio_i2c_restore,
>>> +#endif
>>> +};
>>> +module_virtio_driver(virtio_i2c_driver);
>>> +
>>> +MODULE_DESCRIPTION("Virtio i2c bus driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/include/uapi/linux/virtio_i2c.h 
>>> b/include/uapi/linux/virtio_i2c.h
>>> new file mode 100644
>>> index 0000000..00f4508
>>> --- /dev/null
>>> +++ b/include/uapi/linux/virtio_i2c.h
>>> @@ -0,0 +1,42 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH 
>>> Linux-syscall-note */
>>> +/*
>>> + * Definitions for virtio I2C Adpter
>>> + *
>>> + * Copyright (c) 2021 Intel Corporation. All rights reserved.
>>> + */
>>> +
>>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>>> +
>>> +#include <linux/types.h>
>>> +#include <linux/virtio_ids.h>
>>> +#include <linux/virtio_config.h>
>>> +
>>> +/**
>>> + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
>>> + * @addr: the controlled device address
>>> + * @padding: used to pad to full dword
>>> + * @flags: used for feature extensibility
>>> + */
>>> +struct virtio_i2c_out_hdr {
>>> +    __le16 addr;
>>> +    __le16 padding;
>>> +    __le32 flags;
>>> +};
>>> +
>>> +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the 
>>> requests */
>>> +#define VIRTIO_I2C_FLAGS_FAIL_NEXT    0x00000001
>>> +
>>> +/**
>>> + * struct virtio_i2c_in_hdr - the virtio I2C message IN header
>>> + * @status: the processing result from the backend
>>> + */
>>> +struct virtio_i2c_in_hdr {
>>> +    u8 status;
>>> +};
>>> +
>>> +/* The final status written by the device */
>>> +#define VIRTIO_I2C_MSG_OK    0
>>> +#define VIRTIO_I2C_MSG_ERR    1
>>> +
>>> +#endif /* _UAPI_LINUX_VIRTIO_I2C_H */
>>> diff --git a/include/uapi/linux/virtio_ids.h 
>>> b/include/uapi/linux/virtio_ids.h
>>> index bc1c062..6ae32db 100644
>>> --- a/include/uapi/linux/virtio_ids.h
>>> +++ b/include/uapi/linux/virtio_ids.h
>>> @@ -54,5 +54,6 @@
>>>   #define VIRTIO_ID_FS            26 /* virtio filesystem */
>>>   #define VIRTIO_ID_PMEM            27 /* virtio pmem */
>>>   #define VIRTIO_ID_MAC80211_HWSIM    29 /* virtio mac80211-hwsim */
>>> +#define VIRTIO_ID_I2C_ADPTER        34 /* virtio i2c adpter */
>>>     #endif /* _LINUX_VIRTIO_IDS_H */
>>
>

