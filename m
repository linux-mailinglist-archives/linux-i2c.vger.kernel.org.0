Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E14577038A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 16:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjHDOu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 10:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbjHDOuy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 10:50:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1936649E1;
        Fri,  4 Aug 2023 07:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691160652; x=1722696652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40OHL2z1D2BDju0OQCJozvDlO1ndY6wr+lQO9kmgHxY=;
  b=Wm0g//ikntRf63tOCAUT/3qzX+bp7Uk5BAYRhTfO4U5ygi7Tas6PcIbh
   AJZD+bgQIX6dHkNusokC50xiK5tslYApGoARkCSFvQJyfXG0mimIQ75vH
   gIexQt4/6Qh/XyvjCl8KNE91Ol+nkKD32R/jBWy8Eiv0FfG2r/CDXB+Dy
   1qH9CjWF5umlWtSbh8wHpLU3meZO5t2rCsFwT4s03bDbnpc3h8UW4booq
   cNRIB9Dm4C2BzoZ/a+noMW/TbngGMDesTCbwmGTyJueiEE451p/QQTmFP
   U7GHMNn6Z3IExegn1gzl3BOC2lCAM4bVs6ig9czWrg+aDApzaFSAE9Oi9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="367630428"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="367630428"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820150960"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="820150960"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2023 07:50:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qRw8c-00Cz83-2p;
        Fri, 04 Aug 2023 17:50:46 +0300
Date:   Fri, 4 Aug 2023 17:50:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-rtc@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 3/4] i2c: Enhance i2c_get_match_data()
Message-ID: <ZM0QRhrBkdNtZRz5@smile.fi.intel.com>
References: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
 <20230804070915.117829-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804070915.117829-4-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 04, 2023 at 08:09:14AM +0100, Biju Das wrote:
> Enhance i2c_get_match_data() for a faster path for device_get_
> match_data().

Strange wrap, the function name shouldn't have a new line in between :-)

> While at it, add const to struct i2c_driver to prevent overriding
> the driver pointer.

...

> v6:
>  * Separate patch to prepare for better difference for
>    i2c_match_id() changes.

With this it actually should be patch 2 and patch 2 become 3
(there is not much difference code wise, but logically this
 can be applied even without the rest).

With the above addressed
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


