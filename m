Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3573459C2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 09:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhCWIeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 04:34:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:31238 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229897AbhCWIdk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Mar 2021 04:33:40 -0400
IronPort-SDR: GjnOo9DIT1VM6LuUjLk2ntqAwB4dGYLc70y+S4VDOh5alz2NXog7ZKwS1cczsd8KZnnx94j/6U
 EtvAGCB7h6rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="169767725"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="169767725"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 01:33:36 -0700
IronPort-SDR: dxMPLZLIdwbEcufioZOCgJqKgJrpYMB+pfcuO4K7maUx4JRNqMDGTLG2wGyMaN82r7P8FYJWo6
 V6galnLHWa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="435470763"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2021 01:33:31 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
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
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
Date:   Tue, 23 Mar 2021 16:33:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/3/23 15:27, Viresh Kumar wrote:

> On 23-03-21, 22:19, Jie Deng wrote:
>> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
>> +{
>> +	virtio_i2c_del_vqs(vdev);
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
>> +{
>> +	return virtio_i2c_setup_vqs(vdev->priv);
>> +}
> Sorry for not looking at this earlier, but shouldn't we enclose the above two
> within #ifdef CONFIG_PM_SLEEP instead and drop the __maybe_unused ?


I remembered I was suggested to use "__maybe_unused" instead of "#ifdef".

You may check this https://lore.kernel.org/patchwork/patch/732981/

The reason may be something like that.

