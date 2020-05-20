Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7B41DB2F3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 14:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgETMRg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 08:17:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:24917 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgETMRd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 08:17:33 -0400
IronPort-SDR: 14PYyW8NPhIq+CTNqIGa6g4dJIGIB/g+lkWMaruHCkt40uLT3c0ICDNKLvq8+2F0ODx8Qw4cZH
 /i+JOFBy3gOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 05:17:32 -0700
IronPort-SDR: 0OgppyOHBZqIfc8vIRqLSAl7ReKWQFtjaVUnxPTEofddvm//r+vVa2HGa+2xvPdFfBJMF82vDK
 BSMTzUOymp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="289331424"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 05:17:28 -0700
Subject: Re: [PATCH v2 10/12] i2c: designware: Discard Cherry Trail model flag
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-11-Sergey.Semin@baikalelectronics.ru>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f199b084-fc07-b2ee-fb74-1c2aadab13ef@linux.intel.com>
Date:   Wed, 20 May 2020 15:17:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510095019.20981-11-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/10/20 12:50 PM, Serge Semin wrote:
> A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
> since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
> bus pm_disabled workaround"), but the flag most likely by mistake has been
> left in the Dw I2C drivers. Lets remove it.
> 
> By doing so we get rid from the last DW APB I2C IP-core model flag, so we
> can remove the MODEL_MASK macro too.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
>   drivers/i2c/busses/i2c-designware-core.h    | 3 ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 1 -
>   drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
>   3 files changed, 1 insertion(+), 5 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
