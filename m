Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7B71833AC
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 15:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgCLOuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 10:50:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:34743 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbgCLOuK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Mar 2020 10:50:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="235042911"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Mar 2020 07:50:08 -0700
Subject: Re: [PATCH 4/6] i2c: designware: Detect the FIFO size in the common
 code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sergey.Semin@baikalelectronics.ru
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132151.2ABC38030786@mail.baikalelectronics.ru>
 <20200306150138.GN1748204@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <c119e638-0fd5-8ad0-be7f-ac408e62e66f@linux.intel.com>
Date:   Thu, 12 Mar 2020 16:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306150138.GN1748204@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/6/20 5:01 PM, Andy Shevchenko wrote:
> On Fri, Mar 06, 2020 at 04:19:54PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
>> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>
>> The problem with detecting the FIFO depth in the platform driver
>> is that in order to implement this we have to access the controller
>> IC_COMP_PARAM_1 register. Currently it's done before the
>> i2c_dw_set_reg_access() method execution, which is errors prone since
>> the method determines the registers endianness and access mode and we
>> can't use dw_readl/dw_writel accessors before this information is
>> retrieved. We also can't move the i2c_dw_set_reg_access() function
>> invocation to after the master/slave probe functions call (when endianness
>> and access mode are determined), since the FIFO depth information is used
>> by them for initializations. So in order to fix the problem we have no
>> choice but to move the FIFO size detection methods to the common code and
>> call it at the probe stage.
> 
> Sounds reasonable.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
