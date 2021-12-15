Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1E8475A97
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 15:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhLOOVT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 09:21:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:35831 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230188AbhLOOVT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 09:21:19 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="300012787"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="300012787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 06:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="545591351"
Received: from mylly.fi.intel.com (HELO [10.237.72.88]) ([10.237.72.88])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2021 06:21:16 -0800
Message-ID: <9949baad-fc59-475c-cb7d-a4da935b8271@linux.intel.com>
Date:   Wed, 15 Dec 2021 16:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/6] i2c: designware-pci: Fix to change data types of
 hcnt and lcnt parameters
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
 <20211213180034.30929-4-andriy.shevchenko@linux.intel.com>
 <05baeea4-08ef-4fcd-5004-58b19e3e63f3@linux.intel.com>
 <Ybny5Cxh60e7d63q@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Ybny5Cxh60e7d63q@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/15/21 15:51, Andy Shevchenko wrote:
> On Wed, Dec 15, 2021 at 09:55:47AM +0200, Jarkko Nikula wrote:
>> On 12/13/21 20:00, Andy Shevchenko wrote:
>>> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>>>
>>> The data type of hcnt and lcnt in the struct dw_i2c_dev is of type u16.
>>> It's better to have same data type in struct dw_scl_sda_cfg as well.
> 
> ...
> 
>> I proposed this to be first before questionable cleanups since this fixes
>> existing confusion (noted by Wolfram not any of us). Same to 5-6/6.
> 
> Okay, I postpone this series. It seems altogether it will require more time
> than I currently have. Consider picking patches on the basis you have in mind
> if you consider them useful. Thanks!
> 
Will do. I really like to get those patches before any cosmetic changes 
that fix existing issues that were confusing all of us (patches 4/6 and 
6/6) and do obvious cleanup (3/6 and 5/6).

Jarkko
