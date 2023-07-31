Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F77C76A1B8
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 22:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjGaUJf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 16:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjGaUJe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 16:09:34 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663ED1BCE;
        Mon, 31 Jul 2023 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690834169; x=1722370169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuZ/s3KbQrL5FJUAvN0dudzHyrghoYL3rl94jhaDl/g=;
  b=ftHOvTCa8RPwzUspzwci+n0epOo/8hGt7/SAOCY3B1yycdtVZ9zH1ATu
   LtqB0usvz+YwmD45bUW7/XBvKQqOuAirwnwS8Dk1RRo7dHhIxTBvvYuFD
   aweXproy1LamJYF01ifVVppgGmjGaE9ZclLw+xX206WH1xeONGVYGIBeG
   uodfbJrXjpGqIA6YDtn4neJvdlVKp2SZ4gduzpZUwwy0zhKiwld9OBkr+
   oBkBx0aegCbruFn8+t0q8EJ//lu+KBaMptV6iF8y1shp+tdWIrATbd0aH
   eGjHvS8/r4Z3UkD5Bc4a25xEY4IwG4oIote1SSi7G6CCDRpU+CVd8RWzD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="354039273"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="354039273"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 13:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="852167161"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="852167161"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 31 Jul 2023 13:09:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQZCm-004BwP-23;
        Mon, 31 Jul 2023 23:09:24 +0300
Date:   Mon, 31 Jul 2023 23:09:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 4/9] i2c: designware: Propagate firmware node
Message-ID: <ZMgU9Jm4u37D+70Y@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-5-andriy.shevchenko@linux.intel.com>
 <f0e0c31e-ad5e-c3ae-945e-c2af0d68beab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0e0c31e-ad5e-c3ae-945e-c2af0d68beab@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 28, 2023 at 03:25:58PM +0300, Jarkko Nikula wrote:
> On 7/25/23 17:30, Andy Shevchenko wrote:
> > Propagate firmware node by using a specific API call, i.e. device_set_node().

...

> > +	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
> 
> Would this be better to put in the same place where ACPI_COMPANION_SET() is
> removed like below? I'd keep this static inline function in the header file
> as simple as possible. All extra code might invite adding even more.

We come again to the duplication and prone to deviation code, I wouldn't like
to go this way. The idea of this call is to unify and avoid mistakes, like
updating only in ACPI or DT (or any new one if happens in the future) case
and leaving the second one unconsidered.

That said, I would rather drop this patch until i2c core will take this
once for all (may be never in the reasonable future :-).

-- 
With Best Regards,
Andy Shevchenko


