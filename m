Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6500C338793
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 09:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhCLIid (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 03:38:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:24678 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232439AbhCLIiD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Mar 2021 03:38:03 -0500
IronPort-SDR: IQpyTA2Jt5XvDG/RdEdKxlOWEk+rc4dWYyeQIA6cBf++hHMqhuVOMQmX6Ze3+hYsovNSYpMfjv
 Hipg8Bo/ASqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="188899797"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="188899797"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 00:38:02 -0800
IronPort-SDR: 8c9+J2Da86cjcBUqFbvTy/6CkYSZWSBvXbUTgVkMsNsB6EFOhL5iXaiJuVOjmndPwWr3p+TQc7
 3GQB1cWtWIcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="377644496"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga007.fm.intel.com with ESMTP; 12 Mar 2021 00:37:57 -0800
Subject: Re: [PATCH v7] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
References: <cd3b0c9138824b0a5fad9d3bc872d8836e829946.1615554673.git.jie.deng@intel.com>
 <20210312061012.slmfnhxe6y5kgrnv@vireshk-i7>
 <a97c64ea-773a-133b-c37c-cd02493e0230@intel.com>
 <20210312081108.fvqrvb75byurt3lo@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <d35e385e-3f5f-49b7-1593-3ed203853dbf@intel.com>
Date:   Fri, 12 Mar 2021 16:37:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210312081108.fvqrvb75byurt3lo@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/12 16:11, Viresh Kumar wrote:
> On 12-03-21, 15:51, Jie Deng wrote:
>> On 2021/3/12 14:10, Viresh Kumar wrote:
>>> I saw your email about wrong version being sent, I already wrote some
>>> reviews. Sending them anyway for FWIW :)
>>>
>>> On 12-03-21, 21:33, Jie Deng wrote:
>>>> +struct virtio_i2c {
>>>> +	struct virtio_device *vdev;
>>>> +	struct completion completion;
>>>> +	struct i2c_adapter adap;
>>>> +	struct mutex lock;
>>> As I said in the previous version (Yes, we were both waiting for
>>> Wolfram to answer that), this lock shouldn't be required at all.
>>>
>>> And since none of us have a use-case at hand where we will have a
>>> problem without this lock, we should really skip it. We can always
>>> come back and add it if we find an issue somewhere. Until then, better
>>> to keep it simple.
>> The problem is you can't guarantee that adap->algo->master_xfer
>> is only called from i2c_transfer. Any function who holds the adapter can
>> call
>> adap->algo->master_xfer directly.
> See my last reply here, (almost) no one in the mainline kernel call it
> directly. And perhaps you can consider the caller broken in that case
> and so there is no need of an extra lock, unless you have a case that
> is broken.
>
> https://lore.kernel.org/lkml/20210305072903.wtw645rukmqr5hx5@vireshk-i7/
>
>> I prefer to avoid potential issues rather
>> than
>> find a issue then fix.
> This is a very hypothetical issue IMHO as the kernel code doesn't have
> such a user. There is no need of locks here, else the i2c core won't
> have handled it by itself.

I'd like to see Wolfram's opinion.
Is it safe to remove lock in adap->algo->master_xfer ?


