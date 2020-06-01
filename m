Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F591EA05B
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jun 2020 10:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgFAIyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jun 2020 04:54:14 -0400
Received: from mga14.intel.com ([192.55.52.115]:14178 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgFAIyO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Jun 2020 04:54:14 -0400
IronPort-SDR: 8BvEAkx21C/Fh8GwcBuPPsGYR3DefnTF3m7WVIZ5aX1EHJ+ip9wIzvNDHfPv47lO7ezxpoz4A7
 56mQBWgpTr2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 01:54:13 -0700
IronPort-SDR: FnkNeyope3kQlKfZ/BaL8l/t/q/AXKTBtfqu4VafIc9FuJjYlF+pd7wVNKpm9C+z3BNz40yrr7
 1HhbIspzfqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; 
   d="scan'208";a="256720241"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jun 2020 01:54:11 -0700
Subject: Re: [PATCH v6 07/11] i2c: designware: Discard Cherry Trail model flag
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-8-Sergey.Semin@baikalelectronics.ru>
 <20200528100635.GH1634618@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <85f326ac-7a11-f405-7830-abda4e8b0879@linux.intel.com>
Date:   Mon, 1 Jun 2020 11:54:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528100635.GH1634618@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/28/20 1:06 PM, Andy Shevchenko wrote:
> On Thu, May 28, 2020 at 12:33:17PM +0300, Serge Semin wrote:
>> A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
>> since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
>> bus pm_disabled workaround"), but the flag most likely by mistake has been
>> left in the Dw I2C drivers. Let's remove it. Since MODEL_MSCC_OCELOT is
>> the only model-flag left, redefine it to be 0x100 so setting a very first
>> bit in the MODEL_MASK bits range.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Conditionally, in case Wolfram and Jarkko are fine with shuffling model
> defines, which I consider an unneeded churn.
> 
>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

I completely agree with Andy and more over, I didn't ack this version. 
This was the version I acked:

https://www.spinics.net/lists/linux-i2c/msg45492.html

So in general please drop the received tags in case you decide to modify 
patch since reviewers may not agree anymore with it.

That said, I'm fine with that minor code and commit log change. And 
don't want to have yet another patchset version because it. Four 
patchset versions during 2 days is a bit too much... Usual 
recommendation is to wait for 1 week before posting a new version 
especially if patchset is under active discussion.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
