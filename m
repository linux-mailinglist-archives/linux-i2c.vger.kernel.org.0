Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF98E64CDD4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 17:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238875AbiLNQTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 11:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238665AbiLNQTY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 11:19:24 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D504275C7;
        Wed, 14 Dec 2022 08:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671034763; x=1702570763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bHQmTIESlqQ4cB0aHihs1PbSoibkX1YdNqvQO1bLf2c=;
  b=CXcLFm6GGOAGvvp73IRYY8hWARxJ1wZGga1CHIufJOIkNnisbMIW6qHj
   oYowpkzVHzrQU3K/plhLtaaX3Jety295XNhv0IR6/Tw00A/crxAmO0Cp4
   BuJyxuKNUhnSQWJb/hyU8/2dovKq0nu8mK5m5LTW/xp6T/sgD8NFpzaWt
   pz3V43FeYzYztvxK7tx6fPi/Jlv8mC01TE1XcEP9EEYOu1E0eUCzP9naE
   X60M3vPD3CJlFDwfXGFWqdOCQsQhGxQLAwaPq7XxnPo9r4IXKun50V5Ne
   KV9QeYpccFuGVyaglCVBJUQ5yHTejopm3p0eT+4vqc39/YGSA6sD+aFO7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="404715664"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="404715664"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 08:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="755953555"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="755953555"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2022 08:19:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p5UTV-009taJ-0L;
        Wed, 14 Dec 2022 18:19:17 +0200
Date:   Wed, 14 Dec 2022 18:19:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com,
        lareine@amazon.com
Subject: Re: [PATCH v2 1/1] i2c: designware: use u64 for clock freq to avoid
 u32 multiplication overflow
Message-ID: <Y5n3hDsbbcnHaDHt@smile.fi.intel.com>
References: <20221214154117.65714-1-hhhawa@amazon.com>
 <Y5n13HLzvMIy3RVh@smile.fi.intel.com>
 <Y5n3PisM+snF8cTJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5n3PisM+snF8cTJ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 06:18:07PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 14, 2022 at 06:12:12PM +0200, Andy Shevchenko wrote:
> > On Wed, Dec 14, 2022 at 03:41:17PM +0000, Hanna Hawa wrote:
> > > From: Lareine Khawaly <lareine@amazon.com>
> > > 
> > > In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
> > > by depending on the values of the given parameters including the ic_clk.
> > > For example in our use case where ic_clk is larger than one million,
> > > multiplication of ic_clk * 4700 will result in 32 bit overflow.
> > > 
> > > Make the ic_clk to be u64 parameter to avoid the overflow.
> > 
> > Below my comment, after addressing it,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Sorry, was too quick. I have to withdraw my tag since this patch obviously
> breaks a compilation for Intel Quark chip.

ld: drivers/i2c/busses/i2c-designware-common.o: in function `i2c_dw_scl_hcnt':
i2c-designware-common.c:(.text+0x5fe): undefined reference to `__udivdi3'
ld: i2c-designware-common.c:(.text+0x634): undefined reference to `__udivdi3'
ld: drivers/i2c/busses/i2c-designware-common.o: in function `i2c_dw_scl_lcnt':
i2c-designware-common.c:(.text+0x679): undefined reference to `__udivdi3'

> Please, test it carefully and submit new version when it will be ready.

-- 
With Best Regards,
Andy Shevchenko


