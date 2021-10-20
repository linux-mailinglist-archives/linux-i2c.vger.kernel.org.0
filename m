Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD05434416
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 06:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhJTEWb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 00:22:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:15800 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhJTEWa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 00:22:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="289535928"
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; 
   d="scan'208";a="289535928"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 21:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; 
   d="scan'208";a="483560724"
Received: from unknown (HELO [10.239.154.68]) ([10.239.154.68])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2021 21:20:13 -0700
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
To:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7> <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7> <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7> <YW8LFTcBuN1bB3PD@ninjato>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
Date:   Wed, 20 Oct 2021 12:20:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YW8LFTcBuN1bB3PD@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/10/20 2:14, Wolfram Sang wrote:
>> I think it is set to HZ currently, though I haven't tried big
>> transfers but I still get into some issues with Qemu based stuff.
>> Maybe we can bump it up to few seconds :)
> If you use adapter->timeout, this can even be set at runtime using a
> ioctl. So, it can adapt to use cases. Of course, the driver should
> initialize it to a sane default if the automatic default (HZ) is not
> suitable.


I think a big value may solve most cases. but the driver never know how 
big is enough by static configuration.

Can we make this value to be configurable, just let the other side 
provide this value ?





