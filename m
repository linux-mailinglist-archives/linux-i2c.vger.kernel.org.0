Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5574E651F4F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 11:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbiLTKzC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 05:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbiLTKzB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 05:55:01 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53561186FE;
        Tue, 20 Dec 2022 02:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671533700; x=1703069700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g7pc3I3NQ4mRKhNaYT20es/wLv6RuJ2eCZI41VwUgGg=;
  b=n2fRW87DRG02oE1TWV9izPox1sYUEnKlQ4zwcGTRH4RlFA6Lo0GMBsk2
   58MNBQpEuI4PrQFk85FKczZi52jN4yDNVRv4ebckawxClRP201O4Yyt5m
   fgT2a0hwtM0cYPuK9FHjp6D46v9R8cU69PFVmUZobC/fJRDKsWlQdxx7R
   Pn5I6TCrTNvlkpotJw7BZFqPo6bjzukWBjIIHz3R4L1uNU88wqSvVCXWV
   ka8p2pkL3SbysYz2IQfF2dTUJfLmVHgAi4yVmT372kQopSMkWQOZu2Lz8
   frW+SSIVquEJZPXnqizOvDHFNkRkFck7fv5X/lUvUDOjdycvenLuB6Y2a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299929245"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="299929245"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 02:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="650952828"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="650952828"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2022 02:54:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7aGn-00CpcS-0N;
        Tue, 20 Dec 2022 12:54:49 +0200
Date:   Tue, 20 Dec 2022 12:54:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Hawa, Hanna" <hhhawa@amazon.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information
 from device pinctrl
Message-ID: <Y6GUeLYqoitw/oOX@smile.fi.intel.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
 <Y5r2pZhe17dVBMme@smile.fi.intel.com>
 <1408bbef-10e3-f76b-b66d-b95e84748e18@amazon.com>
 <Y5yE0SsfGrwaB5zA@smile.fi.intel.com>
 <d60e9cb7-a162-0b49-cd21-33c622ae0e58@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d60e9cb7-a162-0b49-cd21-33c622ae0e58@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 09:35:37PM +0200, Hawa, Hanna wrote:
> On 12/16/2022 4:46 PM, Andy Shevchenko wrote:
> > Can be simplified with help of Elvis:
> > 
> >          p = bri->pinctrl ?: dev_pinctrl(dev->parent);
> 
> Can't use this, as need to set the bri->pinctrl to dev_pinctrl() in case
> it's not set by the driver.

I guess you can. I will answer to the v3.

-- 
With Best Regards,
Andy Shevchenko


