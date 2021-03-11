Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57755336BD2
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Mar 2021 07:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhCKGAH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Mar 2021 01:00:07 -0500
Received: from mga01.intel.com ([192.55.52.88]:37638 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229923AbhCKF7u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Mar 2021 00:59:50 -0500
IronPort-SDR: c2VSedUMAZFnUAZbYA7/YLuaR9uuYdS+2H6WSyob17GSzOtcS7GWG/d8oLEG5nPafo4ZX0KLw6
 16Km3OGIUalw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="208432971"
X-IronPort-AV: E=Sophos;i="5.81,239,1610438400"; 
   d="scan'208";a="208432971"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 21:59:50 -0800
IronPort-SDR: du9lyukxeF00i+Ix2NYJrOSRrhlfdBckq7UR+OhFYQ6il5kUCXljzaM2Uv5W/lpYr6TQzAI03b
 RQEWJrNe20xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,239,1610438400"; 
   d="scan'208";a="603404106"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga005.fm.intel.com with ESMTP; 10 Mar 2021 21:59:43 -0800
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To:     Arnd Bergmann <arnd@arndb.de>, Jason Wang <jasowang@redhat.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
 <db9350b3-b847-8f54-546f-9a0bdec425d4@intel.com>
 <a3d4ce55-db25-5f96-ff44-5b76edfe9e08@redhat.com>
 <CAK8P3a04u9Xv15K06zrsOtzZF18+1wDpJbBHUU3wYwU--Hdz5A@mail.gmail.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <c6538bba-9217-d707-9a16-72b550c7f76f@intel.com>
Date:   Thu, 11 Mar 2021 13:59:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a04u9Xv15K06zrsOtzZF18+1wDpJbBHUU3wYwU--Hdz5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/10 16:27, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 4:59 AM Jason Wang <jasowang@redhat.com> wrote:
>> On 2021/3/10 10:22 上午, Jie Deng wrote:
>>> On 2021/3/4 17:15, Jason Wang wrote:
>>>>
>>>>> +        }
>>>>> +
>>>>> +        if (msgs[i].flags & I2C_M_RD)
>>>>> +            memcpy(msgs[i].buf, req->buf, msgs[i].len);
>>>>
>>>> Sorry if I had asked this before but any rason not to use msg[i].buf
>>>> directly?
>>>>
>>>>
>>> The msg[i].buf is passed by the I2C core. I just noticed that these
>>> bufs are not
>>> always allocated by kmalloc. They may come from the stack, which may
>>> cause
>>> the check "sg_init_one -> sg_set_buf -> virt_addr_valid"  to fail.
>>> Therefore the
>>> msg[i].buf is not suitable for direct use here.
>> Right, stack is virtually mapped.
> Maybe there is (or should be) a way to let the i2c core code handle
> the bounce buffering in this case. This is surely not a problem that
> is unique to this driver, and I'm sure it has come up many times in
> the past.
>
> I see that there is a i2c_get_dma_safe_msg_buf() helper for this
> purpose, but it has to be called by the driver rather than the core,
> so the driver still needs to keep track of each address when it
> sends multiple i2c_msg at once, but maybe it can all be done
> inside the sg_table instead of yet another structure.
>
> At least this one avoids copying data that is marked with the
> I2C_M_DMA_SAFE flag.
>
>         Arnd

Make sense. Thanks Arnd. I will try to use those helper functions.

Regards,
Jie
