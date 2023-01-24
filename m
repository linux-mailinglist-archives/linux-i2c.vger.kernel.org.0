Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503916798DB
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 14:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbjAXNCu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 08:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbjAXNCs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 08:02:48 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A2E7DAE
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 05:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674565367; x=1706101367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/uTpm/OkUDfvq247JLo9eTUq9QvMLpXKnQ6arYeX4U=;
  b=kaYMbikGfD+h+j4T1jFciFq1e9dUvXol53n9piDDLrMiA3faSISbCtj9
   F7Gd85gT3/euSeS67dvIKDfUNsAjSwFMHrkVIr/GuGi2yLGB42rjIM3Sh
   621lj/U+SkMZCuo3l9tzTnQgEiTSlpKtXCW6+UOrtTl6A8ipjTkL1pKvy
   8Yxy7xUwZ39IuBSPH6/TtDW1p6OebhXtxt1rDdqk3lhe9ypwVU+54JIE+
   jG156gjXsBNdACBOTZ/U7NGtyQCbYUg0FR5B8dRikwfyEngH57qgmfeYS
   Fg4fz3V/GJxC5pFSuesYe0QYPtdhDDgds3VfB9fyE+xauhb0V9iV1z4lV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412519539"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="412519539"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 05:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655414151"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="655414151"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 05:02:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pKIwj-00ELgp-2j;
        Tue, 24 Jan 2023 15:02:41 +0200
Date:   Tue, 24 Jan 2023 15:02:41 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: designware: Change from u32 to unsigned int for
 regmap_read() calls
Message-ID: <Y8/W8ebLVoN0WHQq@smile.fi.intel.com>
References: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
 <e32d5647-530c-80d0-e7e5-a92e5f5a82dd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e32d5647-530c-80d0-e7e5-a92e5f5a82dd@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 24, 2023 at 02:54:52PM +0200, Jarkko Nikula wrote:
> On 1/24/23 13:47, Shyam Sundar S K wrote:
> > regmap_read() API signature expects the caller to send "unsigned int"
> > type to return back the read value, but there are some occurrences of 'u32'
> > across i2c-designware-* files.
> > 
> > Change them to match the regmap_read() signature.

...

> Hmm.. I'm not sure about these. We know registers are 32-bit and change to
> unsigned int is a step being more ambiguous. I'm wearing my old embedded
> developer hat who likes to see explicit types when dealing with HW.
> 
> Andy: what was your rationale to propose changing u32 to unsigned int in
> another i2c-designware patch? Has gcc started complaining if regmap_read()
> is used with u32 type?

To be the same type as regmap API is expecting.

What you are talking about makes sense for the direct IO accessor calls.
Actually something like this had to be done when driver was converted to
regmap APIs.

Here we might have 16-bit registers, they are fine when variable is u32,
but goes over boundaries if we declare it as u16. So unsigned int makes
more sense to me.

OTOH I agree that this change is subjective since there is no functional
or other changes as long as we have unsigned int == u32.

So, up to you, guys. But I'm fine with the change.

-- 
With Best Regards,
Andy Shevchenko


