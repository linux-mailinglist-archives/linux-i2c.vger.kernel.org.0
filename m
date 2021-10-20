Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F2B4345AA
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 09:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbhJTHHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 03:07:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:61598 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhJTHHH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 03:07:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="226171625"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="226171625"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 00:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="483605079"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.68]) ([10.239.154.68])
  by orsmga007.jf.intel.com with ESMTP; 20 Oct 2021 00:04:46 -0700
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7> <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7> <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7> <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com> <YW+q1yQ8MuhHINAs@kroah.com>
 <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
Date:   Wed, 20 Oct 2021 15:04:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/10/20 14:41, Viresh Kumar wrote:
> On 20-10-21, 14:35, Jie Deng wrote:
>> Yes, but we need to know what's the best value to be configured for a
>> specific "other side".
>>
>> I think the "other side" should be more aware of what value is reasonable to
>> be used.
> If we _really_ need that, then it would require an update to the
> specification first.
>
> I am not sure if the other side is the only party in play here. It
> depends on the entire setup and not just the hardware device.
> Specially with virtualisation things become really slow because of
> context switches, etc. It may be better for the guest userspace to
> decide on the value.
>
> Since this is specially for virtualisation, the kernel may set the
> value to few HZ by default, lets say 10 (Yeah its really high) :).


I'm OK with this way for the simplicity.


