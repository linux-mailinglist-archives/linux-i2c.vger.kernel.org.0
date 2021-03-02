Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DDF32B24A
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242045AbhCCBPO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:15:14 -0500
Received: from mga01.intel.com ([192.55.52.88]:33412 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1376313AbhCBHRB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Mar 2021 02:17:01 -0500
IronPort-SDR: HfKJdSqFdQi/GbNiy1oYExChle7pPTBIPr3GEN/c20aMzop3iHAyGEjkHkT391/DG5X6LSMPJA
 0yNNEUcIM4iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="206345510"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="206345510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 23:16:11 -0800
IronPort-SDR: cONYIPV0OpIAhapGBuMV8l0Va3BTh17wycnHERsBtyZn7o1wKu8N/PRruo2a5RXzARs2ntB5/C
 +jd9tVBIgNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="444631585"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by orsmga001.jf.intel.com with ESMTP; 01 Mar 2021 23:16:05 -0800
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        conghui.chen@intel.com, arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <YDzZHKdrpROgSdg3@smile.fi.intel.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <5888846c-cc7b-44b1-98df-9fa10d89a3ff@intel.com>
Date:   Tue, 2 Mar 2021 15:16:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDzZHKdrpROgSdg3@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/1 20:07, Andy Shevchenko wrote:
> On Mon, Mar 01, 2021 at 02:41:35PM +0800, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> The device specification can be found on
>> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>>
>> By following the specification, people may implement different
>> backend drivers to emulate different controllers according to
>> their needs.
> ...
>
>> +		buf = kzalloc(msgs[i].len, GFP_KERNEL);
>> +		if (!buf)
>> +			break;
>> +
>> +		if (msgs[i].flags & I2C_M_RD) {
> kzalloc()
>
>> +			reqs[i].read_buf = buf;
>> +			sg_init_one(&msg_buf, reqs[i].read_buf, msgs[i].len);
>> +			sgs[outcnt + incnt++] = &msg_buf;
>> +		} else {
>> +			reqs[i].write_buf = buf;
>> +			memcpy(reqs[i].write_buf, msgs[i].buf, msgs[i].len);
> kmemdup() ?
Do you mean using "kzalloc" in the if condition and "kmemdup" in the 
else condition ?
Then we have to check the NULL twice which is also not good.
>> +			sg_init_one(&msg_buf, reqs[i].write_buf, msgs[i].len);
>> +			sgs[outcnt++] = &msg_buf;
>> +		}
> ...
>
>> +
>> +
> One blank line is enough.
Will fix it. Thank you.
> ...
>
>
>> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>> +	if (ret == 0)
>> +		goto err_unlock_free;
>> +	else
> Redundant.
Good catch !
>> +		nr = ret;
