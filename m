Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61D9670F4A2
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 12:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjEXK7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 06:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjEXK7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 06:59:41 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C784AB7;
        Wed, 24 May 2023 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684925979; x=1716461979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eB9kvRkYr5mGdUVQC9djBQdjGQY2g4NNBVXwNgQMGuk=;
  b=hUWZNbm8KaiT0mZ/ruFuZuZD1s4FGLTPGRf96Agt6ictZcmxo2X1NCnX
   3bnSBBT4SOY1/1JkgxajPi9ZPjeQfSVdBInhMBfr8yvd8bSszDQYI8NJ2
   zKv1zXFKVBf7+BNektQeZMGufj9Nkzr3roEjpfloamHb7S0pS9DLOoPtN
   LZ6T7P1jNBKsI+0Z9MgDtzjx0rqJQKY4Aa2mY7TYtGZKbsFvw4h89pz5c
   YKbCza7CWjkNC30kV6+NftlYhyIKTmXGNzViFbW7EUQKpjPQe/RSBbAJp
   wICl5IdRp2g5QA5hfnnW4o+jmAGT25gFxwg9vQ+XZpNVdCeyYKF4xr2FJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356752886"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356752886"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 03:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="1034490764"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="1034490764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 24 May 2023 03:59:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q1mDQ-000GDz-0W;
        Wed, 24 May 2023 13:59:36 +0300
Date:   Wed, 24 May 2023 13:59:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     David Zheng <david.zheng@intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com
Subject: Re: [PATCH v1] i2c: designware: fix idx_write_cnt in read loop
Message-ID: <ZG3uF1WOv1MhTV3f@smile.fi.intel.com>
References: <ZGzt3dGW0dxa5fqc@davidzhe-DESK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGzt3dGW0dxa5fqc@davidzhe-DESK>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 23, 2023 at 09:46:21AM -0700, David Zheng wrote:
> With IC_INTR_RX_FULL slave interrupt handler reads data in a loop until
> RX FIFO is empty. When testing with the slave-eeprom, each transaction
> has 2 bytes for address/index and 1 byte for value, the address byte
> can be written as data byte due to dropping STOP condition.
> 
> In the test below, the master continuously writes to the slave, first 2
> bytes are index, 3rd byte is value and follow by a STOP condition.
> 
>  i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D1-D1]
>  i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D2-D2]
>  i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D3-D3]
> 
> Upon receiving STOP condition slave eeprom would reset `idx_write_cnt` so
> next 2 bytes can be treated as buffer index for upcoming transaction.
> Supposedly the slave eeprom buffer would be written as
> 
>  EEPROM[0x00D1] = 0xD1
>  EEPROM[0x00D2] = 0xD2
>  EEPROM[0x00D3] = 0xD3
> 
> When CPU load is high the slave irq handler may not read fast enough,
> the interrupt status can be seen as 0x204 with both DW_IC_INTR_STOP_DET
> (0x200) and DW_IC_INTR_RX_FULL (0x4) bits. The slave device may see
> the transactions below.
> 
>  0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>  0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>  0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>  0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1794 : INTR_STAT=0x204
>  0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x1790 : INTR_STAT=0x200
>  0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>  0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>  0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> 
> After `D1` is received, read loop continues to read `00` which is the
> first bype of next index. Since STOP condition is ignored by the loop,
> eeprom buffer index increased to `D2` and `00` is written as value.
> 
> So the slave eeprom buffer becomes
> 
>  EEPROM[0x00D1] = 0xD1
>  EEPROM[0x00D2] = 0x00
>  EEPROM[0x00D3] = 0xD3
> 
> The fix is to use `FIRST_DATA_BYTE` (bit 11) in `IC_DATA_CMD` to split
> the transactions. The first index byte in this case would have bit 11
> set. Check this indication to inject I2C_SLAVE_WRITE_REQUESTED event
> which will reset `idx_write_cnt` in slave eeprom.
> 
> Signed-off-by: David Zheng <david.zheng@intel.com>
> ---

Is it still v1? Otherwise you have wrong Subject (missing version) and missing
changelog here.

-- 
With Best Regards,
Andy Shevchenko


