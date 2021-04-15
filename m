Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AC9360240
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 08:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhDOGSB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 02:18:01 -0400
Received: from mga07.intel.com ([134.134.136.100]:39928 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231196AbhDOGR6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 02:17:58 -0400
IronPort-SDR: oW1NteC1y58HcmMMScT7/iZDsiYq6f3d/pTl3Q5PAIZsvKGZTSePGj9yYGjXt9FTPCnNgF+cyL
 w+Bp/irrOPOw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="258755670"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="258755670"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 23:17:35 -0700
IronPort-SDR: jfymEUlDuAOZaCeFkyDtjgDMtuKU8aEiS9vVzcybf0lefXJn6TJtlvC23SrG5YvRAZiBtyz9RZ
 pF/zENCjWssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="421585736"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga007.jf.intel.com with ESMTP; 14 Apr 2021 23:17:29 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
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
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <eb6011cd-9bd1-0ad4-e95b-aa814f29cb79@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <c8229883-3988-b9f4-189c-7b685bc462b3@intel.com>
Date:   Thu, 15 Apr 2021 14:17:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eb6011cd-9bd1-0ad4-e95b-aa814f29cb79@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/4/15 11:51, Jason Wang wrote:
>
>> +    for (i = 0; i < nr; i++) {
>> +        /* Detach the ith request from the vq */
>> +        req = virtqueue_get_buf(vq, &len);
>> +
>> +        /*
>> +         * Condition (req && req == &reqs[i]) should always meet since
>> +         * we have total nr requests in the vq.
>
>
> So this assumes the requests are completed in order. Is this mandated 
> in the spec?
>
>

This is a mandatory device requirements in spec.


>> +         */
>> +        if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
>> +            (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
>> +            failed = true;
>> +
>> +        i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
>> +        if (!failed)
>> +            ++j;
>> +    }
>> +
>> +    return (timeout ? -ETIMEDOUT : j);
>
>
> Checking timeout is fragile, what happens if the request are completed 
> after wait_for_completion() but before virtio_i2c_complete_reqs()?
>
We have discussed this before in v6. 
https://lists.linuxfoundation.org/pipermail/virtualization/2021-March/053093.html.

If timeout happens, we don't need to care about the requests whether 
really completed by "HW" or not.

Just return error and let the i2c core to decide whether to resend. And 
currently, the timeout is statically configured in driver.

We may extend a device timeout value configuration in spec for driver to 
use if there is actual need in the future.


