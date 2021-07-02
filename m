Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B483B9CD2
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 09:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhGBHRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 03:17:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:1933 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230026AbhGBHRy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 03:17:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208726771"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="208726771"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 00:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="482197260"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2021 00:15:19 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7> <YN4WeJCepCrpylOD@kunai>
 <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
 <409b6cc3-3339-61b2-7f42-0c69b6486bb3@intel.com>
 <20210702065625.qielhnfyrlvrtrkk@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <bdea419c-b450-f6b1-fff3-7df077b2abfc@intel.com>
Date:   Fri, 2 Jul 2021 15:15:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210702065625.qielhnfyrlvrtrkk@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/2 14:56, Viresh Kumar wrote:
> On 02-07-21, 14:52, Jie Deng wrote:
>> This is not efficient. If adding the ith request to the queue fails, we can
>> still send
>>
>> the requests before it.
> Not really. Normally the requests which are sent together by clients, are linked
> together, like a state machine. So if the first one is sent, but not the second
> one, then there is not going to be any meaningful result of that.
>
> The i2c core doesn't club requests together from different clients in a single
> i2c_transfer() call. So you must assume i2c_transfer(), irrespective of the
> number of underlying messages in it, as atomic. If you fail, the client is going
> to retry everything again or assume it failed completely.


Then what is the need to design this interface as "return the number of 
messages successfully
processed, or a negative value on error". Just return success or fail is 
enough.

Here, we didn't break the contract with the interface "master_xfer", so 
if there is a problem then
the contract may be the problem.


