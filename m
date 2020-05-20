Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107AD1DB2EB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 14:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgETMQ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 08:16:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:33945 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETMQ1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 08:16:27 -0400
IronPort-SDR: Nc4IjrnjrqyZ4j8nL6mvjmU4ynU3kFY2dcVMjVV6tbGo1XQo8xQVQqoW4QK36fBkFGsrT5k94J
 HsgWGHvNRsQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 05:16:12 -0700
IronPort-SDR: 2vuCUDa26VNYQNo+oULASX2jp1NV/gy70EFU73mz6dvdkjgFsNpoNEZdVHZLpUTtl4b5sfaOqJ
 p2YbNF/24iTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="289330868"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 05:16:08 -0700
Subject: Re: [PATCH v2 04/12] i2c: designware: Convert driver to using regmap
 API
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-5-Sergey.Semin@baikalelectronics.ru>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <a0d4c6d8-c2c0-b7ea-d77b-e1fe610fd966@linux.intel.com>
Date:   Wed, 20 May 2020 15:16:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510095019.20981-5-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/10/20 12:50 PM, Serge Semin wrote:
> Seeing the DW I2C driver is using flags-based accessors with two
> conditional clauses it would be better to replace them with the regmap
> API IO methods and to initialize the regmap object with read/write
> callbacks specific to the controller registers map implementation. This
> will be also handy for the drivers with non-standard registers mapping
> (like an embedded into the Baikal-T1 System Controller DW I2C block, which
> glue-driver is a part of this series).
> 
> As before the driver tries to detect the mapping setup at probe stage and
> creates a regmap object accordingly, which will be used by the rest of the
> code to correctly access the controller registers. In two places it was
> appropriate to convert the hand-written read-modify-write and
> read-poll-loop design patterns to the corresponding regmap API
> ready-to-use methods.
> 
> Note the regmap IO methods return value is checked only at the probe
> stage. The rest of the code won't do this because basically we have
> MMIO-based regmap so non of the read/write methods can fail (this also
> won't be needed for the Baikal-T1-specific I2C controller).
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> ---
>   drivers/i2c/busses/Kconfig                 |   1 +
>   drivers/i2c/busses/i2c-designware-common.c | 171 +++++++++++++++------
>   drivers/i2c/busses/i2c-designware-core.h   |  18 +--
>   drivers/i2c/busses/i2c-designware-master.c | 125 ++++++++-------
>   drivers/i2c/busses/i2c-designware-slave.c  |  77 +++++-----
>   5 files changed, 239 insertions(+), 153 deletions(-)
> 
Looking at patches 4/12-12/12 I think it would be good to move fixes and 
less invasive patches before this. Like

i2c: designware: slave: Set DW I2C core module dependency
i2c: designware: Use `-y` to build multi-object modules
i2c: designware: Move Baytrail sem config to the platform if-clause

That said, you may add:

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
