Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE25D67964A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 12:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbjAXLMe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 06:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbjAXLM3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 06:12:29 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7695B9B
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674558748; x=1706094748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qgAXhdzb2Ch0OrOqvHa/kjSZXVgGy1t274JBpDFkCig=;
  b=SrPs3WkhCVBfOq37q3KxCYetSgVVhpZrHaigC1/7ZI6wNZppuhUXjMAB
   bdfMWYZ4MNi3gi0Z6qHRveJ6tBA4oO6r4DyjSpDwY7X3xZyTONHTqQ2eH
   U6P51O1J/VHCc/ZiL+5lyl+swQxfKsvla/JdLYeYJG/nQzBYYSoAgwCKt
   nWMfWAinTmy/pNMm+GJCunfiwgapnPUpZymtZefS5axu8Ghnplx/mSb4X
   wT9dPEeYFs0e6lMpvGBXuQks2VcV1v+ImsZkx8X9RVbGzDk5WMTaHfKL8
   6i9HSFie5XKaf3XVr40wG1H6rPe7mZIDL+elOahSAvYFM4xmqQ6+/hqWN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353543867"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="353543867"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 03:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694298682"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="694298682"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 03:12:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pKHE2-00EJ7t-0i;
        Tue, 24 Jan 2023 13:12:26 +0200
Date:   Tue, 24 Jan 2023 13:12:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: designware: add a new bit check for IC_CON
 control
Message-ID: <Y8+9GUwyl1UO6reY@smile.fi.intel.com>
References: <20230124100650.1327656-1-Shyam-sundar.S-k@amd.com>
 <Y8+ymCM3nQ0/b6sH@smile.fi.intel.com>
 <Y8+y73EH84nSGDO/@smile.fi.intel.com>
 <a0d42cac-b39a-f59c-950f-94bcb660472a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0d42cac-b39a-f59c-950f-94bcb660472a@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 24, 2023 at 04:03:55PM +0530, Shyam Sundar S K wrote:
> On 1/24/2023 3:59 PM, Andy Shevchenko wrote:
> > On Tue, Jan 24, 2023 at 12:27:37PM +0200, Andy Shevchenko wrote:
> >> On Tue, Jan 24, 2023 at 03:36:50PM +0530, Shyam Sundar S K wrote:

...

> >>> +	u32 ic_con;
> > 
> > One more nit-pick:
> > 
> > 	unsigned int ic_con;
> 
> is u32 not typedef of unsigned int?

You should not care about implementation details. You call an API that uses
unsigned int, why not using the correct type from the beginning?

> > to be same as regmap_read() uses.

-- 
With Best Regards,
Andy Shevchenko


