Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD1078404F
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 14:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbjHVMHE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 08:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234883AbjHVMHE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 08:07:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D79B185;
        Tue, 22 Aug 2023 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692706021; x=1724242021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZfZXDD9camcZP605udnd7l1XfBjUoIwZIa4tOUjKwUU=;
  b=RStfUyqtqx49zh/NEv9ZErimoarETD02dsFUQl7yyKFlUotIqHg+Ono8
   9eo+8IVkJdgmaPXd5wOpSGmzYREoxOU/SabieeRIAmFP2BdlQ/c/bWj75
   CCbGEwnSYJ+z0WTeLhtWAheiNMla/VBJDZwY5lbujn8MUrTPeUIaTdn48
   VY08B1yP/o6QCrBwVmELsDbdUL892vMohX742PDjOb7uRWwOZq3QHe/kd
   2DlQpE4iz+gWMv0GjP5QFIObD8K1+nGpEhvwNQZcp6qEgmmTSRe5EC0E/
   NC0Z4TJ2BCiwX+3mN8zw0yJc7S57Tr+ETaLprWnRK5RzBPschWjSpz2Sx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437781293"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="437781293"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 05:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="801647323"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="801647323"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 05:06:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYQ9h-009P1k-2P;
        Tue, 22 Aug 2023 15:06:41 +0300
Date:   Tue, 22 Aug 2023 15:06:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Currently if the SoC needs pinctrl to switch the SCL
 and SDA from the I2C function to GPIO function, the recovery won't work.
Message-ID: <ZOSk0b1wKF/NzCzz@smile.fi.intel.com>
References: <20230822091555.18015-1-ysionneau@kalray.eu>
 <ZOSj6C+4q/xUNyhA@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOSj6C+4q/xUNyhA@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 22, 2023 at 03:02:48PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 22, 2023 at 11:15:55AM +0200, Yann Sionneau wrote:

...

> > +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> > +	if (IS_ERR(rinfo->pinctrl)) {
> > +		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> > +			return PTR_ERR(rinfo->pinctrl);
> > +
> > +		rinfo->pinctrl = NULL;
> > +		dev_err(dev->dev, "getting pinctrl info failed: bus recovery might not work\n");
> > +	} else if (!rinfo->pinctrl) {
> > +		dev_dbg(dev->dev, "pinctrl is disabled, bus recovery might not work\n");
> > +	}
> 
> A bit of bikeshedding, would the below be slightly better?
> 
> 	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> 	if (IS_ERR(rinfo->pinctrl)) {
> 		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> 			return PTR_ERR(rinfo->pinctrl);
> 
> 		rinfo->pinctrl = NULL;
> 		dev_err(dev->dev, "getting pinctrl info failed, disabling...\n");
> 	}
> 	if (!rinfo->pinctrl)
> 		dev_dbg(dev->dev, "pinctrl is disabled, bus recovery might not work\n");

On the second thought they are on a different levels... Anyway, up to you,
folks, what to do with that, I gave already my tag.

-- 
With Best Regards,
Andy Shevchenko


