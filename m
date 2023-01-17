Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8957A66E1AB
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 16:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbjAQPI6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 10:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbjAQPI5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 10:08:57 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5803D0AF
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673968137; x=1705504137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5IPO6lTNa3LxPrn56MYIKAvi0cFwnJ1vFqh/6brjNf8=;
  b=i1+8S+O5C6bEn9l8BB6Ob4vGnVqAcZtgFyl2fPY5SQN8EZ/7np+hV7bB
   0pBvXq7gAYH9kvtWTT5faVXxv8cKvLMgSrS5ycOQDvOUZXd1+rZJqpu4j
   0hLN0PqWQKTgPqMxYUugXd5TSIJZ3dYO864KCxheovxV5JrgKjZKnaN74
   E4Hd3A6f00ExYxjBIAjbbO60QRLWF/u4Gn88n1Wj+uUrK9uNsRpTD31vi
   0tw+ZV1rfb3kX3PuEgEeshQo5os5wyrDYdkzhqisyA1RkNrYR3w+1GO4U
   gWNGQXIkJhbdBM86rvjQFzx0hT2UM6cjwrZAA+OLjDTSRulfCmbjhg2Xl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304401802"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="304401802"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 07:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="691617223"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="691617223"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 17 Jan 2023 07:08:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pHnZS-00Ad1c-1r;
        Tue, 17 Jan 2023 17:08:18 +0200
Date:   Tue, 17 Jan 2023 17:08:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: add a new bit check for IC_CON
 control
Message-ID: <Y8a54u1ipywtTIlH@smile.fi.intel.com>
References: <20230117122801.1605176-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117122801.1605176-1-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 17, 2023 at 05:58:01PM +0530, Shyam Sundar S K wrote:
> On some AMD platforms, based on the new designware datasheet,
> BIOS sets the BIT(11) within the IC_CON register to advertise
> the "bus clear feature capability".
> 
> AMD/Designware datasheet says:
> 
> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
> Description: In Master mode:
> - 1'b1: Bus Clear Feature is enabled.
> - 1'b0: Bus Clear Feature is Disabled.
> In Slave mode, this register bit is not applicable.
> 
> On AMD platform designs:
> 1. BIOS programs the BUS_CLEAR_FEATURE_CTRL and enables the detection
> of SCL/SDA stuck low.
> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
> recovery procedure.
> 
> Currently, the way in which the "master_cfg" is built in the driver, it
> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
> cannot initiate the bus recovery if the stuck low is detected.
> 
> Hence add a check in i2c_dw_configure_master() that if the BIOS
> advertises the bus clear feature, let driver not ignore it and
> adapt accordingly.

...

> +	ic_con = ioread32(dev->base + DW_IC_CON);

Any particular reason why regmap_read() can't be used?

-- 
With Best Regards,
Andy Shevchenko


