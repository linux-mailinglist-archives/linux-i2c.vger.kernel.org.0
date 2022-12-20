Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0246526DF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 20:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbiLTTSn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 14:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiLTTSm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 14:18:42 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA181B796;
        Tue, 20 Dec 2022 11:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671563921; x=1703099921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XLtecIj63O+kDbo1NYrvOFaDdZbwFbJUOPsY6/FAEzc=;
  b=j+kmq+GjB9/qz42cZp4TJ4Lz2ALhFAQBtm01NwvUMcbmRMk8d2UKPjCj
   ST9jB2pWmqa8FuppN0S/V7x7z2BUGfQDQThBkHefTK1h48jI61Exnx5ue
   Lip6g1Djv0IL0mDq+Vle7UOGu/vzNvzSzB0JboxOTqo+SQPpXHoq3H4A8
   Y4C7l7PvwpiTM4ZBOzQi7QpgCJvUJ0hFylh6dVuuaWAS1edWBZtPjRRtU
   gu8XbbDaRs5+IlqxPyXxoboQEDMXAaNogamRKrTWRg21aj6re+tyWLIFY
   jjUBQlZDX5iglMtFvEtd5FOjdbKV/kGH9TWhx3zEUdjnkD2DlVQO+ZGKw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="307376770"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="307376770"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 11:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681768471"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="681768471"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 20 Dec 2022 11:18:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7i8J-00D9GA-09;
        Tue, 20 Dec 2022 21:18:35 +0200
Date:   Tue, 20 Dec 2022 21:18:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Hawa, Hanna" <hhhawa@amazon.com>
Cc:     wsa@kernel.org, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Message-ID: <Y6IKit5XMcSLBgpO@smile.fi.intel.com>
References: <20221219193228.35078-1-hhhawa@amazon.com>
 <Y6GUKf5TCumM1Swy@smile.fi.intel.com>
 <4344f575-65f5-2fde-e2d5-3dd5a18d13cb@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4344f575-65f5-2fde-e2d5-3dd5a18d13cb@amazon.com>
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

On Tue, Dec 20, 2022 at 07:07:51PM +0200, Hawa, Hanna wrote:
> On 12/20/2022 12:53 PM, Andy Shevchenko wrote:

...


> > > +static inline struct pinctrl *dev_pinctrl(struct device *dev)
> > > +{
> > > +     return dev->pins && dev->pins->p ? dev->pins->p : NULL;
> > 
> > GCC supports Elvis, you can use it to simplify the above.
> 
> How you suggest to simplify this?

Using Elvis operator, which is ?:.

> I can use 'return dev->pins ? dev->pins->p ?: dev->pins->p : NULL;'

Have you even try to compile this?

> > > +}

-- 
With Best Regards,
Andy Shevchenko


