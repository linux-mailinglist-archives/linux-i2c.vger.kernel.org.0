Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9907565256A
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 18:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiLTRR0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 12:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLTRRZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 12:17:25 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB74ADDD;
        Tue, 20 Dec 2022 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671556644; x=1703092644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xu0kNEDcfd1J1zT07SRIJFWypFJkTEWrkOXrQpKSv30=;
  b=iX+O1lYDK6SapC0yAsx0PKkSgo+cJiV+aNZ7b466U52+1gB1YwnGUrbp
   vwP5RKmTqtLnFH58q6/IXKaT5x+76fXNJLRDEgc712P3VOGtoPV2WdlNZ
   0gm/G7KeSwf0QootFKV/LZKU6XG85kM77/UXTadCoZTVC8gLmTPRr79ke
   LKo52lKRT/wSMtUv1L9cZ20Enr5QPKXg9l+bJLf3doT8Efy/Y44PINzWK
   4KyJXJZ1ILhS+qW2wObogX/BLqheTm6KhQCGaYklMEGANh6ixbF0RN4sN
   lqE12QHWCZzJlbGz0bts0+5n1oBmo1huxhsaFr7zdbZkGizyKcd1V8Wm1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="318362673"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="318362673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 09:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="739847856"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="739847856"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2022 09:13:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7gAp-00D1Ru-24;
        Tue, 20 Dec 2022 19:13:03 +0200
Date:   Tue, 20 Dec 2022 19:13:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
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
Message-ID: <Y6HtH0RWNYc1gT2+@smile.fi.intel.com>
References: <20221220164806.77576-1-hhhawa@amazon.com>
 <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 20, 2022 at 07:11:51PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 20, 2022 at 04:48:06PM +0000, Hanna Hawa wrote:

...

> > -		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
> > +		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) - 8 +
> > +			offset;
> 
> Broken indentation.
> 
> ...
> 
> > -		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
> > +		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf),
> > +					     MICRO) - 3 + offset;
> 
> I would still go with 'MICRO) -' part to be on the previous line despite being
> over 80, this is logical split which increases readability.
> 
> > -	return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
> > +	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) - 1 +
> > +		offset;
> 
> Broken indentation.

That said, can you just follow what I have said in a review of v3?

-- 
With Best Regards,
Andy Shevchenko


