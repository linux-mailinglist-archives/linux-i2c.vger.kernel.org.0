Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88953462DE5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 08:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbhK3HzI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 02:55:08 -0500
Received: from mga04.intel.com ([192.55.52.120]:56009 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239218AbhK3HzE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Nov 2021 02:55:04 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="234888957"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="234888957"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 23:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="609040574"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2021 23:51:43 -0800
Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
To:     Wolfram Sang <wsa@kernel.org>, lakshmi.sowjanya.d@intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        bala.senthil@intel.com, pandith.n@intel.com
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <YaUGV3lEmW9qtP+3@kunai>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <042d2c9f-4333-44b1-09c0-b0953a51c176@linux.intel.com>
Date:   Tue, 30 Nov 2021 09:51:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaUGV3lEmW9qtP+3@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/29/21 6:56 PM, Wolfram Sang wrote:
> On Tue, Nov 09, 2021 at 04:05:51PM +0530, lakshmi.sowjanya.d@intel.com wrote:
>> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>>
>> Add support to configure HCNT, LCNT values for Fast Mode Plus and High
>> Speed Mode.
>>
>> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> 
> Applied to for-next, thanks!
> 
>> +	u32 fp_lcnt;
>> +	u32 hs_lcnt;
>>   	u32 sda_hold;
> 
> Short question unrelated to this patch. Why are all these u32...
> 
>>   		dev->ss_hcnt = cfg->ss_hcnt;
>>   		dev->fs_hcnt = cfg->fs_hcnt;
> 
> ... and the ones in dev are u16? Wouldn't it be easier if they all had
> the same type?
> 
True, only sda_hold(_time) is u32 and other timing parameters are u16.

Lakshmi: Would you like to send a patch fixing this and get more 
contributions to the driver :-)

Originally this discrepancy was introduced 2014 by the commit 
8efd1e9ee3bd ("i2c: designware-pci: set ideal HCNT, LCNT and SDA hold 
time value").

Jarkko
