Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B073725D994
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 15:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbgIDNZY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 09:25:24 -0400
Received: from mga09.intel.com ([134.134.136.24]:18664 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730255AbgIDNWw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 09:22:52 -0400
IronPort-SDR: 6R9jFCf5aUh0K8cau3Hl0WrAId+Witd2v8WHgE25QagxdNZCMfUBNCrK45HSlF5xuEqtTVOCS7
 ror283F5YTbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="158715320"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; 
   d="scan'208";a="158715320"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2020 06:21:32 -0700
IronPort-SDR: GVEmm+AS0LUgCFVWnMaPUMTwypXJhlRmQz6ETS/DmQMqwHPgCMjahAIqYl98J7tCXF5xoK5ZLy
 KVRU5NE9fMTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; 
   d="scan'208";a="334883693"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.215.253.127]) ([10.215.253.127])
  by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2020 06:21:12 -0700
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
 <18828d17-c3ac-31bd-2dcf-ecdbd4ad844e@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <e63a96bf-65d2-ed03-dadc-42d1d8808c9d@intel.com>
Date:   Fri, 4 Sep 2020 21:21:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <18828d17-c3ac-31bd-2dcf-ecdbd4ad844e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/4 12:06, Jason Wang wrote:
>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 293e7a0..70c8e30 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -21,6 +21,17 @@ config I2C_ALI1535
>>         This driver can also be built as a module.  If so, the module
>>         will be called i2c-ali1535.
>>   +config I2C_VIRTIO
>> +    tristate "Virtio I2C Adapter"
>> +    depends on VIRTIO
>
>
> I guess it should depend on some I2C module here.
>
The dependency of I2C is included in the Kconfig in its parent directory.
So there is nothing special to add here.


>
>>
>> +struct virtio_i2c_msg {
>> +    struct virtio_i2c_hdr hdr;
>> +    char *buf;
>> +    u8 status;
>
>
> Any reason for separating status out of virtio_i2c_hdr?
>
The status is not from i2c_msg. So I put it out of virtio_i2c_hdr.

>
>> +};
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
>> +    struct virtio_device *vdev;
>> +    struct completion completion;
>> +    struct i2c_adapter adap;
>> +    struct mutex i2c_lock;
>> +    struct virtqueue *vq;
>> +};
>> +
>> +static void virtio_i2c_msg_done(struct virtqueue *vq)
>> +{
>> +    struct virtio_i2c *vi = vq->vdev->priv;
>> +
>> +    complete(&vi->completion);
>> +}
>> +
>> +static int virtio_i2c_add_msg(struct virtqueue *vq,
>> +                  struct virtio_i2c_msg *vmsg,
>> +                  struct i2c_msg *msg)
>> +{
>> +    struct scatterlist *sgs[3], hdr, bout, bin, status;
>> +    int outcnt = 0, incnt = 0;
>> +
>> +    if (!msg->len)
>> +        return -EINVAL;
>> +
>> +    vmsg->hdr.addr = msg->addr;
>> +    vmsg->hdr.flags = msg->flags;
>> +    vmsg->hdr.len = msg->len;
>
>
> Missing endian conversion?
>
You are right. Need conversion here.
>
>> +
>> +    vmsg->buf = kzalloc(vmsg->hdr.len, GFP_KERNEL);
>> +    if (!vmsg->buf)
>> +        return -ENOMEM;
>> +
>> +    sg_init_one(&hdr, &vmsg->hdr, sizeof(struct virtio_i2c_hdr));
>> +    sgs[outcnt++] = &hdr;
>> +    if (vmsg->hdr.flags & I2C_M_RD) {
>> +        sg_init_one(&bin, vmsg->buf, msg->len);
>> +        sgs[outcnt + incnt++] = &bin;
>> +    } else {
>> +        memcpy(vmsg->buf, msg->buf, msg->len);
>> +        sg_init_one(&bout, vmsg->buf, msg->len);
>> +        sgs[outcnt++] = &bout;
>> +    }
>> +    sg_init_one(&status, &vmsg->status, sizeof(vmsg->status));
>> +    sgs[outcnt + incnt++] = &status;
>> +
>> +    return virtqueue_add_sgs(vq, sgs, outcnt, incnt, vmsg, GFP_KERNEL);
>> +}
>> +
>> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg 
>> *msgs, int num)
>> +{
>> +    struct virtio_i2c *vi = i2c_get_adapdata(adap);
>> +    struct virtio_i2c_msg *vmsg_o, *vmsg_i;
>> +    struct virtqueue *vq = vi->vq;
>> +    unsigned long time_left;
>> +    int len, i, ret = 0;
>> +
>> +    vmsg_o = kzalloc(sizeof(*vmsg_o), GFP_KERNEL);
>> +    if (!vmsg_o)
>> +        return -ENOMEM;
>
>
> It looks to me we can avoid the allocation by embedding virtio_i2c_msg 
> into struct virtio_i2c;
>
Yeah... That's better. Thanks.


>
>> +
>> +    mutex_lock(&vi->i2c_lock);
>> +    vmsg_o->buf = NULL;
>> +    for (i = 0; i < num; i++) {
>> +        ret = virtio_i2c_add_msg(vq, vmsg_o, &msgs[i]);
>> +        if (ret) {
>> +            dev_err(&adap->dev, "failed to add msg[%d] to 
>> virtqueue.\n", i);
>> +            goto err_unlock_free;
>> +        }
>> +
>> +        virtqueue_kick(vq);
>> +
>> +        time_left = wait_for_completion_timeout(&vi->completion, 
>> adap->timeout);
>> +        if (!time_left) {
>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", i, 
>> msgs[i].addr);
>> +            ret = i;
>> +            goto err_unlock_free;
>> +        }
>> +
>> +        vmsg_i = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
>> +        if (vmsg_i) {
>> +            /* vmsg_i should point to the same address with vmsg_o */
>> +            if (vmsg_i != vmsg_o) {
>> +                dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue 
>> error.\n",
>> +                    i, vmsg_i->hdr.addr);
>> +                ret = i;
>> +                goto err_unlock_free;
>> +            }
>
>
> Does this imply in order completion of i2c device?  (E.g what happens 
> if multiple virtio i2c requests are submitted)
>
> Btw, this always use a single descriptor once a time which makes me 
> suspect if a virtqueue(virtio) is really needed. It looks to me we can 
> utilize the virtqueue by submit the request in a batch.
>
I'm afraid not all physical devices support batch. I'd like to keep the 
current design and consider
your suggestion as a possible optimization in the future.

Thanks.


>>
>> +}
>> +
>> +static void virtio_i2c_del_vqs(struct virtio_device *vdev)
>> +{
>> +    vdev->config->reset(vdev);
>
>
> Why need reset here?
>
> Thanks
>
I'm following what other virtio drivers do.
They reset the devices before they clean up the queues.


>
>> +    vdev->config->del_vqs(vdev);
>> +}
>> +
>> +static int virtio_i2c_setup_vqs(struct virtio_i2c *vi)
>> +{
>> +    struct virtio_device *vdev = vi->vdev;
>> +
>> +    vi->vq = virtio_find_single_vq(vdev, virtio_i2c_msg_done, 
>> "i2c-msg");
>
>
> We've in the scope of ic2, so "msg" should be sufficient.
>
>
OK. Will change this name. Thanks.


>> +    return PTR_ERR_OR_ZERO(vi->vq);
