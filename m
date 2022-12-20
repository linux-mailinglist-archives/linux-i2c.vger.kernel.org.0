Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3094E6526E3
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 20:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbiLTTYD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 14:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiLTTYB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 14:24:01 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB30E12744;
        Tue, 20 Dec 2022 11:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671564240; x=1703100240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TNrcl6HyQDoGaxe0Au1HRzRI9AdANs+U7cJkYFrUXDs=;
  b=YgdpOu6mTkygKZP5ERGdwSUrBltlNLrh9uTcXXlEhPCbF/kNym09Xj6z
   xMYM7q7rZjqm58j8kTON85dDPsNLStbHh8dBBd217ibnft6pu9fUOXMGB
   qJh85+NnwCB093mRXSCHM0ER+KD66NSKmHmm1HVQk1CTJmWQYGm+bJsYT
   pfCA1314Xu0+KPuO0cPfn9QwYeh/OYz+NbpUSmf2JZbXOPqNkSfeWWeZ3
   izR+EXeBa6Uw/6gf28DBp6iz+yim1ExY08rgZa6x6OYstx3kfcFbN2kQI
   3yqTfib2Qe94+2zKZPpxmKcZIwgoHcey7evnXSJYOdioyai5/pBc8Nf8B
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="307378264"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="307378264"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 11:24:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="644572944"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="644572944"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 20 Dec 2022 11:23:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7iDR-00D9Pb-2e;
        Tue, 20 Dec 2022 21:23:53 +0200
Date:   Tue, 20 Dec 2022 21:23:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Hawa, Hanna" <hhhawa@amazon.com>
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linus.walleij@linaro.org, ben-linux@fluff.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com,
        Lareine Khawaly <lareine@amazon.com>
Subject: Re: [PATCH v4 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Message-ID: <Y6ILydYEWzJdzwBJ@smile.fi.intel.com>
References: <20221220164806.77576-1-hhhawa@amazon.com>
 <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
 <cc16a489-f711-0c54-8576-ef7974b3cb79@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc16a489-f711-0c54-8576-ef7974b3cb79@amazon.com>
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

On Tue, Dec 20, 2022 at 07:43:06PM +0200, Hawa, Hanna wrote:
> On 12/20/2022 7:11 PM, Andy Shevchenko wrote:
> > On Tue, Dec 20, 2022 at 04:48:06PM +0000, Hanna Hawa wrote:

...

> > > -             return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
> > > +             return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) - 8 +
> > > +                     offset;
> > 
> > Broken indentation.

...

> > > -             return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
> > > +             return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf),
> > > +                                          MICRO) - 3 + offset;
> > 
> > I would still go with 'MICRO) -' part to be on the previous line despite being
> > over 80, this is logical split which increases readability.
> 
> Okay.. will move the 'MICRO) -' one line before
> > 
> > > -     return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
> > > +     return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) - 1 +
> > > +             offset;
> > 
> > Broken indentation.
> 
> Why it's broken indentation? I'm asking to know for the next time. The word
> 'offset' is not part of DIV_ROUND_CLOSEST_ULL parentheses. In wrong
> indentation the checkpatch shout about it, but it didn't happen with the
> above.

The continuation line of the expression should go under the opening
parentheses, but you are right, the part outside DIV_ should be under
D and not as you suggested below.

But the problem is that you made illogical split while I suggested to leave
DIV_...() on one line and the rest on the other.

> Does the below the correct indentation?

No.

		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) -
		       8 + offset;

		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) -
		       3 + offset;

	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) -
	       1 + offset;

-- 
With Best Regards,
Andy Shevchenko


