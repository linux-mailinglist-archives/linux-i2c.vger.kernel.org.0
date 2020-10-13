Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF56528C90B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 09:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389955AbgJMHQf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 03:16:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:54164 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389829AbgJMHQc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Oct 2020 03:16:32 -0400
IronPort-SDR: 7u1qb+EwkUrmSFWuKBVI+pHpoiJi2meLTXRg3H9cgIbqM8skMg8WO/cxOEML25tFYzjh/wKw6O
 TZbxVL/vLW2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250560569"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="250560569"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 00:16:31 -0700
IronPort-SDR: 42JeIXsUr+8A4OD+nNXjBXG2Dg7SlndDAQqMdJHZjN9IY1CUFYyYObicjdcuy0yzWiU4qbH5xw
 0MCNBm4kDSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="346090084"
Received: from unknown (HELO [10.239.154.47]) ([10.239.154.47])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2020 00:16:25 -0700
Subject: Re: [PATCH v3] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
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
 <83529dac-7b87-aec9-55f0-85face47e7b6@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <b1cad8f9-67c4-dbb7-6edc-66be2f6ba08f@intel.com>
Date:   Tue, 13 Oct 2020 15:16:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <83529dac-7b87-aec9-55f0-85face47e7b6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/10/12 11:43, Jason Wang wrote:
>
> On 2020/10/12 上午10:45, Jie Deng wrote:
>>
>>
>> On 2020/10/10 11:14, Jason Wang wrote:
>>>
>>>> +
>>>> +        virtqueue_kick(vq);
>>>> +
>>>> +        time_left = wait_for_completion_timeout(&vi->completion, 
>>>> adap->timeout);
>>>> +        if (!time_left) {
>>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", 
>>>> i, msgs[i].addr);
>>>> +            break;
>>>> +        }
>>>
>>>
>>> You don't set error number here. Is this intended?
>>>
>>> And using a timeout here is not good, and if the request is finished 
>>> just after the timeout, in the next xfer you may hit the following 
>>> check.
>>>
>>> It's better to use either interrupt here.
>>>
>> Could you check the I2C drivers in the kernel ? The 
>> "wait_for_completion_timeout" mechanism
>> is commonly used by I2C bus drivers in their i2c_algorithm.master_xfer.
>
>
> There's a major difference between virtio-i2c and other drivers. In 
> the case of virtio, the device could be a software device emulated by 
> a remote process. This means the timeout might not be rare.
>
> I don't see how timeout is properly handled in this patch (e.g did you 
> notice that you don't set any error when timeout? or is this intended?)
>
The backend software may operate the physical device. The timeout 
depends on how the backend is designed.
Here if the timeout happens, it will return the actual number of 
messages successfully processed to the I2C core.
Let the I2C core decides how to do next.

Thanks.

>
>>
>>>
>>>> +
>>>> +        vmsg = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
>>>> +        /* vmsg should point to the same address with &vi->vmsg */
>>>> +        if ((!vmsg) || (vmsg != &vi->vmsg)) {
>>>> +            dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue 
>>>> error.\n",
>>>> +                i, msgs[i].addr);
>>>> +            break;
>>>> +        }
>>>
>>>
>>> So I think we can remove this check. Consider only one descriptor 
>>> will be used at most, unless there's a bug in the device (and no 
>>> other driver to the similar check), we should not hit this.
>>>
>>> Btw, as I replied in the previous version, the device should be 
>>> cacpable of dealing of a batch of requests through the virtqueue, 
>>> otherwise it's meaningless to use a queue here.
>>>
>> We should not assume there is no bug in the device. I don't think we 
>> can remove this check if we want our code to be robust.
>
>
> Can you tell when at which case you may hit !vmsg or vmsg != vi->vmsg?
>
Normally, it won't hit here. But the API "virtqueue_get_buf" tells me
"It *may *return NULL or the "data" token handed to virtqueue_add_*()."

 From the perspective of a caller, I just don't care when it happens.
To make the code robust, what I care about is what I should do if this 
is not our case
since the doc says it*may *happen.

If you insist on removing this check, I will remove "vmsg != vi->vmsg" 
and keep the check for !vmsg.
As Dan reported in v2, we should at least check here for NULL.

Thanks.

>
>
>> As I said, currently, we are using the virtqueue to send the msg one 
>> by one to the backend. The mechanism is described in the spec. 
>
>
> Which part of the spec describes such "one by one" mechanism? If there 
> is one, I'd happily give a NACK since it doesn't require a queue to 
> work which is conflict with the concept of the virtqueue.
>
>
What's the concept of the virtqueue ?  Why do you want to restrict how 
users use virtqueue ?

It's like you provide a water glass to user. The user can fill a full 
glass of water and drinks once or
fill half a glass of water and drink twice. It is a user behavior and 
should not be restricted by
the glass provider.

Thanks.


>> Thanks.
>>
>>
>>>
>>>> +
>>>>
>>>> +
>>>> +#ifndef _UAPI_LINUX_VIRTIO_I2C_H
>>>> +#define _UAPI_LINUX_VIRTIO_I2C_H
>>>> +
>>>> +#include <linux/types.h>
>>>> +#include <linux/virtio_ids.h>
>>>> +#include <linux/virtio_config.h>
>>>> +
>>>> +/**
>>>> + * struct virtio_i2c_hdr - the virtio I2C message header structure
>>>> + * @addr: i2c_msg addr, the slave address
>>>> + * @flags: i2c_msg flags
>>>> + * @len: i2c_msg len
>>>> + */
>>>> +struct virtio_i2c_hdr {
>>>> +    __le16 addr;
>>>> +    __le16 flags;
>>>> +    __le16 len;
>>>> +};
>>>
>>>
>>> I'm afraid this is not complete. E.g the status is missed.
>>>
>>> I suspect what virtio-scsi use is better. Which split the in from 
>>> the out instead of reusing the same buffer. And it can ease the uAPI 
>>> header export.
>>>
>>> Thanks
>>>
>>>
>>
>> I think following definition in uAPI for the status is enough.
>> There is no need to provide a "u8" status in the structure.
>>
>> /* The final status written by the device */
>> #define VIRTIO_I2C_MSG_OK    0
>> #define VIRTIO_I2C_MSG_ERR    1
>>
>> You can see an example in virtio_blk.
>>
>> In the spec:
>>
>> struct virtio_blk_req {
>> le32 type;
>> le32 reserved;
>> le64 sector;
>> u8 data[];
>> u8 status;
>> };
>>
>> In virtio_blk.h, there is only following definitions.
>>
>> #define VIRTIO_BLK_S_OK        0
>> #define VIRTIO_BLK_S_IOERR    1
>> #define VIRTIO_BLK_S_UNSUPP    2
>>
>
> virtio-blk is a bad example, it's just too late to fix. For any new 
> introduced uAPI it should be a complete one.
>
> Thanks
>
I checked a relatively new device "virtio_fs".
I found following definition in spec but not in uAPI also.

struct virtio_fs_req {
// Device -readable part
struct fuse_in_header in;
u8 datain[];
// Device -writable part
struct fuse_out_header out;
u8 dataout[];
};

So is this also a bad example which has not been fixed yet.
Or what's your mean about "complete" here ? Is there any definition 
about "complete uAPI" ?

Thanks.


>
>> Thanks.
>>
>>
>>
>
