Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63A03B7E5D
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 09:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhF3Hxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 03:53:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:31156 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232788AbhF3Hxm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Jun 2021 03:53:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="229942281"
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; 
   d="scan'208";a="229942281"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2021 00:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; 
   d="scan'208";a="641616026"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2021 00:51:09 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato> <05cc9484-f97b-0533-64fe-ff917c6b87ee@intel.com>
 <YNwd/t3DMKSOrTAT@ninjato>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <3016ab8b-cbff-1309-6a1f-080703a4130f@intel.com>
Date:   Wed, 30 Jun 2021 15:51:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YNwd/t3DMKSOrTAT@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/6/30 15:32, Wolfram Sang wrote:
>>>> +	snprintf(vi->adap.name, sizeof(vi->adap.name), "Virtio I2C Adapter");
>>> Is there something to add so you can distinguish multiple instances?
>>> Most people want that.
>>
>> I find the I2C core will set a device name "i2c-%d" for this purpose, right?
>>
>> I think this name can be used to distinguish the adapter types while
>> "i2c-%d" can be used to
>>
>> distinguish instances. Does it make sense ?
> That alone does not help. See the 'i2cdetect -l' output of my Renesas
> board here:
>
> i2c-4	i2c       	e66d8000.i2c                    	I2C adapter
> i2c-2	i2c       	e6510000.i2c                    	I2C adapter
> i2c-7	i2c       	e60b0000.i2c                    	I2C adapter
>
> Notice that the third column carries the base address, so you know which
> i2c-%d is which physical bus. I don't know if it makes sense in your
> "virtual" case, but so far it would always print "Virtio I2C Adapter".
> Maybe it makes sense to add some parent device name, too?
>
> And if this is not reasonable, just skip it. As I said, it can be
> helpful at times, but it is definately not a show stopper.


OK. I will add the virtio_device index for this purpose.
which indicates the unique position on the virtio bus.

Thanks Wolfram, I will fix it and send the v11.


