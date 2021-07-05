Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE6E3BB726
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 08:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhGEGZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 02:25:02 -0400
Received: from mga07.intel.com ([134.134.136.100]:35169 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229797AbhGEGZB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Jul 2021 02:25:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="272779669"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="272779669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2021 23:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="562409136"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2021 23:22:15 -0700
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <20210705024056.ndth2bwn2itii5g3@vireshk-i7>
 <332af2be-0fb0-a846-8092-49d496fe8b6b@intel.com>
 <20210705043841.zujwo672nfdndpg2@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <6aabc877-673a-e2bc-da2d-ec6741b4159b@intel.com>
Date:   Mon, 5 Jul 2021 14:22:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210705043841.zujwo672nfdndpg2@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/5 12:38, Viresh Kumar wrote:
> On 05-07-21, 11:45, Jie Deng wrote:
>> On 2021/7/5 10:40, Viresh Kumar wrote:
>>> On 02-07-21, 16:46, Jie Deng wrote:
>>> The right way of doing this is is making this function return - Error on failure
>>> and 0 on success. There is no point returning number of successful additions
>>> here.
>>
>> We need the number for virtio_i2c_complete_reqs to do cleanup. We don't have
>> to
>>
>> do cleanup "num" times every time. Just do it as needed.
> If you do full cleanup here, then you won't required that at the caller site.
>
>>> Moreover, on failures this needs to clean up (free the dmabufs) itself, just
>>> like you did i2c_put_dma_safe_msg_buf() at the end. The caller shouldn't be
>>> required to handle the error cases by freeing up resources.
>>
>> This function will return the number of requests being successfully prepared
>> and make sure
>>
>> resources of the failed request being freed. And virtio_i2c_complete_reqs
>> will free the
>>
>> resources of those successful request.
> It just looks cleaner to give such responsibility to each and every function,
> i.e. if they fail, they should clean stuff up instead of the caller. That's the
> normal philosophy you will find across kernel in most of the cases.
>   
>>>> +		/*
>>>> +		 * Condition (req && req == &reqs[i]) should always meet since
>>>> +		 * we have total nr requests in the vq.
>>>> +		 */
>>>> +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
>>>> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
>>> What about writing this as:
>>>
>>> 		if (!failed && (WARN_ON(req != &reqs[i]) ||
>>> 		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
>>>
>>> We don't need to check req here since if req is NULL, we will not do req->in_hdr
>>> at all.
>>
>> It's right here just because the &reqs[i] will never be NULL in our case.
>> But if you see
>>
>> "virtio_i2c_complete_reqs" as an independent function, you need to check the
>>
>> req. From the perspective of the callee, you can't ask the caller always
>> give you
>>
>> the non-NULL parameters.
> We need to keep this driver optimized in its current form. If you see your own
> argument here, then why don't you test vq or msgs for a valid pointer ? And even
> reqs.
>
> If we know for certain that this will never happen, then it should be optimized.
> But if you see a case where reqs[i] can be NULL here, then it would be fine.
> ot the driver. And we don't need to take care of that.


This is still not enough to convince me.  So I won't change them for now 
until I see it

is the consensus of the majority.

Thank you.


