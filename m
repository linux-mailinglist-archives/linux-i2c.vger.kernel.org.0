Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC4B653477
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Dec 2022 17:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiLUQ7R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Dec 2022 11:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiLUQ7Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Dec 2022 11:59:16 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D388DC4;
        Wed, 21 Dec 2022 08:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671641955; x=1703177955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eTN3PHrJBTYhPOARK7NLc74m25MU1BaV6Qqv4Okc8CE=;
  b=H41SSoPrhRWLdS7kuZJzP9gdv0yMroLZps62f4ECFHttLXsk9IJGNlN4
   Ut/RhWE5PdK0qjMCM181jvdkxGtzaF1k3LvCqXJr+1TgCA61VNEgh3OlQ
   VhDcSp2e8/yX0acUwpFYjZ58T5dqsjjpzsvukAuPRa0lojJzw0jpqUPui
   68J0lxE+6N3fNcLahMkTrvPn30GgIEjAcHM8aCRypCM7ukWYM65kyoqBu
   itIgJpyzhodaFpmBH6WQQ2bEy/QfCYtu+RJDqXaiv2jHMDU4/HcrQe3XK
   LY9oDVM0Xhyr3xIuUrRSZargSW6UGfE8hGdAz4Z7XuDFtsL+f/1Ifp5Zs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="303350770"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; 
   d="scan'208";a="303350770"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 08:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793764103"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; 
   d="scan'208";a="793764103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 08:59:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p82Qr-00Daqi-0k;
        Wed, 21 Dec 2022 18:59:05 +0200
Date:   Wed, 21 Dec 2022 18:59:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Hawa, Hanna" <hhhawa@amazon.com>
Cc:     wsa@kernel.org, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Message-ID: <Y6M7WEMwSSndugE3@smile.fi.intel.com>
References: <20221219193228.35078-1-hhhawa@amazon.com>
 <Y6GUKf5TCumM1Swy@smile.fi.intel.com>
 <4344f575-65f5-2fde-e2d5-3dd5a18d13cb@amazon.com>
 <Y6IKit5XMcSLBgpO@smile.fi.intel.com>
 <a82ba757-3b9c-d54b-76bf-ceef84239295@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a82ba757-3b9c-d54b-76bf-ceef84239295@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 20, 2022 at 09:32:11PM +0200, Hawa, Hanna wrote:
> On 12/20/2022 9:18 PM, Andy Shevchenko wrote:
> > > How you suggest to simplify this?
> > Using Elvis operator, which is ?:.
> 
> Are you refer to use 'return dev->pins && dev->pins->p ?: NULL;' ?
> Can't use Elvis operator in this way, because it will return the result of
> 'dev->pins && dev->pins->p' and not the value of 'dev->pins->p'

I see now. Then we need to check pins separately, something like

	if (!dev->pins)
		return NULL;

	return dev->pins->p;

Sorry that I haven't noticed that before.

> > > I can use 'return dev->pins ? dev->pins->p ?: dev->pins->p : NULL;'
> > Have you even try to compile this?
> Yup, the code compiled, but i think the first suggestion is more readable.

-- 
With Best Regards,
Andy Shevchenko


