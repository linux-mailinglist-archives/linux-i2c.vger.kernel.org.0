Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0B64CBB64
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 11:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiCCKbv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 05:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbiCCKbv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 05:31:51 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222F1179A25;
        Thu,  3 Mar 2022 02:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303466; x=1677839466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wDq06r9kddhLaN6b+ChI1ivL51pnJ9aOuIAEFgqn6mo=;
  b=lnYSUp0qqmNSA63T6n/xfXtvIr0z3mkGz4B8Vs6jjRx8h12bnge7Dc7D
   3lejfAETJQ4a7XumuwGrahBo9lda1MuYrgITu1pZZiGWBs0+A8MYMbDms
   zPUrt+awcBTLIcScVKhRMWt3JrjZDc3ZqEs0NSzC4+zeQKAohKjpaCmQN
   uAHT95PDl+xOvv3BbdS4bdG5wVPkxwJhph+Q9+MOmjNcAbSd7yHrnyBia
   Wvrl2HPv/fpLAIVTAllNBCtX/ZQhQtA7tzSZdLg2w8XRtQAP3PlmiGCn6
   Og+ruJrDkf2YS6EnxSqKfKfEFOp1wBuxNdQmAoquX2VtO1s5ueEDSKXnZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253370222"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253370222"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:31:04 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="545817308"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:30:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nPiio-00AjxS-JE;
        Thu, 03 Mar 2022 12:30:10 +0200
Date:   Thu, 3 Mar 2022 12:30:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/11] i2c: npcm: Fix client address calculation
Message-ID: <YiCYshb354S9T5ev@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-4-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-4-warp5tw@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 03, 2022 at 04:31:33PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Fix i2c client address by left-shifting 1 bit before
> applying it to the data register.

...

> -	bus->dest_addr = slave_addr;
> +	bus->dest_addr = slave_addr << 1;

1. Why this is not using i2c_8bit_addr_from_msg() helper?
2. This is duplication of what npcm_i2c_master_start_xmit() does.

Taking 2 into account, what is this exactly fixing?
Sounds like a red herring.

-- 
With Best Regards,
Andy Shevchenko


