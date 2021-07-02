Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09E03B9B15
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 05:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbhGBDjV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 23:39:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:31776 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234791AbhGBDjV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Jul 2021 23:39:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208488309"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="208488309"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 20:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="409162472"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by orsmga006.jf.intel.com with ESMTP; 01 Jul 2021 20:36:45 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <cb35472d-f79e-f3f8-405f-35c699d897a1@intel.com>
 <20210701061846.7u4zorimzpmb66v7@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <34092cb2-03f9-231d-8769-4e45ed51c30f@intel.com>
Date:   Fri, 2 Jul 2021 11:36:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210701061846.7u4zorimzpmb66v7@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/1 14:18, Viresh Kumar wrote:
> On 01-07-21, 14:10, Jie Deng wrote:
>> I think a fixed number of sgs will make things easier to develop backend.
> Yeah, but it looks awkward to send a message buffer which isn't used
> at all. From protocol's point of view, it just looks wrong/buggy.
>
> The backend can just look at the number of elements received, they
> can either be 2 (in case of zero-length) transfer, or 3 (for
> read/write) and any other number is invalid.
>

OK. Let's add the following two lines to make sure that msg_buf is only
sent when the msgs len is not zero. And backend judges whether it is
a zero-length request by checking the number of elements received.

  + if (msgs[i].len) {
            reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
            if (!reqs[i].buf)
                    break;

           sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);

           if (msgs[i].flags & I2C_M_RD)
                   sgs[outcnt + incnt++] = &msg_buf;
           else
                   sgs[outcnt++] = &msg_buf;
+}


