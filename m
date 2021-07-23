Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33673D318F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 04:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhGWBl0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 21:41:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:9103 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233128AbhGWBl0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Jul 2021 21:41:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="211510257"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="211510257"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2021 19:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="502337077"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2021 19:21:54 -0700
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <YPmQQelKfa4J7zdA@ninjato>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <4c257470-9b07-d5dc-a5ba-770b0229663e@intel.com>
Date:   Fri, 23 Jul 2021 10:21:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPmQQelKfa4J7zdA@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/7/22 23:35, Wolfram Sang wrote:

> Hi,
>
> so only minor stuff left from my side.
>
>> @@ -21,6 +21,17 @@ config I2C_ALI1535
>>   	  This driver can also be built as a module.  If so, the module
>>   	  will be called i2c-ali1535.
>>   
>> +config I2C_VIRTIO
>> +	tristate "Virtio I2C Adapter"
>> +	select VIRTIO
>> +	help
>> +	  If you say yes to this option, support will be included for the virtio
>> +	  I2C adapter driver. The hardware can be emulated by any device model
>> +	  software according to the virtio protocol.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called i2c-virtio.
>> +
>>   config I2C_ALI1563
>>   	tristate "ALI 1563"
>>   	depends on PCI
> The sorting is not good. I think your entry should go to the bottom of
> the Kconfig file.


OK. I will move it to the bottom.


>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 69e9963..9843756 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -147,4 +147,7 @@ obj-$(CONFIG_I2C_XGENE_SLIMPRO) += i2c-xgene-slimpro.o
>>   obj-$(CONFIG_SCx200_ACB)	+= scx200_acb.o
>>   obj-$(CONFIG_I2C_FSI)		+= i2c-fsi.o
>>   
>> +# VIRTIO I2C host controller driver
> This comment can go, I'd say.


I will remove this line. Thank you.


>
>> +obj-$(CONFIG_I2C_VIRTIO)	+= i2c-virtio.o
>> +
>>   ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
>
>> +		/*
>> +		 * We don't support 0 length messages and so masked out
>> +		 * I2C_FUNC_SMBUS_QUICK in virtio_i2c_func().
>> +		 */
>> +		if (!msgs[i].len)
>> +			break;
> I recommend using struct i2c_adapter_quirks with I2C_AQ_NO_ZERO_LEN. But
> let's wait first if zero length are possible or not.


I think we can add an i2c_adapter_quirks for this moment. Support for 
I2C_FUNC_SMBUS_QUICK
can be added incrementally if needed.


>
> Also, checkpatch:
>
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>
> So, is one of you interested in maintaining this driver?
>
> All the best,
>
>     Wolfram


I will play this role. I see Viresh also spend a lot of time on this driver.

So I'd like to ask Viresh, are you willing to be a co-maintainer ?

Regards,
Jie


