Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B59D6754BB
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 13:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjATMj2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 07:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjATMj1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 07:39:27 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872407E6A6
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 04:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674218340; x=1705754340;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MDdLi3Y3JKfCq5MiyBmvXN88MLQyindjtDXnotcM8w4=;
  b=SAs4FI15y/7pzPapTsp9Yl9/Hl4kdA5upk3rXiYBrdJSKyq0pVT/3TFq
   GJiaaoySZ7FMM6MH0n12Gcvx8n64ZC232xsXykNvFlmHzEvA6CIJsdP82
   3zIlbN+dxIBBPCWXs4NWcoxBjoRqcJCX7V0tyyjGhbVrcd4vACZrPgAXW
   cfvWldDC87cuUNSl3LUDXlp4wXjULgVXdat5cmCqCFCABRaLk1ZG3NH9A
   GVuZCMTe4GZiZqOaDg/PktJydISuLGz7zeBD84Y0CAodKaLeY4gAKLeK3
   ehUXMfIYBvI7/nkGeqewTElNpBx0Q4fBOD2ZixkZPOeW/kswIe7SVCT57
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="313455479"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="313455479"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784496324"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="784496324"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga004.jf.intel.com with ESMTP; 20 Jan 2023 04:35:56 -0800
Message-ID: <fbd2cd7e-ebb9-1e2b-da93-6904e1ade84f@linux.intel.com>
Date:   Fri, 20 Jan 2023 14:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v2] i2c: designware: add a new bit check for IC_CON
 control
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230117122801.1605176-1-Shyam-sundar.S-k@amd.com>
 <Y8a54u1ipywtTIlH@smile.fi.intel.com>
 <dbdc2d2a-8fcd-8667-3088-ca730212c162@amd.com>
 <Y8gDcaPT+WcsGRRA@smile.fi.intel.com>
 <ad005c44-4a69-1cf4-0e0e-e30e42c76d5c@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ad005c44-4a69-1cf4-0e0e-e30e42c76d5c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/19/23 05:44, Shyam Sundar S K wrote:
> 
> 
> On 1/18/2023 8:04 PM, Andy Shevchenko wrote:
>> On Wed, Jan 18, 2023 at 07:27:06PM +0530, Shyam Sundar S K wrote:
>>> On 1/17/2023 8:38 PM, Andy Shevchenko wrote:
>>>> On Tue, Jan 17, 2023 at 05:58:01PM +0530, Shyam Sundar S K wrote:
>>> In order to use regmap_read() instead of ioread32() in this case, we
>>> have to defer calling i2c_dw_configure()
>>
Comment to change in your previous mail: Moving i2c_dw_configure() after 
i2c_dw_probe() will cause regression to high speed mode since 
DW_IC_CON_SPEED_HIGH is not set when i2c_dw_set_timings_master() is called.

>> I think we need to try to be consistent with IO accessors across the driver
>> which means to try hard to have regmap being initialised beforehand or other
>> functions being moved accordingly. However, it seems a bit non-trivial
>> ordering case and I leave this to you, I²C maintainers and this driver
>> maintainer to decide how to proceed.
>>
Yeah, we don't want to potentially cause a regression on those machines 
that use swapped or word accessors by reading and writing a wrong bit in 
the DW_IC_CON.

> 
> Jarkko, How would you like me to proceed? Would you be OK to pull this
> change without regmap_read() or do you like me to submit a patch for
> reordering the _configure_* call ?
> 
I think safe place to do this is between i2c_dw_init_regmap() and 
dev->init() calls in i2c_dw_probe_master(). Then regmap is initialized 
and the DW_IC_CON is not yet written.

Not sure would reading DW_IC_CON require 
i2c_dw_acquire_lock()/i2c_dw_release_lock() but I would play safe.
