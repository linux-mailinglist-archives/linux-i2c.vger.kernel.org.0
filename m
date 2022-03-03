Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C5D4CBB88
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 11:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiCCKil (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 05:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiCCKij (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 05:38:39 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B475B3F5;
        Thu,  3 Mar 2022 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303873; x=1677839873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hLseLd0tY6z76yWC4tPRUyQCqqYU1QPw+fPC2+urnM4=;
  b=etbtKiTFxbsxYumrYw9C4t/42YTFkv9+JIg25wKjPoJ/TxAExacc+ztS
   HWVwaicHey3RrFQppeWaAF2Ik3MHURqlxhJAnNlpURtqjtaqQKyj0W1yh
   BxKHhskCwXaRS3YP7LAUGeA+5PZhp3GoISVfg2hCyr9wxCZpSe7CalU32
   rIUP45I6+bLnuBXRBStnuhAWg11PjdPD5ImsuMVXZrPPC0Z+g3cvYoU61
   EVQ8hoSLZP4IJcJOZIethWFH8Xt7wQz5dowar8HGskbMNzlYEfoXrPlZj
   ncwi/MBp8D9uCOf2mfUWak9evDymepbhd4/Z9BRgDgiT0wqaWmk/qM3x+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="241059688"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="241059688"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:37:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576445523"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:37:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nPipO-00Ak4g-5d;
        Thu, 03 Mar 2022 12:36:58 +0200
Date:   Thu, 3 Mar 2022 12:36:57 +0200
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
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
Message-ID: <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-10-warp5tw@gmail.com>
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

On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> In order to better handle spurious interrupts:
> 1. Disable incoming interrupts in master only mode.
> 2. Clear end of busy (EOB) after every interrupt.
> 3. Return correct status during interrupt.

This is bad commit message, it doesn't explain "why" you are doing these.

...

> +	/*
> +	 * if irq is not one of the above, make sure EOB is disabled and all
> +	 * status bits are cleared.

This does not explain why you hide the spurious interrupt.

> +	 */
> +	if (ret == IRQ_NONE) {
> +		npcm_i2c_eob_int(bus, false);
> +		npcm_i2c_clear_master_status(bus);
> +	}
> +
> +	return IRQ_HANDLED;

-- 
With Best Regards,
Andy Shevchenko


