Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9378028C9A4
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 10:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732603AbgJMIBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 04:01:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39192 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730347AbgJMIA7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Oct 2020 04:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602576056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XX+2jM3RBMDFVnq+P3ujbLXIB6bjiYY3xDsMh5SMjUE=;
        b=Yb4uv1ZXEHQ5zq2LmM9zXY4VvOQzV/22/KzDxzdjVpm/q3pJ6u5tTyEpmjNnRbJLgIOFDt
        w7GysnnuMMBAdcLJ7KoIL955lhjQBRkVQhLh6jwi7VV5a/CGSCH3hNtTBQ5X37VmbUYxPN
        PKOkx166f7NnyUScgrBevaNM1HS2PZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-UrkiDKutO5uicmsmJQomUA-1; Tue, 13 Oct 2020 04:00:52 -0400
X-MC-Unique: UrkiDKutO5uicmsmJQomUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 530031015ED6;
        Tue, 13 Oct 2020 08:00:50 +0000 (UTC)
Received: from [10.72.13.59] (ovpn-13-59.pek2.redhat.com [10.72.13.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C7D986EF7C;
        Tue, 13 Oct 2020 08:00:33 +0000 (UTC)
Subject: Re: [PATCH v3] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>
References: <1350309657ab0c7b9f97e7a5c71d084f88caa549.1600743079.git.jie.deng@intel.com>
 <958b69c3-0321-d5cb-4c12-702795925583@redhat.com>
 <2dc4bd12-9f23-7caa-b1ec-f3403d36e065@intel.com>
 <83529dac-7b87-aec9-55f0-85face47e7b6@redhat.com>
 <b1cad8f9-67c4-dbb7-6edc-66be2f6ba08f@intel.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <9be8c60c-a111-5de7-3551-93f03ecda445@redhat.com>
Date:   Tue, 13 Oct 2020 16:00:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b1cad8f9-67c4-dbb7-6edc-66be2f6ba08f@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/10/13 下午3:16, Jie Deng wrote:
>
> On 2020/10/12 11:43, Jason Wang wrote:
>>
>> On 2020/10/12 上午10:45, Jie Deng wrote:
>>>
>>>
>>> On 2020/10/10 11:14, Jason Wang wrote:
>>>>
>>>>> +
>>>>> +        virtqueue_kick(vq);
>>>>> +
>>>>> +        time_left = wait_for_completion_timeout(&vi->completion, 
>>>>> adap->timeout);
>>>>> +        if (!time_left) {
>>>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", 
>>>>> i, msgs[i].addr);
>>>>> +            break;
>>>>> +        }
>>>>
>>>>
>>>> You don't set error number here. Is this intended?
>>>>
>>>> And using a timeout here is not good, and if the request is 
>>>> finished just after the timeout, in the next xfer you may hit the 
>>>> following check.
>>>>
>>>> It's better to use either interrupt here.
>>>>
>>> Could you check the I2C drivers in the kernel ? The 
>>> "wait_for_completion_timeout" mechanism
>>> is commonly used by I2C bus drivers in their i2c_algorithm.master_xfer.
>>
>>
>> There's a major difference between virtio-i2c and other drivers. In 
>> the case of virtio, the device could be a software device emulated by 
>> a remote process. This means the timeout might not be rare.
>>
>> I don't see how timeout is properly handled in this patch (e.g did 
>> you notice that you don't set any error when timeout? or is this 
>> intended?)
>>
> The backend software may operate the physical device. The timeout 
> depends on how the backend is designed.
> Here if the timeout happens, it will return the actual number of 
> messages successfully processed to the I2C core.
> Let the I2C core decides how to do next.


So let's consider the following case:

1) driver:virtio_i2c_add_msg(msgA)
2) driver:timeout, and return to I2C core
3) driver:virtio_i2c_add_msg(msgB)
4) device: complete msgA
5) driver: virtqueue_get_buf() returns msgA, since the token is always 
vi->vmsg, the driver may think msgB has been completed.


>
> Thanks.
>
>>
>>>
>>>>
>>>>> +
>>>>> +        vmsg = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
>>>>> +        /* vmsg should point to the same address with &vi->vmsg */
>>>>> +        if ((!vmsg) || (vmsg != &vi->vmsg)) {
>>>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue 
>>>>> error.\n",
>>>>> +                i, msgs[i].addr);
>>>>> +            break;
>>>>> +        }
>>>>
>>>>
>>>> So I think we can remove this check. Consider only one descriptor 
>>>> will be used at most, unless there's a bug in the device (and no 
>>>> other driver to the similar check), we should not hit this.
>>>>
>>>> Btw, as I replied in the previous version, the device should be 
>>>> cacpable of dealing of a batch of requests through the virtqueue, 
>>>> otherwise it's meaningless to use a queue here.
>>>>
>>> We should not assume there is no bug in the device. I don't think we 
>>> can remove this check if we want our code to be robust.
>>
>>
>> Can you tell when at which case you may hit !vmsg or vmsg != vi->vmsg?
>>
> Normally, it won't hit here. But the API "virtqueue_get_buf" tells me
> "It *may *return NULL or the "data" token handed to virtqueue_add_*()."


