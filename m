Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195433B9C66
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 08:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhGBGyr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 02:54:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:62587 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229984AbhGBGyr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 02:54:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="189065378"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="189065378"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 23:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="482188013"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jul 2021 23:52:12 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7> <YN4WeJCepCrpylOD@kunai>
 <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <409b6cc3-3339-61b2-7f42-0c69b6486bb3@intel.com>
Date:   Fri, 2 Jul 2021 14:52:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/2 12:55, Viresh Kumar wrote:
> On 01-07-21, 21:24, Wolfram Sang wrote:
>>> I just noticed this now, but this function even tries to send data
>>> partially, which isn't right. If the caller (i2c device's driver)
>>> calls this for 5 struct i2c_msg instances, then all 5 need to get
>>> through or none.. where as we try to send as many as possible here.
>>>
>>> This looks broken to me. Rather return an error value here on success,
>>> or make it complete failure.
>>>
>>> Though to be fair I see i2c-core also returns number of messages
>>> processed from i2c_transfer().
>>>
>>> Wolfram, what's expected here ? Shouldn't all message transfer or
>>> none?
>> Well, on a physical bus, it can simply happen that after message 3 of 5,
>> the bus is stalled, so we need to bail out.
> Right, and in that case the transfer will have any meaning left? I believe it
> needs to be fully retried as the requests may have been dependent on each other.
>
>> Again, I am missing details of a virtqueue, but I'd think it is
>> different. If adding to the queue fails, then it probably make sense to
>> drop the whole transfer.
> Exactly my point.
>

This is not efficient. If adding the ith request to the queue fails, we 
can still send

the requests before it. We don't need to know if it fails here (adding 
to the queue)

or there (later in the host). The "master_xfer" just need to return 
final number of

messages successfully processed.



