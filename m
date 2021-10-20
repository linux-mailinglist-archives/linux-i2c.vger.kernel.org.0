Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5857E434537
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 08:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhJTGiI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 02:38:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:28121 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhJTGiI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 02:38:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="209500249"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="209500249"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 23:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="483596514"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.68]) ([10.239.154.68])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2021 23:35:50 -0700
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7> <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7> <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7> <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com> <YW+q1yQ8MuhHINAs@kroah.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
Date:   Wed, 20 Oct 2021 14:35:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YW+q1yQ8MuhHINAs@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/10/20 13:36, Greg KH wrote:

> On Wed, Oct 20, 2021 at 12:20:13PM +0800, Jie Deng wrote:
>> On 2021/10/20 2:14, Wolfram Sang wrote:
>>>> I think it is set to HZ currently, though I haven't tried big
>>>> transfers but I still get into some issues with Qemu based stuff.
>>>> Maybe we can bump it up to few seconds :)
>>> If you use adapter->timeout, this can even be set at runtime using a
>>> ioctl. So, it can adapt to use cases. Of course, the driver should
>>> initialize it to a sane default if the automatic default (HZ) is not
>>> suitable.
>>
>> I think a big value may solve most cases. but the driver never know how big
>> is enough by static configuration.
>>
>> Can we make this value to be configurable, just let the other side provide
>> this value ?
> If an ioctl can change it, that would mean it is configurable, right?


Yes, but we need to know what's the best value to be configured for a 
specific "other side".

I think the "other side" should be more aware of what value is 
reasonable to be used.



