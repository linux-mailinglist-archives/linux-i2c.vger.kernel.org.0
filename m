Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DB74CBB7D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 11:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiCCKfm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 05:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbiCCKfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 05:35:40 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAF3340D2;
        Thu,  3 Mar 2022 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303694; x=1677839694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U3CkbipzqRbVQQYh0KNk3tlacM3JmBcSMhxa/ULnS34=;
  b=cdAxkBGfkumrfX2yaZdh0j+J0bSjBzm/GktY0+UKwQaz13zQB2U3hq6z
   1FHzsq7ln9bKrnwoJUwT3N7C3gWLaIdG+M7ak43vf5yZjN4TZejNO8b66
   +bd7B7YE0JFRi6815LH7ca/tsHGHbtDtuLud3Z0dc6ujHURFr5S3M6cjK
   5zpy3EApPCCMbCn7r4xJy+cPClvuSUgPUCecfyT0nOawCb1kLRHIZWxaH
   AvXFDb5u3mlmEwz/MATEvQUkciRpRzFHjyBwMCA6paG4BNLRsxyBf8zGW
   dNtclbTaQzpHt/UU6qILe8dtpUXxnKbfj3VrLeU5Ssf86i7yvX+UmCvjC
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237150278"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="237150278"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:34:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="508542490"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:34:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nPimV-00Ak1G-2F;
        Thu, 03 Mar 2022 12:33:59 +0200
Date:   Thu, 3 Mar 2022 12:33:58 +0200
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
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
Message-ID: <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-9-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-9-warp5tw@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
> the register is only 8-bit wide.

> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")

No, this is bad commit message, since you have bitwise masks and there is
nothing to fix from functional point of view. So, why is this a fix?

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

This is wrong SoB chain.

...

> -	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> +	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));

...

> -	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> +	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));

-- 
With Best Regards,
Andy Shevchenko


