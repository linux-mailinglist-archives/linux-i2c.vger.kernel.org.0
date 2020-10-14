Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C84728DBB7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 10:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgJNIhK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 04:37:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:49652 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgJNIhJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 04:37:09 -0400
IronPort-SDR: 7S5NZgcP+wfUtwT973OLy528SJvFRdCi8KzeM/o1PZOKUp4+iT4APwtpRtnj+lhTl71fU7zPv7
 oq/foxQB6SCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="230236294"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="230236294"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 01:37:08 -0700
IronPort-SDR: zd5s9PkDLaxUNWLaceK5JHt1x7VRcFUGfG3MILkDTqVf6bt8/0UA0LtPrccgFgys5IbY5Zr3ny
 S3a3iqzhT2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="318589996"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.47]) ([10.239.154.47])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2020 01:37:04 -0700
Subject: Re: [PATCH v3] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
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
 <9be8c60c-a111-5de7-3551-93f03ecda445@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <3c648e84-3c29-2cfe-65e2-eb377feb67b2@intel.com>
Date:   Wed, 14 Oct 2020 16:37:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <9be8c60c-a111-5de7-3551-93f03ecda445@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/10/13 16:00, Jason Wang wrote:
>
>>>>>> +
>>>>>> +        virtqueue_kick(vq);
>>>>>> +
>>>>>> +        time_left = wait_for_completion_timeout(&vi->completion, 
>>>>>> adap->timeout);
>>>>>> +        if (!time_left) {
>>>>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", 
>>>>>> i, msgs[i].addr);
>>>>>> +            break;
>>>>>> +        }
>>>>>
>>>>>
>>>>> You don't set error number here. Is this intended?
>>>>>
>>>>> And using a timeout here is not good, and if the request is 
>>>>> finished just after the timeout, in the next xfer you may hit the 
>>>>> following check.
>>>>>
>>>>> It's better to use either interrupt here.
>>>>>
>>>> Could you check the I2C drivers in the kernel ? The 
>>>> "wait_for_completion_timeout" mechanism
>>>> is commonly used by I2C bus drivers in their 
>>>> i2c_algorithm.master_xfer.
>>>
>>>
>>> There's a major difference between virtio-i2c and other drivers. In 
>>> the case of virtio, the device could be a software device emulated 
>>> by a remote process. This means the timeout might not be rare.
>>>
>>> I don't see how timeout is properly handled in this patch (e.g did 
>>> you notice that you don't set any error when timeout? or is this 
>>> intended?)
>>>
>> The backend software may operate the physical device. The timeout 
>> depends on how the backend is designed.
>> Here if the timeout happens, it will return the actual number of 
>> messages successfully processed to the I2C core.
>> Let the I2C core decides how to do next.
>
>
> So let's consider the following case:
>
> 1) driver:virtio_i2c_add_msg(msgA)
> 2) driver:timeout, and return to I2C core
> 3) driver:virtio_i2c_add_msg(msgB)
> 4) device: complete msgA
> 5) driver: virtqueue_get_buf() returns msgA, since the token is always 
> vi->vmsg, the driver may think msgB has been completed.
>
>
If this case does happen, it is exactly a case that the condition 
"((!vmsg) || (vmsg != &vi->vmsg))" are met.
Currently, the timeout value is hard-coded in the driver. Generally 
speaking, timeout rarely happens.
It can also be designed as a device configuration if needed.

Thanks.

>>
>> Thanks.
>>
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +        vmsg = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, 
>>>>>> &len);
>>>>>> +        /* vmsg should point to the same address with &vi->vmsg */
>>>>>> +        if ((!vmsg) || (vmsg != &vi->vmsg)) {
>>>>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue 
>>>>>> error.\n",
>>>>>> +                i, msgs[i].addr);
>>>>>> +            break;
>>>>>> +        }
>>>>>
>>>>>
>>>>> So I think we can remove this check. Consider only one descriptor 
>>>>> will be used at most, unless there's a bug in the device (and no 
>>>>> other driver to the similar check), we should not hit this.
>>>>>
>>>>> Btw, as I replied in the previous version, the device should be 
>>>>> cacpable of dealing of a batch of requests through the virtqueue, 
>>>>> otherwise it's meaningless to use a queue here.
>>>>>
>>>> We should not assume there is no bug in the device. I don't think 
>>>> we can remove this check if we want our code to be robust.
>>>
>>>
>>> Can you tell when at which case you may hit !vmsg or vmsg != vi->vmsg?
>>>
>> Normally, it won't hit here. But the API "virtqueue_get_buf" tells me
>> "It *may *return NULL or the "data" token handed to virtqueue_add_*()."
>
>
> Note that we had the following check already in 
> virtqueue_get_buf_ctx(), so the the virtio core had already have the 
> ability to figure out the wrong head.
>
>     if (unlikely(id >= vq->packed.vring.num)) {
>         BAD_RING(vq, "id %u out of range\n", id);
>         return NULL;
>     }
>     if (unlikely(!vq->packed.desc_state[id].data)) {
>         BAD_RING(vq, "id %u is not a head!\n", id);
>         return NULL;
>     }
>
> And when it returns a NULL, it's not necessarily an error of the 
> device, it might just require more time to finish the processing.
>

