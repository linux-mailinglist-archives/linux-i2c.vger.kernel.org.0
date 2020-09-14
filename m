Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FB426823C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 03:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgINBQS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 21:16:18 -0400
Received: from mga02.intel.com ([134.134.136.20]:19584 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgINBQS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 13 Sep 2020 21:16:18 -0400
IronPort-SDR: YR+KCHyXj/VCV1pWy97vxdTXnC2V0VI9NgNWkd9wkyVZV8jyYP/Xq80x/3i0bE9rjRHA/9cuqC
 xK6SpqcCdxMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="146705115"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="146705115"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2020 18:16:17 -0700
IronPort-SDR: SrCHkU1u15brAcYtdi+6L2+guoSnwYNYGrj5vzKeafIgHEJjHNGTl1FmHOKfTcdCH5wWVVcraT
 eUa1Lq99StkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="330537101"
Received: from unknown (HELO [10.239.154.46]) ([10.239.154.46])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2020 18:16:13 -0700
Subject: Re: [PATCH v2] i2c: virtio: add a virtio i2c frontend driver
To:     Randy Dunlap <rdunlap@infradead.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     mst@redhat.com, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
References: <c4bd4fd56df36864ed34d3572f00b2b838fd833a.1599795029.git.jie.deng@intel.com>
 <f235538d-63d6-2c16-4d9e-d913f15cdcf7@infradead.org>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <39c7c5ba-58c2-2b94-d4a5-59dff1b6f556@intel.com>
Date:   Mon, 14 Sep 2020 09:16:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <f235538d-63d6-2c16-4d9e-d913f15cdcf7@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020/9/11 11:53, Randy Dunlap wrote:
> On 9/10/20 8:48 PM, Jie Deng wrote:
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 293e7a0..70c8e30 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -21,6 +21,17 @@ config I2C_ALI1535
>>   	  This driver can also be built as a module.  If so, the module
>>   	  will be called i2c-ali1535.
>>   
>> +config I2C_VIRTIO
>> +	tristate "Virtio I2C Adapter"
>> +	depends on VIRTIO
>> +	help
>> +	  If you say yes to this option, support will be included for the virtio
>> +	  i2c adapter driver. The hardware can be emulated by any device model
> 	  I2C
> preferably
>
I will fix this typo. Thank you.


>> +	  software according to the virtio protocol.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called i2c-virtio.
>> +
>>   config I2C_ALI1563
>>   	tristate "ALI 1563"
>>   	depends on PCI
>
> thanks.
