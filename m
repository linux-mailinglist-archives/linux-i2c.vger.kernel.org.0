Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E31B403276
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Sep 2021 04:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347034AbhIHCIo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Sep 2021 22:08:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:47820 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347006AbhIHCIn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Sep 2021 22:08:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="305919228"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
   d="scan'208";a="305919228"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 19:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
   d="scan'208";a="503324076"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.46]) ([10.239.154.46])
  by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2021 19:07:30 -0700
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com, gregkh@linuxfoundation.org
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210904160059-mutt-send-email-mst@kernel.org>
 <20210906044307.se4dcld2wlblieyv@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <5bb91030-c4be-a3c1-fe25-337999348e9a@intel.com>
Date:   Wed, 8 Sep 2021 10:07:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210906044307.se4dcld2wlblieyv@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/9/6 12:43, Viresh Kumar wrote:
>
>> Let's let the dust settle on them then, then
>> resubmit?
> It doesn't break anything for now since we don't have much users and
> we know zero length transfers don't work. I will submit the necessary
> changes once spec is finalized.

Agree. The currently merged spec and driver are consistent.

We can support zero length request once the following spec change is 
accepted.

[PATCH V3] virtio: i2c: Allow zero-length transactions 
(https://lists.oasis-open.org/archives/virtio-dev/202109/msg00004.html)

So, can we start a ballot for this new feature ?

