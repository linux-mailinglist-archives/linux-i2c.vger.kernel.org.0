Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E927376A1AE
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 22:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjGaUGO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 16:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjGaUGN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 16:06:13 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA90B8F;
        Mon, 31 Jul 2023 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690833972; x=1722369972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kFbkl+lrUFpiMT/HJhOwKdDPFwHaxoSrdT+pOjShBgo=;
  b=a6qTTgswVFKUwCj9ZA9/o+oeE3WSQ5T3yFkd95j1hcX7ZoYpr3ikfWX9
   U+xgLifnSvTgBSZ+ZNOrKm7no9zvSzzt8mSjUTEoPAHaPzXKckiX2MiBl
   5bYMrZ3x4M01/00yGR//1zQBZQUVhmyltnvsFEHmxYpgTOAC37pWgmx74
   0mbkZKK6u6mR6veDkcxqbFP8kK4wt+uz7+2QbFRoqQv6JIDU7SsryXUwm
   eqF5GK1mfMrsuAibLsDCQMMYq23gJo/yZIbbzSfcTShMtQnX5B7cyZpup
   /8eQ42Jy4gAfk/dzNMJyneDQlUJ5uUQH9zf/FXhaYD2+QkJiwpOHpJ/9I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435430205"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="435430205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 13:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="758040731"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="758040731"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 31 Jul 2023 13:05:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQZ8b-004307-3A;
        Mon, 31 Jul 2023 23:05:05 +0300
Date:   Mon, 31 Jul 2023 23:05:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 5/9] i2c: designware: Always provide ID tables
Message-ID: <ZMgT8bYGnGwTSAPf@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-6-andriy.shevchenko@linux.intel.com>
 <7be19d99-b197-662c-5157-dfdd9c793e3c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7be19d99-b197-662c-5157-dfdd9c793e3c@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 28, 2023 at 03:33:59PM +0300, Jarkko Nikula wrote:
> On 7/25/23 17:30, Andy Shevchenko wrote:

...

> > +/* Work with hotplug and coldplug */
> > +MODULE_ALIAS("platform:i2c_designware");
> 
> Perhaps this comment can be retired, i.e. dropped.

Then it needs to be done in a separate patch, because in the other file the
comment will be left untouched.


-- 
With Best Regards,
Andy Shevchenko


