Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9934D28AC9F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 05:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgJLDnw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Oct 2020 23:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22254 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725972AbgJLDnv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Oct 2020 23:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602474229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LRc/4gOXa8jCVo/d1ERRs5SER0ImU1RZc38TDUpLQFc=;
        b=Rc54z2xuiCTXJcdAlhLyjGA3hCP72Qsh0a6z7pLqB9RL/AhmGVnD4IFK0IWx0pUfk6cVrV
        3xi5cdCtDzQnqkN5MDObLw5yuCQHRwGOH6dpOnLA2bP88PlPlt3dIajvlH50QTKQG0NdvG
        kO9BJRFMNSYROsfSDU54Tli0lM//srw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-hQRGdXMNNcu0xzgFnXbrDA-1; Sun, 11 Oct 2020 23:43:45 -0400
X-MC-Unique: hQRGdXMNNcu0xzgFnXbrDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8589D805F0B;
        Mon, 12 Oct 2020 03:43:43 +0000 (UTC)
Received: from [10.72.13.74] (ovpn-13-74.pek2.redhat.com [10.72.13.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1888460C13;
        Mon, 12 Oct 2020 03:43:33 +0000 (UTC)
Subject: Re: [PATCH v3] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <1350309657ab0c7b9f97e7a5c71d084f88caa549.1600743079.git.jie.deng@intel.com>
 <958b69c3-0321-d5cb-4c12-702795925583@redhat.com>
 <2dc4bd12-9f23-7caa-b1ec-f3403d36e065@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <83529dac-7b87-aec9-55f0-85face47e7b6@redhat.com>
Date:   Mon, 12 Oct 2020 11:43:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2dc4bd12-9f23-7caa-b1ec-f3403d36e065@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/10/12 上午10:45, Jie Deng wrote:
>
>
> On 2020/10/10 11:14, Jason Wang wrote:
>>
>>> +
>>> +        virtqueue_kick(vq);
>>> +
>>> +        time_left = wait_for_completion_timeout(&vi->completion, 
>>> adap->timeout);
>>> +        if (!time_left) {
>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", i, 
>>> msgs[i].addr);
>>> +            break;
>>> +        }
>>
>>
>> You don't set error number here. Is this intended?
>>
>> And using a timeout here is not good, and if the request is finished 
>> just after the timeout, in the next xfer you may hit the following 
>> check.
>>
>> It's better to use either interrupt here.
>>
> Could you check the I2C drivers in the kernel ? The 
> "wait_for_completion_timeout" mechanism
> is commonly used by I2C bus drivers in their i2c_algorithm.master_xfer.


There's a major difference between virtio-i2c and other drivers. In the 
case of virtio, the device could be a software device emulated by a 
remote process. This means the timeout might not be rare.

I don't see how timeout is properly handled in this patch (e.g did you 
notice that you don't set any error when timeout? or is this intended?)


>
>>
>>> +
>>> +        vmsg = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
>>> +        /* vmsg should point to the same address with &vi->vmsg */
>>> +        if ((!vmsg) || (vmsg != &vi->vmsg)) {
>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue 
>>> error.\n",
>>> +                i, msgs[i].addr);
>>> +            break;
>>> +        }
>>
>>
>> So I think we can remove this check. Consider only one descriptor 
>> will be used at most, unless there's a bug in the device (and no 
>> other driver to the similar check), we should not hit this.
>>
>> Btw, as I replied in the previous version, the device should be 
>> cacpable of dealing of a batch of requests through the virtqueue, 
>> otherwise it's meaningless to use a queue here.
>>
> We should not assume there is no bug in the device. I don't think we 
> can remove this check if we want our code to be robust.


Can you tell when at which case you may hit !vmsg or vmsg != vi->vmsg?



> As I said, currently, we are using the virtqueue to send the msg one 
> by one to the backend. The mechanism is described in the spec. 


Which part of the spec describes such "one by one" mechanism? If there 
is one, I'd happily give a NACK since it doesn't require a queue to work 
which is conflict with the concept of the virtqueue.


> Thanks.
>
>
>>
>>> +
>>>
>>> +
>>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>>> +
>>> +#include <linux/types.h>
>>> +#include <linux/virtio_ids.h>
>>> +#include <linux/virtio_config.h>
>>> +
>>> +/**
>>> + * struct virtio_i2c_hdr - the virtio I2C message header structure
>>> + * @addr: i2c_msg addr, the slave address
>>> + * @flags: i2c_msg flags
>>> + * @len: i2c_msg len
>>> + */
>>> +struct virtio_i2c_hdr {
>>> +    __le16 addr;
>>> +    __le16 flags;
>>> +    __le16 len;
>>> +};
>>
>>
>> I'm afraid this is not complete. E.g the status is missed.
>>
>> I suspect what virtio-scsi use is better. Which split the in from the 
>> out instead of reusing the same buffer. And it can ease the uAPI 
>> header export.
>>
>> Thanks
>>
>>
>
> I think following definition in uAPI for the status is enough.
> There is no need to provide a "u8" status in the structure.
>
> /* The final status written by the device */
> #define VIRTIO_I2C_MSG_OK    0
> #define VIRTIO_I2C_MSG_ERR    1
>
> You can see an example in virtio_blk.
>
> In the spec:
>
> struct virtio_blk_req {
> le32 type;
> le32 reserved;
> le64 sector;
> u8 data[];
> u8 status;
> };
>
> In virtio_blk.h, there is only following definitions.
>
> #define VIRTIO_BLK_S_OK        0
> #define VIRTIO_BLK_S_IOERR    1
> #define VIRTIO_BLK_S_UNSUPP    2
>

virtio-blk is a bad example, it's just too late to fix. For any new 
introduced uAPI it should be a complete one.

Thanks


> Thanks.
>
>
>

