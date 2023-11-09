Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE397E7101
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344795AbjKISAQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjKISAP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:00:15 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC403AAA;
        Thu,  9 Nov 2023 10:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699552812; x=1731088812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LMqRwHvlxfT+69m21hUtWTOQqN1NjhHG7xWSmRFOxcI=;
  b=DlmjAxZjAtzW4AEEqNMMRcxIxB5cOLwhdxCp26HzCE6iGXgAUmRjwUSC
   z8mPG0Z7gL5OgZ3gBx5wN2DSLC0C0HvbiwPtT2AyAw7ZaRfcZmDSPAlYm
   jCMov/yN0IXK7I0G2rhq0RjzxOSzolSukwWW/UFLU2vGqd16kg2EsJBs1
   JzmXiWbYlYtm+OIluOmjNaF7qOoTt4TCCI0QV0+t8WJfYqWc0dhJE5Au1
   kv3tufgTBt3YRqzKYKowpZBt/mB4KmQooFz472T38esDMKZ/DvJ5Qi2lE
   MeF6JVUOKmdkfcDZGeWYs22mBe5KQiWQTRiHMxNZyyHzsGDsjv3goZb9V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421134611"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="421134611"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="798385876"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="798385876"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:00:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1r19K2-0000000CeoU-1MW2;
        Thu, 09 Nov 2023 20:00:06 +0200
Date:   Thu, 9 Nov 2023 20:00:05 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZU0eJdwHXEoQ7mj2@smile.fi.intel.com>
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109031927.1990570-1-janb@os.amperecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 09, 2023 at 03:19:27AM +0000, Jan Bottorff wrote:
> When running on a many core ARM64 server, errors were
> happening in the ISR that looked like corrupted memory. These
> corruptions would fix themselves if small delays were inserted
> in the ISR. Errors reported by the driver included "i2c_designware
> APMC0D0F:00: i2c_dw_xfer_msg: invalid target address" and
> "i2c_designware APMC0D0F:00:controller timed out" during
> in-band IPMI SSIF stress tests.
> 
> The problem was determined to be memory writes in the driver were not
> becoming visible to all cores when execution rapidly shifted between
> cores, like when a register write immediately triggers an ISR.
> Processors with weak memory ordering, like ARM64, make no
> guarantees about the order normal memory writes become globally
> visible, unless barrier instructions are used to control ordering.
> 
> To solve this, regmap accessor functions configured by this driver
> were changed to use non-relaxed forms of the low-level register
> access functions, which include a barrier on platforms that require
> it. This assures memory writes before a controller register access are
> visible to all cores. The community concluded defaulting to correct
> operation outweighed defaulting to the small performance gains from
> using relaxed access functions. Being a low speed device added weight to
> this choice of default register access behavior.

...

> v3->v4: add missing changelog

Side note: Usually it's enough to just reply to the patch with the changelog.

...

> -	*val = swab32(readl_relaxed(dev->base + reg));
> +	*val = swab32(readl(dev->base + reg));

> -	writel_relaxed(swab32(val), dev->base + reg);
> +	writel(swab32(val), dev->base + reg);

I'm wondering why ioread32be() / iowrite32be() can't be used here...

Probably it would require to switch entire IO to use ioreadXX() /
iowriteXX() APIs and since we touch all of them (?) may be it makes
sense convert to use them at the same time. Dunno.

-- 
With Best Regards,
Andy Shevchenko


