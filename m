Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4300F67952B
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 11:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbjAXK3N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 05:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233390AbjAXK3M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 05:29:12 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB1E3F2BE
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 02:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674556147; x=1706092147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fFou4w6AAj3ivw0f5XYBgaJFSUYm1RHeVNdkyL5zQmk=;
  b=dom3uMLzJH0AITZ2/KtJ+HRnuLGiPgEDFZuMW1Y42pz5neQPbKVfimoP
   j0bXkSk8TZAcjEnqyaZxArdsb22k78sf9VNIx1eKS58OikMMTKiQACtS7
   vql2cqMc0dOv/sX/opKz566H4EVLKIcwaK8ileC9iCSeC+96M3IPq+Cv7
   7jFjMnZPY1PJZuib1xcF+FMtzc2FmCAUnhy4YLeQTjofMMLBKshqSVqkK
   ZRUz+7F7Es3UsFG5O12AfRg5Uz0rvJkb5abyARbaS8QkJ5Ekl48DG33Vj
   0yXQsUqhu/8dDZSBxL7ncPQ2ad768LxHHnOvsnG7VARLWv1ukEMLl63Hi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314166407"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="314166407"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:29:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655369846"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="655369846"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 02:29:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pKGY4-00EI3K-0Z;
        Tue, 24 Jan 2023 12:29:04 +0200
Date:   Tue, 24 Jan 2023 12:29:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: designware: add a new bit check for IC_CON
 control
Message-ID: <Y8+y73EH84nSGDO/@smile.fi.intel.com>
References: <20230124100650.1327656-1-Shyam-sundar.S-k@amd.com>
 <Y8+ymCM3nQ0/b6sH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8+ymCM3nQ0/b6sH@smile.fi.intel.com>
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

On Tue, Jan 24, 2023 at 12:27:37PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 24, 2023 at 03:36:50PM +0530, Shyam Sundar S K wrote:

...

> > +	u32 ic_con;


One more nit-pick:

	unsigned int ic_con;

to be same as regmap_read() uses.

-- 
With Best Regards,
Andy Shevchenko


