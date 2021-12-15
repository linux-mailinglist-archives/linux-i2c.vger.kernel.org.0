Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6629D4753ED
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 08:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236060AbhLOHzu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 02:55:50 -0500
Received: from mga03.intel.com ([134.134.136.65]:65204 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230260AbhLOHzu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 02:55:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239122880"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="239122880"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 23:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="545493488"
Received: from mylly.fi.intel.com (HELO [10.237.72.88]) ([10.237.72.88])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2021 23:55:48 -0800
Message-ID: <05baeea4-08ef-4fcd-5004-58b19e3e63f3@linux.intel.com>
Date:   Wed, 15 Dec 2021 09:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/6] i2c: designware-pci: Fix to change data types of
 hcnt and lcnt parameters
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
 <20211213180034.30929-4-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211213180034.30929-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/13/21 20:00, Andy Shevchenko wrote:
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> 
> The data type of hcnt and lcnt in the struct dw_i2c_dev is of type u16.
> It's better to have same data type in struct dw_scl_sda_cfg as well.
> 
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v2: added tag (Jarkko)
> 
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
I proposed this to be first before questionable cleanups since this 
fixes existing confusion (noted by Wolfram not any of us). Same to 5-6/6.

Jarkko