Note that we had the following check already in virtqueue_get_buf_ctx(), 
so the the virtio core had already have the ability to figure out the 
wrong head.

     if (unlikely(id >= vq->packed.vring.num)) {
         BAD_RING(vq, "id %u out of range\n", id);
         return NULL;
     }
     if (unlikely(!vq->packed.desc_state[id].data)) {
         BAD_RING(vq, "id %u is not a head!\n", id);
         return NULL;
     }

And when it returns a NULL, it's not necessarily an error of the device, 
it might just require more time to finish the processing.


>
> From the perspective of a caller, I just don't care when it happens.
> To make the code robust, what I care about is what I should do if this 
> is not our case
> since the doc says it*may *happen.
>
> If you insist on removing this check, I will remove "vmsg != vi->vmsg" 
> and keep the check for !vmsg.
> As Dan reported in v2, we should at least check here for NULL.
>
> Thanks.
>
>>
>>
>>> As I said, currently, we are using the virtqueue to send the msg one 
>>> by one to the backend. The mechanism is described in the spec. 
>>
>>
>> Which part of the spec describes such "one by one" mechanism? If 
>> there is one, I'd happily give a NACK since it doesn't require a 
>> queue to work which is conflict with the concept of the virtqueue.
>>
>>
> What's the concept of the virtqueue ?  Why do you want to restrict how 
> users use virtqueue ?


So I think there's some misunderstanding here. The point is not to 
restrict how to use virtqueue.

What I meant is:

- we should not invent a device with a virtqueue that can only accept 
one buffer at a time
- I don't see any mechanism like "one by one" described in the spec, so 
it's ok but if it'd happen to have, I will NACK


>
> It's like you provide a water glass to user. The user can fill a full 
> glass of water and drinks once or
> fill half a glass of water and drink twice. It is a user behavior and 
> should not be restricted by
> the glass provider.


That's my point as well, we should not describe the "once" behavior in 
the spec.


>
> Thanks.
>
>
>>> Thanks.
>>>
>>>
>>>>
>>>>> +
>>>>>
>>>>> +
>>>>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>>>>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>>>>> +
>>>>> +#include <linux/types.h>
>>>>> +#include <linux/virtio_ids.h>
>>>>> +#include <linux/virtio_config.h>
>>>>> +
>>>>> +/**
>>>>> + * struct virtio_i2c_hdr - the virtio I2C message header structure
>>>>> + * @addr: i2c_msg addr, the slave address
>>>>> + * @flags: i2c_msg flags
>>>>> + * @len: i2c_msg len
>>>>> + */
>>>>> +struct virtio_i2c_hdr {
>>>>> +    __le16 addr;
>>>>> +    __le16 flags;
>>>>> +    __le16 len;
>>>>> +};
>>>>
>>>>
>>>> I'm afraid this is not complete. E.g the status is missed.
>>>>
>>>> I suspect what virtio-scsi use is better. Which split the in from 
>>>> the out instead of reusing the same buffer. And it can ease the 
>>>> uAPI header export.
>>>>
>>>> Thanks
>>>>
>>>>
>>>
>>> I think following definition in uAPI for the status is enough.
>>> There is no need to provide a "u8" status in the structure.
>>>
>>> /* The final status written by the device */
>>> #define VIRTIO_I2C_MSG_OK    0
>>> #define VIRTIO_I2C_MSG_ERR    1
>>>
>>> You can see an example in virtio_blk.
>>>
>>> In the spec:
>>>
>>> struct virtio_blk_req {
>>> le32 type;
>>> le32 reserved;
>>> le64 sector;
>>> u8 data[];
>>> u8 status;
>>> };
>>>
>>> In virtio_blk.h, there is only following definitions.
>>>
>>> #define VIRTIO_BLK_S_OK        0
>>> #define VIRTIO_BLK_S_IOERR    1
>>> #define VIRTIO_BLK_S_UNSUPP    2
>>>
>>
>> virtio-blk is a bad example, it's just too late to fix. For any new 
>> introduced uAPI it should be a complete one.
>>
>> Thanks
>>
> I checked a relatively new device "virtio_fs".
> I found following definition in spec but not in uAPI also.
>
> struct virtio_fs_req {
> // Device -readable part
> struct fuse_in_header in;
> u8 datain[];
> // Device -writable part
> struct fuse_out_header out;
> u8 dataout[];
> };
>
> So is this also a bad example which has not been fixed yet.


Cc Stefan for the answer.


> Or what's your mean about "complete" here ? Is there any definition 
> about "complete uAPI" ?


My understanding it should contain all the fields defined in the virtio 
spec.

Thanks


>
> Thanks.
>
>
>>
>>> Thanks.
>>>
>>>
>>>
>>
>

