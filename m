Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECEA725BB80
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 09:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgICHTI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 03:19:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:50360 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727955AbgICHTI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 03:19:08 -0400
IronPort-SDR: s2FJnA7GE+DTIZ46pVz/DiuU7I9DZEA+pi/5aHrUrX96hSPYrS+W5zTYvg08OJqE0uf53yzsTv
 0vv8aEQVZF+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="155036824"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="155036824"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 00:19:08 -0700
IronPort-SDR: fTo99JnhqCgFkBUut2syhSAtgp8nnudAzDtvy9C5FvzNlHqF0dG9gg8yaORwLKYvna9eRwj6/8
 Pp5RHPpGzBCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="297946856"
Received: from unknown (HELO [10.239.154.46]) ([10.239.154.46])
  by orsmga003.jf.intel.com with ESMTP; 03 Sep 2020 00:19:03 -0700
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
To:     Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
 <f3ab5d7d-cce5-b34c-5931-dd5d74f065e7@redhat.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <6517879c-15d4-6265-761c-626cba9c95d6@intel.com>
Date:   Thu, 3 Sep 2020 15:19:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <f3ab5d7d-cce5-b34c-5931-dd5d74f065e7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/3 14:12, Jason Wang wrote:
>
> On 2020/9/3 下午1:34, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> This driver communicates with the backend driver through a
>> virtio I2C message structure which includes following parts:
>>
>> - Header: i2c_msg addr, flags, len.
>> - Data buffer: the pointer to the i2c msg data.
>> - Status: the processing result from the backend.
>>
>> People may implement different backend drivers to emulate
>> different controllers according to their needs. A backend
>> example can be found in the device model of the open source
>> project ACRN. For more information, please refer to
>> https://projectacrn.org.
>
>
> May I know the reason why don't you use i2c or virtio directly?
>
We don't want to add virtio drivers for every I2C devices in the guests.
This bus driver is designed to provide a way to flexibly expose the 
physical
I2C slave devices to the guest without adding or changing the drivers of 
the
I2C slave devices in the guest OS.


>
>>
>> The virtio device ID 34 is used for this I2C adpter since IDs
>> before 34 have been reserved by other virtio devices.
>
>
> Is there a link to the spec patch?
>
> Thanks
>
I haven't submitted the patch to reserve the ID in spec yet.
I write the ID here because I want to see your opinions first.

Thanks