That's why we just returned the actual number of messages successfully 
processed in this case,
and let the I2C core to try one more time.

Actually we have no idea if this is a device error or not. Try one more 
time can also fail if it is a backend error.
Of course, there is another option. We can return error for timeout, no 
matter what reason.

Thanks.


>
>>
>> From the perspective of a caller, I just don't care when it happens.
>> To make the code robust, what I care about is what I should do if 
>> this is not our case
>> since the doc says it*may *happen.
>>
>> If you insist on removing this check, I will remove "vmsg != 
>> vi->vmsg" and keep the check for !vmsg.
>> As Dan reported in v2, we should at least check here for NULL.
>>
>> Thanks.
>>
>>>
>>>
>>>> As I said, currently, we are using the virtqueue to send the msg 
>>>> one by one to the backend. The mechanism is described in the spec. 
>>>
>>>
>>> Which part of the spec describes such "one by one" mechanism? If 
>>> there is one, I'd happily give a NACK since it doesn't require a 
>>> queue to work which is conflict with the concept of the virtqueue.
>>>
>>>
>> What's the concept of the virtqueue ?  Why do you want to restrict 
>> how users use virtqueue ?
>
>
> So I think there's some misunderstanding here. The point is not to 
> restrict how to use virtqueue.
>
> What I meant is:
>
> - we should not invent a device with a virtqueue that can only accept 
> one buffer at a time
> - I don't see any mechanism like "one by one" described in the spec, 
> so it's ok but if it'd happen to have, I will NACK
>
>
Thanks for your clarification. I didn't restrict how to use the 
virtqueue in the spec.
The code is just one implementation. I'd like to have this simple driver 
been merged first.
It may have optimization in the future according to the needs.

Thanks.


>>
>> It's like you provide a water glass to user. The user can fill a full 
>> glass of water and drinks once or
>> fill half a glass of water and drink twice. It is a user behavior and 
>> should not be restricted by
>> the glass provider.
>
>
> That's my point as well, we should not describe the "once" behavior in 
> the spec.
>
>
>>
>> Thanks.
>>
>>
>>>> Thanks.
>>>>
>>>>
>>>>>
>>>>>> +
>>>>>>
>>>>>> +
>>>>>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>>>>>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>>>>>> +
>>>>>> +#include <linux/types.h>
>>>>>> +#include <linux/virtio_ids.h>
>>>>>> +#include <linux/virtio_config.h>
>>>>>> +
>>>>>> +/**
>>>>>> + * struct virtio_i2c_hdr - the virtio I2C message header structure
>>>>>> + * @addr: i2c_msg addr, the slave address
>>>>>> + * @flags: i2c_msg flags
>>>>>> + * @len: i2c_msg len
>>>>>> + */
>>>>>> +struct virtio_i2c_hdr {
>>>>>> +    __le16 addr;
>>>>>> +    __le16 flags;
>>>>>> +    __le16 len;
>>>>>> +};
>>>>>
>>>>>
>>>>> I'm afraid this is not complete. E.g the status is missed.
>>>>>
>>>>> I suspect what virtio-scsi use is better. Which split the in from 
>>>>> the out instead of reusing the same buffer. And it can ease the 
>>>>> uAPI header export.
>>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>
>>>> I think following definition in uAPI for the status is enough.
>>>> There is no need to provide a "u8" status in the structure.
>>>>
>>>> /* The final status written by the device */
>>>> #define VIRTIO_I2C_MSG_OK    0
>>>> #define VIRTIO_I2C_MSG_ERR    1
>>>>
>>>> You can see an example in virtio_blk.
>>>>
>>>> In the spec:
>>>>
>>>> struct virtio_blk_req {
>>>> le32 type;
>>>> le32 reserved;
>>>> le64 sector;
>>>> u8 data[];
>>>> u8 status;
>>>> };
>>>>
>>>> In virtio_blk.h, there is only following definitions.
>>>>
>>>> #define VIRTIO_BLK_S_OK        0
>>>> #define VIRTIO_BLK_S_IOERR    1
>>>> #define VIRTIO_BLK_S_UNSUPP    2
>>>>
>>>
>>> virtio-blk is a bad example, it's just too late to fix. For any new 
>>> introduced uAPI it should be a complete one.
>>>
>>> Thanks
>>>
>> I checked a relatively new device "virtio_fs".
>> I found following definition in spec but not in uAPI also.
>>
>> struct virtio_fs_req {
>> // Device -readable part
>> struct fuse_in_header in;
>> u8 datain[];
>> // Device -writable part
>> struct fuse_out_header out;
>> u8 dataout[];
>> };
>>
>> So is this also a bad example which has not been fixed yet.
>
>
> Cc Stefan for the answer.
>
>
>> Or what's your mean about "complete" here ? Is there any definition 
>> about "complete uAPI" ?
>
>
> My understanding it should contain all the fields defined in the 
> virtio spec.
>
> Thanks
>
OK. I noticed this isn't strictly implemented in the current virtio codes.
I'm not sure if this is already a consensus. I will follow it if this is 
the opinion of the majority.

Thanks.


