Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911D84A828B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 11:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237986AbiBCKnO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 05:43:14 -0500
Received: from mga18.intel.com ([134.134.136.126]:41492 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231520AbiBCKnN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Feb 2022 05:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643884993; x=1675420993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hPo/o/I9Ar9X8k9+YqwmnvgSgCEWWLbkEa3FdWqIweo=;
  b=XOJ1xTjlpRjsi2jpXioqGK367LBS+eFwAJjsB7P5BnXfjaTcrXdec4+U
   FJZ1OhYWjauYR1OMR4JOLDilzHA1iZ9yPAdL8EQPBe2OHiQhbZBIyGSsG
   IgNYRvFQ3XY0XO82ALtkXTpsAPaA3ECsM/kMV6pfhfVPYPpAKFXNhK8uW
   GxXGlUJRFwx+cLxxxBZkvBeibNFzhwSAp1eeHNDWb8YlSub+hI7RP6kuN
   iG+32ELpWmHoeW2P/obPnrWCp/kzjA5yeb80KraCK3YPdUUaFinUmp9Xn
   K3vsufnNDUmTUUjd5IDpX65fsI8suFz6K0x+Oov9BrE+zn/RisUa3T48K
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="231688381"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; 
   d="scan'208";a="231688381"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 02:42:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; 
   d="scan'208";a="498096519"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 02:42:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nFZYo-000NWG-14;
        Thu, 03 Feb 2022 12:41:54 +0200
Date:   Thu, 3 Feb 2022 12:41:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YfuxcTFnWQ4MLxvp@smile.fi.intel.com>
References: <20220120001621.705352-2-jsd@semihalf.com>
 <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com>
 <724bbaef-8ee5-0904-d871-750643b4ff89@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <724bbaef-8ee5-0904-d871-750643b4ff89@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 02, 2022 at 04:49:40PM -0600, Limonciello, Mario wrote:
> On 2/2/2022 08:43, Jan Dabros wrote:

...

> > +	{ "AMDI0019", APD_ADDR(wt_i2c_desc) },
> 
> Did you already check with anyone in AMD about reserving this ID?

Oh, it's a very good point! I was under impression that Jan operates on
allocated IDs...

> Considering this design is specific to arbitration used for Chromebooks I
> wonder if it is better to be GOOG ID?
> 
> I can see it both ways, but if you didn't already talk to anyone and the
> consensus is for it to be AMDI****, I will ask around internally about
> reserving it / making sure there are no future or existing conflicts.

-- 
With Best Regards,
Andy Shevchenko


