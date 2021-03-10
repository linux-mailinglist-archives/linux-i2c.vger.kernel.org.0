Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7D1333316
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 03:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhCJCWz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 21:22:55 -0500
Received: from mga18.intel.com ([134.134.136.126]:11702 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231299AbhCJCWh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Mar 2021 21:22:37 -0500
IronPort-SDR: LEY/aue7aBdfJgQIgJ5ZIpx/REIfSOgk1zN5RW5Xwomlu3hMab3uP7VSx/Zkai076lidHnMlpp
 POKb0uhepJyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175966622"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
   d="scan'208";a="175966622"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 18:22:35 -0800
IronPort-SDR: 4hb4GTO/VCURjcsMMoLIhUgrPjxB6ULiRRKXoeTZE+siy3Iy3gYkSIer46ao1JOZ1k65tnpHD7
 gglQM2RcKfaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
   d="scan'208";a="376770074"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2021 18:22:30 -0800
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa@kernel.org, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <db9350b3-b847-8f54-546f-9a0bdec425d4@intel.com>
Date:   Wed, 10 Mar 2021 10:22:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/4 17:15, Jason Wang wrote:
>
>
>> +        }
>> +
>> +        if (msgs[i].flags & I2C_M_RD)
>> +            memcpy(msgs[i].buf, req->buf, msgs[i].len);
>
>
> Sorry if I had asked this before but any rason not to use msg[i].buf 
> directly?
>
>
The msg[i].buf is passed by the I2C core. I just noticed that these bufs 
are not
always allocated by kmalloc. They may come from the stack, which may cause
the check "sg_init_one -> sg_set_buf -> virt_addr_valid"  to fail. 
Therefore the
msg[i].buf is not suitable for direct use here.

Regards.

