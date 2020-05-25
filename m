Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1971E0F39
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 15:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390654AbgEYNQM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 09:16:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:64597 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388757AbgEYNQL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 May 2020 09:16:11 -0400
IronPort-SDR: gFHRJKf/fzgIkRWbiRwQ2XSMYXB/UwWQlvks7Qjuvw81DiGAx6fXNJa7e+QLXifs6GBibN5hzl
 Fzb8HExQv0hw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 06:16:11 -0700
IronPort-SDR: 29F1ZN30wZD0n3NYF9s7La+3jVNm76brsOCh1moocqg5VGKKI5v9XVZenm7WyJTxli7pWH8e+R
 a2bJsIDr/DYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; 
   d="scan'208";a="266147156"
Received: from mylly.fi.intel.com (HELO [10.237.72.67]) ([10.237.72.67])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2020 06:16:06 -0700
Subject: Re: [PATCH v2 08/12] i2c: designware: Introduce platform drivers glue
 layer interface
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-9-Sergey.Semin@baikalelectronics.ru>
 <4950bb1e-302f-947e-1924-452a8169b504@linux.intel.com>
 <20200521023735.mja62ujmxebgwyef@mobilestation>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <80cf1d67-5de1-f3f1-27a0-b88cc105b228@linux.intel.com>
Date:   Mon, 25 May 2020 16:16:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521023735.mja62ujmxebgwyef@mobilestation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/21/20 5:37 AM, Serge Semin wrote:
> On Wed, May 20, 2020 at 03:46:11PM +0300, Jarkko Nikula wrote:
>> Hi
>>
>> On 5/10/20 12:50 PM, Serge Semin wrote:
>>> Seeing the DW I2C platform driver is getting overcomplicated with a lot of
>>> vendor-specific configs let's introduce a glue-layer interface so new
>>> platforms which equipped with Synopsys Designware APB I2C IP-core would
>>> be able to handle their peculiarities in the dedicated objects.
>>>
>> Comment to this patch and patches 9/12 and 12/12:
>>
>> Currently i2c-designware-platdrv.c is about 500 lines of code so I don't
>> think it's too overcomplicated. But I feel we have already too many Kconfig
>> options and source modules for i2c-designware and obviously would like to
>> push back a little from adding more.
>>
>> I don't think i2c-designware-platdrv.c becomes yet too complicated if Baikal
>> related code is added there, perhaps under #ifdef CONFIG_OF like MSCC Ocelot
>> code is currently.
> 
> Well, it's up to you to decide, what solution is more suitable for you to
> maintain. My idea of detaching the MSCC and Baikal-T1 code to the dedicated
> source files was to eventually move the whole i2c-designware-* set of files
> into a dedicated directory drivers/i2c/buses/dw as it's done for some others
> Synopsys DesignWare controllers: drivers/pci/controller/dwc/, drivers/usb/dwc2,
> drivers/usb/dwc3, drivers/net/ethernet/synopsys/ . If you think, that it's too
> early for Dw I2C code to live in a dedicated directory, fine with me. I can
> merge the MSCC and Baikal-T1 code back into the i2c-designware-platdrv.c .
> So what's your final word in this matter?
> 
I think sub directory decision under each subsystem is more subsystem 
rather than vendor/driver specific. Good point anyway.

For this patchset I'd like more if changes are done to 
i2c-designware-platdrv.c since it's not too complicated yet :-)

If it starts to look too messy in the future then it's time split I think.

Jarkko
