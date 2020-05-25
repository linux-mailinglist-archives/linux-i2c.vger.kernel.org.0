Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1C41E0EF3
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 15:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390654AbgEYNBh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 09:01:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:61383 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388738AbgEYNBg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 May 2020 09:01:36 -0400
IronPort-SDR: +WEbcvz6KbTVDxe417hrDmGNEuVVJsTIe/Zgm9KGnCfvKKSCaGse0b7cKyxaNltAOQwLcKKDeu
 dAxYlOUIJUqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 06:01:34 -0700
IronPort-SDR: Rli/mR6WDMx9Hx5ViPLLh25L60zuFtnubw00/s5RY3kRaHybaQtEQWu371E/UlTfgFLB1vz92w
 vQPs1Bp8bFyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; 
   d="scan'208";a="266141381"
Received: from mylly.fi.intel.com (HELO [10.237.72.67]) ([10.237.72.67])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2020 06:01:27 -0700
Subject: Re: [PATCH v2 07/12] i2c: designware: Move Baytrail sem config to the
 platform if-clause
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-8-Sergey.Semin@baikalelectronics.ru>
 <da6d8b18-b808-fd86-bbd2-13e7a90b2a5e@linux.intel.com>
 <20200521022215.ubvhuop47aflqkkb@mobilestation>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f01b3082-082c-8ce9-d0f7-f9ff952a37bf@linux.intel.com>
Date:   Mon, 25 May 2020 16:01:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521022215.ubvhuop47aflqkkb@mobilestation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/21/20 5:22 AM, Serge Semin wrote:
> On Wed, May 20, 2020 at 03:16:14PM +0300, Jarkko Nikula wrote:
>> On 5/10/20 12:50 PM, Serge Semin wrote:
>>> Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
>>> platform driver. It's a bit confusing to see it's config in the menu at
>>> some separated place with no reference to the platform code. Lets move the
>>> config definition under the if-I2C_DESIGNWARE_PLATFORM clause. By doing so
>>> the config menu will display the feature right below the DW I2C platform
>>> driver item and will indent it to the right so signifying its belonging.
>>>
>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
>>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>> Cc: Paul Burton <paulburton@kernel.org>
>>> Cc: Ralf Baechle <ralf@linux-mips.org>
>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> Cc: Wolfram Sang <wsa@the-dreams.de>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Frank Rowand <frowand.list@gmail.com>
>>> Cc: linux-mips@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> ---
>>>    drivers/i2c/busses/Kconfig | 30 +++++++++++++++++-------------
>>>    1 file changed, 17 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>>> index 368aa64e9266..ed6927c4c540 100644
>>> --- a/drivers/i2c/busses/Kconfig
>>> +++ b/drivers/i2c/busses/Kconfig
>>> @@ -530,8 +530,8 @@ config I2C_DESIGNWARE_CORE
>>>    config I2C_DESIGNWARE_PLATFORM
>>>    	tristate "Synopsys DesignWare Platform"
>>> -	select I2C_DESIGNWARE_CORE
>>>    	depends on (ACPI && COMMON_CLK) || !ACPI
>>> +	select I2C_DESIGNWARE_CORE
>>>    	help
>>>    	  If you say yes to this option, support will be included for the
>>>    	  Synopsys DesignWare I2C adapter.
>>> @@ -539,6 +539,22 @@ config I2C_DESIGNWARE_PLATFORM
>>>    	  This driver can also be built as a module.  If so, the module
>>>    	  will be called i2c-designware-platform.
>>> +if I2C_DESIGNWARE_PLATFORM
>>> +
>>> +config I2C_DESIGNWARE_BAYTRAIL
>>> +	bool "Intel Baytrail I2C semaphore support"
>>> +	depends on ACPI
>>> +	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
>>> +		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
>>> +	help
>>> +	  This driver enables managed host access to the PMIC I2C bus on select
>>> +	  Intel BayTrail platforms using the X-Powers AXP288 PMIC. It allows
>>> +	  the host to request uninterrupted access to the PMIC's I2C bus from
>>> +	  the platform firmware controlling it. You should say Y if running on
>>> +	  a BayTrail system using the AXP288.
>>> +
>>> +endif # I2C_DESIGNWARE_PLATFORM
>>> +
>>
>> Is the added "if I2C_DESIGNWARE_PLATFORM" needed here? Should the "depends
>> on" be enough?
> 
> The idea was to add if-endif clause here for features possibly added sometime
> in future. But using normal "depends on I2C_DESIGNWARE_PLATFORM" shall make
> the config depicted as an indented sub-config as well. Would you like me to
> remove the if-clause and use the depends on operator instead?
> 
Yes, please remove it from this patch. Keeps this patch simpler and if 
some future feature needs it then that patch(set) is the right place to 
add it.

Jarkko
