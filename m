Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7979A64ED1D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 15:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiLPOqt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 09:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiLPOqs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 09:46:48 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FBD5D6AB;
        Fri, 16 Dec 2022 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671202008; x=1702738008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lLgU8iAuD97bVOvHLDwFY8Y2D9mQMfGe1vN1MfsUUjk=;
  b=CCtex0BP3MTzXJl8XyMwsd62Ka1BVKwvEN1GHNC0yBCkL6Zgnckg9avi
   UJgJPicFSaacVtl/273xSoJYwWPqVh5VC83Rn4obLXH1lsvXeS3TfqJuF
   PUsqo/oWDdstyJvWuNNzQhpImRCe6Y4YR6Z9jIa7y/+B1BmFfrfG1YWc1
   V7hO0hpxAQ6i/RhlWTwwYQk4yUxiyEE1ddx2CvhH1kStaN28NN/o31vYk
   ju6qiJUtodqdIpyQWSAwXAi5/uqr5YmmRDHVFXUImv2UrpvJY5SAQ6iLr
   RgrL22QLXn7cWdlrPRxfEk9h5bXCB1rSk0YWXfKwsQOeW8r38zYul8p5J
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="298649829"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="298649829"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 06:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="792096757"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="792096757"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2022 06:46:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p6Bz0-00Atfy-0W;
        Fri, 16 Dec 2022 16:46:42 +0200
Date:   Fri, 16 Dec 2022 16:46:41 +0200
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
Message-ID: <Y5yE0SsfGrwaB5zA@smile.fi.intel.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
 <Y5r2pZhe17dVBMme@smile.fi.intel.com>
 <1408bbef-10e3-f76b-b66d-b95e84748e18@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408bbef-10e3-f76b-b66d-b95e84748e18@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 16, 2022 at 03:50:19PM +0200, Hawa, Hanna wrote:
> On 12/15/2022 12:27 PM, Andy Shevchenko wrote:
> > OK, but why that function doesn't use the dev->pins->p if it's defined?
> > (As a fallback when rinfo->pinctrl is NULL. >
> 
> The solution will look like the below diff (get_device_pinctrl() is new
> function that i've added that return the dev->pins->p)

Naming is not aligned with a namespace.

I would rather name it dev_pinctrl() and locate it in pinctrl/devinfo.h.

...

> -       struct pinctrl *p = bri->pinctrl;
> +       struct pinctrl *p;
> +
> +       if (!bri->pinctrl)
> +               bri->pinctrl = get_device_pinctrl(dev->parent);
> +       p = bri->pinctrl;

Can be simplified with help of Elvis:

	p = bri->pinctrl ?: dev_pinctrl(dev->parent);

> > Wolfram?
> > 
> > Hanna, it seems you missed I²C maintainer to Cc...
> 
> I based my CC/TO on get_maintainer.pl script. Will make sure that Wolfram on
> CC next time.

All the same about Linus W., who is pin control subsystem maintainer, and be
sure the respective mailing lists are also included.

-- 
With Best Regards,
Andy Shevchenko


